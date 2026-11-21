Scriptname BaboEncounter06BScript extends Quest

; Helper config on Encounter 06B. Not the main quest script.
; Script Event quest: Stop() clears aliases. Persistent actor handles
; are stored on BaboEncounter06DumpsterRef via StorageUtil.
;
; Stage 0 CK conditions:
;   kmyQuest.ResetVisitVariables()
;   Spawn Actors    EndVariable == 0  -> kmyQuest.SpawnCrewIfFirstEncounter()
;   Teleport Actors EndVariable >= 1  -> kmyQuest.MoveAlreadySpawnedCrew()
; Stage 250 (aliases still filled):
;   kmyQuest.ParkCrewInDumpster()
;   then SetStage(255)
; Stage 255: set EndVariable, Stop. Do not park here.
; Stage 180 give up -> guild now:     kmyQuest.GotoGuild(180)  EndVariable 15
; Stage 190 win-leverage -> guild now: kmyQuest.GotoGuild(190)  EndVariable 16
; Stage 200 promise guild visit: kmyQuest.PromiseGuildVisit()  EndVariable 17, 7-day freeze
; Stage 210 told crew to get lost: kmyQuest.TellCrewGetLost()  EndVariable 18, bounty set, crew pursuit squad comes (Chaser branch)
;   210 links to hired-thug quest. This crew stops coming.
; Stage 85: no resist, confiscate only. kmyQuest.ConfiscateValuableMisc()
; Crew: never Delete() unless dead. Always Park / StorageUtil.
; EndVariable 19 = crew wiped, LoanShark crew pursuit squad pending (06B Stage 0 Chaser branch, EndVariable 18 or 19).
; EndVariable 20 = after pursuit squad killed/evaded. E06 bounty hunters start (E06 condition == 20).
; Stage 10: player pays. CollectPlayerGoldAndSettle (gold only).
; Stage 15: body search. BodySearchAndSettle (gold + valuable misc, then settle).
Quest Property BaboEncounter06B Auto
Quest Property BaboChangeLocationEvent09 Auto
BaboLoanSharkScript Property LSScript Auto
int Property CombatStage = 70 Auto Hidden

Actor Property PlayerRef Auto
ObjectReference Property BaboPosRef Auto
Keyword Property BaboBadendKeyword Auto
MiscObject Property Gold001 Auto
BaboDiaMonitorScript Property BDMScript Auto
Quest Property BaboSexController Auto
BaboMsgManager Property MsgCtrl Auto
BaboSceneManager Property SceneManager Auto
Message Property BaboEncounter06BSexEndMsg 	Auto
Message Property BaboEncounter06BVictoryMsg Auto
Message Property BaboEncounter06BChokeMsg Auto
Message Property BaboEncounter06BSurrenderNoMsg Auto
GlobalVariable Property BaboSimpleSlavery Auto
Keyword Property LocTypeHold Auto
LocationAlias Property myHoldLocation Auto
ReferenceAlias Property InnCenterMarker Auto
GlobalVariable Property BaboHorribleHarassment Auto
Sound Property BaboPunchMarkerMedium Auto
Sound Property BaboPunchMarkerLarge Auto
Sound Property BaboPlapMarker Auto
Sound Property BaboSpankHardMarker Auto
Sound Property BaboCreampieMarker Auto
Perk Property BaboDamageReduction50 Auto
Perk Property BaboDamageReduction25 Auto
; 0 first fight, 1 after one player win, 2+ no handicap.
int Property PlayerBeatCrewCount Auto Hidden

GlobalVariable Property BaboEncounter06Variable Auto
GlobalVariable Property BaboEncounter06BEndVariable Auto
GlobalVariable Property BaboLoanSharkFreezeUntilDay Auto
GlobalVariable Property BaboEncounter06SLHHEscapeFailGlobal Auto
; Gold taken from player at Stage 10 (all carried gold).
GlobalVariable Property BaboEncounter06BGoldAmount Auto
; 0 none, 1 < half weekly, 2 half < gold < weekly, 3 >= weekly, 4 > full debt
GlobalVariable Property BaboEncounter06BSettleResult Auto
; Times crew took player misc (not gold). Lifetime.
GlobalVariable Property BaboEncounter06BStolenCountGlobal Auto
; Times crew raped the player. Lifetime.
GlobalVariable Property BaboEncounter06BSexCount Auto
; 0 scene blocked. 1 confiscate done, next phase allowed.
GlobalVariable Property BaboEncounter06BSceneGlobal Auto
; Full outstanding (principal + interest)
GlobalVariable Property BabodebtPaybackValueGlobal Auto
; This visit weekly interest (Payback - Snapshot)
GlobalVariable Property BaboWeeklyInterestDueGlobal Auto
; 1 = 06B allowed. 0 = 06B blocked after overpay split.
GlobalVariable Property BaboPunishGlobal Auto
GlobalVariable Property BaboEventLoanSharkCollectInterestReady Auto

ActorBase Property BaboEncounter06BStalkerA Auto
ActorBase Property BaboEncounter06BStalkerB Auto
ActorBase Property BaboEncounter06BStalkerC Auto
ActorBase Property BaboEncounter06BStalkerD Auto
ActorBase Property BaboEncounter06BStalkerE Auto

ActorBase Property BaboEncounter06BThugBoss Auto
ActorBase Property BaboEncounter06BThug01 Auto
ActorBase Property BaboEncounter06BThug02 Auto
ActorBase Property BaboEncounter06BThug03 Auto
ActorBase Property BaboEncounter06BThug04 Auto

ReferenceAlias Property DebtCollector Auto
ReferenceAlias Property SyndicateBrawn01 Auto
ReferenceAlias Property SyndicateBrawn02 Auto
ReferenceAlias Property SyndicateBrawn03 Auto
ReferenceAlias Property SyndicateBrawn04 Auto
ReferenceAlias Property PlayerAliasMarker Auto
ReferenceAlias Property DebtCollectorMarker Auto
ReferenceAlias Property SyndicateBrawn01Marker Auto
ReferenceAlias Property SyndicateBrawn02Marker Auto
ReferenceAlias Property SyndicateBrawn03Marker Auto
ReferenceAlias Property SyndicateBrawn04Marker Auto
ReferenceAlias Property SpawnMarkerCenter Auto

; Persistent XMarker in BaboDumpsterCell. Crew parks here between encounters.
ObjectReference Property BaboEncounter06DumpsterRef Auto

; Ring markers live on BaboSexControllerManager. Span 180 = front half, 270 = past half, 360 = full wrap.
float Property RingSpan = 180.0 Auto
float Property RingRadius = 150.0 Auto
Spell Property FastHealing Auto

; Runtime cache. Do not fill in CK. Survives Stop/Start, not Quest.Reset().
Actor Property SavedDebtCollector Auto Hidden
Actor Property SavedSyndicateBrawn01 Auto Hidden
Actor Property SavedSyndicateBrawn02 Auto Hidden
Actor Property SavedSyndicateBrawn03 Auto Hidden
Actor Property SavedSyndicateBrawn04 Auto Hidden

; Same chest as LoanShark cell: BaboLoanSharkConfiscatedChestRef
ObjectReference Property BaboLoanSharkConfiscatedChestRef Auto
Quest Property BaboDialogueUtil Auto
GlobalVariable Property BaboPlayerNudityCriteriaSkimpy Auto
GlobalVariable Property BaboPlayerNudityCriteriaNaked Auto
GlobalVariable Property BaboPlayerNudityCriteriaSexy Auto
GlobalVariable Property BaboPlayerAppearanceCriteriaAverage Auto
GlobalVariable Property BaboPlayerGotStrippedGlobal Auto
GlobalVariable Property BaboReputationBitch Auto
; Each list: 0 Player, 1 ActorA ... 5 ActorE. Same refs that have BaboEventPlayerMarker / A-E.
FormList Property BaboEncounter06BHouse01List Auto
FormList Property BaboEncounter06BHouse02List Auto
FormList Property BaboEncounter06BFort01List Auto
FormList Property BaboEncounter06BFort02List Auto
Message Property BaboEventSexContinueMsg Auto
int Property SLHHSexRound Auto Hidden

