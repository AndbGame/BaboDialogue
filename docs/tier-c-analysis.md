# Tier C: разбор фиксов stability-патча 6.1.1.3 на 6.51

> Дополнение к `docs/stability-patch-spec.md` (§4.3 Tier C). Принцип: каждый фикс
> разбирается — причина → цель → актуальность в 6.51 → вердикт. Переносим только
> оправданное. Все данные ESP получены прямым парсингом VMAD-подзаписей
> `BaboInteractiveDia.esp` 6.51 (инструмент: `tmp/babo_check/vmad_scan.py`,
> структура VMAD верифицирована на ванильном `Skyrim.esm`).

## Метод

Тир C — скрипты, где патч добавляет только None-guard'ы против «cannot call None»
(по спеке §5.1 это чистка лога, не фризы) — плюс один скрипт с реальным
логик-багом. Вопрос «оправданно ли» для каждого guard'а сводится к трём
фактическим проверкам:

1. Используется ли скрипт в ESP 6.51 вообще, и с какими property-конфигами.
2. Достижим ли None-сценарий guard'а при этих конфигах.
3. Меняет ли guard поведение (а не только лог).

Формат VMAD (SSE, ScriptVersion 5 / ObjectFormat 2), подтверждённый на ванили:
строки `u16 len + content` (имена скриптов — с завершающим NUL, имена свойств —
без); script entry = `{str16 name, u8 flags, u16 propCount, props}`;
prop = `{str16 name, u8 type, u8 flags=01, value}`, type = PEX VTYPES
(1=Object `{u16 0, u16 aliasId, u32 formid}`, 2=String, 3=Int, 4=Float,
5=Bool, 0x0B = array-of-Object `{u32 count, count×8-байтовых элементов}`);
плюс секции questFlags/stages/aliases, которые для этой задачи не парсились
(алиас-скрипты искались байтовым сканом + forward-parse свойств).

## Инвентарь по ESP 6.51 (49 388 записей, 43 482 с VMAD-полем проверены)

| Скрипт | Инстансов | Где |
|---|---|---|
| `Babowealiasscript` | 10 | BaboEncounter13 ×1, BaboEncounter11 ×1, BaboChangeLocationEvent02 ×6, Event02DLC02 ×1, Event02Marsh ×1 |
| `BaboAliasWIChangeLocationScript` | 7 | BaboChangeLocationEvent01/05/06/07/08, BaboCLE08DrinksonMeSolitude, BaboCLE08DrinksonMeFalkreath |
| `BaboActorDetectorScript` | 21 | 1 базовый ACTI + 20 триггеров REFR |

Проверка «все ли вхождения найдены»: сырой байтовый скан всего ESP по
последовательности `[u16 len][имя]` дал ровно 10 / 7 / 21 — совпадает с
парсером, инвентарь полный.

---

## 1. `Babowealiasscript` — 13 guard'ов патча → **СКИП ЦЕЛИКОМ**

Патч оборачивает каждый вызов `(GetOwningQuest() as WEScript).X(...)` в
`weQuest != None` и каждый `GetActorReference()` в null-guard.

**Корневая причина guard'ов отсутствует в 6.51.** Каст `as WEScript` даёт None
только если главный скрипт квеста (или любой из прикреплённых) не наследует
WEScript. Парс VMAD главных скриптов:

| Квест | Прикреплённые скрипты |
|---|---|
| BaboEncounter13 | `BaboDiaQuest`, **`WEScript`**, `QF_BaboEncounter13` |
| BaboEncounter11 | **`WEScript`**, `QF__0851CC84`, `BaboDiaQuest` |
| BaboChangeLocationEvent02 | `QF_..._089A4F55`, `BaboDiaQuest`, **`WEScript`** |
| Event02DLC02 | `QF_...`, **`WEScript`** |
| Event02Marsh | **`WEScript`**, `QF_...` |

Автор 6.51 **осознанно прицепил голый WEScript** к каждому квесту с
wealiasscript-алиасами — то, от чего crajjjj защищался guard'ами, upstream
закрыл архитектурно. Каст никогда не None → 7 из 13 guard'ов — мёртвый код.

Остальные 6 guard'ов — на alias-ref None (`selfRef`/`selfActorRef`):
- `OnLoad`/`OnDying`/`OnUnload` — события доставляются самому reference алиаса:
  reference существует по определению в момент события. Guard'ы против
  недостижимого состояния.
- `OnUpdate` (poll дистанции) — реально мог бы ловить «алиас очищен во время
  опроса», но `MakeAggressiveOnDistanceToPlayer = 0` во **всех** 10 инстансах
  (свойство не задано ни в одном) → `RegisterForSingleUpdate` никогда не
  вызывается → весь `OnUpdate` — мёртвый путь в 6.51.
- `OnHit`/`OnGainLOS`/`PacifyOnLoad`/`KillOnLoad`/`DisintegrateOnLoad`/
  `PutInThisFactionOnLoad` — соответствующие флаги false/unset во всех
  инстансах → вызовы не выполняются.

Активные пути в 6.51 (RegisterLoadingAndUnloading=true по умолчанию,
DisableOnUnload=true, у Encounter11 + RequireStage/RequiredStage=60) не
содержат ни одного достижимого None.

**Вердикт: 0/13 оправданы. Файл не трогаем.**

