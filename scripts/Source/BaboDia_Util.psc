Scriptname BaboDia_Util extends Quest
{Utility helpers: appearance, layered nude score from JSON, SexLab voice.}

; ----- Appearance globals -----
GlobalVariable Property BaboPlayerAppearanceValue Auto
GlobalVariable Property BaboPlayerBreastsValue Auto
GlobalVariable Property BaboPlayerButtocksValue Auto
GlobalVariable Property BaboPlayerAppearanceTotalValue Auto
; Cached result of NudeCalc(PlayerRef). Updated on inventory close / explicit refresh.
GlobalVariable Property BaboPlayerNudityValue Auto
; 1 = top worn but no bottom (IsPlayerBottomless), else 0
GlobalVariable Property BaboPlayerNudityBottomless Auto

Actor Property PlayerRef Auto
Form Property sla_NakedArmorList Auto
SexLabFramework Property SexLab Auto

; JSON path is relative to Data/SKSE/Plugins/StorageUtilData/, so it resolves to Data/SKSE/Plugins/BaboDialogue/NudeArmorKeywords.json
String Property NudeKeywordFile = "../BaboDialogue/NudeArmorKeywords.json" Auto

; ---------- Style cache: keyword -> tier index (0 halfnaked .. 7 pretty) ----------
Keyword[] StyleKeys
int[] StyleKeyTier
int[] StyleTierMods
int StyleCount = 0

; ---------- Coverage cache: keywords in JSON group order, each carrying its group mod ----------
; Category c owns indexes CoverStart[c] .. CoverStart[c + 1] - 1
; 0 top, 1 naked_top, 2 bikini_top, 3 bikini_bottom, 4 bikini_lower, 5 leotard_bottom, 6 lower, 7 bottom, 8 misc
Keyword[] CoverKeys
int[] CoverMods
int[] CoverStart
; Category c indexes CoverStart[c] .. CoverFullEnd[c] - 1 are full-cover bottom groups (armor_bottom_full, pants, Hotpants)
int[] CoverFullEnd

int BaseNudeScore = 100
int ScoreClampMin = 0
int ScoreClampMax = 100
bool NudeCacheReady = false

; ---------- Lifecycle ----------

Event OnInit()
	LoadNudeKeywordCache()
	RegisterForMenu("InventoryMenu")
	RegisterForMenu("ContainerMenu")
	; Delay so PlayerRef / keywords are ready on first load
	RegisterForSingleUpdate(2.0)
EndEvent

Event OnUpdate()
	UpdatePlayerNudityValue()
EndEvent

; Refresh once when leaving inventory/container (batch equip/unequip).
Event OnMenuClose(String MenuName)
	if MenuName == "InventoryMenu" || MenuName == "ContainerMenu"
		UpdatePlayerNudityValue()
	endif
EndEvent

Function ReloadNudeKeywordCache()
	LoadNudeKeywordCache()
	UpdatePlayerNudityValue()
EndFunction

; Write NudeCalc(PlayerRef) into BaboPlayerNudityValue.
; Safe to call after scripted strip / sex / armor break etc.
Function UpdatePlayerNudityValue()
	BaboPlayerNudityValue.SetValue(NudeCalc(PlayerRef) as float)
	BaboPlayerNudityBottomless.SetValue(IsPlayerBottomless() as float)
EndFunction

Function LoadNudeKeywordCache()
	String file = NudeKeywordFile

	BaseNudeScore = JsonUtil.GetPathIntValue(file, ".base_nude", 100)
	ScoreClampMin = JsonUtil.GetPathIntValue(file, ".clamp.min", 0)
	ScoreClampMax = JsonUtil.GetPathIntValue(file, ".clamp.max", 100)

	BuildStyleTier(file)
	BuildCoverageCache(file)

	NudeCacheReady = true
EndFunction

; Style tiers in fixed order, most revealing first
Function BuildStyleTier(String file)
	String[] tierNames = new String[8]
	tierNames[0] = "halfnaked"
	tierNames[1] = "transparent"
	tierNames[2] = "curtain"
	tierNames[3] = "bikini"
	tierNames[4] = "leotard"
	tierNames[5] = "spandex"
	tierNames[6] = "erotic"
	tierNames[7] = "pretty"

	StyleKeys = new Keyword[64]
	StyleKeyTier = new int[64]
	StyleTierMods = new int[8]
	StyleCount = 0
	int t = 0
	while t < tierNames.Length
		String path = ".style." + tierNames[t]
		StyleTierMods[t] = JsonUtil.GetPathIntValue(file, path + ".mod", 0)
		String[] names = JsonUtil.PathStringElements(file, path + ".keywords")
		int i = 0
		while i < names.Length && StyleCount < 64
			Keyword k = Keyword.GetKeyword(names[i])
			if k
				StyleKeys[StyleCount] = k
				StyleKeyTier[StyleCount] = t
				StyleCount += 1
			endif
			i += 1
		endwhile
		t += 1
	endwhile