; Minimum base gold value to count as "valuable". 0 = take all Misc except gold.
int Property MinItemValue = 50 Auto

; Last confiscation totals (optional debug / dialogue)
int Property LastConfiscatedKinds Auto Hidden
int Property LastConfiscatedCount Auto Hidden
int Property LastConfiscatedValue Auto Hidden
int Property ConfiscateGearAfterSex Auto Hidden

; StorageUtil keys on BaboEncounter06DumpsterRef
String Property SUKEY_BOSS = "Babo06B_DebtCollector" AutoReadOnly
String Property SUKEY_T1 = "Babo06B_Brawn01" AutoReadOnly
String Property SUKEY_T2 = "Babo06B_Brawn02" AutoReadOnly
String Property SUKEY_T3 = "Babo06B_Brawn03" AutoReadOnly
String Property SUKEY_T4 = "Babo06B_Brawn04" AutoReadOnly

; SKSE FormType for TESObjectMISC (inventory Misc tab)
int Function GetMiscFormType()
	return 32
EndFunction

ObjectReference Function GetDestChest()
	return BaboLoanSharkConfiscatedChestRef
EndFunction

; Crew fence value. Half the listed gold price.
int Function AppraiseItem(Form akItem)
	return akItem.GetGoldValue() / 2
EndFunction

Bool Function IsValuableMisc(Form akItem)
	if akItem.GetType() != GetMiscFormType()
		return false
	endif
	if akItem == Gold001
		return false
	endif
	if akItem.GetGoldValue() < MinItemValue
		return false
	endif
	return true
EndFunction

; One-shot scan. Safe to call from dialogue / stage.
Function ConfiscateValuableMisc()
	ObjectReference dest = GetDestChest()
	int kinds = 0
	int pieces = 0
	int valueSum = 0

	int i = PlayerRef.GetNumItems()
	while i > 0
		i -= 1
		Form item = PlayerRef.GetNthForm(i)
		if IsValuableMisc(item)
			int count = PlayerRef.GetItemCount(item)
			if count > 0
				int unitValue = AppraiseItem(item)
				PlayerRef.RemoveItem(item, count, true, dest)
				kinds += 1
				pieces += count
				valueSum += unitValue * count
			endif
		endif
	endwhile

	LastConfiscatedKinds = kinds
	LastConfiscatedCount = pieces
	LastConfiscatedValue = valueSum
	if pieces > 0
		BaboEncounter06BStolenCountGlobal.SetValue(BaboEncounter06BStolenCountGlobal.GetValue() + 1.0)
	endif
EndFunction

; Mid-scene call from BaboEncounter06BNoCoinScene after Crew1 first line.
; Fade, take Misc. If value < half weekly interest, Potion, then unworn Armor, then Weapon.
; Does not take equipped armor. Fade back. Scene keeps running.
Function NoCoinSceneConfiscate()
	BaboSexControllerManager scs = BaboSexController as BaboSexControllerManager
	scs.FadeinScene(true)

	int need = (BaboWeeklyInterestDueGlobal.GetValue() * 0.5) as int
	LastConfiscatedKinds = 0
	LastConfiscatedCount = 0
	LastConfiscatedValue = 0

	TakeInventoryPass(32, false, need)
	if LastConfiscatedValue < need
		TakeInventoryPass(46, false, need)
	endif
	if LastConfiscatedValue < need
		TakeInventoryPass(26, true, need)
	endif
	if LastConfiscatedValue < need
		TakeInventoryPass(41, false, need)
	endif

	if LastConfiscatedCount > 0
		BaboEncounter06BStolenCountGlobal.SetValue(BaboEncounter06BStolenCountGlobal.GetValue() + 1.0)
	endif

	scs.FadeOutScene(true)
	BaboEncounter06BSceneGlobal.SetValue(1)
EndFunction

Function TakeInventoryPass(int aiType, bool abSkipEquipped, int aiNeed)
	ObjectReference dest = GetDestChest()
	int i = PlayerRef.GetNumItems()
	while i > 0 && LastConfiscatedValue < aiNeed
		i -= 1
		Form item = PlayerRef.GetNthForm(i)
		if item.GetType() == aiType && item != Gold001 && item.GetGoldValue() >= MinItemValue
			if !abSkipEquipped || !PlayerRef.IsEquipped(item)
				int count = PlayerRef.GetItemCount(item)
				if count > 0
					int unitValue = AppraiseItem(item)
					PlayerRef.RemoveItem(item, count, true, dest)
					LastConfiscatedKinds += 1
					LastConfiscatedCount += count
					LastConfiscatedValue += unitValue * count
				endif
			endif
		endif
	endwhile
EndFunction

; Stage 0. Only when EndVariable == 0 (first encounter).
; PlaceAtMe at SpawnMarkerCenter, then ForceRefTo aliases.
; Boss -> DebtCollector. Thug01-04 -> SyndicateBrawn01-04.
; Stage 0. Clear per-visit globals. Does not touch EndVariable or crew handles.
Function ResetVisitVariables()
	BaboEncounter06BSettleResult.SetValue(0)
	BaboEncounter06BGoldAmount.SetValue(0)
	BaboEncounter06Variable.SetValue(0)
	LastConfiscatedKinds = 0
	LastConfiscatedCount = 0
	LastConfiscatedValue = 0
	ConfiscateGearAfterSex = 0
	(BaboEncounter06B as BaboDiaQuest).FaintCountNum = 0
EndFunction

Function SpawnStalker()
	ObjectReference marker = SpawnMarkerCenter.GetReference()
	Actor boss = SpawnCrewMember(BaboEncounter06BStalkerA, DebtCollector, marker)
	Actor t1 = SpawnCrewMember(BaboEncounter06BStalkerB, SyndicateBrawn01, marker)
	Actor t2 = SpawnCrewMember(BaboEncounter06BStalkerC, SyndicateBrawn02, marker)
	Actor t3 = SpawnCrewMember(BaboEncounter06BStalkerD, SyndicateBrawn03, marker)
	Actor t4 = SpawnCrewMember(BaboEncounter06BStalkerE, SyndicateBrawn04, marker)
	SavedDebtCollector = boss
	SavedSyndicateBrawn01 = t1
	SavedSyndicateBrawn02 = t2
	SavedSyndicateBrawn03 = t3
	SavedSyndicateBrawn04 = t4
EndFunction

Function SpawnCrewIfFirstEncounter()

	ObjectReference marker = SpawnMarkerCenter.GetReference()
	Actor boss = SpawnCrewMember(BaboEncounter06BThugBoss, DebtCollector, marker)
	Actor t1 = SpawnCrewMember(BaboEncounter06BThug01, SyndicateBrawn01, marker)
	Actor t2 = SpawnCrewMember(BaboEncounter06BThug02, SyndicateBrawn02, marker)
	Actor t3 = SpawnCrewMember(BaboEncounter06BThug03, SyndicateBrawn03, marker)
	Actor t4 = SpawnCrewMember(BaboEncounter06BThug04, SyndicateBrawn04, marker)
	RememberCrew(boss, t1, t2, t3, t4)
EndFunction

Actor Function SpawnCrewMember(ActorBase akBase, ReferenceAlias akAlias, ObjectReference akMarker)
	Actor existing = akAlias.GetActorReference()
	if existing && !existing.IsDead()
		existing.MoveTo(akMarker)
		return existing
	endif

	; persist = true so the ref survives cell detach / quest Stop
	Actor akActor = akMarker.PlaceAtMe(akBase, 1, true, false) as Actor
	akAlias.ForceRefTo(akActor)
	return akActor
EndFunction

