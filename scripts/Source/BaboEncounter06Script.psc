Scriptname BaboEncounter06Script extends Quest
; BaboEncounter06 quest helper: spawn, bribe/seduce, submit, combat/surrender, assassin.
; Design / stage map: Notion "Babo Encounter 06".

Actor Property PlayerRef Auto
MiscObject Property Gold001 Auto
; BaboSexControllerManager quest (sex, fades, ChallengeStart/pacify, surrender)
Quest Property BaboSexController Auto
GlobalVariable Property BaboPlayerAppearanceCriteriaVeryHard Auto
; Post-sex capture % by appearance: Low < Average <= Mid < VeryHard <= High
Int Property SeduceCaptureChanceLow = 70 Auto
Int Property SeduceCaptureChanceMid = 40 Auto
Int Property SeduceCaptureChanceHigh = 20 Auto
; Legacy (default False): partner orgasm forces release
Bool Property SeduceOrgasmForcesRelease = False Auto
; Added to capture % when HiredThug01 did not orgasm
Int Property SeduceNoOrgasmCaptureBonus = 30 Auto

; 0 Opportunist / 1 Bounty Hunter / 2 Assassin / 3 Rapist (not implemented)
GlobalVariable Property BaboEncounter06Scenario Auto
GlobalVariable Property BaboEncounter06BribeCost Auto
; Partial-bribe gold
GlobalVariable Property BaboEncounter06BribeCostHalf Auto
; TakeBribeAndRoll result: 0 Leave / 1 Sex / 2 Capture
GlobalVariable Property BaboEncounter06BribeGlobal Auto
; Spawn-time 0-100 chance the mercenaries yield to Intimidate
GlobalVariable Property BaboEncounter06Intimidation Auto
; Remaining visits (LoanShark sets it)
GlobalVariable Property BaboEncounter06VisitCount Auto
; Mercenary count 1	3 (dialogue GetGlobalValue conditions)
GlobalVariable Property BaboEncounter06CrewNum Auto
; Value = score, Criteria = dialogue threshold
GlobalVariable Property BaboPlayerNudityValue Auto
GlobalVariable Property BaboPlayerNudityCriteriaSkimpy Auto
GlobalVariable Property BaboPlayerAppearanceTotalValue Auto
GlobalVariable Property BaboPlayerAppearanceCriteriaAverage Auto

Faction Property SLAX_AggressiveFaction Auto

ActorBase Property BaboEncounter06Thug01 Auto
ActorBase Property BaboEncounter06Thug02 Auto
ActorBase Property BaboEncounter06Thug03 Auto

ReferenceAlias Property Alias_CenterMarker Auto
ReferenceAlias Property Alias_HiredThug01 Auto
ReferenceAlias Property Alias_HiredThug02 Auto
ReferenceAlias Property Alias_HiredThug03 Auto
ReferenceAlias Property BountyNote Auto ; CK alias; handed to HiredThug01 on spawn
; Player alias with BaboBrawlingPlayerREF
ReferenceAlias Property Alias_Player Auto
; Ring marker aliases for AI packages
ReferenceAlias Property PlayerAliasMarker Auto
ReferenceAlias Property HiredThug01Marker Auto
ReferenceAlias Property HiredThug02Marker Auto
ReferenceAlias Property HiredThug03Marker Auto
ReferenceAlias Property LookOutMarker Auto
; HiredThug01, HiredThug02, HiredThug03 (in that order)
ReferenceAlias[] Property Crews Auto
; Scenario 2 actor, spawned alone into HiredThug01
ActorBase Property BaboEncounter06Assassin Auto

; 06B relocate FormLists: index 0 = player, 1-3 = thugs
FormList Property BaboEncounter06BHouse01List Auto
FormList Property BaboEncounter06BHouse02List Auto
FormList Property BaboEncounter06BFort01List Auto
FormList Property BaboEncounter06BFort02List Auto

Message Property BaboEncounter06SexResistLeaveMsg Auto
Message Property BaboEncounter06SubmitMsg Auto
; Encounter06ScenePlay: 4 SubmitKneel (Stage 35), 5 Submit (Stage 80), 6-9 sex interludes, 10 SexAfter, 11 AfterResist, 12 AfterFaint
BaboSceneManager Property SceneManager Auto
; EncounterEvent06Messagebox(n) -> BakaStrings.json key baboencounterevent06_0n
BaboMsgManager Property MsgCtrl Auto
Float Property SubmitRingRadius = 120.0 Auto

; Weighted Scenario roll (active sum = Opp+BH+Assassin)
Int Property WeightOpportunist = 40 Auto
Int Property WeightBountyHunter = 30 Auto
Int Property WeightAssassin = 20 Auto
; WeightRapist = 10 (Scenario 3, not implemented)
; Rapist joins the VisitCount 0 pool when implemented
Int Property CrewMin = 1 Auto
; Bounty added per mercenary killed at the victory choice
Int Property KillBountyPerNPC = 500 Auto
Int Property CrewMax = 3 Auto
; Intimidation weights Appearance : Exposure : Level (sum 100)
Int Property IntimidationWeightAppearance = 20 Auto
Int Property IntimidationWeightExposure = 50 Auto
Int Property IntimidationWeightLevel = 30 Auto
; Level score hits 100 at HiredThug01 level + this gap
Int Property IntimidateLevelGap = 10 Auto

Int Property LastCrewSize Auto Hidden
Int Property LastBribeGlobal Auto Hidden