EndFunction

; Group names in JSON order (PathMembers returns them alphabetically, so they are listed here)
Function BuildCoverageCache(String file)
	String[] cats = new String[9]
	String[] groups = new String[9]
	cats[0] = ".coverage_top"
	groups[0] = "armor_top_full,bra,nipple_pasties,bra_transparent_low,bra_transparent,bra_transparent_high,armor_top_base"
	cats[1] = ".coverage_naked_top"
	groups[1] = "armor_top_full,bra,nipple_pasties,bra_transparent_low,bra_transparent,bra_transparent_high,armor_top_base"
	cats[2] = ".coverage_bikini_top"
	groups[2] = "armor_top_full,bra,nipple_pasties,bra_transparent_low,bra_transparent,bra_transparent_high,armor_top_base"
	cats[3] = ".coverage_bikini_bottom"
	groups[3] = "armor_bottom_full,pants,Hotpants,underwear,thong_low,thong_mid,thong_high,vagina_pasties,underwear_transparent_low,underwear_transparent,underwear_transparent_high,thong_transparent_low,thong_transparent,thong_transparent_high,armor_bottom"
	cats[4] = ".coverage_bikini_lower"
	groups[4] = "full_skirt,mini_skirt,micro_skirt,pelvic_curtain,ass_curtain"
	cats[5] = ".coverage_leotard_bottom"
	groups[5] = "full_skirt,pants,mini_skirt,Hotpants,micro_skirt,pelvic_curtain,ass_curtain"
	cats[6] = ".coverage_lower"
	groups[6] = "full_skirt,mini_skirt,pelvic_curtain,micro_skirt,ass_curtain"
	cats[7] = ".coverage_bottom"
	groups[7] = "armor_bottom_full,pants,Hotpants,underwear,thong_low,thong_mid,thong_high,vagina_pasties,underwear_transparent_low,underwear_transparent,underwear_transparent_high,thong_transparent_low,thong_transparent,thong_transparent_high,armor_bottom"
	cats[8] = ".coverage_misc"
	groups[8] = "covers_all,cloak_cape,nearly_naked"

	CoverKeys = new Keyword[128]
	CoverMods = new int[128]
	CoverStart = new int[10]
	CoverFullEnd = new int[9]
	int w = 0
	int c = 0
	while c < 9
		CoverStart[c] = w
		CoverFullEnd[c] = w
		String[] names = PapyrusUtil.StringSplit(groups[c], ",")
		int g = 0
		while g < names.Length
			String path = cats[c] + "." + names[g]
			int mod = JsonUtil.GetPathIntValue(file, path + ".mod", 0)
			String[] kws = JsonUtil.PathStringElements(file, path + ".keywords")
			int i = 0
			while i < kws.Length && w < 128
				Keyword k = Keyword.GetKeyword(kws[i])
				if k
					CoverKeys[w] = k
					CoverMods[w] = mod
					w += 1
				endif
				i += 1
			endwhile
			if g == 2
				CoverFullEnd[c] = w
			endif
			g += 1
		endwhile
		c += 1
	endwhile
	CoverStart[9] = w
EndFunction

; First worn style tier (0 halfnaked .. 7 pretty), -1 = no style
int Function GetStyleTier(Actor akRef)
	int i = 0
	while i < StyleCount
		if akRef.WornHasKeyword(StyleKeys[i])
			return StyleKeyTier[i]
		endif
		i += 1
	endwhile
	return -1
EndFunction

; Mod of the first group (JSON order) in category c that has a worn keyword, else 0
int Function CoverageMod(Actor akRef, int c)
	int i = CoverStart[c]
	while i < CoverStart[c + 1]
		if akRef.WornHasKeyword(CoverKeys[i])
			return CoverMods[i]
		endif
		i += 1
	endwhile
	return 0
EndFunction

; True if a full-cover bottom group (armor_bottom_full, pants) of category c is worn
bool Function IsBottomFullyCovered(Actor akRef, int c)
	int i = CoverStart[c]
	while i < CoverFullEnd[c]
		if akRef.WornHasKeyword(CoverKeys[i])
			return true
		endif
		i += 1
	endwhile
	return false
EndFunction