; Later encounters (EndVariable != 0).
; Pull saved actors from cache / alias / StorageUtil,
; MoveTo SpawnMarkerCenter, ForceRefTo aliases.
; Dead actors are resurrected so the same crew can be reused.
Function MoveAlreadySpawnedCrew()
	ObjectReference spawnMarker = SpawnMarkerCenter.GetReference()

	Actor boss = ResolveSavedActor(SavedDebtCollector, SUKEY_BOSS, DebtCollector)
	Actor t1 = ResolveSavedActor(SavedSyndicateBrawn01, SUKEY_T1, SyndicateBrawn01)
	Actor t2 = ResolveSavedActor(SavedSyndicateBrawn02, SUKEY_T2, SyndicateBrawn02)
	Actor t3 = ResolveSavedActor(SavedSyndicateBrawn03, SUKEY_T3, SyndicateBrawn03)
	Actor t4 = ResolveSavedActor(SavedSyndicateBrawn04, SUKEY_T4, SyndicateBrawn04)

	RestoreActorToSpawn(boss, DebtCollector, spawnMarker)
	RestoreActorToSpawn(t1, SyndicateBrawn01, spawnMarker)
	RestoreActorToSpawn(t2, SyndicateBrawn02, spawnMarker)
	RestoreActorToSpawn(t3, SyndicateBrawn03, spawnMarker)
	RestoreActorToSpawn(t4, SyndicateBrawn04, spawnMarker)

	RememberCrew(boss, t1, t2, t3, t4)
EndFunction

; Quest end (Stage 255). Teleport current crew to dumpster and persist handles.
Function ParkCrewInDumpster()
	Actor boss = GetActorForPark(DebtCollector)
	Actor t1 = GetActorForPark(SyndicateBrawn01)
	Actor t2 = GetActorForPark(SyndicateBrawn02)
	Actor t3 = GetActorForPark(SyndicateBrawn03)
	Actor t4 = GetActorForPark(SyndicateBrawn04)

	ParkOne(boss)
	ParkOne(t1)
	ParkOne(t2)
	ParkOne(t3)
	ParkOne(t4)

	RememberCrew(boss, t1, t2, t3, t4)
EndFunction

; Set combat cause, then jump to CombatStage (default 70).
; Scenario 1 = force-leave / chase. 2 = short pay. If SLHH is on, 2 uses choke / no-resist.
Function Engage(int Scenario)
	BaboEncounter06Variable.setvalue(Scenario)
	if Scenario == 2 && BaboHorribleHarassment.GetValue() == 1.0
		ResolveShortPayKnockout(2)
		return
	endif
	BaboEncounter06B.setstage(CombatStage)
EndFunction

Function RegisterSurrenderEvent()
	RegisterForModEvent("On_BaboDiaSurrender", "OnBaboDiaSurrender")
	(BaboSexController as BaboSexControllerManager).ReadySurrender(true)
EndFunction

Event OnBaboDiaSurrender()
	if GetStage() != 70
		return
	endif
	if BaboEncounter06Variable.GetValue() == 4
		BaboEncounter06BSurrenderNoMsg.Show()
		return
	endif
	(BaboSexController as BaboSexControllerManager).ReadySurrender(false)
	BaboEncounter06B.SetStage(75)
EndEvent

Function RecoverCrewAfterCombat()
	RecoverOneAfterCombat(DebtCollector.GetActorReference())
	RecoverOneAfterCombat(SyndicateBrawn01.GetActorReference())
	RecoverOneAfterCombat(SyndicateBrawn02.GetActorReference())
	RecoverOneAfterCombat(SyndicateBrawn03.GetActorReference())
	RecoverOneAfterCombat(SyndicateBrawn04.GetActorReference())
EndFunction

Function RecoverOneAfterCombat(Actor akActor)
	akActor.StopCombat()
	akActor.StopCombatAlarm()
	akActor.SetUnconscious(false)
	akActor.ResetHealthAndLimbs()
	akActor.RestoreActorValue("Health", akActor.GetBaseActorValue("Health"))
EndFunction

Function SLHHChoke()
	RegisterForModEvent("ON_SLHHEnd_06B_S", "SLHH06BEscape")
	RegisterForModEvent("ON_SLHHEnd_06B_F", "SLHH06BFail")
	(BaboSexController as BaboSexControllerManager).SLHHSendOnEndEvent("ON_SLHHEnd_06B_S", "ON_SLHHEnd_06B_F")
	BDMScript.SLHHBCActivate(SavedSyndicateBrawn01, None, 1); WIP Perhaps I should replace Brawn01 with 04 considering thier placement.
EndFunction

Event SLHH06BEscape()
	SceneManager.Encounter06BScenePlay(4, true)
EndEvent

Event SLHH06BFail()
	SceneManager.Encounter06BScenePlay(5, true)
EndEvent

; End fragment on BaboEncounter06BSLHHEscape
Function SLHHEscapeSuccess()
	MsgCtrl.EncounterEvent06BMessagebox(5)
	BaboEncounter06Variable.SetValue(0)
	(BaboSexController as BaboSexControllerManager).RecoverControl()
	BaboEncounter06B.SetStage(70)
EndFunction

; End fragment on BaboEncounter06BSLHHEscapeFail
Function SLHHEscapeFail()
	BaboEncounter06SLHHEscapeFailGlobal.SetValue(BaboEncounter06SLHHEscapeFailGlobal.GetValue() + 1.0)
	MsgCtrl.EncounterEvent06BMessagebox(6)
	(BaboSexController as BaboSexControllerManager).LosingControl()
	(BaboSexController as BaboSexControllerManager).FadeinScene(true)
	ConfiscateValuableMisc()
	StripSkimpyIfHot()
	PlaceCrewRing()
	SnapActorsToRing()
	(BaboSexController as BaboSexControllerManager).FadeOutScene(true)
	SceneManager.Encounter06BScenePlay(6, true)
EndFunction

; End fragment on BaboEncounter06BSLHHFailAfterStrip
Function SLHHFailAfterStripDone()
	if BaboPlayerGotStrippedGlobal.GetValue() == 1 && BaboReputationBitch.GetValue() >= 150.0
		BaboEncounter06B.SetStage(90)
	else
		SLHHFailCrewLeave()
	endif
EndFunction

Function SLHHFailCrewLeave()
	BaboSexControllerManager scs = BaboSexController as BaboSexControllerManager
	scs.FadeinScene(true)
	ParkCrewInDumpster()
	RecoverRingMarkers()
	scs.FadeOutScene(true)
	scs.RecoverControl()
	BaboEncounter06BEndVariable.SetValue(3)
	BaboEncounter06B.SetStage(255)
EndFunction

; Stage 90. Random house/fort. List order: Player, A, B, C, D, E.
Function RelocateForGroupSex()
	FormList list = BaboEncounter06BHouse01List
	int pick = Utility.RandomInt(1, 4)
	if pick == 2
		list = BaboEncounter06BHouse02List
	elseif pick == 3
		list = BaboEncounter06BFort01List
	elseif pick == 4
		list = BaboEncounter06BFort02List
	endif

	BaboSexControllerManager scs = BaboSexController as BaboSexControllerManager
	scs.BaboRingPlayerMarkerRef.MoveTo(PlayerRef)
	scs.FadeinScene(true)
	MoveActorToListIndex(PlayerRef, list, 0)
	MoveActorToListIndex(SyndicateBrawn01.GetActorReference(), list, 1)
	MoveActorToListIndex(SyndicateBrawn02.GetActorReference(), list, 2)
	MoveActorToListIndex(SyndicateBrawn03.GetActorReference(), list, 3)
	MoveActorToListIndex(SyndicateBrawn04.GetActorReference(), list, 4)
	MoveActorToListIndex(DebtCollector.GetActorReference(), list, 5)
	scs.FadeOutScene(true)
	MsgCtrl.EncounterEvent06BMessagebox(7)
	SLHHSexRound = 0
	StartFoursome()
EndFunction