Bool Property LastSeducePartnerOrgasm Auto Hidden
Bool Property LastSeduceOrgasmTracked Auto Hidden
Bool Property LastSeduceCapture Auto Hidden
Bool Property SeduceSexActive Auto Hidden
; True during partial-bribe sex: never kidnapped, ends with the partial leave message
Bool Property SeducePartialLeaveMode Auto Hidden
; Lead NPC rolled rapist (IsactorRapist)
Bool Property SexRapist Auto Hidden
; Mercenary count at sex start, current round, last round
Int Property SexCrew Auto Hidden
Int Property SexRound Auto Hidden
Int Property SexRoundsTotal Auto Hidden
; Partial-bribe gold paid to HiredThug01 after the last round (0 = none)
Int Property SexPayAmount Auto Hidden
Bool Property SexFainted Auto Hidden
; Non-rapist chose another round
Bool Property SexWantMore Auto Hidden
; Extra round after fainting (no player choice)
Bool Property SexForced Auto Hidden
; Stage 40 in-place single round: AfterSexRound goes straight to Stage 100
Bool Property SexHereCapture Auto Hidden
; Stops AssassinDefeatToCapture running twice
Bool Property AssassinCaptureStarted Auto Hidden
; 06B location list picked for this sex (re-used before scene 12)
FormList Property SeduceLocList Auto Hidden
; BaboDiaQuest on this same quest (faint/death counters)
BaboDiaQuest Property BaboDia Auto
; This quest; all stage calls go through it
Quest Property BaboEncounter06 Auto
; Victory choice box: 0 Let them leave / 1 Kill all of them
Message Property BaboEncounter06BVictoryMsg Auto
; LoanShark quest: stored bounty + IncreaseBounty
BaboLoanSharkScript Property LoanSharkQuest Auto

; Stage 65 sex flow (paused scene flag, choice boxes, stat factions)
GlobalVariable Property BaboSceneStandBy Auto
GlobalVariable Property BaboSexWantMore Auto
; Non-rapist extra round box: 0 Do it again / 1 Stop
Message Property BaboEncounter06SexSecondMsg Auto
; Exhausted box: 0 Get a hold of myself / 1 I am so tired...
Message Property BaboResistSexFaintMessage Auto
; One-button leave boxes (full / partial bribe)
Message Property BaboEncounter06SexEndLeaveMsg Auto
Message Property BaboEncounter06SexEndLeavePartialBribeMsg Auto
Faction Property BaboFactionStatWill Auto
Faction Property BaboFactionStatCorruption Auto
Faction Property BaboFactionStatLewdness Auto
; Added to kidnap % when the player fainted
Int Property SeduceFaintCaptureBonus = 15 Auto

Function SetupEncounter()
	Int scenario = RollScenario()
	BaboEncounter06Scenario.SetValue(scenario as Float)

	BaboEncounter06BribeGlobal.SetValue(0)
	BaboEncounter06Intimidation.SetValue(0)

	AssassinCaptureStarted = False
	SexPayAmount = 0
	SexHereCapture = False

	If scenario == 2
		SetupAssassinEncounter()
		Return
	EndIf

	Int n = Utility.RandomInt(CrewMin, CrewMax)
	LastCrewSize = n
	BaboEncounter06CrewNum.setvalue(LastCrewSize)
	SpawnCrew(n)
	ApplySharedPersonalityToCrew(n)

	SexRapist = RollRapistOnLead(scenario)

	Int intim = (BaboSexController as BaboSexControllerManager).CalcIntimidation(Alias_HiredThug01.GetActorReference(), IntimidationWeightAppearance, IntimidationWeightExposure, IntimidationWeightLevel, IntimidateLevelGap)

	BaboEncounter06Intimidation.SetValue(intim as Float)
	EvaluateCrewPackages(n)
	SyncFaintGoal(n)
EndFunction

; Faint/death goals = mercenary count (KO/death win scales with mercenaries)
Function SyncFaintGoal(Int n)
	BaboDia.FaintCountNum = 0
	BaboDia.DeathCountNum = 0
	if n < 1
		n = 1
	endif
	BaboDia.FaintCountGoalNum = n
	BaboDia.DeathCountGoalNum = n
EndFunction

; Intimidate TIF: True = mercenaries yield
Bool Function RollIntimidateSuccess()
	Int chance = BaboEncounter06Intimidation.GetValue() as Int
	if chance <= 0
		return false
	endif
	if chance >= 100
		return true
	endif
	return Utility.RandomInt(1, 100) <= chance
EndFunction


Int Function GetRapistDiminish(Int scenario)
	If scenario == 0
		Return 50
	ElseIf scenario == 1
		Return 80
	ElseIf scenario == 2
		Return 150
	EndIf
	; Rapist scenario (3): 0
	Return 0
EndFunction

Bool Function RollRapistOnLead(Int scenario)
	BaboSexControllerManager mgr = BaboSexController as BaboSexControllerManager
	Return mgr.IsactorRapist(Alias_HiredThug01.GetActorReference(), GetRapistDiminish(scenario), false)
EndFunction

Int Function RollScenario()
	Int wO = WeightOpportunist
	Int wB = WeightBountyHunter
	Int wA = WeightAssassin
	If wO < 0
		wO = 0
	EndIf
	If wB < 0
		wB = 0
	EndIf
	If wA < 0
		wA = 0
	EndIf
	; No visits left: only the Assassin can roll
	If BaboEncounter06VisitCount.GetValue() <= 0.0
		wO = 0
		wB = 0
	EndIf
	Int sum = wO + wB + wA
	If sum <= 0
		Return 1
	EndIf
	Int roll = Utility.RandomInt(1, sum)
	If roll <= wO
		Return 0
	EndIf
	roll -= wO
	If roll <= wB
		Return 1
	EndIf
	Return 2
EndFunction