## 2. `BaboAliasWIChangeLocationScript` — **ЧАСТИЧНЫЙ ПЕРЕНОС**

7 инстансов, все с активно настроенными флагами (StageChange* — Event01/05/08,
CLE08×2; StopQuestOnLocationChange/TimeChange — Event06/07/08, CLE08×2;
`PlayerRef` задан (=0x14) во всех 7; `NewLocationRef` — LocationAlias,
ссылающийся на квестовый алиас, во всех 7).

**Причина/цель фикса патча:** 6.51-код на каждое `OnLocationChange` голыми
цепочками вычисляет `NewLocationRef.getlocation().IsChild(akNewLoc)` и
`NewLocationRef.getlocation() == akNewLoc`. Если `getlocation()` = None (алиас
не заполнен, либо алиас «следует за reference», чей ref стоит в локации без
Location — т.е. в дикой местности), то:
- `None.IsChild(...)` → error → **False** → `!False` = **True**;
- `None == akNewLoc` → **False** → `!(...)` = **True**.

Итог: все ветки «игрок покинул отслеживаемую локацию» срабатывают **ложно** —
`setstage(NextStage*)` или `GetOwningQuest().Stop()` на живых квестах без
реального выхода из локации. Это не спам лога, а ложные переходы стадий
(Event01: окна стадий 9-46 → 251/102; Event05: → 100; Event06-08, CLE08×2:
Stop квеста) — функциональный баг, тот же класс, что и Tier A.

**Переносится** (по патчу): кэш `targetLoc = NewLocationRef.GetLocation()` +
`if targetLoc == None → return` + кэширование `isChildLocation`/`isExactLocation`
(заодно убирает 6+ повторных `getlocation()`-вызовов).

**Не переносится из патча (осознанно):**
- `if akNewLoc == None → return` — семантическое изменение без багфикс-ценности.
  При валидном `targetLoc` ветка `akNewLoc = None` в 6.51 определена корректно:
  `IsChild(None)` = False, `targetLoc == None` = False → «ушёл из локации»
  срабатывает, когда игрок вышел в дикую местность. Это соответствует
  конфигурации автора («StopQuestOnLocationChange» = игрок ушёл откуда надо —
  включая выход в пустоши). Подавление (как в патче) изменило бы поведение:
  квесты перестали бы останавливаться/продвигаться при выходе в дикие ячейки.
  Сguard'ом только на `targetLoc` поведение при `akNewLoc = None` остаётся
  байт-в-байт как в 6.51, а спуринные срабатывания исчезают.
- `if PlayerRef != None` вокруг `isininterior()` — `PlayerRef` задан во всех 7
  инстансах ESP (form 0x14) → недостижимо.

**Вердикт: переносим guard пустого алиаса; akNewLoc/PlayerRef-части — скип.**

## 3. `BaboActorDetectorScript` — **ПЕРЕНОС (реальный логик-баг)**

Спека предполагала «возможно не нужно» — проверка показала обратное.

21 инстанс: 20 триггеров REFR + 1 базовый ACTI. У **14 из 20 триггеров
`ActorArrayToggle = True`** (остальные 6 — False, 1 ACTI без флагов). Все 14
с `ReferenceArray = [alias#1 квеста 0x083BE3E7]` — это `QF_BaboKidnapEvent_083BE3E7`
(квест похищения; детекторы — `BaboKidnapperHouse01DetectorBox*` и пары
вход/выход с `ActorEnterBool` True/False).

**Причина/цель:** в 6.51 `CountActors()` — сломан: тело цикла вычисляет
`kActor` и **выбрасывает** его, функция возвращает `True` для любого непустого
`ReferenceArray`. Семантика имени функции («есть ли хоть один заполненный
актор») не реализована. Патч восстанавливает замысел: `true` только если
хотя бы один алиас массива заполнен.

**Актуальность в 6.51:** ветка `If CountActors() || !ActorArrayToggle` —
в Papyrus нет короткого замыкания, `CountActors()` вызывается всегда; при
Toggle=True её значение единственное, что решает. Сломанная версия: детектор
срабатывает от входа любого NPC, даже когда похититель из KidnapEvent не
существует (квест не запущен / алиас пуст) → глобал
`BaboActorDetectorGlobal` переключается вхолостую. Патч-версия: детектор
активен только при живом наблюдаемом акторе.

**Вердикт: переносим переписанный `CountActors` целиком (как в патче).**

---

## Итог по Tier C

| Файл | Чанков в патче | Перенесено | Скипнуто |
|---|---|---|---|
| `Babowealiasscript.psc` | 13 | 0 | 13 (все — мёртвый код на 6.51) |
| `BaboAliasWIChangeLocationScript.psc` | 9 | 1 (guard targetLoc + кэш, 6 сайтов использования) | 2 (akNewLoc-семантика, PlayerRef) |
| `BaboActorDetectorScript.psc` | 1 | 1 (CountActors) | 0 |

Правки снабжены комментариями `; --- andb: ported from crajjjj stability patch
6.1.1.3 (...)` с формулировкой причины и отличий от патча.

Инструмент анализа: `tmp/babo_check/vmad_scan.py` (перечисление VMAD-скриптов
и property-значений по всем типам записей плагина; валидирован на
`Skyrim.esm` — WE-квесты, float/int/bool/string/array-проперти).