; Scene 7 end. EndVariable == 0. Simple Slavery: confiscate valuable Misc (credited to debt). Else straight to LoanShark FailRepay.
Function CombatDefeatedSlavery()
	BaboSexControllerManager scs = BaboSexController as BaboSexControllerManager
	scs.ReadySurrender(false)
	scs.LosingControl()
	scs.FadeinScene(true)
	ParkCrewInDumpster()
	RecoverRingMarkers()
	if BaboSimpleSlavery.GetValue() == 1.0
		ConfiscateValuableMisc()
		LSScript.ApplyDebtCredit(LastConfiscatedValue)
		SendModEvent("SSLV Entry")
		BaboEncounter06BEndVariable.SetValue(5)
		scs.FadeoutScene(true)
		BaboEncounter06B.SetStage(255)
		return
	endif
	BaboEncounter06BEndVariable.SetValue(15)
	BaboEncounter06B.SetStage(255)
	scs.RecoverControl()
	scs.FadeoutScene(true)
	LSScript.FailRepay()
EndFunction

; Inn CenterMarker alias filled in CK from the encounter hold.
Function MoveToHoldInn()
	ObjectReference inn = InnCenterMarker.GetReference()
	PlayerRef.MoveTo(inn)
EndFunction

Function MoveActorToListIndex(Actor akActor, FormList akList, int aiIndex)
	ObjectReference dest = akList.GetAt(aiIndex) as ObjectReference
	akActor.MoveTo(dest)
	akActor.SetAngle(0.0, 0.0, dest.GetAngleZ())
EndFunction

Function StartFoursome()
	BaboEncounter06BSexCount.SetValue(BaboEncounter06BSexCount.GetValue() + 1.0)
	(BaboSexController as BaboSexControllerManager).SexCustomActor(PlayerRef, SyndicateBrawn01.GetActorReference(), SyndicateBrawn02.GetActorReference(), SyndicateBrawn03.GetActorReference(), None, "MMMF", "Aggressive", "Rape", true, "Event06BSex01", "Encounter06BSex01", true)
EndFunction

; Dogeza scene end. Crew rapes the player on the spot, then BadEnd.
Function DogejaSceneDone()
	BaboEncounter06BSexCount.SetValue(BaboEncounter06BSexCount.GetValue() + 1.0)
	(BaboSexController as BaboSexControllerManager).SexCustomActor(PlayerRef, SyndicateBrawn01.GetActorReference(), SyndicateBrawn02.GetActorReference(), SyndicateBrawn03.GetActorReference(), None, "MMMF", "Aggressive", "Rape", true, "Event06BSex02", "Encounter06BSex02", true)
EndFunction

; Sex end. Hand off to BadEnd, park crew under BadEnd's stage 1 black.
Function DogejaSexToBadEnd()
	BaboSexControllerManager scs = BaboSexController as BaboSexControllerManager
	scs.TraumaExp(Utility.RandomInt(5, 8) as float)
	BaboPosRef.MoveTo(PlayerRef)
	BaboBadendKeyword.SendStoryEvent(None, BaboPosRef)
	Utility.Wait(5.0)
	ParkCrewInDumpster()
	RecoverRingMarkers()
	BaboEncounter06BEndVariable.SetValue(9)
	MsgCtrl.EncounterEvent06BMessagebox(11)
	BaboEncounter06B.SetStage(255)
EndFunction

Function AfterGroupSex()
	if SLHHSexRound == 0
		SLHHSexRound = 1
		int pick = BaboEventSexContinueMsg.Show()
		if pick == 0
			StartFoursome()
			return
		endif
	endif
	SkipNightmare()
EndFunction

Function SkipNightmare()
	BaboSexControllerManager scs = BaboSexController as BaboSexControllerManager
	scs.FadeinScene(true)
	if ConfiscateGearAfterSex == 1
		ConfiscateCombatGear()
		ConfiscateGearAfterSex = 0
		; WIP: Result 0 one-day health/stamina regen -100%
	endif
	; 3 loops x 7-9 plaps. One pattern per loop.
	int loop = 0
	while loop < 3
		int plaps = Utility.RandomInt(11, 15)
		int i = 0
		while i < plaps
			BaboPlapMarker.Play(PlayerRef)
			if loop == 0
				if i == 3 || i == 7 || i == 11
					scs.UseSexlabVoice(PlayerRef, true)
				endif
				Utility.Wait(0.4)
			elseif loop == 1
				if i == 2 || i == 6 || i == 10
					BaboSpankHardMarker.Play(PlayerRef)
					scs.UseSexlabVoice(PlayerRef, true)
				endif
				Utility.Wait(0.4)
			else
				if i == plaps - 1
					scs.UseSexlabVoice(SyndicateBrawn01.GetActorReference(), false)
					scs.UseSexlabVoice(SyndicateBrawn02.GetActorReference(), false)
					Utility.Wait(0.3)
					BaboCreampieMarker.Play(PlayerRef)
					Utility.Wait(0.2)
					scs.UseSexlabVoice(PlayerRef, true)
					Utility.Wait(0.7)
				else
					if i == 2 || i == 7
						scs.UseSexlabVoice(SyndicateBrawn03.GetActorReference(), false)
					elseif i == 5 || i == 8
						scs.UseSexlabVoice(PlayerRef, true)
					endif
					Utility.Wait(0.4)
				endif
			endif
			i += 1
		endwhile
		Utility.Wait(0.35)
		loop += 1
	endwhile
	BaboEncounter06BSexCount.SetValue(BaboEncounter06BSexCount.GetValue() + 1.0)
	scs.AddSexCount(6)
	scs.ModifySexlabStats(PlayerRef, 0, 6, 1, Utility.RandomInt(5, 6), Utility.RandomInt(7, 8), Utility.RandomInt(8, 10))
	scs.TraumaExp(Utility.RandomInt(5, 8) as float)
	;MsgCtrl.EncounterEvent06BMessagebox(8)
	
	int pick = BaboEncounter06BSexEndMsg.Show()

	if pick == 0
		PlayerRef.MoveTo(scs.BaboRingPlayerMarkerRef)
		ParkCrewInDumpster()
		RecoverRingMarkers()
		scs.FadeOutScene(true)
		scs.RecoverControl()
		BaboEncounter06BEndVariable.SetValue(4)
	endif
	BaboEncounter06B.SetStage(255)
EndFunction

; Skimpy bar <= nudity < naked bar, and appearance over average.
; Already naked (>= 90): skip. Keyword-tagged worn armor unequipped, not taken.
Function StripSkimpyIfHot()
	BaboDia_Util util = BaboDialogueUtil as BaboDia_Util
	float nude = util.BaboPlayerNudityValue.GetValue()
	if nude < BaboPlayerNudityCriteriaSkimpy.GetValue()
		return
	endif
	if nude >= BaboPlayerNudityCriteriaNaked.GetValue()
		return
	endif
	if util.BaboPlayerAppearanceTotalValue.GetValue() <= BaboPlayerAppearanceCriteriaAverage.GetValue()
		return
	endif

	int stripped = 0
	int slot = 30
	while slot <= 61
		Form worn = PlayerRef.GetWornForm(Armor.GetMaskForSlot(slot))
		if worn && util.FormHasCoverageKeyword(worn)
			PlayerRef.UnequipItem(worn, false, true)
			stripped += 1
		endif
		slot += 1
	endwhile
	if stripped > 0
		BaboPlayerGotStrippedGlobal.SetValue(1)
		(BaboSexController as BaboSexControllerManager).UseSexlabVoice(PlayerRef, true)
	endif
	util.UpdatePlayerNudityValue()
EndFunction