; Scenario 2: lone assassin + rank/rapist, then Stage 70
Function SetupAssassinEncounter()
	ObjectReference marker = Alias_CenterMarker.GetReference()
	LastCrewSize = 1
	BaboEncounter06CrewNum.SetValue(1.0)

	SpawnOne(1, 1, BaboEncounter06Assassin, Alias_HiredThug01, marker)
	SpawnOne(2, 1, BaboEncounter06Thug02, Alias_HiredThug02, marker)
	SpawnOne(3, 1, BaboEncounter06Thug03, Alias_HiredThug03, marker)
	ApplySharedPersonalityToCrew(1)
	SexRapist = RollRapistOnLead(2)
	EvaluateCrewPackages(1)
	SyncFaintGoal(1)
	PrepareBribeCosts()
	BaboEncounter06.SetStage(70)
EndFunction


Function SpawnCrew(Int n)
	ObjectReference marker = Alias_CenterMarker.GetReference()

	SpawnOne(1, n, BaboEncounter06Thug01, Alias_HiredThug01, marker)
	SpawnOne(2, n, BaboEncounter06Thug02, Alias_HiredThug02, marker)
	SpawnOne(3, n, BaboEncounter06Thug03, Alias_HiredThug03, marker)
EndFunction

; slot > n clears the alias; spawned thugs are Essential; leader gets BountyNote
Function SpawnOne(Int slot, Int n, ActorBase akBase, ReferenceAlias akAlias, ObjectReference akMarker)
	if slot > n
		akAlias.Clear()
		return
	endif

	Actor akActor = akMarker.PlaceAtMe(akBase, 1, true, false) as Actor
	akAlias.ForceRefTo(akActor)
	akActor.GetActorBase().SetEssential(true)
	If akAlias == Alias_HiredThug01
		GiveBountyNoteToLeader(akActor)
	EndIf
EndFunction

Function GiveBountyNoteToLeader(Actor akLeader)
	ObjectReference noteRef = BountyNote.GetReference()
	If noteRef
		akLeader.AddItem(noteRef, 1, true)
	EndIf
EndFunction

; Mirrors SexController SetRandomCharacterRank buckets, one shared rank for the mercenaries
Int Function RollSharedCharacterRank()
	Int ichance = Utility.RandomInt(0, 100)
	If ichance < 25
		Return 0
	ElseIf ichance < 50
		Return 1
	ElseIf ichance < 85
		Return 2
	EndIf
	Return 3
EndFunction

Function ApplySharedPersonalityToCrew(Int n)
	BaboSexControllerManager mgr = BaboSexController as BaboSexControllerManager
	Int rank = RollSharedCharacterRank()
	ApplySharedPersonality(Alias_HiredThug01, 1, n, rank, mgr)
	ApplySharedPersonality(Alias_HiredThug02, 2, n, rank, mgr)
	ApplySharedPersonality(Alias_HiredThug03, 3, n, rank, mgr)
EndFunction

Function ApplySharedPersonality(ReferenceAlias akAlias, Int slot, Int n, Int rank, BaboSexControllerManager mgr)
	If slot > n
		Return
	EndIf
	mgr.SetChracterRank(akAlias.GetActorReference(), rank)
EndFunction

Function EvaluateCrewPackages(Int n)
	EvalOne(Alias_HiredThug01, 1, n)
	EvalOne(Alias_HiredThug02, 2, n)
	EvalOne(Alias_HiredThug03, 3, n)
EndFunction

Function EvalOne(ReferenceAlias akAlias, Int slot, Int n)
	if slot > n
		return
	endif

	akAlias.GetActorReference().EvaluatePackage()
EndFunction

; Take-gold TIF: gold to HiredThug01 (always up front), then set BribeGlobal (never SetStage here)
Function TakeBribeAndRoll()
	Int cost = BaboEncounter06BribeCost.GetValue() as Int
	if cost < 0
		cost = 0
	endif

	; Paid up front for every result
	PlayerRef.RemoveItem(Gold001, cost, true, Alias_HiredThug01.GetActorReference())

	Int result = RollBribeGlobal()
	LastBribeGlobal = result
	BaboEncounter06BribeGlobal.SetValue(result as Float)
EndFunction

; Ordered gate: SLAX rank, level gap (rank 2), then nudity + appearance
Int Function RollBribeGlobal()
	Actor speaker = Alias_HiredThug01.GetActorReference()
	Int slax = speaker.GetFactionRank(SLAX_AggressiveFaction)
	if slax < 0
		slax = 0
	endif

	if slax <= 1
		return 0
	endif

	if slax == 2
		if PlayerRef.GetLevel() > (speaker.GetLevel() + 10)
			return 0 ; player 11+ levels higher -> Leave
		endif
	endif

	Float nudity = BaboPlayerNudityValue.GetValue()
	Float nudityNeed = BaboPlayerNudityCriteriaSkimpy.GetValue()
	Float appearance = BaboPlayerAppearanceTotalValue.GetValue()
	Float appearanceNeed = BaboPlayerAppearanceCriteriaAverage.GetValue()

	if nudity >= nudityNeed && appearance >= appearanceNeed
		return 1 ; Sex
	endif
	return 2 ; Capture
EndFunction

; Stage 25
Function ShowSubmitChoice()
	Int bi = BaboEncounter06SubmitMsg.Show()
	If bi == 0
		BaboEncounter06.SetStage(70) ; Resist -> Combat
	Else
		BaboEncounter06.SetStage(35) ; Do not resist -> SubmitKneel
	EndIf
EndFunction