; Score = base + style mod + per-style coverage (first match each) + misc, clamped
int Function NudeCalc(Actor akRef)
	if !NudeCacheReady
		LoadNudeKeywordCache()
	endif

	int tier = GetStyleTier(akRef)
	int styleMod = -100 ; no style: score starts at 0
	if tier >= 0
		styleMod = StyleTierMods[tier]
	endif
	int score = BaseNudeScore + styleMod

	; A full-cover bottom (armor_bottom_full, pants, Hotpants) hides the underwear, so the lower (skirt) layer is skipped
	if tier == 0 || tier == 1 ; halfnaked, transparent
		score += CoverageMod(akRef, 1) + CoverageMod(akRef, 3)
		if !IsBottomFullyCovered(akRef, 3)
			score += CoverageMod(akRef, 4)
		endif
	elseif tier == 2 || tier == 3 ; curtain, bikini
		score += CoverageMod(akRef, 2) + CoverageMod(akRef, 3)
		if !IsBottomFullyCovered(akRef, 3)
			score += CoverageMod(akRef, 4)
		endif
	elseif tier == 4 || tier == 5 ; leotard, spandex
		score += CoverageMod(akRef, 5)
	elseif tier == 6 ; erotic
		score += CoverageMod(akRef, 0) + CoverageMod(akRef, 3)
		if !IsBottomFullyCovered(akRef, 3)
			score += CoverageMod(akRef, 4)
		endif
	else ; pretty or no style
		score += CoverageMod(akRef, 0) + CoverageMod(akRef, 7)
		if !IsBottomFullyCovered(akRef, 7)
			score += CoverageMod(akRef, 6)
		endif
	endif
	score += CoverageMod(akRef, 8)

	if score < ScoreClampMin
		score = ScoreClampMin
	elseif score > ScoreClampMax
		score = ScoreClampMax
	endif
	return score
EndFunction

; True if the player wears a top but no bottom (pretty/spandex/leotard always count as a bottom)
Bool Function IsPlayerBottomless()
	if !NudeCacheReady
		LoadNudeKeywordCache()
	endif
	int tier = GetStyleTier(PlayerRef)
	if tier == 4 || tier == 5 || tier == 7 ; leotard, spandex, pretty
		return false
	endif
	; Bottom: coverage_lower + coverage_bottom (categories 6..7; split bottom categories hold the same keywords)
	int i = CoverStart[6]
	while i < CoverStart[8]
		if PlayerRef.WornHasKeyword(CoverKeys[i])
			return false
		endif
		i += 1
	endwhile
	; HalfNaked / Transparent count as a top; other styles need a coverage_top keyword (AND parity: style alone = Slot32 fully covered)
	if tier == 0 || tier == 1
		return true
	endif
	; coverage_top (category 0; split top categories hold the same keywords)
	i = CoverStart[0]
	while i < CoverStart[1]
		if PlayerRef.WornHasKeyword(CoverKeys[i])
			return true
		endif
		i += 1
	endwhile
	return false
EndFunction
int Function AppearanceCalc()
	float appearanceValue = 0.0
	float breastsValue = 0.0
	float buttsValue = 0.0

	if BaboPlayerAppearanceValue
		appearanceValue = BaboPlayerAppearanceValue.GetValue()
	endif
	if BaboPlayerBreastsValue
		breastsValue = BaboPlayerBreastsValue.GetValue()
	endif
	if BaboPlayerButtocksValue
		buttsValue = BaboPlayerButtocksValue.GetValue()
	endif

	float total = appearanceValue + breastsValue + buttsValue
	if BaboPlayerAppearanceTotalValue
		BaboPlayerAppearanceTotalValue.SetValue(total)
	endif

	return ((total / 3.0) as int)
EndFunction

bool Function IsSexLabPPlus()
	String ver = SexLabUtil.GetStringVer()
	return StringUtil.Find(ver, "2.") == 0
EndFunction

Function UseSexlabVoice(Actor ActorRef, bool isvictim, int Strength = 50)
	if !ActorRef
		return
	endif
	if IsSexLabPPlus()
		return
	endif
	if !SexLab
		return
	endif
	sslBaseVoice voice = SexLab.PickVoice(ActorRef)
	if voice
		voice.Moan(ActorRef, Strength, isvictim)
	endif
EndFunction

; True if form carries a keyword from coverage_top, coverage_lower, coverage_bottom or coverage_misc
Bool Function FormHasCoverageKeyword(Form akForm)
	if !akForm
		return false
	endif
	if !NudeCacheReady
		LoadNudeKeywordCache()
	endif
	; coverage_top (category 0)
	int i = CoverStart[0]
	while i < CoverStart[1]
		if akForm.HasKeyword(CoverKeys[i])
			return true
		endif
		i += 1
	endwhile
	; coverage_lower, coverage_bottom, coverage_misc (categories 6..8)
	i = CoverStart[6]
	while i < CoverStart[9]
		if akForm.HasKeyword(CoverKeys[i])
			return true
		endif
		i += 1
	endwhile
	return false