; Call at combat start (Stage 70). First fight 50, after one player win 25, after two wins none.
Function ApplyCrewDamageHandicap()
	Perk addPerk = None
	if PlayerBeatCrewCount == 0
		addPerk = BaboDamageReduction50
	elseif PlayerBeatCrewCount == 1
		addPerk = BaboDamageReduction25
	endif

	ApplyOneCrewPerk(DebtCollector.GetActorReference(), addPerk)
	ApplyOneCrewPerk(SyndicateBrawn01.GetActorReference(), addPerk)
	ApplyOneCrewPerk(SyndicateBrawn02.GetActorReference(), addPerk)
	ApplyOneCrewPerk(SyndicateBrawn03.GetActorReference(), addPerk)
	ApplyOneCrewPerk(SyndicateBrawn04.GetActorReference(), addPerk)
EndFunction

; Player attacked before talk (Variable 4). No courtesy handicap.
Function ClearCrewDamageHandicap()
	ApplyOneCrewPerk(DebtCollector.GetActorReference(), None)
	ApplyOneCrewPerk(SyndicateBrawn01.GetActorReference(), None)
	ApplyOneCrewPerk(SyndicateBrawn02.GetActorReference(), None)
	ApplyOneCrewPerk(SyndicateBrawn03.GetActorReference(), None)
	ApplyOneCrewPerk(SyndicateBrawn04.GetActorReference(), None)
EndFunction

Function ApplyOneCrewPerk(Actor akActor, Perk akKeep)
	akActor.RemovePerk(BaboDamageReduction50)
	akActor.RemovePerk(BaboDamageReduction25)
	if akKeep
		akActor.AddPerk(akKeep)
	endif
EndFunction

; Call when the player wins the fight.
Function RecordCrewDefeat()
	PlayerBeatCrewCount += 1
EndFunction

; Snapshot player, then put Center in front and L/R along the arc.
; afSpan 180 / 270 / 360. 5 slots: L02 L01 Center R01 R02.
Function PlaceCrewRing(float afSpan = 0.0, float afRadius = 0.0)
	if afSpan == 0.0
		afSpan = RingSpan
	endif
	if afRadius == 0.0
		afRadius = RingRadius
	endif

	BaboSexControllerManager scs = BaboSexController as BaboSexControllerManager
	scs.PlaceRingMarkers(PlayerRef, afSpan, afRadius)

	PlayerAliasMarker.ForceRefTo(scs.BaboRingPlayerMarkerRef)
	DebtCollectorMarker.ForceRefTo(scs.BaboRingMarkerRefCenter)
	SyndicateBrawn01Marker.ForceRefTo(scs.BaboRingMarkerRefR01)
	SyndicateBrawn02Marker.ForceRefTo(scs.BaboRingMarkerRefR02)
	SyndicateBrawn03Marker.ForceRefTo(scs.BaboRingMarkerRefL01)
	SyndicateBrawn04Marker.ForceRefTo(scs.BaboRingMarkerRefL02)
EndFunction

Function SnapActorsToRing()
	BaboSexControllerManager scs = BaboSexController as BaboSexControllerManager
	PlayerRef.MoveTo(scs.BaboRingPlayerMarkerRef)
	SnapActorToMarker(DebtCollector.GetActorReference(), scs.BaboRingMarkerRefCenter)
	SnapActorToMarker(SyndicateBrawn01.GetActorReference(), scs.BaboRingMarkerRefR01)
	SnapActorToMarker(SyndicateBrawn02.GetActorReference(), scs.BaboRingMarkerRefR02)
	SnapActorToMarker(SyndicateBrawn03.GetActorReference(), scs.BaboRingMarkerRefL01)
	SnapActorToMarker(SyndicateBrawn04.GetActorReference(), scs.BaboRingMarkerRefL02)
EndFunction

Function SnapActorToMarker(Actor akActor, ObjectReference akMarker)
	akActor.MoveTo(akMarker)
	akActor.SetAngle(0.0, 0.0, akMarker.GetAngleZ())
EndFunction

Function RecoverRingMarkers()
	(BaboSexController as BaboSexControllerManager).RecoverRingMarkers()
	PlayerAliasMarker.Clear()
	DebtCollectorMarker.Clear()
	SyndicateBrawn01Marker.Clear()
	SyndicateBrawn02Marker.Clear()
	SyndicateBrawn03Marker.Clear()
	SyndicateBrawn04Marker.Clear()
EndFunction

; Stage 10. Take all player gold to DebtCollector, store amount, pick settle bucket.
; Does not write loan globals. Dialogue / later TIF applies Payback.
; 0 = paid nothing
; 1 = below half of weekly
; 2 = above half of weekly, below weekly
; 3 = gold >= weekly
; 4 = gold > full debt
Function CollectPlayerGoldAndSettle()
	int gold = PlayerRef.GetGoldAmount()
	BaboEncounter06BGoldAmount.SetValue(gold)

	Actor boss = DebtCollector.GetActorReference()
	if gold > 0
		PlayerRef.RemoveItem(Gold001, gold, true, boss)
	endif

	int debt = BabodebtPaybackValueGlobal.GetValue() as int
	int weekly = BaboWeeklyInterestDueGlobal.GetValue() as int
	int halfWeekly = weekly / 2

	int result = 0
	if gold > debt
		result = 4
	elseif gold >= weekly
		result = 3
	elseif gold > halfWeekly
		result = 2
	elseif gold > 0
		result = 1
	endif

	BaboEncounter06BSettleResult.SetValue(result)
EndFunction

; Stage 15. Body search. Gold + valuable misc, then settle on the combined value.
; Gold goes to boss. Misc goes to confiscate chest. Loan globals not written here.
Bool Function BodySearchAndSettle()
	ConfiscateValuableMisc()

	int gold = PlayerRef.GetGoldAmount()
	int total = gold + LastConfiscatedValue
	BaboEncounter06BGoldAmount.SetValue(total)

	Actor boss = DebtCollector.GetActorReference()
	if gold > 0
		PlayerRef.RemoveItem(Gold001, gold, true, boss)
	endif

	int debt = BabodebtPaybackValueGlobal.GetValue() as int
	int weekly = BaboWeeklyInterestDueGlobal.GetValue() as int
	int halfWeekly = weekly / 2

	int result = 0
	if total > debt
		result = 4
	elseif total >= weekly
		result = 3
	elseif total > halfWeekly
		result = 2
	elseif total > 0
		result = 1
	endif

	BaboEncounter06BSettleResult.SetValue(result)
	return true
EndFunction

Objectreference Property BaboLoanSharkReceptionXmarkerRef04 Auto

; Stage 180 = give up. Stage 190 = beat crew 2+ times, talk to branch manager.
; Park crew first (aliases still filled), then this Script Event quest ends.
; Branch-manager quest starts after the player enters the guild.
Function GotoGuild(int scenario)
	LSScript.BossBriefingArrive()
	RecoverRingMarkers()
	if BaboEncounter06BEndVariable.GetValue() == 18 || BaboEncounter06BEndVariable.GetValue() == 19
		DebtCollector.GetReference().Delete()
		SyndicateBrawn01.GetReference().Delete()
		SyndicateBrawn02.GetReference().Delete()
		SyndicateBrawn03.GetReference().Delete()
		SyndicateBrawn04.GetReference().Delete()
		BaboEncounter06B.SetStage(255)
		return
	elseif scenario == 190
		BaboEncounter06BEndVariable.SetValue(16)
	else
		BaboEncounter06BEndVariable.SetValue(15)
	endif
	;Player moveto Guild WIP
	ParkCrewInDumpster()
	BaboEncounter06B.SetStage(255)
EndFunction