; Stage 35: kneel + mercenary ring, then SubmitKneelScene (index 4)
Function BeginSubmitKneel()
	(BaboSexController as BaboSexControllerManager).FadeinScene(true)

	Debug.SendAnimationEvent(PlayerRef, "BaboKneelingTied")

	PlaceCrewRingAroundPlayer(SubmitRingRadius)
	SnapCrewToFacePlayer()

	(BaboSexController as BaboSexControllerManager).FadeOutScene(true)
	SceneManager.Encounter06ScenePlay(4, true)
EndFunction

ReferenceAlias Function GetThugAlias(Int slot)
	If slot == 1
		Return Alias_HiredThug01
	ElseIf slot == 2
		Return Alias_HiredThug02
	ElseIf slot == 3
		Return Alias_HiredThug03
	EndIf
	Return None
EndFunction

Int Function CountFilledThugs()
	Int n = 0
	Int i = 1
	While i <= 3
		Actor a = GetThugAlias(i).GetActorReference()
		If a && !a.IsDead()
			n += 1
		EndIf
		i += 1
	EndWhile
	Return n
EndFunction

; Black screen: shared ring markers, HT01 Center / HT02 R01 / HT03 L01
Function PlaceCrewRingAroundPlayer(Float radius)
	BaboSexControllerManager mgr = BaboSexController as BaboSexControllerManager
	mgr.PlaceRingMarkers(PlayerRef, 360.0, radius)
	PlayerAliasMarker.ForceRefTo(mgr.BaboRingPlayerMarkerRef)
	HiredThug01Marker.ForceRefTo(mgr.BaboRingMarkerRefCenter)
	HiredThug02Marker.ForceRefTo(mgr.BaboRingMarkerRefR01)
	HiredThug03Marker.ForceRefTo(mgr.BaboRingMarkerRefL01)
	Alias_HiredThug01.GetActorReference().MoveTo(mgr.BaboRingMarkerRefCenter)
	Actor a = Alias_HiredThug02.GetActorReference()
	If a
		a.MoveTo(mgr.BaboRingMarkerRefR01)
	EndIf
	a = Alias_HiredThug03.GetActorReference()
	If a
		a.MoveTo(mgr.BaboRingMarkerRefL01)
	EndIf
EndFunction

Function SnapCrewToFacePlayer()
	Int i = 1
	While i <= 3
		Actor a = GetThugAlias(i).GetActorReference()
		If a && !a.IsDead()
			a.SetLookAt(PlayerRef, true)
		EndIf
		i += 1
	EndWhile
EndFunction

Function MoveActorToListIndex(Actor akActor, FormList akList, Int aiIndex)
	If aiIndex < 0 || aiIndex >= akList.GetSize()
		Return
	EndIf
	ObjectReference marker = akList.GetAt(aiIndex) as ObjectReference
	akActor.MoveTo(marker)
	akActor.SetAngle(0.0, 0.0, marker.GetAngleZ())
EndFunction

; Random 06B location list; LookOutMarker = its index 5
FormList Function PickSeduceLocationList()
	FormList loc = BaboEncounter06BFort02List
	Int roll = Utility.RandomInt(1, 4)
	If roll == 1
		loc = BaboEncounter06BHouse01List
	ElseIf roll == 2
		loc = BaboEncounter06BHouse02List
	ElseIf roll == 3
		loc = BaboEncounter06BFort01List
	EndIf
	LookOutMarker.ForceRefTo(loc.GetAt(5) as ObjectReference)
	Return loc
EndFunction

; Stage 65 QF entry; no-op if the partial path already started
Function RelocateThenStartSeduceSex()
	If SeducePartialLeaveMode || SeduceSexActive
		Return
	EndIf
	SeducePartialLeaveMode = False
	RelocateAndStartSeduceSexCore()
EndFunction


; Partial-bribe TIF: half gold (paid after sex), partial flag, Stage 65, relocate + sex
Function AcceptPartialBribeThenSex()
	Int cost = BaboEncounter06BribeCostHalf.GetValue() as Int
	If cost < 0
		cost = 0
	EndIf
	SexPayAmount = cost
	SeducePartialLeaveMode = True
	BaboEncounter06.SetStage(65)
	RelocateAndStartSeduceSexCore()
EndFunction

; Fade, move player + thugs to a random 06B location, StartSeduceSex
Function RelocateAndStartSeduceSexCore()
	(BaboSexController as BaboSexControllerManager).BaboReturnMarkerRef.MoveTo(PlayerRef)
	SeduceLocList = PickSeduceLocationList()
	(BaboSexController as BaboSexControllerManager).FadeinScene(true)

	PlaceAtSeduceLocation()

	(BaboSexController as BaboSexControllerManager).FadeOutScene(true)

	StartSeduceSex()
EndFunction

; Player at SeduceLocList[0], living thugs at the next indexes
Function PlaceAtSeduceLocation()
	MoveActorToListIndex(PlayerRef, SeduceLocList, 0)

	Int idx = 1
	Int i = 1
	While i <= 3
		Actor a = GetThugAlias(i).GetActorReference()
		If a && !a.IsDead()
			MoveActorToListIndex(a, SeduceLocList, idx)
			idx += 1
		EndIf
		i += 1
	EndWhile
EndFunction

; Stage 65 entry for all sex: round 1 of 2 (3 with 3 mercenaries)
Function StartSeduceSex()
	LastSeducePartnerOrgasm = False
	LastSeduceCapture = False
	LastSeduceOrgasmTracked = True
	SeduceSexActive = True
	SexFainted = False
	SexWantMore = False
	SexForced = False
	SexCrew = CountFilledThugs()
	SexRound = 1
	SexRoundsTotal = 2
	If SexCrew == 3
		SexRoundsTotal = 3
	EndIf
	RegisterForModEvent("SexLabOrgasmSeparate", "OnSeduceOrgasmSeparate")
	StartSexRound()