EndFunction

; Move worn player items with coverage_top / coverage_lower / coverage_bottom keywords into akContainer
Function StripPlayerTopBottom(ObjectReference akContainer)
	if !NudeCacheReady
		LoadNudeKeywordCache()
	endif
	int slot = 30
	while slot <= 59 ; slots 60 (3BA body) / 61 (spell FX) ignored
		Form worn = PlayerRef.GetWornForm(Armor.GetMaskForSlot(slot))
		if worn
			; Categories 0 (top) and 6..7 (lower, bottom)
			int i = CoverStart[0]
			while i < CoverStart[8]
				if i == CoverStart[1]
					i = CoverStart[6]
				elseif worn.HasKeyword(CoverKeys[i])
					PlayerRef.RemoveItem(worn, 1, false, akContainer)
					i = CoverStart[8]
				else
					i += 1
				endif
			endwhile
		endif
		slot += 1
	endwhile
	UpdatePlayerNudityValue()
EndFunction

; True if akForm carries a keyword of coverage category c. part: 0 all, 1 full-cover groups only, 2 the rest.
bool Function FormInCoverage(Form akForm, int c, int part = 0)
	if !NudeCacheReady
		LoadNudeKeywordCache()
	endif
	int i = CoverStart[c]
	int iEnd = CoverStart[c + 1]
	if part == 1
		iEnd = CoverFullEnd[c]
	elseif part == 2
		i = CoverFullEnd[c]
	endif
	while i < iEnd
		if akForm.HasKeyword(CoverKeys[i])
			return true
		endif
		i += 1
	endwhile
	return false
EndFunction
; Move worn player items tagged with coverage category c into akContainer. part: 0 all, 1 full-cover groups only, 2 the rest. Returns the number moved.
int Function StripPlayerCoverage(ObjectReference akContainer, int c, int part = 0)
	if !NudeCacheReady
		LoadNudeKeywordCache()
	endif
	int iStart = CoverStart[c]
	int iEnd = CoverStart[c + 1]
	if part == 1
		iEnd = CoverFullEnd[c]
	elseif part == 2
		iStart = CoverFullEnd[c]
	endif
	int moved = 0
	int slot = 30
	while slot <= 59 ; slots 60 (3BA body) / 61 (spell FX) ignored
		Form worn = PlayerRef.GetWornForm(Armor.GetMaskForSlot(slot))
		if worn
			int i = iStart
			while i < iEnd
				if worn.HasKeyword(CoverKeys[i])
					PlayerRef.RemoveItem(worn, 1, false, akContainer)
					moved += 1
					i = iEnd
				else
					i += 1
				endif
			endwhile
		endif
		slot += 1
	endwhile
	return moved
EndFunction
; Strip body slot 32 plus any worn armor tagged with coverage_top / bottom / misc keywords.
; DoAnimate uses the same SexLab undress anim event: Arrok_Undress_G0 (male) / G1 (female).
Function StripNaked(Actor akActor, bool DoAnimate, bool bStripWeapon)

	if !NudeCacheReady
		LoadNudeKeywordCache()
	endif

	if DoAnimate
		;int gender = akActor.GetLeveledActorBase().GetSex()
		Debug.SendAnimationEvent(akActor, "Arrok_Undress_G1")
	endif

	; Body / slot 32 first (SexLab also keys anim off body piece)
	Form bodyItem = akActor.GetWornForm(Armor.GetMaskForSlot(32))
	if bodyItem
		akActor.UnequipItemEX(bodyItem, 0, false)
	endif

	; Remaining biped slots 30-61: unequip if coverage keyword present
	int slot = 30
	while slot <= 59 ; slots 60 (3BA body) / 61 (spell FX) ignored
		if slot != 32
			Form worn = akActor.GetWornForm(Armor.GetMaskForSlot(slot))
			if worn && FormHasCoverageKeyword(worn)
				akActor.UnequipItemEX(worn, 0, false)
			endif
		endif
		slot += 1
	endwhile

	; Weapons / shield (match SexLab StripSlots hand handling)
	if bStripWeapon
		Form rightHand = akActor.GetEquippedObject(1)
		if rightHand
			akActor.UnequipItemEX(rightHand, 1, false)
		endif
		Form leftHand = akActor.GetEquippedObject(0)
		if leftHand
			akActor.UnequipItemEX(leftHand, 2, false)
		endif
	endif

	if akActor == PlayerRef
		UpdatePlayerNudityValue()
	endif
EndFunction