; SettleResult 4. Half the taken value back to the player. Boss keeps the rest.
; Store crew. BaboPunishGlobal = 0 blocks 06B. Do not use EndVariable 10 for that.
; LoanShark Alias restarts the 7-day cycle. Ready=1 after 7 days -> Event09 check.
; If interest grows to principal again, loan shark sets PunishGlobal 1 and 06B can start.
; Do not Delete crew. Script Event: Stop only. Reset() does nothing here.
Function SettleOverpaySplitToGuild()
	int refund = (BaboEncounter06BGoldAmount.GetValue() as int) / 2
	Actor boss = DebtCollector.GetActorReference()
	boss.RemoveItem(Gold001, refund, true)
	PlayerRef.AddItem(Gold001, refund, true)
	LSScript.ApplyDebtCredit(refund)

	(BaboSexController as BaboSexControllerManager).FadeinScene(true)
	ParkCrewInDumpster()
	RecoverRingMarkers()
	BaboPunishGlobal.SetValue(0)
	ResetVisitVariables()
	BaboChangeLocationEvent09.Stop()
	(BaboSexController as BaboSexControllerManager).FadeOutScene(true)
	MsgCtrl.EncounterEvent06BMessagebox(3)
	BaboEncounter06B.SetStage(255)
EndFunction

; SettleResult 3. All taken gold goes on the debt. Crew will return next week.
; Same fade / park / message as 4. Do not clear BaboPunishGlobal. Do not Reset Event09.
Function SettleMetQuota()
	int taken = BaboEncounter06BGoldAmount.GetValue() as int
	LSScript.ApplyDebtCredit(taken)

	(BaboSexController as BaboSexControllerManager).FadeinScene(true)
	ParkCrewInDumpster()
	RecoverRingMarkers()
	BaboEncounter06BEndVariable.SetValue(2)
	ResetVisitVariables()
	(BaboSexController as BaboSexControllerManager).FadeOutScene(true)
	MsgCtrl.EncounterEvent06BMessagebox(4)
	BaboEncounter06B.SetStage(255)
EndFunction

; First meet, refused to pay. Variable 3. SLHH / knockout / sneak>=40 can fight.
Function FirstMeetRefuse()
	BaboEncounter06Variable.SetValue(3)
	ResolveShortPayKnockout(1)
EndFunction

; First meet, no coin. Sneak >= 40 shows choke menu. Below 40 goes straight to no-resist.
Function FirstMeetNoCoin()
	ResolveShortPayKnockout(1)
EndFunction

; Return visit, SettleResult <= 2. Same knockout, scene 2.
Function ReturnVisitNotEnough()
	ResolveShortPayKnockout(2)
EndFunction

Function ResolveShortPayKnockout(int aiScene)
	if PlayerRef.GetActorValue("Sneak") >= 40.0
		HandleChokeMessage(aiScene)
	else
		NoResistKnockout(aiScene)
	endif
EndFunction

Function HandleChokeMessage(int aiScene)
	int pick = BaboEncounter06BChokeMsg.Show()
	bool slhhOn = BaboHorribleHarassment.GetValue() == 1.0

	if pick == 0
		ApplyCrewDamageHandicap()
		BaboEncounter06B.SetStage(CombatStage)
	elseif slhhOn && pick == 1
		BaboEncounter06B.SetStage(50)
	else
		NoResistKnockout(aiScene)
	endif
EndFunction

;Stage 35: dogeza anim
Function KnockOutPlayer(string AnimationName, int aiScene)
		BaboSexControllerManager scs = BaboSexController as BaboSexControllerManager
		scs.FadeinScene(true)
	int i = 0
	while i < 6
		if Utility.RandomInt(0, 1) == 0
			BaboPunchMarkerMedium.Play(PlayerRef)
		else
			BaboPunchMarkerLarge.Play(PlayerRef)
		endif
		Utility.Wait(0.45)
		if i == 1 || i == 3 || i == 5
			scs.UseSexlabVoice(PlayerRef, true)
		endif
		Utility.Wait(0.35)
		i += 1
	endwhile
	float hp = PlayerRef.GetActorValue("Health")
	PlayerRef.DamageActorValue("Health", hp * 0.8)
	PlaceCrewRing()
	if AnimationName == "BaboDogejaLoop"
		scs.MoveRingMarker(scs.BaboRingMarkerRefCenter, 0.0, 80.0)
		SnapActorsToRing()
	endif
	Debug.SendAnimationEvent(PlayerRef, AnimationName)
	scs.FadeOutScene(true)
	SceneManager.Encounter06BScenePlay(aiScene, true)
EndFunction

Function NoResistKnockout(int aiScene);aiScene == 1~3
	BaboEncounter06B.SetStage(30)
	KnockOutPlayer("BaboFaintFStart", aiScene)
	;SceneManager.Encounter06BScenePlay(aiScene, true)
EndFunction

; NoCoinScene end. Steal already done mid-scene. Crew leaves.
Function NoCoinSceneLeave()
	BaboSexControllerManager scs = BaboSexController as BaboSexControllerManager
	scs.FadeinScene(true)
	ParkCrewInDumpster()
	RecoverRingMarkers()
	BaboEncounter06BEndVariable.SetValue(3)
	scs.FadeOutScene(true)
	scs.RecoverControl()
	BaboEncounter06B.SetStage(255)
EndFunction

Function TiePlayerKneeling()
	BaboSexControllerManager scs = BaboSexController as BaboSexControllerManager
	scs.FadeinScene(true)
	Debug.SendAnimationEvent(PlayerRef, "BaboKneelingTied")
	scs.FadeOutScene(true)
EndFunction

; CombatDefeatedNormal scene end. itype = BaboEncounter06Variable.
Function CombatDefeated(int itype)
	if itype == 1
		FastHealing.Cast(PlayerRef, PlayerRef)
	endif

	if BaboEncounter06BEndVariable.GetValue() == 0.0
		SceneManager.Encounter06BScenePlay(1, true)
		return
	endif

	if itype == 1 || itype == 3
		if BaboEncounter06BEndVariable.GetValue() == 18 ||BaboEncounter06BEndVariable.GetValue() == 19
			BaboSexControllerManager scs = BaboSexController as BaboSexControllerManager
			scs.LosingControl()
			scs.FadeinScene(true)
			RecoverRingMarkers()
			BaboEncounter06BEndVariable.SetValue(5)
			scs.RecoverControl()
			DebtCollector.GetReference().Delete()
			SyndicateBrawn01.GetReference().Delete()
			SyndicateBrawn02.GetReference().Delete()
			SyndicateBrawn03.GetReference().Delete()
			SyndicateBrawn04.GetReference().Delete()
			BaboEncounter06B.SetStage(255)
			LSScript.FailRepay()
			scs.FadeoutScene(true)
		else
			SceneManager.Encounter06BScenePlay(3, true)
		endif
		return
	endif

	if itype == 2
		TiePlayerKneeling()
		SceneManager.Encounter06BScenePlay(2, true)
		return
	endif

	if itype == 0
		BaboEncounter06B.SetStage(85)
	endif
EndFunction

Function PlaySettleResultScene()
	BaboSexControllerManager scs = BaboSexController as BaboSexControllerManager
	scs.FadeinScene(true)
	Debug.SendAnimationEvent(PlayerRef, "BaboKneelingTied")
	BodySearchAndSettle()
	PlaceCrewRing()
	SnapActorsToRing()
	scs.FadeOutScene(true)
	SceneManager.Encounter06BScenePlay(10, true)
EndFunction

Function SettleResultSceneDone()
	int r = BaboEncounter06BSettleResult.GetValue() as int
	if r == 4
		BaboEncounter06B.SetStage(170)
		FullPaySexStep(1)
	elseif r == 3
		SettleMetQuota()
	else
		if r <= 1
			ConfiscateGearAfterSex = 1
		endif
		RelocateForGroupSex()
	endif
EndFunction