EndFunction

; Partners + tags by rapist / mercenary count / round
Function StartSexRound()
	Actor t1 = Alias_HiredThug01.GetActorReference()
	Actor t2 = Alias_HiredThug02.GetActorReference()
	Actor t3 = Alias_HiredThug03.GetActorReference()
	Actor pa = t1
	Actor pb = None
	Actor pc = None
	String tag1 = "MF"
	String agg = ""
	String act = "Vaginal"
	If SexRapist
		agg = "Aggressive"
	EndIf
	If Utility.RandomInt(0, 1) == 1
		act = "Oral"
	EndIf
	If SexCrew == 1
		If SexRapist && SexRound == 2
			act = "Vaginal"
			; Lewdness below 2 = unsatisfied
			If PlayerRef.GetFactionRank(BaboFactionStatLewdness) < 2
				act = "Anal"
			EndIf
		EndIf
	ElseIf SexCrew == 2
		If !SexRapist
			pb = t2
			tag1 = "MMF"
			act = "Vaginal"
		ElseIf SexRound == 2
			If PlayerRef.GetFactionRank(BaboFactionStatLewdness) < 2
				pb = t2
				tag1 = "MMF"
				act = "Rape"
			Else
				pa = t2
				act = "Vaginal"
			EndIf
		EndIf
	Else
		If SexRound == 2
			pa = t2
			pb = t3
			tag1 = "MMF"
			act = "Vaginal"
		ElseIf SexRound == 3
			pb = t2
			pc = t3
			tag1 = "MMMF"
			act = "Anal"
		EndIf
	EndIf
	(BaboSexController as BaboSexControllerManager).SexCustomActor(PlayerRef, pa, pb, pc, None, tag1, agg, act, true, "Event06SeduceSex", "Encounter06SeduceSexEnd", false)
EndFunction

Event OnSeduceOrgasmSeparate(Form ActorRef, Int Thread)
	If !SeduceSexActive
		Return
	EndIf
	If (ActorRef as Actor) == Alias_HiredThug01.GetActorReference()
		LastSeducePartnerOrgasm = True
	EndIf
EndEvent

; Stage 40 QF: RapistFaction mercenaries, in place, one Aggressive Vaginal round (MF/MMF/MMMF), then Stage 100
Function StartSexHereCapture()
	SexHereCapture = True
	String tag1 = "MF"
	Int crew = CountFilledThugs()
	If crew == 2
		tag1 = "MMF"
	ElseIf crew == 3
		tag1 = "MMMF"
	EndIf
	(BaboSexController as BaboSexControllerManager).SexCustomActor(PlayerRef, Alias_HiredThug01.GetActorReference(), Alias_HiredThug02.GetActorReference(), Alias_HiredThug03.GetActorReference(), None, tag1, "Aggressive", "Vaginal", true, "Event06SeduceSex", "Encounter06SeduceSexEnd", false)
EndFunction

; SexController Encounter06SeduceSexEnd hook: interlude scene or end of sex
Function AfterSexRound()
	BaboSexControllerManager mgr = BaboSexController as BaboSexControllerManager
	mgr.RandomExhaustionIdle(PlayerRef)
	If SexHereCapture
		SexHereCapture = False
		MsgCtrl.EncounterEvent06Messagebox(7)
		BaboEncounter06.SetStage(100) ; CaptureTeleport
		Return
	EndIf
	
	If SexForced
		SexForced = False
		mgr.FadeinScene(true)
		MsgCtrl.EncounterEvent06Messagebox(9)
		ResolveSexEnd()
	ElseIf SexRound < SexRoundsTotal
		; 6 Interlude / 7 Interlude02 / 8 Interlude03 / 9 Interlude03B
		SceneManager.Encounter06ScenePlay(4 + SexCrew + SexRound, true)
	Else
		FinishSex()
	EndIf
EndFunction

; Interlude scene End fragment: next round, or stop if the non-rapist declined
Function NextSexRound()
	If !SexRapist && SexRound == SexRoundsTotal - 1 && !SexWantMore
		FinishSex()
		Return
	EndIf
	SexRound += 1
	StartSexRound()
EndFunction

; Non-rapist interlude scene phase: pause scene, ask for another round
Function AskSexSecondRound()
	Int choice = BaboEncounter06SexSecondMsg.Show()
	If choice == 0
		SexWantMore = True
		MsgCtrl.EncounterEvent06Messagebox(11)
		; Exception: an accepted extra round costs a visit
		ConsumeVisit(1)
	else
		SexWantMore = False
	EndIf
	BaboSexWantMore.setvalue(SexWantMore as int)
	BaboSceneStandBy.SetValue(1)
EndFunction

; All rounds done: black screen, exhaustion (rapist only), forced extra round
Function FinishSex()
	SeduceSexActive = False
	UnregisterForModEvent("SexLabOrgasmSeparate")
	BaboSexControllerManager mgr = BaboSexController as BaboSexControllerManager
	mgr.FadeinScene(true)
	; Mercenary bonus for the exhaustion roll: 2 -> +15, 3 -> +30
	Int extra = 0
	If SexCrew == 2
		extra = 15
	ElseIf SexCrew == 3
		extra = 30
	EndIf
	If SexRapist && mgr.SuccumbToLust(PlayerRef, 0, true, extra)
		SexFainted = True
		If BaboResistSexFaintMessage.Show() == 0
			; Will rank x 10 % to resist, then one weaker re-roll
			If Utility.RandomInt(1, 100) <= PlayerRef.GetFactionRank(BaboFactionStatWill) * 10 && !mgr.SuccumbToLust(PlayerRef, 20, true, extra)
				SexFainted = False
			EndIf
		EndIf
	EndIf
	Utility.wait(1.0)
	If SexFainted
		MsgCtrl.EncounterEvent06Messagebox(6)
		; Forced continuation: (HT01 SLAX rank + 1) x 15 %
		If Utility.RandomInt(1, 100) <= (Alias_HiredThug01.GetActorReference().GetFactionRank(SLAX_AggressiveFaction) + 1) * 15
			SexForced = True
			mgr.FadeOutScene(true)
			StartSexRound()
			Return
		EndIf
	EndIf
	ResolveSexEnd()