; Scene 10 result 4. 1 MMF B1+B2, 2 MMF B3+B4, 3 MMMF B1-3, 4 settle.
Function FullPaySexStep(int step)
	BaboSexControllerManager scs = BaboSexController as BaboSexControllerManager
	if step == 4
		scs.LosingControl()
		Debug.SendAnimationEvent(PlayerRef, "Babo_DeathStart")
		scs.TraumaExp(Utility.RandomInt(5, 8) as float)
		SettleCombatFullPay(true)
		return
	endif
	BaboEncounter06BSexCount.SetValue(BaboEncounter06BSexCount.GetValue() + 1.0)
	if step == 1
		scs.SexCustomActor(PlayerRef, SyndicateBrawn01.GetActorReference(), SyndicateBrawn02.GetActorReference(), None, None, "MMF", "Aggressive", "Rape", true, "Event06BSex03", "Encounter06BSex03", true)
	elseif step == 2
		scs.SexCustomActor(PlayerRef, SyndicateBrawn03.GetActorReference(), SyndicateBrawn04.GetActorReference(), None, None, "MMF", "Aggressive", "Rape", true, "Event06BSex04", "Encounter06BSex04", true)
	else
		scs.SexCustomActor(PlayerRef, SyndicateBrawn01.GetActorReference(), SyndicateBrawn02.GetActorReference(), SyndicateBrawn03.GetActorReference(), None, "MMMF", "Aggressive", "Rape", true, "Event06BSex05", "Encounter06BSex05", true)
	endif
EndFunction

; End fragment on BaboEncounter06BConfiscateScene.
Function ConfiscateSceneDone()
	int r = BaboEncounter06BSettleResult.GetValue() as int
	if r >= 4
		if BaboReputationBitch.GetValue() >= 200.0
			int taken = (BaboEncounter06BGoldAmount.GetValue() as int) + LastConfiscatedValue
			LSScript.ApplyDebtCredit(taken)
			BaboPunishGlobal.SetValue(0)
			RelocateForGroupSex()
		else
			SettleCombatFullPay()
		endif
		return
	endif
	if r == 3
		SettleMetQuota()
		return
	endif
	if r <= 1
		ConfiscateGearAfterSex = 1
	endif
	RelocateForGroupSex()
EndFunction

; Result 0 / 1. Potions, armor, weapons to the chest before the hideout.
Function ConfiscateCombatGear()
	TakeInventoryPass(46, false, 999999)
	TakeInventoryPass(26, false, 999999)
	TakeInventoryPass(41, false, 999999)
	if LastConfiscatedCount > 0
		BaboEncounter06BStolenCountGlobal.SetValue(BaboEncounter06BStolenCountGlobal.GetValue() + 1.0)
	endif
EndFunction

; Scene 10 result 4. Credit gold + appraised misc. Debt done here. No guild visit.
Function SettleCombatFullPay(bool abToInn = false)
	int taken = (BaboEncounter06BGoldAmount.GetValue() as int) + LastConfiscatedValue
	LSScript.ApplyDebtCredit(taken)
	BaboSexControllerManager scs = BaboSexController as BaboSexControllerManager
	scs.FadeinScene(true)
	ParkCrewInDumpster()
	RecoverRingMarkers()
	if abToInn
		MoveToHoldInn()
		scs.GameHour.Mod(Utility.RandomFloat(8.0, 12.0))
		Debug.SendAnimationEvent(PlayerRef, "Babo_DeathStart")
	endif
	BaboPunishGlobal.SetValue(0)
	BaboEncounter06BEndVariable.SetValue(14)
	ResetVisitVariables()
	scs.FadeOutScene(true)
	if abToInn
		Utility.Wait(3.0)
	endif
	scs.RecoverControl()
	if abToInn
		MsgCtrl.EncounterEvent06BMessagebox(13)
	endif
	BaboEncounter06B.SetStage(255)
EndFunction

; FirstMeetWarning end when they already paid something. No extra steal.
Function FirstMeetWarningLeave()
	BaboSexControllerManager scs = BaboSexController as BaboSexControllerManager
	scs.FadeinScene(true)
	ParkCrewInDumpster()
	RecoverRingMarkers()
	BaboEncounter06BEndVariable.SetValue(2)
	scs.FadeOutScene(true)
	scs.RecoverControl()
	BaboEncounter06B.SetStage(255)
EndFunction

Function ConfiscateUpToWeekly()
	int need = BaboWeeklyInterestDueGlobal.GetValue() as int
	LastConfiscatedKinds = 0
	LastConfiscatedCount = 0
	LastConfiscatedValue = 0
	TakeInventoryPass(32, false, need)
	if LastConfiscatedValue < need
		TakeInventoryPass(46, false, need)
	endif
	if LastConfiscatedValue < need
		TakeInventoryPass(26, true, need)
	endif
	if LastConfiscatedValue < need
		TakeInventoryPass(41, false, need)
	endif
	if LastConfiscatedCount > 0
		BaboEncounter06BStolenCountGlobal.SetValue(BaboEncounter06BStolenCountGlobal.GetValue() + 1.0)
	endif
EndFunction

; End fragment on BaboEncounter06BFirstMeetWarningScene. Always this function.
Function FirstMeetWarningDone()
	BaboSexControllerManager scs = BaboSexController as BaboSexControllerManager
	scs.FadeinScene(true)
	int weekly = BaboWeeklyInterestDueGlobal.GetValue() as int
	int gold = PlayerRef.GetGoldAmount()
	int take = gold
	if take > weekly
		take = weekly
	endif
	if take > 0
		PlayerRef.RemoveItem(Gold001, take, true, DebtCollector.GetActorReference())
		LSScript.ApplyDebtCredit(take)
	endif
	BaboEncounter06BEndVariable.SetValue(2)
	ParkCrewInDumpster()
	RecoverRingMarkers()
	scs.FadeOutScene(true)
	scs.RecoverControl()
	BaboEncounter06B.SetStage(255)
EndFunction

; Boss alias Unload. Stage 70 flee -> 150. Ignore after 90.
Function CrewBossUnloaded()
	int st = GetStage()
	if st >= 90
		return
	endif
	if BaboEncounter06BEndVariable.GetValue() == 18 || BaboEncounter06BEndVariable.GetValue() == 19
		EndEncounterFledFromStalkers()
		return
	endif
	if st == 70
		BaboEncounter06B.SetStage(150)
		return
	endif
	if st < 5
		EndEncounterFled(1)
	else
		EndEncounterFled(8)
	endif
EndFunction

Function EndEncounterFled(int aiEndVar)
	ParkCrewInDumpster()
	RecoverRingMarkers()
	BaboEncounter06BEndVariable.SetValue(aiEndVar as float)
	BaboEncounter06B.SetStage(255)
EndFunction

Function EndEncounterFledFromStalkers()
	DebtCollector.GetReference().Delete()
	SyndicateBrawn01.GetReference().Delete()
	SyndicateBrawn02.GetReference().Delete()
	SyndicateBrawn03.GetReference().Delete()
	SyndicateBrawn04.GetReference().Delete()
	RecoverRingMarkers()
	BaboEncounter06BEndVariable.SetValue(20)
	BaboEncounter06B.SetStage(255)
EndFunction

; Stage 210 told crew to get lost. Crew never return. Crew pursuit squad comes via 06B Chaser branch.
Function TellCrewGetLost()
	BaboSexControllerManager scs = BaboSexController as BaboSexControllerManager
	scs.FadeinScene(true)
	ParkCrewInDumpster()
	RecoverRingMarkers()
	BaboEncounter06BEndVariable.SetValue(18)
	ResetVisitVariables()
	LSScript.LSSetBounty()
	scs.FadeOutScene(true)
	scs.RecoverControl()
	BaboEncounter06B.SetStage(255)
EndFunction

; Stage 200 promised to visit the guild within 7 days. Interest frozen, crew blocked by 17.
Function PromiseGuildVisit()
	BaboSexControllerManager scs = BaboSexController as BaboSexControllerManager
	scs.FadeinScene(true)
	ParkCrewInDumpster()
	RecoverRingMarkers()
	BaboEncounter06BEndVariable.SetValue(17)
	ResetVisitVariables()
	BaboLoanSharkFreezeUntilDay.SetValue(Utility.GetCurrentGameTime() + 7.0)
	scs.FadeOutScene(true)
	scs.RecoverControl()
	BaboEncounter06B.SetStage(255)
EndFunction

; Stage 120 kill choice. ActorBase essential off, then kill living crew.
Function KillCrewAfterChoice()
	KillOneAfterChoice(DebtCollector.GetActorReference())
	KillOneAfterChoice(SyndicateBrawn01.GetActorReference())
	KillOneAfterChoice(SyndicateBrawn02.GetActorReference())
	KillOneAfterChoice(SyndicateBrawn03.GetActorReference())
	KillOneAfterChoice(SyndicateBrawn04.GetActorReference())
	BaboEncounter06BEndVariable.SetValue(19)
	(BaboSexController as BaboSexControllerManager).RaiseCompetitiveness(15.0, 90.0)
	; Trigger only. Amount comes from current principal / interest.
	if LSScript
		LSScript.LSSetBounty()
	endif
	(BaboSexController as BaboSexControllerManager).RecoverControl()
	(BaboSexController as BaboSexControllerManager).FadeOutScene(true)
	MsgCtrl.EncounterEvent06BMessagebox(10)
	BaboEncounter06B.SetStage(255)
EndFunction

Function KillOneAfterChoice(Actor akActor)
	akActor.GetActorBase().SetEssential(false)
	;akActor.SetEssential(false)
	akActor.Kill(PlayerRef)
EndFunction

Function SpareCrewAfterChoice()
	BaboSexControllerManager scs = BaboSexController as BaboSexControllerManager
	RecoverRingMarkers()
	scs.FadeinScene(true)
		Debug.SendAnimationEvent(DebtCollector.GetActorReference(), "IdleForceDefaultState")
		Debug.SendAnimationEvent(SyndicateBrawn01.GetActorReference(), "IdleForceDefaultState")
		Debug.SendAnimationEvent(SyndicateBrawn02.GetActorReference(), "IdleForceDefaultState")
		Debug.SendAnimationEvent(SyndicateBrawn03.GetActorReference(), "IdleForceDefaultState")
		Debug.SendAnimationEvent(SyndicateBrawn04.GetActorReference(), "IdleForceDefaultState")
		ParkCrewInDumpster()
	(BaboSexController as BaboSexControllerManager).RecoverControl()
	scs.FadeOutScene(true)
	MsgCtrl.EncounterEvent06BMessagebox(9)
	BaboEncounter06B.SetStage(255)
EndFunction

; Stage 120 (EndVariable 18/19). Stalker victory: no menu/bounty/kill choice. Bodies stay.
Function ResolveVictoryStalker()
	BaboEncounter06BEndVariable.SetValue(20)
	RecoverRingMarkers()
	BaboEncounter06B.SetStage(255)
EndFunction

; Stage 120. 0 let go + msg 9 + EndVar 7. 1 kill + msg 10 + EndVar 20.
Function ResolveVictory()
	BaboSexControllerManager scs = BaboSexController as BaboSexControllerManager
	scs.ReadySurrender(false)
	scs.losingcontrol()
	int pick = BaboEncounter06BVictoryMsg.Show()
	scs.RaiseCompetitiveness(10.0, 80.0)
	RecoverCrewAfterCombat()
	Debug.SendAnimationEvent(DebtCollector.GetActorReference(), "Babo_Kneel")
	Debug.SendAnimationEvent(SyndicateBrawn01.GetActorReference(), "Babo_Kneel")
	Debug.SendAnimationEvent(SyndicateBrawn02.GetActorReference(), "IdleInjured")
	Debug.SendAnimationEvent(SyndicateBrawn03.GetActorReference(), "IdleInjured")
	Debug.SendAnimationEvent(SyndicateBrawn04.GetActorReference(), "IdleInjured")
	RecordCrewDefeat()
	if pick == 0
		BaboEncounter06BEndVariable.SetValue(7)
		if !SceneManager.Encounter06BScenePlay(13, true)
			SpareCrewAfterChoice()
		endif
		return
	else
		BaboSceneStandBy.setvalue(0)
		if !SceneManager.Encounter06BScenePlay(14, true)
			scs.FadeinScene(true)
			KillCrewAfterChoice()
		endif
	endif

EndFunction

GlobalVariable Property BaboSceneStandBy Auto
Message Property BaboEncounter06BKillConfirmMsg Auto

Function ConfirmKill()
	int pick = BaboEncounter06BKillConfirmMsg.Show()
	if pick == 0;kill
		BaboSceneStandBy.setvalue(1)
	else
		BaboSceneStandBy.setvalue(2)
	endif
EndFunction

Function BaboEncounter06BKillCrewSceneEnd()
	if BaboSceneStandBy.getvalue() == 1
		KillCrewAfterChoice()
	else
		BaboEncounter06BEndVariable.SetValue(7)
		SpareCrewAfterChoice()
	endif
	BaboSceneStandBy.setvalue(0)
EndFunction

Function ForgetCrewHandles()
	SavedDebtCollector = None
	SavedSyndicateBrawn01 = None
	SavedSyndicateBrawn02 = None
	SavedSyndicateBrawn03 = None
	SavedSyndicateBrawn04 = None

	StorageUtil.UnsetFormValue(BaboEncounter06DumpsterRef, SUKEY_BOSS)
	StorageUtil.UnsetFormValue(BaboEncounter06DumpsterRef, SUKEY_T1)
	StorageUtil.UnsetFormValue(BaboEncounter06DumpsterRef, SUKEY_T2)
	StorageUtil.UnsetFormValue(BaboEncounter06DumpsterRef, SUKEY_T3)
	StorageUtil.UnsetFormValue(BaboEncounter06DumpsterRef, SUKEY_T4)
EndFunction

; ---------- internals ----------

Function RememberCrew(Actor boss, Actor t1, Actor t2, Actor t3, Actor t4)
	SavedDebtCollector = boss
	SavedSyndicateBrawn01 = t1
	SavedSyndicateBrawn02 = t2
	SavedSyndicateBrawn03 = t3
	SavedSyndicateBrawn04 = t4

	StorageUtil.SetFormValue(BaboEncounter06DumpsterRef, SUKEY_BOSS, boss)
	StorageUtil.SetFormValue(BaboEncounter06DumpsterRef, SUKEY_T1, t1)
	StorageUtil.SetFormValue(BaboEncounter06DumpsterRef, SUKEY_T2, t2)
	StorageUtil.SetFormValue(BaboEncounter06DumpsterRef, SUKEY_T3, t3)
	StorageUtil.SetFormValue(BaboEncounter06DumpsterRef, SUKEY_T4, t4)
EndFunction

Actor Function ResolveSavedActor(Actor akCached, String asKey, ReferenceAlias akAlias)
	Actor found = akCached
	if found && found.IsDeleted()
		found = None
	endif

	if !found
		found = akAlias.GetActorReference()
	endif

	if !found
		found = StorageUtil.GetFormValue(BaboEncounter06DumpsterRef, asKey) as Actor
	endif

	if found && found.IsDeleted()
		return None
	endif
	return found
EndFunction

Actor Function GetActorForPark(ReferenceAlias akAlias)
	Actor found = akAlias.GetActorReference()
	;if !found || found.IsDeleted()
	;	found = ResolveSavedActor(akCached, asKey, akBase, None)
	;endif
	if found && found.IsDeleted()
		return None
	endif
	return found
EndFunction

Function RestoreActorToSpawn(Actor akActor, ReferenceAlias akAlias, ObjectReference akMarker)
	if akActor.IsDead()
		akActor.Resurrect()
	endif
	if akActor.IsDisabled()
		akActor.Enable()
	endif

	akActor.MoveTo(akMarker)
	;akActor.EvaluatePackage()
	akAlias.ForceRefTo(akActor)
EndFunction

Function ParkOne(Actor akActor)
	; Leave enabled. Dummy cell is not player-accessible.
	akActor.MoveTo(BaboEncounter06DumpsterRef)
	akActor.EvaluatePackage()
EndFunction

GlobalVariable Property BaboTimeLapseGlobal Auto
Message Property BaboTimeLapseWarningMsg Auto