EndFunction

; Pay partial-bribe gold, decide kidnap, then scenes or leave
Function ResolveSexEnd()
	BaboSexControllerManager mgr = BaboSexController as BaboSexControllerManager
	mgr.LosingControl()
	If SexPayAmount > 0
		PlayerRef.RemoveItem(Gold001, SexPayAmount, true, Alias_HiredThug01.GetActorReference())
		SexPayAmount = 0
	EndIf
	LastSeduceCapture = !SeducePartialLeaveMode && RollPostSexCapture()
	If SexFainted
		; 10 SexAfterScene (black dialogue); its End fragment calls AfterSexFainted
		SceneManager.Encounter06ScenePlay(10, true)
	ElseIf !LastSeduceCapture
		SexLeaveFlow(False)
	ElseIf SexRapist
		mgr.FadeinScene(True)
		mgr.PlayPairedMotion(Alias_HiredThug01.GetActorReference(), "Babo_CollapsedLoop_S2_A1", "Babo_CollapsedLoop_S2_A2", -70.0, 45.0, -90.0)
		mgr.FadeoutScene(True)
		; 11 AfterResist; its End fragment calls SexLeaveFlow(False)
		SceneManager.Encounter06ScenePlay(11, true)
	Else
		BaboEncounter06.SetStage(100) ; CaptureTeleport
	EndIf
EndFunction

; SexAfterScene End fragment (fainted only): kidnap or leave
Function AfterSexFainted()
	SceneManager.Encounter06ScenePlay(10, false)
	If LastSeduceCapture
		; Back to the initial sex spots, Crouch Holding Head idle (next motion in scene 12)
		BaboSexControllerManager mgr = BaboSexController as BaboSexControllerManager
		PlaceAtSeduceLocation()
		mgr.PlayPairedMotion(Alias_HiredThug01.GetActorReference(), "BaboFaintF", "BaboCrouchM", 0.0, 90.0, 180.0)
		mgr.FadeOutScene(true)
		; 12 AfterFaint; its End fragment calls AfterFaintSceneToCapture
		if SceneManager.Encounter06ScenePlay(12, true)
			;Null
		else
			AfterFaintSceneToCapture()
		endif
	Else
		SexLeaveFlow(True)
	EndIf
EndFunction

; AfterFaintScene End fragment: fade, release paired motion, Stage 100
Function AfterFaintSceneToCapture()
	BaboSexControllerManager mgr = BaboSexController as BaboSexControllerManager
	mgr.FadeinScene(true)
	mgr.EndPairedMotion(Alias_HiredThug01.GetActorReference())
	BaboEncounter06.SetStage(100)
	Utility.Wait(1.0)
	mgr.FadeOutScene(true)
EndFunction

; Delete mercenaries, leave message, return to the original spot (255)
Function SexLeaveFlow(Bool lieDown)
	BaboSexControllerManager mgr = BaboSexController as BaboSexControllerManager
	;mgr.FadeOutScene(true)
	mgr.FadeinScene(true)
	SetFilledThugsEssential(false)
	DisableAndDeleteFilledThugs()
	
	If lieDown
		Debug.SendAnimationEvent(PlayerRef, "BaboFaintFStart")
		MsgCtrl.EncounterEvent06Messagebox(10)
	Else
		Utility.Wait(4.0)
	EndIf
	If SeducePartialLeaveMode
		BaboEncounter06SexEndLeavePartialBribeMsg.Show()
	Else
		BaboEncounter06SexEndLeaveMsg.Show()
	EndIf
	If lieDown
		Debug.SendAnimationEvent(PlayerRef, "BaboFaintFEnd")
	EndIf
	SeducePartialLeaveMode = False
	SexLeaveCleanup()
EndFunction

Function SexResistLeaveFlow()
	BaboSexControllerManager mgr = BaboSexController as BaboSexControllerManager
	mgr.FadeinScene(true)
	SetFilledThugsEssential(false)
	DisableAndDeleteFilledThugs()

	if BaboEncounter06SexResistLeaveMsg.show() == 0
		PlayerRef.MoveTo(mgr.BaboReturnMarkerRef)
		mgr.FadeOutScene(true)
		BaboEncounter06.SetStage(255)
	endif
EndFunction

Bool Function RollPostSexCapture()
	If SeduceOrgasmForcesRelease && LastSeducePartnerOrgasm
		Return False
	EndIf

	Float total = BaboPlayerAppearanceTotalValue.GetValue()
	Float average = BaboPlayerAppearanceCriteriaAverage.GetValue()
	Float veryHard = BaboPlayerAppearanceCriteriaVeryHard.GetValue()

	Int chance = SeduceCaptureChanceLow ; Total < Average
	If total >= veryHard
		chance = SeduceCaptureChanceHigh
	ElseIf total >= average
		chance = SeduceCaptureChanceMid
	EndIf

	If LastSeduceOrgasmTracked && !LastSeducePartnerOrgasm
		chance += SeduceNoOrgasmCaptureBonus
	EndIf
	If SexFainted
		chance += SeduceFaintCaptureBonus
	EndIf

	If chance <= 0
		Return False
	EndIf
	If chance >= 100
		Return True
	EndIf
	Return Utility.RandomInt(1, 100) <= chance
EndFunction


; Stage 10 fragment + SetupAssassinEncounter. Cost = stored bounty / 10, Half = Cost / 2
Function PrepareBribeCosts()
	Float bounty = LoanSharkQuest.BaboLoanSharkBountyGlobal.GetValue()
	Int cost = Math.Floor((bounty / 10.0) + 0.5)
	Int half = cost / 2
	BaboEncounter06BribeCost.SetValue(cost as Float)
	BaboEncounter06BribeCostHalf.SetValue(half as Float)
	UpdateCurrentInstanceGlobal(BaboEncounter06BribeCost)
	UpdateCurrentInstanceGlobal(BaboEncounter06BribeCostHalf)
EndFunction

; Remaining visits -n on NPC death or an accepted extra sex round (never below 0)
Function ConsumeVisit(Int n = 1)
	Int left = (BaboEncounter06VisitCount.GetValue() as Int) - n
	If left < 0
		left = 0
	EndIf
	BaboEncounter06VisitCount.SetValue(left as Float)
EndFunction

; BaboDia RoadEncounterEvent06 DeathCount hook: combat deaths only (Stage 70-84)
Function OnCrewDeathCounted()
	Int st = BaboEncounter06.GetStage()
	If st >= 70 && st < 85
		ConsumeVisit(1)
	EndIf
EndFunction

; Stage 85 fragment: Essential off first, then victory box, then choice
Function ShowVictoryChoice()
	(BaboSexController as BaboSexControllerManager).RaiseCompetitiveness(5.0, 200.0)
	SetFilledThugsEssential(false)
	int choice = BaboEncounter06BVictoryMsg.Show()
	If choice == 1
		if SceneManager.Encounter06ScenePlay(15, true)
			;Null
		else
			KillCrewAfterVictory()
			BaboEncounter06.SetStage(95) ; ThugsKilled
		endif
	Else
		if SceneManager.Encounter06ScenePlay(14, true)
			;Null
		else
			BaboEncounter06.SetStage(90)
		endif
		 ; WalkAway
	EndIf
EndFunction

; Kill all: per living NPC bounty +KillBountyPerNPC and one visit, then Stage 95
Function KillCrewAfterVictory()
	Int i = 1
	While i <= 3
		Actor a = GetThugAlias(i).GetActorReference()
		If a && !a.IsDead()
			a.GetActorBase().SetEssential(false)
			a.Kill(PlayerRef)
			LoanSharkQuest.IncreaseBounty(KillBountyPerNPC)
			ConsumeVisit(1)
		EndIf
		i += 1
	EndWhile
EndFunction

; Stage 95 fragment: kill notice, Corruption down, then 255
Function ThugsKilled()
	BaboSexControllerManager mgr = (BaboSexController as BaboSexControllerManager)
	MsgCtrl.EncounterEvent06Messagebox(8)
	mgr.ConfidenceExp(LastCrewSize * 2)
	mgr.CorruptionExp(LastCrewSize * -4)
	BaboEncounter06.SetStage(255)
EndFunction

Function SetFilledThugsEssential(Bool abEssential)
	Int i = 1
	While i <= 3
		Actor a = GetThugAlias(i).GetActorReference()
		If a
			a.GetActorBase().SetEssential(abEssential)
		EndIf
		i += 1
	EndWhile
EndFunction

Function DisableAndDeleteFilledThugs()
	Int i = 1
	While i <= 3
		Actor a = GetThugAlias(i).GetActorReference()
		If a
			a.Disable()
			a.Delete()
		EndIf
		GetThugAlias(i).Clear()
		i += 1
	EndWhile
EndFunction

; Free/partial leave: fade, delete thugs, return player, Stage 255 (not capture)
Function SexLeaveCleanup()
	(BaboSexController as BaboSexControllerManager).FadeinScene(true)

	SetFilledThugsEssential(false)
	DisableAndDeleteFilledThugs()

	PlayerRef.MoveTo((BaboSexController as BaboSexControllerManager).BaboReturnMarkerRef)

	(BaboSexController as BaboSexControllerManager).FadeOutScene(true)

	BaboEncounter06.SetStage(255)
EndFunction

; Stage 90 fragment: black screen, Essential off, delete mercenaries -> 255
Function LeaveUnderBlack()
	BaboSexControllerManager mgr = BaboSexController as BaboSexControllerManager
	mgr.FadeinScene(true)
	SetFilledThugsEssential(false)
	DisableAndDeleteFilledThugs()
	mgr.ConfidenceExp(LastCrewSize * 2)
	mgr.CorruptionExp(LastCrewSize * -3)
	mgr.FadeOutScene(true)
	MsgCtrl.EncounterEvent06Messagebox(2)
	BaboEncounter06.SetStage(255)
EndFunction

; Stage 50/55/60 fragment: Essential off, walk away, 1h loop until out of sight -> 255
Function BeginWalkAwayLeave()
	SetFilledThugsEssential(false)
	Int n = LastCrewSize
	If n < 1
		n = CountFilledThugs()
	EndIf
	EvaluateCrewPackages(n)
	RegisterForSingleUpdateGameTime(1.0)
EndFunction

; WalkAway loop (Stage 50/55/60): deletes mercenaries once unloaded -> 255
Event OnUpdateGameTime()
	Int st = BaboEncounter06.GetStage()
	If st != 50 && st != 55 && st != 60
		Return
	EndIf

	Bool anyLoaded = False
	Int i = 1
	While i <= 3
		Actor a = GetThugAlias(i).GetActorReference()
		If a && a.Is3DLoaded()
			anyLoaded = True
		EndIf
		i += 1
	EndWhile

	If anyLoaded
		RegisterForSingleUpdateGameTime(1.0)
		Return
	EndIf

	; Mercenaries fully unloaded: delete directly
	DisableAndDeleteFilledThugs()
	BaboEncounter06.SetStage(255)
EndEvent

Bool Function IsAssassinScenario()
	Return (BaboEncounter06Scenario.GetValue() as Int) == 2
EndFunction

; Stage 70: player essential + hit events, surrender hook, ChallengeStart
Function StartEncounterCombat()
	BaboDia.GoToState("RoadEncounterEvent06")
	Int goal = LastCrewSize
	If goal < 1
		goal = 1
	EndIf
	BaboDia.DeathCountGoalNum = goal

	BaboBrawlingPlayerREF playerAlias = Alias_Player as BaboBrawlingPlayerREF
	playerAlias.CheckEssential()
	Int i = 1
	While i <= 3
		Actor a = GetThugAlias(i).GetActorReference()
		If a && !a.IsDead()
			playerAlias.RegisterOnHitExExtra(a)
		EndIf
		i += 1
	EndWhile

	RegisterSurrenderEvent()

	BaboSexControllerManager mgr = BaboSexController as BaboSexControllerManager
	If IsAssassinScenario()
		mgr.ChallengeStart(Alias_HiredThug01)
	Else
		mgr.ChallengeStartArray(Crews)
	EndIf
EndFunction

; SexController sends On_BaboDiaSurrender on the surrender key
Function RegisterSurrenderEvent()
	RegisterForModEvent("On_BaboDiaSurrender", "OnBaboDiaSurrender")
	(BaboSexController as BaboSexControllerManager).ReadySurrender(true)
EndFunction

; Only at Stage 70 -> Stage 80
Event OnBaboDiaSurrender()
	If BaboEncounter06.GetStage() != 70
		Return
	EndIf
	(BaboSexController as BaboSexControllerManager).ReadySurrender(false)
	BaboEncounter06.SetStage(80)
EndEvent

; Stage 75/80/85: surrender off, mercenaries recovered + pacified, player essential off
Function EndEncounterCombat()
	BaboSexControllerManager mgr = BaboSexController as BaboSexControllerManager
	mgr.ReadySurrender(false)
	UnregisterForModEvent("On_BaboDiaSurrender")

	RecoverCrewAfterCombat()

	If IsAssassinScenario()
		mgr.pacifyAlias(Alias_HiredThug01)
	Else
		mgr.pacifyAliasArray(Crews)
	EndIf

	(Alias_Player as BaboBrawlingPlayerREF).ClearEssential()
EndFunction

Function RecoverCrewAfterCombat()
	Int i = 1
	While i <= 3
		RecoverOneAfterCombat(GetThugAlias(i).GetActorReference())
		i += 1
	EndWhile
EndFunction

Function RecoverOneAfterCombat(Actor akActor)
	If !akActor || akActor.IsDead()
		Return
	EndIf
	akActor.StopCombat()
	akActor.StopCombatAlarm()
	akActor.SetUnconscious(false)
	akActor.ResetHealthAndLimbs()
	akActor.RestoreActorValue("Health", akActor.GetBaseActorValue("Health"))
EndFunction

; Stage 75
Function BeginCombatDefeat()
	EndEncounterCombat()
	If IsAssassinScenario()
		AssassinDefeatToCapture()
	Else
		if SceneManager.Encounter06ScenePlay(13, true)
			;Null
		else
			BaboEncounter06.SetStage(100)
		endif
	EndIf
EndFunction

; Stage 80: SubmitScene (index 5); Sc3 goes straight to capture if no SceneManager
Function BeginSurrender()
	EndEncounterCombat()
	(BaboSexController as BaboSexControllerManager).LosingControl()
	if SceneManager.Encounter06ScenePlay(5, true)
		;Null
	else
		AfterSurrenderScene()
	endif
EndFunction

; SubmitScene End hook: Sc2 assassin capture, else message 1 + Stage 100 if still at 80
Function AfterSurrenderScene()
	If IsAssassinScenario()
		AssassinDefeatToCapture()
	ElseIf BaboEncounter06.GetStage() == 80
		BaboSexControllerManager mgr = BaboSexController as BaboSexControllerManager
		mgr.FadeinScene(true)
		MsgCtrl.EncounterEvent06Messagebox(1)
		BaboEncounter06.SetStage(100)
		Utility.Wait(1.0)
		mgr.FadeOutScene(true)
	EndIf
EndFunction

; Sc2 defeat: WombHit, fade, message 5, Stage 100
Function AssassinDefeatToCapture()
	If AssassinCaptureStarted
		Return
	EndIf
	AssassinCaptureStarted = True
	BaboSexControllerManager mgr = BaboSexController as BaboSexControllerManager
	Actor ht01 = Alias_HiredThug01.GetActorReference()
	mgr.PlayPairedMotion(ht01, "BaboWombHit", "BaboWombHitM", 13.0, 21.0, 180.0)
	Utility.Wait(1.0)
	mgr.MiscSound(ht01, 1)
	mgr.UseSexlabVoice(PlayerRef, true)
	Utility.Wait(2.0)
	mgr.FadeinScene(true)
	mgr.EndPairedMotion(ht01)
	MsgCtrl.EncounterEvent06Messagebox(5)
	BaboEncounter06.SetStage(100)
	Utility.Wait(1.0)
	mgr.FadeOutScene(true)
EndFunction
