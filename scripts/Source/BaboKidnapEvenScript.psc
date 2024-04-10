Scriptname BaboKidnapEvenScript extends Quest  

Actor Property PlayerRef Auto
ActorBase Property BaboBadEndGuardM Auto
ActorBase Property BaboBadEndHelperM Auto
Actorbase Property Player Auto
Actor SurrogateActor

Bool bReadytoRest
Bool bCanTalkwithGuards
int CurrentDDI

Cell Property BaboKidnapperHouse01 Auto
Cell Property BaboKidnapperHouse02 Auto
Cell Property BaboKidnapperHouse03 Auto
Cell Property BaboSlaverHouse01 Auto
Cell Property BaboSlaverHouse02 Auto
Cell Property BaboSlaverHouse03 Auto
Cell Property BaboKidnapperCave01 Auto

Quest Property BaboStealingScript Auto
Quest Property BaboDialogueMCM Auto
Quest Property BaboSexController Auto
Quest Property BaboKidnapEventPending Auto
ObjectReference Property BaboTempStolenGoodsRef Auto
ObjectReference Property BaboDumpsterRef Auto
ObjectReference Property BaboFollowerStandbyMarkerRef Auto
ObjectReference Property BaboKidnapperHouse01DetectorBox Auto

ObjectReference Property BaboKidnapHouseXmarkerD Auto
ObjectReference Property BaboKidnapHouseXmarkerE Auto

ObjectReference Property BaboXmarkerHomeRef Auto

Faction Property BaboKidnapperEnemyFaction Auto
Faction Property BaboFactionAlmostEatenTitle Auto
Faction Property BaboFactionSexSlaveTitle Auto
Faction Property BaboKidnapCaptiveFaction Auto
Faction Property BaboAnonymousSlaverFaction Auto
Faction Property BaboAnonymousSlaverGuardFaction Auto
Faction Property SexLabAnimatingFaction Auto

Referencealias Property PlayerAlias Auto
Referencealias Property Kidnapper01 Auto
Referencealias Property Kidnapper02 Auto
Referencealias Property Kidnapper03 Auto
Referencealias Property Kidnapper04 Auto
Referencealias Property Kidnapper05 Auto
Referencealias Property Follower01 Auto
Referencealias Property Follower02 Auto
Referencealias Property Follower03 Auto
Referencealias Property Follower04 Auto
Referencealias Property Follower05 Auto
Referencealias Property Helper01 Auto
Referencealias Property Helper02 Auto
Referencealias Property KidnapperMarker01 Auto
Referencealias Property KidnapperMarker02 Auto
Referencealias Property KidnapperMarker03 Auto
Referencealias Property KidnapperMarker04 Auto
Referencealias Property KidnapperMarker05 Auto
Referencealias Property KidnapperVictimMarkerA Auto
Referencealias Property KidnapperVictimMarkerB Auto
Referencealias Property KidnapperVictimMarkerC Auto
Referencealias Property HelperMarker01 Auto
Referencealias Property HelperMarker02 Auto
Referencealias Property CenterMarkerPlayer Auto
Referencealias Property RestrainCenterMarker01 Auto
Referencealias Property RestrainCenterMarker02 Auto
Referencealias Property RestrainCenterMarker03 Auto
Referencealias Property RecoverMarker Auto
Referencealias Property FollowerMarker Auto
Referencealias Property ConfiscateChest Auto
Referencealias Property FurnitureSafeA Auto
Referencealias Property FurnitureSafeALink Auto
Referencealias Property KidnapperSafeMarkerA Auto
Referencealias Property KidnapperSafeMarkerB Auto
Referencealias Property PlayerTalkXmarker Auto
ReferenceAlias Property FrontDoor Auto
ReferenceAlias Property OtherVictimA Auto
ReferenceAlias Property OtherVictimB Auto
ReferenceAlias Property OtherVictimC Auto
ReferenceAlias Property WeaponMarker Auto
ReferenceAlias Property RestraintEquipment Auto
ReferenceAlias Property SweepAreaA Auto
ReferenceAlias Property SweepAreaB Auto
ReferenceAlias Property SweepAreaC Auto

ReferenceAlias Property CageDoorA Auto
ReferenceAlias Property FoodMarkerA Auto

LeveledItem Property BaboKidnap1HWeapon Auto
LeveledItem Property BaboListTribalClothes Auto

Quest Property BaboKidnapEvent Auto
Quest Property BaboMonitorScript Auto

Float Property StartGameHour Auto
Float Property EndGameHour Auto
GlobalVariable Property GameHour Auto
GlobalVariable Property GameDaysPassed Auto
GlobalVariable Property BaboKidnapScenarioe Auto
GlobalVariable Property BaboKidnapNormalEndScenarioe Auto
GlobalVariable Property BaboKidnapEscapeResponse Auto;0Nothing 1Sex 2Punish
GlobalVariable Property BaboSpeechCraftAV Auto
GlobalVariable Property BaboKidnapHelperRescue Auto
GlobalVariable Property BaboPlayerGagged Auto
GlobalVariable Property BaboGuardFavor Auto
GlobalVariable Property BaboSlaverTrust Auto
GlobalVariable Property BaboPlayerYoke Auto
GlobalVariable Property BaboKidnapLastFoodTime Auto
GlobalVariable Property BaboKidnapTiedUp Auto
GlobalVariable Property BaboDebugging Auto
GlobalVariable Property BaboKidnapGuardHelpPlayer Auto;0 Default 1 Escape Plan 2 Put off Escape Plan
GlobalVariable Property BaboKidnapGuardHelpPlayerMethod Auto;0 Kill Master 1 Kill Master and bring Player as slave 2 Bring the Key 3 not get in the way 4 Knock Master off  WIP

GlobalVariable Property BaboGlobalSexSlaveTitle Auto
GlobalVariable Property BaboGlobalAlmostEatenTitle Auto

ImageSpaceModifier Property BaboFadeToBlack  Auto  
ImageSpaceModifier Property BaboFadeToBlackFast  Auto  
ImageSpaceModifier Property BaboFadeToBlackHoldImod  Auto  
ImageSpaceModifier Property BaboFadeToBlackBackImod  Auto  
ImageSpaceModifier Property BaboFadeToBlackBackImodFast  Auto  

Package Property BaboDoNothing Auto

Scene Property BaboKidnapEventDrunkPlayerScene01 Auto
Scene Property BaboKidnapEventDrunkPlayerScene02 Auto
Scene Property BaboKidnapEventDrunkPlayerSceneEnd Auto
Scene Property BaboKidnapEventDrunkPlayerSceneNormalEnd Auto
Scene Property BaboKidnapEventDrunkPlayerSceneNormalScene01 Auto

Scene Property BaboKidnapEventScenario10A Auto
Scene Property BaboKidnapEventScenario04A Auto;Start Scene
Scene Property BaboKidnapEventScenario04B Auto
Scene Property BaboKidnapEventScenario04C Auto
Scene Property BaboKidnapEventScenario04D Auto
Scene Property BaboKidnapEventScenario04E Auto
Scene Property BaboKidnapEventScenario04EB Auto
Scene Property BaboKidnapEventScenario20A Auto
Scene Property BaboKidnapEventScenario20B Auto
Scene Property BaboKidnapEventScenario20BAfter Auto
Scene Property BaboKidnapEventScenario20C Auto
Scene Property BaboKidnapEventScenario20D Auto
Scene Property BaboKidnapEventScenario20E Auto;Punch punish Scene
Scene Property BaboKidnapEventScenario20F Auto;
Scene Property BaboKidnapEventScenario20FB Auto;
Scene Property BaboKidnapEventScenarioCall Auto;Call the guard
Scene Property BaboKidnapEventScenarioCallFail Auto;Call the guard
Scene Property BaboKidnapEventScenarioPunishPunch Auto
Scene Property BaboKidnapEventScenarioGuardSex Auto
Scene Property BaboKidnapEventScenarioGuardSexB Auto
Scene Property BaboKidnapEventScenarioGuardAfterSex Auto
Scene Property BaboKidnapEventScenarioGuardAfterSexB Auto
Scene Property BaboKidnapEventScenarioGuardKillMaster Auto
Scene Property BaboKidnapEventYouAreSpotted Auto
Scene Property BaboKidnapEventYouAreSpottedA02 Auto
Scene Property BaboKidnapEventYouAreSpottedA03 Auto
Scene Property BaboKidnapEventYouAreSpottedA04 Auto
Scene Property BaboKidnapEventScenarioRescue Auto
Scene Property BaboKidnapEventFollowersStandBy Auto

formlist Property BaboPantiesFormList auto
formlist Property BaboSkirtFormList auto
formlist Property BaboSkoomaFormList auto
formlist Property BaboBoozeFormList auto
formlist Property BaboRemoveItemFormList auto
formlist Property BaboKidnapNPCList auto
formlist Property BaboKidnapSlaverGuardList auto
formlist Property BaboDrunkRapistNPCList auto

formlist Property BaboEdibleSoupFormList auto
formlist Property BaboEdibleCheapFormList auto
formlist Property BaboEdibleTrashFormList auto
formlist Property BaboEdibleWaterFormList auto
Formlist Property BaboEdibleSuspiciousFormList Auto
Formlist Property BaboEscapeToolFormList Auto

Faction Property SLAX_RapistFaction Auto

ObjectReference Property BaboRecoverMarkerRef  Auto  
ObjectReference Property BaboFollowerRecoverMarkerRef  Auto  

;BaboChangeLocationEvent07 Properties
ReferenceAlias Property CL07RecoverMarker Auto
ReferenceAlias Property CL07FollowerMarker Auto

Message Property BaboKidnapOptionsGaggedMessage Auto
Message Property BaboKidnapOptionsMessage Auto
Message Property BaboKidnapCaveOptionsGaggedMessage Auto
Message Property BaboKidnapCaveOptionsMessage Auto
Message Property BaboKidnapHangedMessage Auto
Message Property BaboKidnapCageOptionMessage Auto
Message Property BaboKidnapCageOptionBMessage Auto
Message Property BaboKidnapCageGaggedOptionMessage Auto
Message Property BaboKidnapCageDoorOptionMessage Auto
Message Property BaboKidnapSleepOptionMessage Auto
Message Property BaboKidnapStarvedMessage Auto
Message Property BaboKidnapFarAwayMessage Auto

Message Property BaboHotkeyTutorialMessage Auto


Perk Property BaboAwfullyFatiguedPerk Auto
GlobalVariable Property BaboPlayerDetectorGlobal Auto
GlobalVariable Property BaboActorDetectorGlobal Auto
GlobalVariable Property BaboPrisonerDetectorGlobal Auto
GlobalVariable Property BaboKidnapEscapeAttempts Auto
GlobalVariable Property BaboKidnapbFoodTime Auto

GlobalVariable Property BaboDDI Auto

Key Property BaboKidnapHouse01Key Auto
Key Property BaboKidnapHouse02Key Auto
Key Property BaboKidnapHouse03Key Auto

Key Property BaboSlaverHouse01Key Auto
Key Property BaboSlaverHouse02Key Auto
Key Property BaboSlaverHouse03Key Auto
Key Property BaboSlaverHouse04Key Auto

Key Property BaboSlaverNobleHouse01Key Auto

Armor Property BaboWristRopePlayable Auto
Armor Property BaboCollarRopePlayable Auto
Armor Property BaboAnkleRopePlayable Auto
Armor Property BaboGagLogBitPlayable Auto
Armor Property BaboYokeMetalPlayable Auto
Armor Property BaboPee01 Auto
Armor Property BaboTribalClotheTop Auto

Sound Property zbfSoundGagFrustrated Auto

actor akactor01
actor akactor02
actor akactor03
actor akactor04
actor akactor05

Perk Property BaboDia_WeaktoAdventurerPerk Auto

int property kidnapperKill Auto
int property kidnapperNum Auto
int property VictimNum Auto

Location Property BaboSlaverLocation01 Auto
Location Property BaboSlaverLocation02 Auto
Location Property BaboSlaverLocation03 Auto
Location Property BaboSlaverLocation04 Auto
Location Property BaboSlaverNobleHouseLocation01 Auto
Location Property BaboKidnapperLocation01 Auto
Location Property BaboKidnapperLocation02 Auto
Location Property BaboKidnapperLocation03 Auto
Location Property BaboKidnapperLocationCave Auto

Idle Property pa_1HMKillMoveBleedOutKill Auto
Idle Property pa_1HMKillMoveShortC Auto
Idle Property pa_KillMoveH2HComboA Auto

Objectreference Property BaboEventAbductionRoomMarker01 Auto
Objectreference Property BaboEventAbductionRoomMarker02 Auto

Quest Property BaboReputationScript Auto

Topic Property BaboKidnapEventBranchGuardSayT01 Auto

string HeadAttachNode ="NPC Head [Head]"
string NeckAttachNode = "npc neck [neck]"
string RopeAttachNode = "Vert05"
string RopeAttachNode2 = "Vert06"

float LockDurability

Function PlaceSlaveOutfit()
	FoodMarkerA.getreference().PlaceAtMe(BaboListTribalClothes)
EndFunction

Function PlaceSubWeapon()
	WeaponMarker.getreference().PlaceAtMe(BaboKidnap1HWeapon)
EndFunction

Function KidnapperAddPerk()
	(Kidnapper01.getreference() as actor).addperk(BaboDia_WeaktoAdventurerPerk)
	if Kidnapper02
		(Kidnapper02.getreference() as actor).addperk(BaboDia_WeaktoAdventurerPerk)
	endif
	if Kidnapper03
		(Kidnapper03.getreference() as actor).addperk(BaboDia_WeaktoAdventurerPerk)
	endif
	if Kidnapper04
		(Kidnapper04.getreference() as actor).addperk(BaboDia_WeaktoAdventurerPerk)
	endif
	if Kidnapper05
		(Kidnapper05.getreference() as actor).addperk(BaboDia_WeaktoAdventurerPerk)
	endif
endfunction

Bool Function FollowersStandby()
	(Follower01.getreference() as actor).moveto(BaboFollowerStandbyMarkerRef)
	(Follower02.getreference() as actor).moveto(BaboFollowerStandbyMarkerRef)
	(Follower03.getreference() as actor).moveto(BaboFollowerStandbyMarkerRef)
	(Follower04.getreference() as actor).moveto(BaboFollowerStandbyMarkerRef)
	(Follower05.getreference() as actor).moveto(BaboFollowerStandbyMarkerRef)
	if Follower01 || Follower02 || Follower03 || Follower04 || Follower05
		return true
	else
		return false
	endif
EndFunction

Function SettheStage()
;Nothing
endfunction

Function StartUptheEvent(int Scenarioe)
		;Clearallthealiases()
		if Scenarioe == 1
			Gotostate("BaboChangeLocationEvent07ScenarioMorthal")
		elseif Scenarioe == 2
			Gotostate("BaboChangeLocationEvent07ScenarioRorikstead")
		elseif Scenarioe == 3
			Gotostate("BaboChangeLocationEvent07ScenarioDragonBridge")
		elseif Scenarioe == 4
			Gotostate("BaboKidnapCabin")
		elseif Scenarioe == 5
			Gotostate("BaboKidnapCabinPunishment")
		elseif Scenarioe == 10
			Gotostate("BaboKidnapBanditCave")
		elseif Scenarioe == 20
			Gotostate("BaboSlaverCabin")
		else
			Gotostate("BaboKidnapStandby")
		endif
EndFunction

Function StartUptheNormalEvent(int Scenarioe)
	BaboKidnapNormalEndScenarioe.setvalue(0)
		;Clearallthealiases()
		if Scenarioe == 1
			Gotostate("");Blank
		elseif Scenarioe == 2
			Gotostate("BaboChangeLocationEvent07ScenarioRoriksteadWellRested")
		elseif Scenarioe == 3
			Gotostate("BaboChangeLocationEvent07ScenarioDragonBridgeWellRested")
		endif
EndFunction

Function KidnapGotostate(String StateName)
	Gotostate(StateName)
EndFunction

Function SetGameHourCustom(Bool AddTime, Float ftime)
if Addtime
	GameHour.SetValue(GameHour.getvalue() + ftime)
else
	GameHour.SetValue(ftime)
endif
EndFunction

Function CalcUnsavedCaptive()
int Unsaved = 0
	if OtherVictimA
		Unsaved += 1
	endif
	if OtherVictimB
		Unsaved += 1
	endif
	if OtherVictimC
		Unsaved += 1
	endif
(BaboSexController as BaboSexControllerManager).MinusRescueCount(Unsaved)
(BaboSexController as BaboSexControllerManager).ReputationDecrease(Unsaved * 5, Unsaved * 3)
EndFunction

Function RescueCaptive(actor akactor, int num)
	
	akactor.moveto(RecoverMarker.getreference())
	if akactor == (OtherVictimA.getreference() as actor)
		OtherVictimA.clear()
	elseif akactor == (OtherVictimB.getreference() as actor)
		OtherVictimB.clear()
	elseif akactor == (OtherVictimC.getreference() as actor)
		OtherVictimC.clear()
	endif
	akactor.deletewhenable();recruiting in future update?
	(BaboSexController as BaboSexControllerManager).PlusRescueCount(num)
EndFunction

Function AliasRapistAddFaction(ReferenceAlias akReference)
	(akReference.getreference() as actor).addtofaction(SLAX_RapistFaction)
EndFunction

Function AliasDrunkRapistAddList()

akactor01 = Kidnapper01.getreference() as actor
akactor02 = Kidnapper02.getreference() as actor
akactor03 = Kidnapper03.getreference() as actor
akactor04 = Kidnapper04.getreference() as actor
akactor05 = Kidnapper05.getreference() as actor

	if akactor01 && !akactor01.isdead()
		BaboDrunkRapistNPCList.addform(akactor01)
	endif
	if akactor02 && !akactor02.isdead()
		BaboDrunkRapistNPCList.addform(akactor02)
	endif
	if akactor03 && !akactor03.isdead()
		BaboDrunkRapistNPCList.addform(akactor03)
	endif
	if akactor04 && !akactor04.isdead()
		BaboDrunkRapistNPCList.addform(akactor04)
	endif
	if akactor05 && !akactor05.isdead()
		BaboDrunkRapistNPCList.addform(akactor05)
	endif
EndFunction

Function AliasSlaverGuardAddList()

akactor02 = Kidnapper02.getreference() as actor
akactor03 = Kidnapper03.getreference() as actor
akactor04 = Kidnapper04.getreference() as actor
akactor05 = Kidnapper05.getreference() as actor


	if akactor02 && !akactor02.isdead()
		if akactor02.isinfaction(BaboAnonymousSlaverGuardFaction)
			BaboKidnapSlaverGuardList.addform(akactor02)
			Kidnapper02.clear()
		endif
	endif
	if akactor03 && !akactor03.isdead()
		if akactor02.isinfaction(BaboAnonymousSlaverGuardFaction)
			BaboKidnapSlaverGuardList.addform(akactor03)
			Kidnapper03.clear()
		endif
	endif
	if akactor04 && !akactor04.isdead()
		if akactor02.isinfaction(BaboAnonymousSlaverGuardFaction)
			BaboKidnapSlaverGuardList.addform(akactor04)
			Kidnapper04.clear()
		endif
	endif
	if akactor05 && !akactor05.isdead()
		if akactor02.isinfaction(BaboAnonymousSlaverGuardFaction)
			BaboKidnapSlaverGuardList.addform(akactor05)
			Kidnapper05.clear()
		endif
	endif
EndFunction

Function AliasKidnapperAddList()

akactor01 = Kidnapper01.getreference() as actor
akactor02 = Kidnapper02.getreference() as actor
akactor03 = Kidnapper03.getreference() as actor
akactor04 = Kidnapper04.getreference() as actor
akactor05 = Kidnapper05.getreference() as actor

	if akactor01 && !akactor01.isdead()
		BaboKidnapNPCList.addform(akactor01)
		Kidnapper01.clear()
	endif
	if akactor02 && !akactor02.isdead()
		BaboKidnapNPCList.addform(akactor02)
		Kidnapper02.clear()
	endif
	if akactor03 && !akactor03.isdead()
		BaboKidnapNPCList.addform(akactor03)
		Kidnapper03.clear()
	endif
	if akactor04 && !akactor04.isdead()
		BaboKidnapNPCList.addform(akactor04)
		Kidnapper04.clear()
	endif
	if akactor05 && !akactor05.isdead()
		BaboKidnapNPCList.addform(akactor05)
		Kidnapper05.clear()
	endif
EndFunction

Function AliasKidnapperRemoveList()
	Actor akactor
	Int iIndex = BaboKidnapNPCList.GetSize()
	While iIndex > 0
		iIndex -= 1
		akactor = BaboKidnapNPCList.getat(iIndex) as actor
		BaboKidnapNPCList.RemoveAddedForm(akactor)
		akactor.delete()
	EndWhile
EndFunction

Function Clearallthealiases()

	Kidnapper01.clear()
	Kidnapper02.clear()
	Kidnapper03.clear()
	Kidnapper04.clear()
	Kidnapper05.clear()
	
	Helper01.clear()
	Helper02.clear()
	
	OtherVictimA.clear()
	OtherVictimB.clear()
	OtherVictimC.clear()
	
	KidnapperMarker01.clear()
	KidnapperMarker02.clear()
	KidnapperMarker03.clear()
	KidnapperMarker04.clear()
	KidnapperMarker05.clear()
	
	HelperMarker01.clear()
	HelperMarker02.clear()
	CenterMarkerPlayer.clear()
	RestrainCenterMarker01.clear()
	RestrainCenterMarker02.clear()
	RestrainCenterMarker03.clear()
EndFunction

Function FillKidnapperActors(Actor KidnapperRef01, Actor KidnapperRef02 = None, Actor KidnapperRef03 = None, Actor KidnapperRef04 = None, Actor KidnapperRef05 = None)
	if KidnapperRef01
		Kidnapper01.forcerefto(KidnapperRef01)
	endif
	if KidnapperRef02
		Kidnapper02.forcerefto(KidnapperRef02)
	endif
	if KidnapperRef03
		Kidnapper03.forcerefto(KidnapperRef03)
	endif
	if KidnapperRef04
		Kidnapper04.forcerefto(KidnapperRef04)
	endif
	if KidnapperRef05
		Kidnapper05.forcerefto(KidnapperRef05)
	endif
EndFunction

Function FillVictimActors(Actor VictimA, Actor VictimB, Actor VictimC)
	if VictimA
		OtherVictimA.forcerefto(VictimA)
	endif
	if VictimB
		OtherVictimB.forcerefto(VictimB)
	endif
	if VictimC
		OtherVictimC.forcerefto(VictimC)
	endif
EndFunction

Function FillKidnapperMarkers(Objectreference KidnapperMarkerRef01, Objectreference KidnapperMarkerRef02 = None, Objectreference KidnapperMarkerRef03 = None, Objectreference KidnapperMarkerRef04 = None, Objectreference KidnapperMarkerRef05 = None)
	KidnapperMarker01.forcerefto(KidnapperMarkerRef01)
	if KidnapperMarkerRef02
		KidnapperMarker02.forcerefto(KidnapperMarkerRef02)
	endif
	if KidnapperMarkerRef03
		KidnapperMarker03.forcerefto(KidnapperMarkerRef03)
	endif
	if KidnapperMarkerRef04
		KidnapperMarker04.forcerefto(KidnapperMarkerRef04)
	endif
	if KidnapperMarkerRef05
		KidnapperMarker05.forcerefto(KidnapperMarkerRef05)
	endif
EndFunction

Function FillPlayerMarkers(Objectreference CenterMarkerPlayerRef, Objectreference RestrainCenterMarkerRef01 = None, Objectreference RestrainCenterMarkerRef02 = None, Objectreference RestrainCenterMarkerRef03 = None)
	CenterMarkerPlayer.forcerefto(CenterMarkerPlayerRef)
	
	if RestrainCenterMarkerRef01
		RestrainCenterMarker01.forcerefto(RestrainCenterMarkerRef01)
	endif
	if RestrainCenterMarkerRef02
		RestrainCenterMarker02.forcerefto(RestrainCenterMarkerRef02)
	endif
	if RestrainCenterMarkerRef03
		RestrainCenterMarker03.forcerefto(RestrainCenterMarkerRef03)
	endif
EndFunction

Function RecoverMarkers(Objectreference RecoverMarkerPlayerRef, Objectreference RecoverMarkerFollowerRef)
if RecoverMarkerPlayerRef
	RecoverMarker.clear()
	RecoverMarker.forcerefto(RecoverMarkerPlayerRef)
endif

if RecoverMarkerFollowerRef
	FollowerMarker.clear()
	FollowerMarker.forcerefto(RecoverMarkerFollowerRef)
endif
EndFunction

Function Dumptheactors()
	if Kidnapper01
		(Kidnapper01.getreference() as actor).moveto(BaboDumpsterRef)
	endif
	if Kidnapper02
		(Kidnapper02.getreference() as actor).moveto(BaboDumpsterRef)
	endif
	if Kidnapper03
		(Kidnapper03.getreference() as actor).moveto(BaboDumpsterRef)
	endif
	if Kidnapper04
		(Kidnapper04.getreference() as actor).moveto(BaboDumpsterRef)
	endif
	if Kidnapper05
		(Kidnapper05.getreference() as actor).moveto(BaboDumpsterRef)
	endif
EndFunction

Function EatSoup(int Menu, int Times, Bool RandomMenu = false)
int i = 0
While i < Times
if RandomMenu
	Menu = Utility.randomint(0, BaboEdibleSoupFormList.GetSize() - 1)
endif
	PlayerRef.EquipItem(BaboEdibleSoupFormList.getat(Menu))
	Utility.wait(0.5)
i += 1
endWhile
EndFunction

Function DrinkWater(int Menu, int Times, Bool RandomMenu = false)
int i = 0
While i < Times
if RandomMenu
	Menu = Utility.randomint(0, BaboEdibleWaterFormList.GetSize() - 1)
endif
	PlayerRef.EquipItem(BaboEdibleWaterFormList.getat(Menu))
	Utility.wait(0.5)
i += 1
endWhile
EndFunction

Function EatCheap(int Menu, int Times, Bool RandomMenu = false)
int i = 0
While i < Times
if RandomMenu
	Menu = Utility.randomint(0, BaboEdibleCheapFormList.GetSize() - 1)
endif
	PlayerRef.EquipItem(BaboEdibleCheapFormList.getat(Menu))
	Utility.wait(0.5)
i += 1
endWhile
EndFunction

Function Drinkit(int Menu, int Times, Bool RandomMenu = false)
int i = 0
While i < Times
if RandomMenu
	Menu = Utility.randomint(0, BaboSkoomaFormList.GetSize() - 1)
endif
	PlayerRef.EquipItem(BaboSkoomaFormList.getat(Menu))
	Utility.wait(0.5)
i += 1
endWhile
EndFunction

Function DrinkitBooze(int Menu, int Times, Bool RandomMenu = false)
int i = 0
While i < Times
if RandomMenu
	Menu = Utility.randomint(0, BaboBoozeFormList.GetSize() - 1)
endif
	PlayerRef.EquipItem(BaboBoozeFormList.getat(Menu));Ale / WineAlto / Mead / Honingbrew / BlackBriar
	Utility.wait(0.5)
i += 1
endWhile
EndFunction

Function PlaceFoodSoup(int Menu, int Times, Bool RandomMenu = false, referencealias placemarker)
int i = 0
While i < Times
if RandomMenu
	Menu = Utility.randomint(0, BaboEdibleSoupFormList.GetSize() - 1)
endif
	placemarker.getreference().Placeatme(BaboEdibleSoupFormList.getat(Menu), 1)
	Utility.wait(0.5)
i += 1
endWhile
EndFunction

Function PlaceFoodTrash(int Menu, int Times, Bool RandomMenu = false, referencealias placemarker)
int i = 0
While i < Times
if RandomMenu
	Menu = Utility.randomint(0, BaboEdibleTrashFormList.GetSize() - 1)
endif
	placemarker.getreference().Placeatme(BaboEdibleTrashFormList.getat(Menu), 1)
	Utility.wait(0.5)
i += 1
endWhile
EndFunction

Function PlaceEscapeTool(int Menu, int Times, Bool RandomMenu = false, referencealias placemarker)
int i = 0
While i < Times
if RandomMenu
	Menu = Utility.randomint(0, BaboEscapeToolFormList.GetSize() - 1)
endif
	placemarker.getreference().Placeatme(BaboEscapeToolFormList.getat(Menu), 1)
	Utility.wait(0.5)
i += 1
endWhile
EndFunction

Function PlaceFoodSuspicious(int Menu, int Times, Bool RandomMenu = false, referencealias placemarker)
int i = 0
While i < Times
if RandomMenu
	Menu = Utility.randomint(0, BaboEdibleSuspiciousFormList.GetSize() - 1)
endif
	placemarker.getreference().Placeatme(BaboEdibleSuspiciousFormList.getat(Menu), 1)
	Utility.wait(0.5)
i += 1
endWhile
EndFunction

Function PlaceFoodCheap(int Menu, int Times, Bool RandomMenu = false, referencealias placemarker)
int i = 0
While i < Times
if RandomMenu
	Menu = Utility.randomint(0, BaboEdibleCheapFormList.GetSize() - 1)
endif
	placemarker.getreference().Placeatme(BaboEdibleCheapFormList.getat(Menu), 1)
	Utility.wait(0.5)
i += 1
endWhile
EndFunction

Function PlaceDrink(int Menu, int Times, Bool RandomMenu = false, referencealias placemarker)
int i = 0
While i < Times
if RandomMenu
	Menu = Utility.randomint(0, BaboEdibleWaterFormList.GetSize() - 1)
endif
	placemarker.getreference().Placeatme(BaboEdibleWaterFormList.getat(Menu), 1)
	Utility.wait(0.5)
i += 1
endWhile
EndFunction

Function RemoveProperty(int Menu, int count, bool Tsound)
	PlayerRef.RemoveItem(BaboRemoveItemFormList.getat(Menu), count, Tsound)
EndFunction

Function SetScenarioe(int Style)
	BaboKidnapScenarioe.setvalue(Style)
	;1 = Two travellers kidnap Player
	;20 = Slaved
EndFunction

Function SetAllSetstoDefault()
	BaboKidnapHelperRescue.setvalue(0)
	BaboKidnapEscapeResponse.setvalue(0)
	BaboKidnapScenarioe.setvalue(0)
	BaboKidnapEscapeAttempts.setvalue(0)
EndFunction

Function PlayBaboAnimation(Referencealias akactorRef, string AnimationName)
	Debug.sendanimationevent(akactorRef.getreference() as actor, AnimationName)
EndFunction

Function SetvehicleRef(Referencealias akactorRef, Referencealias ObjMarker)
	if !akactorRef
		if ObjMarker
			PlayerRef.SetVehicle(ObjMarker.getreference())
		else
			PlayerRef.SetVehicle(None)
		endif
	else
		if ObjMarker
			(akactorRef.getreference() as actor).SetVehicle(ObjMarker.getreference())
		else
			(akactorRef.getreference() as actor).SetVehicle(None)
		endif
	endif
EndFunction

Function PlayerTalkXmarkerStart()
	PlayerTalkXmarker.Getreference().moveto(PlayerRef)
EndFunction

Function PlayerTalkXmarkerReturn()
	PlayerTalkXmarker.Getreference().moveto(BaboXmarkerHomeRef)
EndFunction

Function Nocollision(Referencealias akactorRef)
actor akactor
	if !akactorRef
		akactor = PlayerRef
	else
		akactor = akactorRef.getreference() as actor
	endif
	(BaboSexController as BaboSexControllerManager).PrecisionCheck(akactor, true)
	if akactor == PlayerRef
		;Game.DisablePlayerControls( true, true, false, false, true, false, true, false )
		;akactor.SetDontMove(True)
		;akactor.SetRestrained()
		;Game.SetPlayerAIDriven(true)
		Game.DisablePlayerControls(true, true, true, false, true, true, false, false)
		Game.SetPlayerAIDriven()
		if Game.GetCameraState() == 0
			Game.ForceThirdPerson()
		endIf
	else
		ActorUtil.AddPackageOverride(akactor, BaboDoNothing, 100, 1)
		akactor.EvaluatePackage()
		akactor.SetRestrained(True)
		akactor.SetDontMove(True)
	endif
EndFunction

Function YesCollision(Referencealias akactorRef, string AnimationName)
	actor akactor
	if akactorRef
		akactor = akactorRef.getreference() as actor
	else
		akactor = PlayerRef
	endif
	
	if akactor == PlayerRef
		Game.EnablePlayerControls()
		Game.SetPlayerAIDriven(false)
		akactor.SetRestrained(false)
		akactor.SetDontMove(false)
		akactor.SetVehicle(None)
		ActorUtil.RemovePackageOverride(akactor, BaboDoNothing)
	else
		ActorUtil.RemovePackageOverride(akactor, BaboDoNothing)
		akactor.EvaluatePackage()
		akactor.SetRestrained(false)
		akactor.SetDontMove(false)
		akactor.SetVehicle(None)
	endif
	(BaboSexController as BaboSexControllerManager).PrecisionCheck(akactor, false)
	if !(AnimationName == "")
		Debug.SendAnimationEvent(akactor, AnimationName)
	endif
EndFunction

Function FadeinMoveScene(ReferenceAlias akactorRef, ReferenceAlias MovePoint, int CallStage, bool CallSwitch, bool IdleMotion = false, String MotionString = "")
	FadeinScene(true)
	MoveReftoPiont(akactorRef, MovePoint)
	Utility.wait(5.0)
	if IdleMotion
		Debug.sendanimationevent(akactorRef.getreference() as actor, MotionString)
	endif
	if callswitch
		BaboKidnapEvent.setstage(CallStage)
	endif
	FadeOutScene(true)
EndFunction

Function FadeinMoveSceneFast(ReferenceAlias akactorRef, ReferenceAlias MovePoint, int CallStage, bool CallSwitch)
	FadeinScene(false)
	MoveReftoPiont(akactorRef, MovePoint)
	Utility.wait(1.0)
	if callswitch
		BaboKidnapEvent.setstage(CallStage)
	endif
	FadeOutScene(false)
EndFunction

Function MoveReftoPiont(ReferenceAlias akactorRef, ReferenceAlias MovePoint)
	Actor akactor = akactorRef.GetReference() as actor
	akactor.moveto(MovePoint.getreference());move actor to xmarker
EndFunction

Function MoveActortoPiont(Actor akactor, ReferenceAlias MovePoint)
	akactor.moveto(MovePoint.getreference());move actor to xmarker
EndFunction

Function FadeinScene(bool SlowScene)
if SlowScene
	BaboFadeToBlack.Apply()
	Utility.wait(2.0)
	BaboFadeToBlack.PopTo(BaboFadeToBlackHoldImod)
else
	BaboFadeToBlackFast.Apply()
	Utility.wait(1.5)
	BaboFadeToBlackFast.PopTo(BaboFadeToBlackHoldImod)
endif
EndFunction

Function FadeOutScene(bool SlowScene)
if SlowScene
	BaboFadeToBlackHoldImod.PopTo(BaboFadeToBlackBackImod)
	Utility.wait(3.0)
	BaboFadeToBlackBackImod.Remove()
else
	BaboFadeToBlackHoldImod.PopTo(BaboFadeToBlackBackImodFast)
	Utility.wait(2.0)
	BaboFadeToBlackBackImodFast.Remove()
endif
EndFunction

Function RemoveTargetArmor(Actor target, Keyword TargetArmor, Bool RemoveSwitch)
	(BaboStealingScript as BaboStealingArmorScript).SimpleFindandMoveArmor(target, BaboTempStolenGoodsRef, TargetArmor, RemoveSwitch)
EndFunction

Function RemoveTargetCuirass(Actor target, Bool RemoveSwitch)
	Armor thisArmor = target.GetWornForm(0x00000004) as Armor
	Target.UnequipItem(thisArmor)
	if RemoveSwitch
		Target.RemoveItem(thisArmor, 1, false, BaboTempStolenGoodsRef)
	endif
EndFunction

Function RemoveAllthePanties(Actor target, Bool RemoveSwitch)
	(BaboStealingScript as BaboStealingArmorScript).SimpleFindandMoveKeyword(target, BaboTempStolenGoodsRef, BaboPantiesFormList, RemoveSwitch)
EndFunction

Function RemoveAlltheSkirts(Actor target, Bool RemoveSwitch)
	(BaboStealingScript as BaboStealingArmorScript).SimpleFindandMoveKeyword(target, BaboTempStolenGoodsRef, BaboSkirtFormList, RemoveSwitch)
EndFunction

Function RecoverEquipments()
	BaboTempStolenGoodsRef.removeallitems(playerref, false, true)
	ConfiscateChest.getreference().removeallitems(playerref, false, true)
EndFunction

Function TransferAllItems()
	BaboTempStolenGoodsRef.removeallitems(ConfiscateChest.getreference(), false, true)
EndFunction

Function ConfiscateAllItems()
	PlayerRef.removeallitems(ConfiscateChest.getreference(), false, false)
EndFunction

Function BaboKidnapScenePlay(int Callstage)
	Debug.trace("BaboKidnapScenePlay failed to play. No State allocated.")
EndFunction

Function KidnapQuestStopCheck()
;Blank
EndFunction

Function OnUpdateRegister()
	RegisterForSingleUpdate(1.0)
EndFunction

Function LOSRegister(actor akViewer, ObjectReference akTarget)
	RegisterForSingleLOSGain(akViewer, akTarget)
EndFunction

Function LOSUnRegister(actor akViewer, ObjectReference akTarget)
	UnregisterForLOS(akViewer, akTarget)
EndFunction

Function TimeLapse(Bool OneHour, Bool Standby)
if OneHour
	SetGameHourCustom(true, 1.0)
Endif
EndFunction

Function YouGotSpotted(int Scenario)
;empty
EndFunction

Function YouGotSpottedOG(actor akactor, int Scenario)
;empty
EndFunction

Function EscapeAttemptsCount(int Num)
	BaboKidnapEscapeAttempts.setvalue(BaboKidnapEscapeAttempts.getvalue() + Num)
EndFunction

Function KidnapEventStringOut(int num)
	(BaboSexController as BaboSexControllerManager).KidnapEvent01Messagebox(num)
EndFunction

Event OnSleepStart(float afSleepStartTime, float afDesiredSleepEndTime)
endEvent

Event OnSleepStop(bool abInterrupted)
endEvent

Function SummonHelper(Bool Summon = true)

EndFunction

Bool Function GetEquippedDDI(actor akActor, int DDIdevice)
if (BaboMonitorScript as BaboDiaMonitorScript).GetequippedDDIDevice(akActor, DDIdevice) > 0
	return true
else
	return false
endif
EndFunction

Function EquipDDI(Actor akactor, int DDIDevice, Bool Force = true)
	if BaboDDI.getvalue() == 1
		(BaboMonitorScript as BaboDiaMonitorScript).ForceEquipDDIDevice(akActor, DDIDevice, Force)
	else
		Return
	endif
EndFunction

Function UnEquipDDI(Actor akactor, int DDIDevice, Bool destroyDevice = true)
	if BaboDDI.getvalue() == 1
		(BaboMonitorScript as BaboDiaMonitorScript).ForceUnequipDDIDevice(akActor, DDIDevice, destroyDevice)
	else
		Return
	endif
EndFunction

Objectreference Function EquipZazYoke(Actor akactor)
	Objectreference Yoke = akactor.additem(BaboYokeMetalPlayable, 1)
	akactor.EquipItem(Yoke, true, true)
	Return Yoke
EndFunction

Function EquipGag(Actor akactor, Bool Equip)
if Equip
	BaboPlayerGagged.setvalue(1)
	if BaboDDI.getvalue() == 1
		(BaboMonitorScript as BaboDiaMonitorScript).ForceEquipDDIDevice(akActor, 8, true)
	else
		akactor.additem(BaboGagLogBitPlayable, 1)
		akactor.EquipItem(BaboGagLogBitPlayable)
	endif
Else
	BaboPlayerGagged.setvalue(0)
	if BaboDDI.getvalue() == 1
		(BaboMonitorScript as BaboDiaMonitorScript).ForceUnequipDDIDevice(akActor, 8, false)
	else
		akactor.UnequipItem(BaboGagLogBitPlayable)
		akactor.Removeitem(BaboGagLogBitPlayable, 1)
	endif
Endif
EndFunction

Function EquipRestraintsCheck(Actor akactor)
	if !akactor.IsEquipped(BaboWristRopePlayable)
		akactor.additem(BaboWristRopePlayable, 1)
		akactor.EquipItem(BaboWristRopePlayable)
	endif
	
	if BaboDDI.getvalue() == 1
		(BaboMonitorScript as BaboDiaMonitorScript).ForceEquipDDIDevice(akActor, 2, true)
	else
		if !akactor.IsEquipped(BaboCollarRopePlayable)
			akactor.additem(BaboCollarRopePlayable, 1)
			akactor.EquipItem(BaboCollarRopePlayable)
		endif
	endif
		
	if !akactor.IsEquipped(BaboAnkleRopePlayable)
		akactor.additem(BaboAnkleRopePlayable, 1)
		akactor.EquipItem(BaboAnkleRopePlayable)
	endif
EndFunction

Function EquipRestraints(Actor akactor, Bool Equip)
if Equip
	if BaboDDI.getvalue() == 1
		(BaboMonitorScript as BaboDiaMonitorScript).ForceEquipDDIDevice(akActor, 2, true)
	else
		akactor.additem(BaboCollarRopePlayable, 1)
		akactor.EquipItem(BaboCollarRopePlayable)
	endif
	akactor.additem(BaboWristRopePlayable, 1)
	akactor.additem(BaboAnkleRopePlayable, 1)

	akactor.EquipItem(BaboWristRopePlayable)	
	akactor.EquipItem(BaboAnkleRopePlayable)
Else
	if BaboDDI.getvalue() == 1
		(BaboMonitorScript as BaboDiaMonitorScript).ForceUnequipDDIDevice(akActor, 2, false)
	else
		akactor.UnequipItem(BaboCollarRopePlayable)
		akactor.Removeitem(BaboCollarRopePlayable, 1)
	endif
	akactor.UnequipItem(BaboWristRopePlayable)
	akactor.UnequipItem(BaboAnkleRopePlayable)
	
	akactor.Removeitem(BaboAnkleRopePlayable, 1)
	akactor.Removeitem(BaboAnkleRopePlayable, 1)
Endif
EndFunction

Function YouAreRescued()
	YesCollision(PlayerAlias, "IdleForceDefaultState")
	PlayerRef.moveto(RecoverMarker.getreference())
EndFunction

Function KidnapperDied()
EndFunction

Function AddFatigue(actor akactor, Bool PerkAdd)
if PerkAdd
	akactor.AddPerk(BaboAwfullyFatiguedPerk)
else
	akactor.RemovePerk(BaboAwfullyFatiguedPerk)
endif
EndFunction

Function NPCChallengeStart(ReferenceAlias Helper01Ref, ReferenceAlias Helper02Ref)
	Actor ActorRef01 = Helper01Ref.GetActorReference()
	Actor ActorRef02 = Helper02Ref.GetActorReference()

	actorRef01.addtoFaction(BaboKidnapperEnemyFaction)
	actorRef02.addtoFaction(BaboKidnapperEnemyFaction)
	if actorRef01.GetActorValue("Confidence") < 4
		actorRef01.SetActorValue("Confidence", 4) 
	EndIf
	if actorRef02.GetActorValue("Confidence") < 4
		actorRef02.SetActorValue("Confidence", 4) 
	EndIf
	actorRef01.startCombat(Kidnapper01.Getreference() as actor)
	actorRef02.startCombat(Kidnapper01.Getreference() as actor)
EndFunction

Function KidnapperMovetoPoint(int Marker)
	if Marker == 1
		MoveReftoPiont(Kidnapper01, KidnapperMarker01)
	elseif Marker == 2
		MoveReftoPiont(Kidnapper01, KidnapperMarker02)
	endif
EndFunction

Bool Function KeyPress()
Return false
EndFunction

Function AddTitle(int Titleint)
	if Titleint == 4
		(BaboReputationScript as BaboReputationMasterScript).AddingTitletoPlayerRef(BaboFactionAlmostEatenTitle)
		(BaboReputationScript as BaboReputationMasterScript).SetTitleGlobal(BaboGlobalAlmostEatenTitle, 1)
	else
		(BaboReputationScript as BaboReputationMasterScript).AddingTitletoPlayerRef(BaboFactionSexSlaveTitle)
		(BaboReputationScript as BaboReputationMasterScript).SetTitleGlobal(BaboGlobalSexSlaveTitle, 1)
	endif
EndFunction

Function UnequipWeapons(Actor Target)
	Int i = 5 ; Security for the loop to not be stuck just in case.
	Form EquippedWeapon = Target.GetEquippedWeapon()
	While (EquippedWeapon && (i > 5))
		Target.UnequipItem(EquippedWeapon, False, True)
		EquippedWeapon = Target.GetEquippedWeapon()
		i -= 1
	EndWhile
EndFunction

Function DisabledXmarkerEnable(Bool EnableTrue)
	if EnableTrue
		BaboKidnapHouseXmarkerD.enable()
	else
		BaboKidnapHouseXmarkerD.disable()
	endif
EndFunction

Function EnabledXmarkerDisable(Bool DisableTrue)
	if DisableTrue
		BaboKidnapHouseXmarkerE.disable()
	else
		BaboKidnapHouseXmarkerE.enable()
	endif
EndFunction



;##################Shared Functions###################

bool Function CageDoorChoice()

endfunction

Function CleanResetRoom()
	BaboKidnapperHouse01.reset()
	BaboKidnapperHouse02.reset()
	BaboKidnapperHouse03.reset()
	BaboSlaverHouse01.reset()
	BaboSlaverHouse02.reset()
	BaboSlaverHouse03.reset()
	BaboKidnapperCave01.reset()
EndFunction

Function ResetSetRoom()
	DisabledXmarkerEnable(false)
	EnabledXmarkerDisable(false)
	BaboPlayerDetectorGlobal.setvalue(0)
	BaboActorDetectorGlobal.setvalue(0)
	BaboPrisonerDetectorGlobal.setvalue(0)
	(BaboSexController as BaboSexControllerManager).AppearanceCalc();Check Player Appearance
	if SweepAreaA
		SweepAreaA.getreference().disable()
		SweepAreaB.getreference().disable()
		SweepAreaC.getreference().disable()
	endif
	LockDurability = 100
EndFunction

Function CheckLocationAndKey(actor akactor, ReferenceAlias akKidnapper)

	if akactor.getcurrentlocation() == BaboKidnapperLocation01
		(akKidnapper.getreference() as actor).additem(BaboKidnapHouse01Key, 1)
	elseif akactor.getcurrentlocation() == BaboKidnapperLocation02
		(akKidnapper.getreference() as actor).additem(BaboKidnapHouse02Key, 1)
	elseif akactor.getcurrentlocation() == BaboKidnapperLocation03
		(akKidnapper.getreference() as actor).additem(BaboKidnapHouse03Key, 1)
	elseif akactor.getcurrentlocation() == BaboSlaverLocation01
		(akKidnapper.getreference() as actor).additem(BaboSlaverHouse01Key, 1)
	elseif akactor.getcurrentlocation() == BaboSlaverLocation02
		(akKidnapper.getreference() as actor).additem(BaboSlaverHouse02Key, 1)
	elseif akactor.getcurrentlocation() == BaboSlaverLocation03
		(akKidnapper.getreference() as actor).additem(BaboSlaverHouse03Key, 1)
	elseif akactor.getcurrentlocation() == BaboSlaverLocation04
		(akKidnapper.getreference() as actor).additem(BaboSlaverHouse04Key, 1)
	elseif akactor.getcurrentlocation() == BaboSlaverNobleHouseLocation01
		(akKidnapper.getreference() as actor).additem(BaboSlaverNobleHouse01Key, 1)
	endif

EndFunction

Function RemovealltheKey()
	PlayerRef.removeitem(BaboKidnapHouse01Key, 1)
	PlayerRef.removeitem(BaboKidnapHouse02Key, 1)
	PlayerRef.removeitem(BaboKidnapHouse03Key, 1)
	PlayerRef.removeitem(BaboSlaverHouse01Key, 1)
	PlayerRef.removeitem(BaboSlaverHouse02Key, 1)
	PlayerRef.removeitem(BaboSlaverHouse03Key, 1)
	PlayerRef.removeitem(BaboSlaverHouse04Key, 1)
	PlayerRef.removeitem(BaboSlaverNobleHouse01Key, 1)
EndFunction

Function OnLOSRegister()
	akactor01 = Kidnapper01.getreference() as actor
	LOSRegister(akactor01, PlayerRef)
	BaboKidnapTiedUp.setvalue(0);You are not tied
	if Kidnapper02
		akactor02 = Kidnapper02.getreference() as actor
		LOSRegister(akactor02, PlayerRef)
	endif
	if Kidnapper03
		akactor03 = Kidnapper03.getreference() as actor
		LOSRegister(akactor03, PlayerRef)
	endif
	if Kidnapper04
		akactor04 = Kidnapper04.getreference() as actor
		LOSRegister(akactor04, PlayerRef)
	endif
	if Kidnapper05
		akactor05 = Kidnapper05.getreference() as actor
		LOSRegister(akactor05, PlayerRef)
	endif
EndFunction

Function GivePunishment(int istage)

if istage == 1;blowjob
	(BaboSexController as BaboSexControllerManager).SexCustom(PlayerAlias, Kidnapper01, None, None, None, "MF", "Aggressive", "Blowjob", True, "", "", True)
elseif istage == 2;sex
	(BaboSexController as BaboSexControllerManager).SexCustom(PlayerAlias, Kidnapper01, None, None, None, "MF", "Aggressive", "Rape", True, "", "", True)
elseif istage == 3;sex

elseif istage == 4;drug

elseif istage == 5;Whip

elseif istage == 5;TrashFood

else

endif

endfunction

Function AfterKidnapEvent(int istage)

if istage == 1

else;MarkerA
	PlayerRef.moveto(CenterMarkerPlayer.getreference())
	(Kidnapper01.getreference() as actor).moveto(KidnapperMarker01.getreference())
	(Kidnapper01.getreference() as actor).evaluatepackage()
	(BaboSexController as BaboSexControllerManager).RecoverControl(true)
	RegisterForSingleUpdateGameTime(3.0)
endif

EndFunction

Function GuardFavor(float ffavor)
	ffavor += BaboGuardFavor.getvalue()
	BaboGuardFavor.setvalue(ffavor)
EndFunction

Function SlaveTrust(float ftrust)
	ftrust += BaboSlaverTrust.getvalue()
	BaboSlaverTrust.setvalue(ftrust)
EndFunction

Function ProvideLockpicks()
int ichance = Utility.randomint(0, 100)
int ifavor = BaboGuardFavor.getvalue() as int
if ichance <= ifavor
	PlaceEscapeTool(0, 1, true, FoodMarkerA)
endif
EndFunction

Function ProvidePlacefood(bool nofood = false)
	float ftrust = Baboslavertrust.getvalue()
	BaboKidnapLastFoodTime.setvalue(GameDaysPassed.getvalue())
	if nofood
		if ftrust < 30
			SlaveTrust(-7.0)
		elseif ftrust < 40
			SlaveTrust(-5.0)
		elseif ftrust < 50
			SlaveTrust(-2.0)
		elseif ftrust < 70
			SlaveTrust(-1.0)
		endif
		return
	endif
	
	if ftrust < 30
		PlaceFoodSuspicious(0, 1, true, FoodMarkerA);Semen
	elseif ftrust < 40
		PlaceFoodTrash(0, 1, false, FoodMarkerA);there's one menu
	elseif ftrust < 50
		PlaceFoodCheap(0, 1, false, FoodMarkerA)
	elseif ftrust < 60
		PlaceFoodCheap(1, 2, false, FoodMarkerA)
	elseif ftrust < 70
		PlaceFoodCheap(0, 2, true, FoodMarkerA)
	elseif ftrust < 100
		PlaceFoodCheap(0, 1, true, FoodMarkerA)
		PlaceFoodSoup(0, 1, true, FoodMarkerA)
	endif
EndFunction

Function BedRollSleep()
	if GameHour.value >= 22.0 || GameHour.value < 7.0
		RegisterForSleep()
		FurnitureSafeA.getreference().activate(PlayerRef);Sleep
	;elseif (GameHour.value >= 12.0 && GameHour.value < 18.0) && BaboActorDetectorGlobal.getvalue() == 1
		;SetGameHourCustom(false, 18.0)
	endif
EndFunction

Function ShackleRestraint(Bool RestraintLock)
	if RestraintLock
		int i = Utility.randomint(0, 1)
		if i == 1
			CurrentDDI = 4;Armbinder
		else
			CurrentDDI = 7;Yoke
		endif
		if BaboDDI.getvalue() == 1
			EquipDDI(PlayerRef, CurrentDDI, true)
		else
			RestraintEquipment.forcerefto(EquipZazYoke(PlayerRef))
		endif
		BaboPlayerYoke.setvalue(1)
	else
		if BaboPlayerYoke.getvalue() == 1
			if BaboDDI.getvalue() == 1
				UnEquipDDI(PlayerRef, CurrentDDI, true);Armbinder
			else
				PlayerRef.unequipitem(RestraintEquipment.getreference())
				PlayerRef.RemoveItem(RestraintEquipment.getreference())
				RestraintEquipment.clear()
			endif
			BaboPlayerYoke.setvalue(0)
		endif
	endif
EndFunction

Function RestOneHour()
	if bReadytoRest || BaboActorDetectorGlobal.Getvalue() == 1;No master
		(BaboSexController as BaboSexControllerManager).LosingControl()
		FadeinScene(true)
		;FadeinMoveScene(PlayerAlias, FurnitureSafeALink, 0, false, false, "")
		SetGameHourCustom(true, 1.0)
		MoveReftoPiont(PlayerAlias, FurnitureSafeALink)
		PlayerRef.RestoreActorValue("Health", 5)
		PlayerRef.RestoreActorValue("Stamina", 10)
		Debug.sendanimationevent(PlayerRef, "BaboSleeponBedRoll")
		FadeOutScene(true)
		bReadytoRest = false
		Utility.wait(8.0)
		FadeinScene(true)
		SetGameHourCustom(true, 0.5)
		(BaboSexController as BaboSexControllerManager).RecoverControl(true)
		
		FadeOutScene(true)
		;if - Assaulted during sleep WIP
			;(BaboSexController as BaboSexControllerManager).SlaveryEventMessagebox(9)
		;endif
	else
		(BaboSexController as BaboSexControllerManager).SlaveryEventMessagebox(12)
	endif
EndFunction

Function Meditate()
	if bReadytoRest || BaboActorDetectorGlobal.Getvalue() == 1
		FadeinScene(true)
		MoveReftoPiont(PlayerAlias, FurnitureSafeALink)
		(BaboMonitorScript as BaboDiaMonitorScript).CalcCorruptionExpGain(-0.5)
		(BaboMonitorScript as BaboDiaMonitorScript).CalcTraumaExpGain(-0.1)
		PlayerRef.RestoreActorValue("Magicka", 15)
		Debug.sendanimationevent(PlayerRef, "BaboMeditate")
		SetGameHourCustom(true, 1.0)
		FadeOutScene(true)
		
		bReadytoRest = false
		
		Utility.wait(15.0)
		FadeinScene(true)
		;Master can intervene WIP
		SetGameHourCustom(true, 0.5)
		;Debug.sendanimationevent(PlayerRef, "IdleForceDefaultState")
		Debug.sendanimationevent(PlayerRef, "IdleStop");Test
		FadeOutScene(true)
	else
		(BaboSexController as BaboSexControllerManager).SlaveryEventMessagebox(12)
	endif
EndFunction

Function StatDamaged()

Float fPlayerHealth = PlayerRef.GetActorValue("Health")
Float fPlayerMagicka = PlayerRef.GetActorValue("Health")
Float fPlayerStamina = PlayerRef.GetActorValue("Health")

PlayerRef.DamageActorValue("Health", fPlayerMagicka * 0.5)
PlayerRef.DamageActorValue("Magicka", fPlayerMagicka * 0.8)
PlayerRef.DamageActorValue("Stamina", fPlayerMagicka * 0.9)

EndFunction

Function CalltheGuard()
int choice = BaboKidnapCageOptionBMessage.Show()
if (choice == 0);Call the guard
;	BaboKidnapScenePlay(11)
endif
EndFunction

Function GuardHelpPlayer(int iscenario = 0)
	BaboKidnapGuardHelpPlayer.setvalue(1);Guard will help Player escape.
	BaboKidnapGuardHelpPlayerMethod.setvalue(iscenario)
	if iscenario == 0
	elseif iscenario == 1
		
	
	endif
EndFunction

Function Draw(Actor Target)
	If !Target.IsWeaponDrawn()
		Target.DrawWeapon()
		Float i = 3.0
		While (!Target.IsWeaponDrawn() && (i > 0.0))
			Utility.Wait(0.5)
			i -= 0.5
		EndWhile
	Endif
EndFunction

Function OptionKill(Actor Victim, Actor Aggressor)
	Draw(Aggressor)
	Float zOffset = Aggressor.GetHeadingAngle(Victim)
	Aggressor.SetAngle(0.0, 0.0, Aggressor.GetAngleZ() + zOffset)

		Idle TheKillmove
		Int WeaponType = Aggressor.GetEquippedItemType(1)
		If (Aggressor.IsWeaponDrawn() && ((WeaponType == 1) || (WeaponType == 2) || (WeaponType == 5))) 		; Dagger & Sword 1H/2H Bleedout kill
			TheKillmove = pa_1HMKillMoveBleedOutKill
		Elseif (Aggressor.IsWeaponDrawn() && ((WeaponType == 3) || (WeaponType == 4) || (WeaponType == 6))) 	; Axe/Mace 1H/2H
			TheKillmove = pa_1HMKillMoveShortC 	; Quick slash
		Else
			TheKillmove = pa_KillMoveH2HComboA 	; Combo 3 punches
		Endif
			
	Aggressor.PlayIdleWithTarget(TheKillmove, Victim)

	Victim.Kill(Aggressor)
EndFunction

Function GotoAbductionRoom(Actor akactor)
	PlayerRef.moveto(BaboEventAbductionRoomMarker01)
	akactor.moveto(BaboEventAbductionRoomMarker02)
	(BaboKidnapEventPending as BaboKidnapEventPendingScript).PendingKidnapQuest(akactor, none, none, none, none)
EndFunction

Function GotoStateString(String StateString)
	Gotostate(StateString)
EndFunction

;###############################################
;##################State Area###################
;###############################################

;##################Morthal Inn Drunken Event#1##################

State BaboChangeLocationEvent07ScenarioMorthal

Event OnBeginState()
	SetScenarioe(1);Two travellers kidnap Player at Morthal inn
	RecoverMarkers(CL07RecoverMarker.getreference(), CL07FollowerMarker.getreference())
	BaboKidnapEvent.setstage(5)
EndEvent

Function BaboKidnapScenePlay(int Callstage)
if Callstage == 1
	BaboKidnapEventDrunkPlayerScene01.forcestart()
elseif Callstage == 2
	BaboKidnapEventDrunkPlayerScene02.forcestart()
elseif Callstage == 3
	BaboKidnapEventDrunkPlayerSceneEnd.forcestart()
endif
EndFunction

Function KidnapQuestStopCheck()
	BaboKidnapEvent.stop()
EndFunction

EndState

;##################Ririkstead Inn Drunken Event#2##################

State BaboChangeLocationEvent07ScenarioRorikstead

Event OnBeginState()
	SetScenarioe(2);Two travellers kidnap Player at Rorikstead inn
	RecoverMarkers(CL07RecoverMarker.getreference(), CL07FollowerMarker.getreference())
	BaboKidnapEvent.setstage(5)
EndEvent

Function BaboKidnapScenePlay(int Callstage)
if Callstage == 1
	BaboKidnapEventDrunkPlayerScene01.forcestart()
elseif Callstage == 2
	BaboKidnapEventDrunkPlayerScene02.forcestart()
elseif Callstage == 3
	BaboKidnapEventDrunkPlayerSceneEnd.forcestart()
endif
EndFunction


Function KidnapQuestStopCheck()
	BaboKidnapEvent.stop()
EndFunction

EndState

State BaboChangeLocationEvent07ScenarioRoriksteadWellRested

Event OnBeginState()
	SetScenarioe(2)
	RecoverMarkers(CL07RecoverMarker.getreference(), CL07FollowerMarker.getreference())
	BaboKidnapEvent.setstage(159);Normal Ending
EndEvent

Function BaboKidnapScenePlay(int Callstage)
if Callstage == 1
	BaboKidnapEventDrunkPlayerSceneNormalEnd.forcestart()
elseif Callstage == 2
	BaboKidnapEventDrunkPlayerSceneNormalScene01.forcestart()
endif
EndFunction

Function KidnapQuestStopCheck()
	BaboKidnapEvent.stop()
EndFunction

EndState

;##################DragonBridge Inn Drunken Event#3##################

State BaboChangeLocationEvent07ScenarioDragonBridge

Event OnBeginState()
	SetScenarioe(3);Two travellers kidnap Player at DragonBridge inn
	RecoverMarkers(CL07RecoverMarker.getreference(), CL07FollowerMarker.getreference())
	BaboKidnapEvent.setstage(5)
EndEvent

Function BaboKidnapScenePlay(int Callstage)
if Callstage == 1
	BaboKidnapEventDrunkPlayerScene01.forcestart()
elseif Callstage == 2
	BaboKidnapEventDrunkPlayerScene02.forcestart()
elseif Callstage == 3
	BaboKidnapEventDrunkPlayerSceneEnd.forcestart()
endif
EndFunction

Function KidnapQuestStopCheck()
	BaboKidnapEvent.stop()
EndFunction

EndState

State BaboChangeLocationEvent07ScenarioDragonBridgeWellRested

Event OnBeginState()
	SetScenarioe(3)
	RecoverMarkers(CL07RecoverMarker.getreference(), CL07FollowerMarker.getreference())
	BaboKidnapEvent.setstage(159);Normal Ending
EndEvent

Function BaboKidnapScenePlay(int Callstage)
if Callstage == 1
	BaboKidnapEventDrunkPlayerSceneNormalEnd.forcestart()
elseif Callstage == 2
	BaboKidnapEventDrunkPlayerSceneNormalScene01.forcestart()
endif
EndFunction

Function KidnapQuestStopCheck()
	BaboKidnapEvent.stop()
EndFunction

EndState


;##################Kidnap Event#4##################

State BaboKidnapCabin

Event OnBeginState()
	(BaboSexController as BaboSexControllerManager).StateChange("ConstantPainExpression")
	if !(BaboKidnapScenarioe.getvalue() == 4)
		;Debug.notification("Kidnap Event Starts")
		ResetSetRoom()
		Debug.sendanimationevent(PlayerRef, "IdleForceDefaultState")
		UnequipWeapons(PlayerRef)
		Utility.wait(2.0)
		PlayerRef.SheatheWeapon()
		AddTitle(0)
		if FollowersStandby()
			BaboKidnapEventFollowersStandBy.forcestart()
		endif
		
		FadeinScene(true)
		AddFatigue(PlayerRef, True)
		MoveReftoPiont(PlayerAlias, CenterMarkerPlayer)
		(BaboSexController as BaboSexControllerManager).StuckControl()
		Utility.wait(5.0)
		Debug.sendanimationevent(PlayerRef, "BaboRopeHit")
		TransferAllItems()
		;FadeinMoveScene(PlayerAlias, CenterMarkerPlayer, 0, false, true, "BaboRopeHit")
		BaboKidnapTiedUp.setvalue(1);You are tied
		(Kidnapper01.getreference() as actor).moveto(KidnapperSafeMarkerA.getreference())
		StartGameHour = GameHour.value
		EndGameHour = StartGameHour + ((Utility.randomint(1, 4)) * 24) as float
		CheckLocationAndKey(PlayerRef, Kidnapper01)
		SetScenarioe(4);One criminal kidnapped you.
		FadeOutScene(true)
		
		BaboKidnapEvent.setstage(7)
		(BaboMonitorScript as BaboDiaMonitorScript).CalcCorruptionExpGain(16.0)
		(BaboMonitorScript as BaboDiaMonitorScript).CalcTraumaExpGain(3.0)
	else
		Game.DisablePlayerControls( true, true, false, false, true, false, true, false )
		SetvehicleRef(None, None)
		EquipRestraintsCheck(PlayerRef)
		BaboKidnapTiedUp.setvalue(1);You are tied
		;EquipRestraints(PlayerRef, false)
		;EquipRestraints(PlayerRef, true)
	endif
EndEvent

Function BaboKidnapScenePlay(int Callstage)
if Callstage == 1
	BaboKidnapEventScenario04A.forcestart()
elseif Callstage == 2
	BaboKidnapEventScenario04B.forcestart()
elseif Callstage == 3
	BaboKidnapEventScenario04C.forcestart()
elseif Callstage == 4
	BaboKidnapEventScenario04D.forcestart()
elseif Callstage == 5
	BaboKidnapEventScenario04E.forcestart()
elseif Callstage == 6
	BaboKidnapEventScenario04EB.forcestart()
endif
EndFunction

Function KidnapQuestStopCheck()
	BaboKidnapEvent.stop()
EndFunction

Function TimeLapse(Bool OneHour, Bool Standby)

if GameHour.value >= 21.0 && GameHour.value < 8.0

endif

if OneHour
	SetGameHourCustom(true, 1.0)
Endif

if Standby
	if GameHour.value >= 0.0 && GameHour.value < 8.0
		RegisterForSleep()
		FurnitureSafeA.getreference().activate(PlayerRef);Sleep
		;SetGameHourCustom(false, 8.0)
	elseif (GameHour.value >= 12.0 && GameHour.value < 18.0) && BaboActorDetectorGlobal.getvalue() == 1
		SetGameHourCustom(false, 18.0)
	endif
else

endif
EndFunction

Event OnSleepStart(float afSleepStartTime, float afDesiredSleepEndTime)
	Float SleepTime = (afDesiredSleepEndTime - afSleepStartTime) * 24
	if sleeptime > 8.0
		sleeptime = 8.0
	endif
	Utility.WaitMenuMode(Sleeptime)
	PlayerRef.MoveTo(PlayerRef)
endEvent

;Event OnKeyDown( int keyCode )
Bool Function KeyPress()
;	If (!Utility.IsInMenuMode() && (BaboDialogueMCM as BaboDialogueConfigMenu).NotificationKey == keyCode)
;		If BaboKidnapEvent.getstage() >= 8
			;Debug.Notification("I press it!")
			float itotal
			float iSneak
			float ir1
			float ir2
			int ChanceEscape = Utility.randomint(0, 100)
			
			if GameHour.value >= 0.0 && GameHour.value < 8.0
				TimeLapse(false, true)
			else
			int choice
			if BaboPlayerGagged.getvalue() == 1
				choice = BaboKidnapOptionsGaggedMessage.Show()
			else
				choice = BaboKidnapOptionsMessage.Show()
			endif
			
				if (choice == 0);Struggle
					ir1 = PlayerRef.getactorvalue("OneHanded")
					ir2 = PlayerRef.getactorvalue("TwoHanded")
					iSneak = PlayerRef.getactorvalue("Sneak")
					itotal = ((ir1 + ir2) * 0.0004)

					if iSneak <= ChanceEscape
						(BaboSexController as BaboSexControllerManager).SturggleDifficulty(itotal ,"Stamina", "")
						(BaboSexController as BaboSexControllerManager).Restore()
						(BaboSexController as BaboSexControllerManager).StateChange("BaboKidnapState")
					else
						;StruggleWeak motion play
						Debug.sendanimationevent(PlayerRef, "BaboRopeSquirm")
						Utility.wait(2.0)
						(BaboSexController as BaboSexControllerManager).MiscSound(PlayerRef, 2)
						Utility.wait(2.0)
						(BaboSexController as BaboSexControllerManager).UseSexlabVoice(PlayerRef, true)
						Utility.wait(6.0)
						BaboKidnapScenePlay(2);sound
						Debug.sendanimationevent(PlayerRef, "BaboRopeHit")
					endif
					return false; No monologue
				elseif (choice == 1);Use Magic
					itotal = (PlayerRef.getactorvalue("Destruction")) as int
					itotal *= 0.0008
					PlayerRef.DamageActorValue("Magicka", 10.0)
					Debug.sendanimationevent(PlayerRef, "")
					
					if iSneak <= ChanceEscape
						(BaboSexController as BaboSexControllerManager).SturggleDifficulty(itotal ,"Magicka", "")
						(BaboSexController as BaboSexControllerManager).Restore()
						(BaboSexController as BaboSexControllerManager).StateChange("BaboKidnapState")
					else
						Debug.sendanimationevent(PlayerRef, "BaboRopeSquirm")
						Utility.wait(2.0)
						(BaboSexController as BaboSexControllerManager).MiscSound(PlayerRef, 2)
						Utility.wait(2.0)
						(BaboSexController as BaboSexControllerManager).UseSexlabVoice(PlayerRef, true)
						Utility.wait(6.0)
						BaboKidnapScenePlay(3);sound
					endif
					return false; No monologue
				elseif (choice == 2);Talk to the kidnapper
					;Scene Starts
					if BaboPlayerGagged.getvalue() == 1
						;WIP
						zbfSoundGagFrustrated.play(PlayerRef)
						(BaboSexController as BaboSexControllerManager).KidnapEvent01Messagebox(16)
					else
						BaboKidnapScenePlay(4)
					endif
					return false; No monologue
				elseif (choice == 3);Call for help
					int ChanceofSuccess = Utility.randomint(0, 100)
					Float SpeechDeviation = Utility.randomint(0, 20) as float;Need to improve
					Float fPlayerSpeech = PlayerRef.GetActorValue("Speechcraft")
					Float ChanceSpeech = fPlayerSpeech - SpeechDeviation
					;Debug.notification(ChanceSpeech)
					BaboSpeechCraftAV.setvalue(ChanceSpeech)
					if BaboPlayerGagged.getvalue() == 1
						;Murmur soundWIP
						zbfSoundGagFrustrated.play(PlayerRef)
						(BaboSexController as BaboSexControllerManager).KidnapEvent01Messagebox(16)
						return false
					else
						if ChanceofSuccess <= ChanceSpeech
							BaboKidnapHelperRescue.setvalue(1)
							SummonHelper(true)
							Utility.wait(1.0)
						else
							BaboKidnapHelperRescue.setvalue(0)
						endif
						
						if BaboActorDetectorGlobal.Getvalue() == 1
							BaboKidnapScenePlay(6);No kidnapper
						else
							BaboKidnapScenePlay(5);Yes kidnapper
						endif
					endif
					return false; No monologue
				elseif (choice == 4);Wait
					TimeLapse(true, true)
					return true; monologue
				endif
			endif
		;Endif
;	EndIf
Return true
EndFunction

Event OnUpdate();blank
EndEvent

Event OnGainLOS(Actor akViewer, ObjectReference akTarget)
if akTarget == PlayerRef
	if (akViewer == akactor01) || (akViewer == akactor02) || (akViewer == akactor03) || (akViewer == akactor04) || (akViewer == akactor05)
	
		if akViewer.isincombat()
			return
		endif	

		if (akViewer.GetSleepState() == 3)
			;nothing
		else
			if PlayerRef.IsDetectedBy(akViewer)
			Armor thisArmor = PlayerRef.GetWornForm(0x00000004) as Armor
				if thisArmor;You retrieved your gear, Maybe a few keyword exceptions later? WIP
					(BaboSexController as BaboSexControllerManager).ChallengeStart(Kidnapper01);Battle
					(BaboSexController as BaboSexControllerManager).KidnapEvent01Messagebox(13)
					FrontDoor.Getreference().lock(true)
					LOSUnRegister(akViewer, PlayerRef)
					;Maybe possibly some other dialogue trees? WIP
					return
				else
					;Self.Nocollision(PlayerAlias)
					(BaboSexController as BaboSexControllerManager).StuckControl()
					if PlayerRef.IsSneaking()
						PlayerRef.StartSneaking()
					endif
						LOSUnRegister(akactor01, PlayerRef)
						LOSUnRegister(akactor02, PlayerRef)
						LOSUnRegister(akactor03, PlayerRef)
						LOSUnRegister(akactor04, PlayerRef)
						LOSUnRegister(akactor05, PlayerRef)
						if (akViewer == akactor01)
							BaboKidnapEventYouAreSpotted.forcestart()
						elseif (akViewer == akactor02)
							BaboKidnapEventYouAreSpottedA02.forcestart()
						elseif (akViewer == akactor03)
							BaboKidnapEventYouAreSpottedA03.forcestart()
						elseif (akViewer == akactor04)
							BaboKidnapEventYouAreSpottedA04.forcestart()
						else
							akactor01.moveto(PlayerRef);Just in case
							Utility.wait(1.0)
							BaboKidnapEventYouAreSpotted.forcestart()
						endif
					return
				endif
			endif
		endif
	endif
endif
Endevent


Function YouGotSpotted(int Scenario)
if Scenario == 1;
	FadeinMoveScene(PlayerAlias, CenterMarkerPlayer, 0, false, true, "BaboRopeHit")
	(Kidnapper01.getreference() as actor).evaluatepackage()
elseif Scenario == 2;hit
	(BaboSexController as BaboSexControllerManager).EventPairMotion(Kidnapper01.getreference() as actor, 0, 0, 0, 1, false)
elseif Scenario == 3;hitrope
	(BaboSexController as BaboSexControllerManager).EventPairMotion(Kidnapper01.getreference() as actor, 0, 0, 0, 2, false)
elseif Scenario == 4;
	(BaboSexController as BaboSexControllerManager).SexCustom(PlayerAlias, Kidnapper01, None, None, None, "MF", "Aggressive", "Rape", True, "KidnapE04A", "KidnapEvent04A", True)
else;BadEnd / Kill
	AddTitle(4)
	GotoState("BaboKidnapHangedReady")
endif
EndFunction

Function KidnapperDied()
	(BaboSexController as BaboSexControllerManager).KidnapEvent01Messagebox(12)
	(BaboMonitorScript as BaboDiaMonitorScript).CalcCorruptionExpLoss(35.0)
	(BaboMonitorScript as BaboDiaMonitorScript).CalcTraumaExpLoss(6.0)
	(BaboSexController as BaboSexControllerManager).pacifyAlias(Kidnapper01)
	;FrontDoor.Getreference().lock(false)
EndFunction

Function SummonHelper(Bool Summon = true)
if Summon
	Helper01.forcerefto(KidnapperSafeMarkerB.getreference().PlaceActorAtMe(BaboBadEndGuardM, 4))
	Helper02.forcerefto(KidnapperSafeMarkerB.getreference().PlaceActorAtMe(BaboBadEndGuardM, 4))
else
	(Helper01.getreference() as actor).deletewhenable()
	(Helper02.getreference() as actor).deletewhenable()
	Helper01.clear()
	Helper02.clear()
endif
EndFunction

Function YouAreRescued()
	YesCollision(PlayerAlias, "IdleForceDefaultState")
	PlayerRef.moveto(RecoverMarker.getreference())
EndFunction

EndState

State BaboKidnapCabinPunishment

Bool Function KeyPress()
Return False
EndFunction

Event OnUpdate()
EndEvent

Function YouGotSpotted(int Scenario)
if Scenario == 1;Sex Time
	FadeinMoveScene(PlayerAlias, KidnapperMarker03, 0, false, false, "")
	(Kidnapper01.Getreference() as actor).moveto(KidnapperMarker03.getreference())
	Utility.Wait(5.0)
	(BaboSexController as BaboSexControllerManager).SexCustom(PlayerAlias, Kidnapper01, None, None, None, "MF", "Aggressive", "Rape", True, "KidnapE04", "KidnapEvent04", True)
elseif Scenario == 2;hit
	(BaboSexController as BaboSexControllerManager).EventPairMotion(Kidnapper01.getreference() as actor, 0, 0, 0, 1, false)
elseif Scenario == 3;hitrope
	(BaboSexController as BaboSexControllerManager).EventPairMotion(Kidnapper01.getreference() as actor, 0, 0, 0, 2, false)
elseif Scenario == 4;Sex and rope
	(BaboSexController as BaboSexControllerManager).SexCustom(PlayerAlias, Kidnapper01, None, None, None, "MF", "Aggressive", "Rape", True, "KidnapE04A", "KidnapEvent04A", True)
else;BadEnd / Kill
endif
EndFunction

EndState

State BaboKidnapCabinGuard


Event OnBeginState()
	NPCChallengeStart(Helper01, Helper02)
EndEvent

Bool Function KeyPress()
Return false
EndFunction

Event OnUpdate()
EndEvent

Function YouGotSpotted(int Scenario)
if Scenario == 1;Sex Time
	FadeinMoveScene(PlayerAlias, KidnapperMarker03, 0, false, false, "")
	Utility.Wait(5.0)
	(BaboSexController as BaboSexControllerManager).SexCustom(PlayerAlias, Kidnapper01, None, None, None, "MF", "Aggressive", "Rape", True, "KidnapE04", "KidnapEvent04", True)
elseif Scenario == 2;hit
	(BaboSexController as BaboSexControllerManager).EventPairMotion(Kidnapper01.getreference() as actor, 0, 0, 0, 1, false)
elseif Scenario == 3;hitrope
	(BaboSexController as BaboSexControllerManager).EventPairMotion(Kidnapper01.getreference() as actor, 0, 0, 0, 2, false)
elseif Scenario == 4;Sex and rope
	FadeinMoveScene(PlayerAlias, KidnapperMarker03, 0, false, false, "")
	Utility.Wait(5.0)
	(BaboSexController as BaboSexControllerManager).SexCustom(PlayerAlias, Kidnapper01, None, None, None, "MF", "Aggressive", "Rape", True, "KidnapE04A", "KidnapEvent04A", True)
else;BadEnd / Kill

endif
EndFunction

Function YouAreRescued()
	(BaboMonitorScript as BaboDiaMonitorScript).CalcCorruptionExpGain(4.0)
	(BaboMonitorScript as BaboDiaMonitorScript).CalcTraumaExpGain(1.0)
	(BaboSexController as BaboSexControllerManager).ReputationDecrease(10, 5)
	(BaboSexController as BaboSexControllerManager).ReputationBitchIncrease(20)
	PlayerRef.moveto(RecoverMarker.getreference())
	EquipRestraints(PlayerRef, false)
	RecoverEquipments()
	YesCollision(PlayerAlias, "IdleForceDefaultState")
	SetvehicleRef(None, None)
	(BaboSexController as BaboSexControllerManager).RecoverControl(true)
	KidnapQuestStopCheck()
EndFunction

Function KidnapperDied()
	BaboKidnapEventScenarioRescue.forcestart()
EndFunction

Function KidnapQuestStopCheck()
	BaboKidnapEvent.stop()
EndFunction

EndState


;##################Bandit Cave Event#6##################

State BaboKidnapBanditCave

Event OnBeginState()

	(BaboSexController as BaboSexControllerManager).StateChange("ConstantPainExpression")
	if !(BaboKidnapScenarioe.getvalue() == 10)
		ResetSetRoom()
		PlaceSubWeapon()
		Debug.sendanimationevent(PlayerRef, "IdleForceDefaultState")
		UnequipWeapons(PlayerRef)
		Utility.wait(2.0)
		PlayerRef.SheatheWeapon()
		AddTitle(0)
		if FollowersStandby()
			BaboKidnapEventFollowersStandBy.forcestart()
		endif
		MoveReftoPiont(PlayerAlias, CenterMarkerPlayer)
		(BaboSexController as BaboSexControllerManager).StuckControl()
		Utility.wait(5.0)
		Debug.sendanimationevent(PlayerRef, "BaboRopeHit")
		;FadeinMoveScene(PlayerAlias, CenterMarkerPlayer, 0, false, true, "BaboRopeHit")
		(Kidnapper01.getreference() as actor).moveto(KidnapperMarker01.getreference())
		(Kidnapper02.getreference() as actor).moveto(KidnapperMarker02.getreference())
		StartGameHour = GameHour.value
		EndGameHour = StartGameHour + ((Utility.randomint(1, 4)) * 24) as float

		SetScenarioe(10)
		BaboKidnapEvent.setstage(7)
		AddFatigue(PlayerRef, True)
		FadeOutScene(true)
		(BaboMonitorScript as BaboDiaMonitorScript).CalcCorruptionExpGain(20.0)
		(BaboMonitorScript as BaboDiaMonitorScript).CalcTraumaExpGain(3.0)
	else
		;Game.DisablePlayerControls( true, true, false, false, true, false, true, false )
		;SetvehicleRef(None, None)
		(BaboSexController as BaboSexControllerManager).StuckControl()
		EquipRestraintsCheck(PlayerRef)
	endif

EndEvent

Function BaboKidnapScenePlay(int Callstage)
if Callstage == 1
	BaboKidnapEventScenario10A.forcestart()
elseif Callstage == 2
	BaboKidnapEventScenario04B.forcestart()
elseif Callstage == 3
	BaboKidnapEventScenario04C.forcestart()
elseif Callstage == 4
	BaboKidnapEventScenario04D.forcestart()
endif
EndFunction

Function KidnapQuestStopCheck()
	BaboKidnapEvent.stop()
EndFunction

Function TimeLapse(Bool OneHour, Bool Standby)
if OneHour
	SetGameHourCustom(true, 1.0)
Endif

if Standby
	if GameHour.value >= 0.0 && GameHour.value < 8.0
		RegisterForSleep()
		FurnitureSafeA.getreference().activate(PlayerRef);Sleep
		;SetGameHourCustom(false, 8.0)
	elseif (GameHour.value >= 12.0 && GameHour.value < 18.0) && BaboActorDetectorGlobal.getvalue() == 1
		SetGameHourCustom(false, 18.0)
	endif
else

endif
EndFunction

Event OnSleepStart(float afSleepStartTime, float afDesiredSleepEndTime)
	Float SleepTime = (afDesiredSleepEndTime - afSleepStartTime) * 24
	if sleeptime > 8.0
		sleeptime = 8.0
	endif
	Utility.WaitMenuMode(Sleeptime)
	PlayerRef.MoveTo(PlayerRef)
endEvent

Bool Function KeyPress()
;	If (!Utility.IsInMenuMode() && (BaboDialogueMCM as BaboDialogueConfigMenu).NotificationKey == keyCode)
;		If BaboKidnapEvent.getstage() >= 8
			;Debug.Notification("I press it!")
			float itotal
			float iSneak
			float ir1
			float ir2
			int ChanceEscape = Utility.randomint(0, 100)
			
			if GameHour.value >= 0.0 && GameHour.value < 8.0
				TimeLapse(false, true)
			else
			int choice
			if BaboPlayerGagged.getvalue() == 1
				choice = BaboKidnapCaveOptionsGaggedMessage.Show()
			else
				choice = BaboKidnapCaveOptionsMessage.Show()
			endif
			
				if (choice == 0);Struggle
					ir1 = PlayerRef.getactorvalue("OneHanded")
					ir2 = PlayerRef.getactorvalue("TwoHanded")
					iSneak = PlayerRef.getactorvalue("Sneak")
					itotal = ((ir1 + ir2) * 0.0004)

					if iSneak <= ChanceEscape
						(BaboSexController as BaboSexControllerManager).SturggleDifficulty(itotal ,"Stamina", "")
						(BaboSexController as BaboSexControllerManager).Restore()
						(BaboSexController as BaboSexControllerManager).StateChange("BaboKidnapState")
					else
						;StruggleWeak motion play
						Debug.sendanimationevent(PlayerRef, "BaboRopeSquirm")
						Utility.wait(2.0)
						(BaboSexController as BaboSexControllerManager).MiscSound(PlayerRef, 2)
						Utility.wait(2.0)
						(BaboSexController as BaboSexControllerManager).UseSexlabVoice(PlayerRef, true)
						Utility.wait(6.0)
						BaboKidnapScenePlay(2);sound
						Debug.sendanimationevent(PlayerRef, "BaboRopeHit")
					endif

				elseif (choice == 1);Use Magic
					itotal = (PlayerRef.getactorvalue("Destruction")) as int
					itotal *= 0.0008
					PlayerRef.DamageActorValue("Magicka", 10.0)
					Debug.sendanimationevent(PlayerRef, "")
					
					if iSneak <= ChanceEscape
						(BaboSexController as BaboSexControllerManager).SturggleDifficulty(itotal ,"Magicka", "")
						(BaboSexController as BaboSexControllerManager).Restore()
						(BaboSexController as BaboSexControllerManager).StateChange("BaboKidnapState")
					else
						Debug.sendanimationevent(PlayerRef, "BaboRopeSquirm")
						Utility.wait(2.0)
						(BaboSexController as BaboSexControllerManager).MiscSound(PlayerRef, 2)
						Utility.wait(2.0)
						(BaboSexController as BaboSexControllerManager).UseSexlabVoice(PlayerRef, true)
						Utility.wait(6.0)
						BaboKidnapScenePlay(3);sound
					endif
				elseif (choice == 2);Talk to the kidnapper
					;Scene Starts
					if BaboPlayerGagged.getvalue() == 1
						;WIP
						zbfSoundGagFrustrated.play(PlayerRef)
						(BaboSexController as BaboSexControllerManager).KidnapEvent01Messagebox(16)
					else
						BaboKidnapScenePlay(4)
					endif
				elseif (choice == 3);Wait
					TimeLapse(true, true)
				endif
			endif
		;Endif
;	EndIf
Return true
EndFunction

Event OnUpdate()

EndEvent

Function YouGotSpottedOG(actor akactor, int Scenario)
if scenario == 1
	(BaboSexController as BaboSexControllerManager).SexCustomActorTag(PlayerRef, akactor, None, None, None, "MF, Rape", "Femdom", True, "KidnapE06A", "KidnapEvent06A", True)
endif
EndFunction

Function YouGotSpotted(int Scenario)
if Scenario == 1;
	FadeinMoveScene(PlayerAlias, CenterMarkerPlayer, 0, false, true, "BaboRopeHit")
	(Kidnapper01.getreference() as actor).evaluatepackage()
elseif Scenario == 2;hit
	(BaboSexController as BaboSexControllerManager).EventPairMotion(Kidnapper01.getreference() as actor, 0, 0, 0, 1, false)
elseif Scenario == 3;hitrope
	(BaboSexController as BaboSexControllerManager).EventPairMotion(Kidnapper01.getreference() as actor, 0, 0, 0, 2, false)
elseif Scenario == 4;
	(BaboSexController as BaboSexControllerManager).SexCustom(PlayerAlias, Kidnapper01, None, None, None, "MF", "Aggressive", "Rape", True, "KidnapE04A", "KidnapEvent04A", True)
elseif Scenario == 5;Just Sex
	(BaboSexController as BaboSexControllerManager).SexCustom(PlayerAlias, Kidnapper01, None, None, None, "MF", "Aggressive", "Rape", True, "KidnapE04A", "KidnapEvent04A", True)
else;BadEnd / Kill
	GotoState("BaboKidnapHangedReady")
endif
EndFunction

Function KidnapperDied()
	kidnapperKill += 1
	(BaboMonitorScript as BaboDiaMonitorScript).CalcCorruptionExpLoss(5.0)
	(BaboMonitorScript as BaboDiaMonitorScript).CalcTraumaExpLoss(1.0)
	
	
	if kidnapperKill == kidnapperNum
		(BaboMonitorScript as BaboDiaMonitorScript).CalcCorruptionExpLoss(35.0)
		(BaboMonitorScript as BaboDiaMonitorScript).CalcTraumaExpLoss(6.0)
		(BaboSexController as BaboSexControllerManager).KidnapEvent01Messagebox(12)
		
		(BaboSexController as BaboSexControllerManager).pacifyAlias(Kidnapper01)
		(BaboSexController as BaboSexControllerManager).pacifyAlias(Kidnapper02)
		(BaboSexController as BaboSexControllerManager).pacifyAlias(Kidnapper03)
		(BaboSexController as BaboSexControllerManager).pacifyAlias(Kidnapper04)
		(BaboSexController as BaboSexControllerManager).pacifyAlias(Kidnapper05)
	endif
	;FrontDoor.Getreference().lock(false)
EndFunction

Function SummonHelper(Bool Summon = true)
if Summon
	Helper01.forcerefto(KidnapperSafeMarkerB.getreference().PlaceActorAtMe(BaboBadEndHelperM, 4))
	Helper02.forcerefto(KidnapperSafeMarkerB.getreference().PlaceActorAtMe(BaboBadEndHelperM, 4))
else
	(Helper01.getreference() as actor).deletewhenable()
	(Helper02.getreference() as actor).deletewhenable()
	Helper01.clear()
	Helper02.clear()
endif
EndFunction

Function YouAreRescued()
	YesCollision(PlayerAlias, "IdleForceDefaultState")
	PlayerRef.moveto(RecoverMarker.getreference())
EndFunction

Event OnGainLOS(Actor akViewer, ObjectReference akTarget)
if akTarget == PlayerRef
	if (akViewer == akactor01) || (akViewer == akactor02) || (akViewer == akactor03) || (akViewer == akactor04) || (akViewer == akactor05)
	
		if akViewer.isincombat()
			return
		endif	
		
		if (akViewer.GetSleepState() == 3)
			;nothing
		else
			Armor thisArmor = PlayerRef.GetWornForm(0x00000004) as Armor
			if thisArmor;You retrieved your gear
				if !PlayerRef.isincombat()
					(BaboSexController as BaboSexControllerManager).KidnapEvent01Messagebox(13)
				endif
				(BaboSexController as BaboSexControllerManager).ActorChallengeStart(akViewer);Battle
				LOSUnRegister(akViewer, PlayerRef)
				return
			else
				;Self.Nocollision(PlayerAlias)
				(BaboSexController as BaboSexControllerManager).StuckControl()
				if PlayerRef.IsSneaking()
					PlayerRef.StartSneaking()
				endif
					LOSUnRegister(akactor01, PlayerRef)
					LOSUnRegister(akactor02, PlayerRef)
					LOSUnRegister(akactor03, PlayerRef)
					LOSUnRegister(akactor04, PlayerRef)
					LOSUnRegister(akactor05, PlayerRef)
					if (akViewer == akactor01)
						BaboKidnapEventYouAreSpotted.forcestart()
					elseif (akViewer == akactor02)
						BaboKidnapEventYouAreSpottedA02.forcestart()
					elseif (akViewer == akactor03)
						BaboKidnapEventYouAreSpottedA03.forcestart()
					elseif (akViewer == akactor04)
						BaboKidnapEventYouAreSpottedA04.forcestart()
					else
						akactor01.moveto(PlayerRef);Just in case
						Utility.wait(1.0)
						BaboKidnapEventYouAreSpotted.forcestart()
					endif
				return
			endif
		endif
	endif
endif
Endevent

Function SettheStage()
kidnapperKill = 0
kidnapperNum = 1
VictimNum = 0
	if Kidnapper02
		kidnapperNum += 1
	endif
	if Kidnapper03
		(Kidnapper03.getreference() as actor).moveto(KidnapperMarker03.getreference())
		kidnapperNum += 1
	endif
	if Kidnapper04
		(Kidnapper04.getreference() as actor).moveto(KidnapperMarker04.getreference())
		kidnapperNum += 1
	endif
	if Kidnapper05
		(Kidnapper05.getreference() as actor).moveto(KidnapperMarker05.getreference())
		kidnapperNum += 1
	endif
	
	if OtherVictimA
		(OtherVictimA.getreference() as actor).moveto(KidnapperVictimMarkerA.getreference())
		VictimNum += 1
	endif
	if OtherVictimB
		(OtherVictimB.getreference() as actor).moveto(KidnapperVictimMarkerB.getreference())
		VictimNum += 1
	endif
	if OtherVictimC
		(OtherVictimC.getreference() as actor).moveto(KidnapperVictimMarkerC.getreference())
		VictimNum += 1
	endif

EndFunction

EndState

State BaboKidnapStandby

Bool Function KeyPress()
Return false
EndFunction

Event OnBeginState()
	(BaboSexController as BaboSexControllerManager).Restore()
EndEvent

Event OnUpdate()
EndEvent

Function YouGotSpottedOG(actor akactor, int Scenario)
if scenario == 1
	(BaboSexController as BaboSexControllerManager).SexCustomActorTag(PlayerRef, akactor, None, None, None, "MF, Rape", "Femdom", True, "KidnapE06A", "KidnapEvent06A", True)
else;kill player
	(BaboSexController as BaboSexControllerManager).SexCustomActorTag(PlayerRef, akactor, None, None, None, "MF, Necro", "Femdom", True, "KidnapE06F", "KidnapEvent06F", True)
endif
EndFunction

Function YouGotSpotted(int Scenario)
if Scenario == 1;
	FadeinMoveScene(PlayerAlias, CenterMarkerPlayer, 0, false, true, "BaboRopeHit")
	StartUptheEvent(BaboKidnapScenarioe.getvalue() as int)
	;Sometimes struggle bar alpha value set to 100 invisible
elseif Scenario == 2;hit
	(BaboSexController as BaboSexControllerManager).EventPairMotion(Kidnapper01.getreference() as actor, 0, 0, 0, 1, false)
elseif Scenario == 3;hitrope
	(BaboSexController as BaboSexControllerManager).EventPairMotion(Kidnapper01.getreference() as actor, 0, 0, 0, 2, false)
elseif Scenario == 4;Sex and rope
	(BaboSexController as BaboSexControllerManager).SexCustom(PlayerAlias, Kidnapper01, None, None, None, "MF", "Aggressive", "Rape", True, "KidnapE04A", "KidnapEvent04A", True)
elseif Scenario == 5;No Guard Coming
	(BaboSexController as BaboSexControllerManager).KidnapEvent01Messagebox(14)
	FadeinMoveScene(PlayerAlias, CenterMarkerPlayer, 0, false, true, "BaboRopeHit")
	StartUptheEvent(BaboKidnapScenarioe.getvalue() as int)
	TimeLapse(true, False)
else;BadEnd / FakeKill
	GotoState("BaboKidnapHangedReady")
endif
EndFunction

EndState

State BaboKidnapHangedReady

Event OnBeginState()
	(BaboSexController as BaboSexControllerManager).FadeinScene(true)
	DisabledXmarkerEnable(true)
	EnabledXmarkerDisable(true)
	(BaboSexController as BaboSexControllerManager).AwayFromtheScene()
	(Kidnapper01.GetReference() as actor).moveto(KidnapperMarker03.Getreference())
	PlayerRef.moveto(KidnapperMarker01.Getreference())
	
	SurrogateActor = CenterMarkerPlayer.GetReference().PlaceActorAtMe(Player)
	SurrogateActor.removeallitems()
	EquipRestraints(SurrogateActor, true)
	(BaboSexController as BaboSexControllerManager).HangingActor(SurrogateActor, RestrainCenterMarker01.getreference(), True, True)

	(BaboSexController as BaboSexControllerManager).FadeOutScene(true)
	RegisterForSingleUpdate(50.0)
	
EndEvent

Event OnUpdate()
	GotoState("BaboKidnapHanged")
EndEvent

EndState

State BaboKidnapHanged

Event OnBeginState()
	YouGotSpotted(0)
EndEvent

Bool Function KeyPress()
Return false
EndFunction

Event OnUpdate()
	;YouGotSpotted(0)
	SurrogateActor.Removeitem(BaboPee01, 1)
	YouGotSpotted(0)
EndEvent

Function YouGotSpotted(int Scenario)
int choice = BaboKidnapHangedMessage.Show()
	if (choice == 0);Die
		;EquipPee
		SurrogateActor.equipitem(SurrogateActor.additem(BaboPee01, 1))
		RegisterForSingleUpdate(60.0)
	else
		YouAreRescued()
		;Debug.Notification("This is still WIP. Please get back to the previous save.")
		;
	endif
EndFunction

Function YouAreRescued()
	(BaboMonitorScript as BaboDiaMonitorScript).CalcCorruptionExpGain(20.0)
	(BaboMonitorScript as BaboDiaMonitorScript).CalcTraumaExpGain(10.0)
	(BaboSexController as BaboSexControllerManager).ReputationDecrease(30, 5)
	(BaboSexController as BaboSexControllerManager).ReputationBitchIncrease(10)
	PlayerRef.moveto(RecoverMarker.getreference())
	EquipRestraints(PlayerRef, false)
	RecoverEquipments()
	YesCollision(PlayerAlias, "IdleForceDefaultState")
	SetvehicleRef(None, None)
	(BaboSexController as BaboSexControllerManager).RecoverControl(true)
	(BaboSexController as BaboSexControllerManager).KidnapEvent01Messagebox(15)
	KidnapQuestStopCheck()
EndFunction

Function KidnapQuestStopCheck()
	BaboKidnapEvent.stop()
EndFunction

EndState
; Privated needs, Pee and Fart, (Mini needs)

;##################Slaver Event#20##################

State BaboSlaverCabin

Event OnBeginState()
	(BaboSexController as BaboSexControllerManager).StateChange("ConstantPainExpression")
	if !(BaboKidnapScenarioe.getvalue() == 20)
		;Debug.notification("Slaved Event Starts")
		ResetSetRoom()
		Debug.sendanimationevent(PlayerRef, "IdleForceDefaultState")
		UnequipWeapons(PlayerRef)
		Utility.wait(2.0)
		PlayerRef.SheatheWeapon()
		AddTitle(0)
		if FollowersStandby()
			BaboKidnapEventFollowersStandBy.forcestart()
		endif
		;FadeinMoveScene(PlayerAlias, CenterMarkerPlayer, 0, false, false, "")
		FadeinScene(true)
		akactor01 = Kidnapper01.getreference() as actor
		akactor02 = Kidnapper02.getreference() as actor
		akactor03 = Kidnapper03.getreference() as actor
		akactor04 = Kidnapper04.getreference() as actor
		akactor05 = Kidnapper05.getreference() as actor
		
		MoveReftoPiont(PlayerAlias, CenterMarkerPlayer)
		(Kidnapper01.getreference() as actor).moveto(KidnapperSafeMarkerA.getreference())
		(Kidnapper01.getreference() as actor).addtofaction(BaboAnonymousSlaverFaction)
		(BaboSexController as BaboSexControllerManager).SetRandomCharacterRank((Kidnapper01.getreference() as actor));Give a character
		if akactor02
			(Kidnapper02.getreference() as actor).moveto(KidnapperMarker02.getreference())
			(Kidnapper02.getreference() as actor).addtofaction(BaboAnonymousSlaverGuardFaction)
			(BaboSexController as BaboSexControllerManager).SetRandomCharacterRank((Kidnapper02.getreference() as actor));Give a character
		endif
		
		if akactor03
			(Kidnapper03.getreference() as actor).moveto(KidnapperMarker03.getreference())
			(Kidnapper03.getreference() as actor).addtofaction(BaboAnonymousSlaverGuardFaction)
		endif
		
		if akactor04
			(Kidnapper04.getreference() as actor).moveto(KidnapperMarker04.getreference())
			(Kidnapper04.getreference() as actor).addtofaction(BaboAnonymousSlaverGuardFaction)
		endif

		if akactor05
			(Kidnapper05.getreference() as actor).moveto(KidnapperMarker05.getreference())
			(Kidnapper05.getreference() as actor).addtofaction(BaboAnonymousSlaverGuardFaction)
		endif

		StartGameHour = GameHour.value
		EndGameHour = StartGameHour + ((Utility.randomint(1, 4)) * 24) as float
		SetScenarioe(20)
		BaboKidnapEvent.setstage(5)
		AddFatigue(PlayerRef, True)
		RegisterForSleep()
		RegisterForSingleUpdate(300.0)
		CheckLocationAndKey(PlayerRef, Kidnapper01)
		(CageDoorA as BaboKidnapCageDoorActivateScript).ResetState()
		(BaboMonitorScript as BaboDiaMonitorScript).CalcCorruptionExpGain(10.0)
		(BaboMonitorScript as BaboDiaMonitorScript).CalcTraumaExpGain(1.0)
		LockDurability = 100
		StatDamaged()
		BaboKidnapTiedUp.setvalue(1);You are in the cage
		FadeOutScene(false)
	else
		(BaboSexController as BaboSexControllerManager).RecoverControl(true)
		RegisterForSingleUpdate(180.0)
		RegisterForSingleUpdateGameTime(0.1)
		RegisterForSleep()
		BaboKidnapTiedUp.setvalue(1);You are in the cage
		;Game.EnablePlayerControls()
		;SetvehicleRef(None, None)
		;EquipRestraintsCheck(PlayerRef)
	endif
EndEvent

Event OnSleepStart(float afSleepStartTime, float afDesiredSleepEndTime)
	Float SleepTime = (afDesiredSleepEndTime - afSleepStartTime) * 24
	if sleeptime > 8.0
		sleeptime = 8.0
	endif
		PlayerRef.RestoreActorValue("Health", 1*sleeptime)
		PlayerRef.RestoreActorValue("Stamina", 2*sleeptime)
		PlayerRef.RestoreActorValue("Magicka", 2*sleeptime)
	Utility.WaitMenuMode(Sleeptime)
	SlaveTrust(5.0)
	PlayerRef.MoveTo(PlayerRef)
endEvent

Function CalltheGuard()
int choice = BaboKidnapCageOptionBMessage.Show()
if (choice == 0);Call the guard
	if bCanTalkwithGuards
		BaboKidnapScenePlay(11)
		bCanTalkwithGuards = false
	else
		BaboKidnapScenePlay(12)
	endif
endif
EndFunction

;Event OnKeyDown( int keyCode )
Bool Function KeyPress()
;	If (!Utility.IsInMenuMode() && (BaboDialogueMCM as BaboDialogueConfigMenu).NotificationKey == keyCode)
;		If BaboKidnapEvent.getstage() >= 8
			;Debug.Notification("I press it!")
			float itotal
			float iSneak
			float ir1
			float ir2
			int ChanceEscape = Utility.randomint(0, 100)
			
			int choice
			
			if BaboPlayerGagged.getvalue() == 1
				choice = BaboKidnapCageGaggedOptionMessage.Show()
			else
				choice = BaboKidnapCageOptionMessage.Show()
			endif
			
				if (choice == 0);Call the master
					if BaboActorDetectorGlobal.Getvalue() == 1;No master
						if akactor02
							CalltheGuard()
						else
							(BaboSexController as BaboSexControllerManager).SlaveryEventMessagebox(4)
						endif
					else
						if GameHour.value >= 22.0 || GameHour.value < 8.0
							if akactor02
								CalltheGuard()
							else
								(BaboSexController as BaboSexControllerManager).SlaveryEventMessagebox(4)
							endif
						else
							if BaboPlayerGagged.getvalue() == 1
								zbfSoundGagFrustrated.play(PlayerRef)
								(BaboSexController as BaboSexControllerManager).SlaveryEventMessagebox(8)
							else
								(BaboSexController as BaboSexControllerManager).SlaveryEventMessagebox(3)
								if ((GameDaysPassed.getValue() - BaboKidnapLastFoodTime.getvalue()) * 24) < 3;It didn't past 3 hours yet.
									BaboKidnapbFoodTime.setvalue(0)
								else
									BaboKidnapbFoodTime.setvalue(1)
								endif
								BaboKidnapScenePlay(4)
							endif
						endif
					endif
					return false; No monologue
				elseif (choice == 1);Call for help
					int ChanceofSuccess = Utility.randomint(0, 100)
					Float SpeechDeviation = Utility.randomint(20, 40) as float;Need to improve
					Float fPlayerSpeech = PlayerRef.GetActorValue("Speechcraft")
					Float ChanceSpeech = fPlayerSpeech - SpeechDeviation
					;Debug.notification(ChanceSpeech)
					BaboSpeechCraftAV.setvalue(ChanceSpeech)
					if BaboPlayerGagged.getvalue() == 1
						;Murmur soundWIP
						zbfSoundGagFrustrated.play(PlayerRef)
					else
						;if ChanceofSuccess <= ChanceSpeech; WIP
						;	BaboKidnapHelperRescue.setvalue(1)
						;	SummonHelper(true)
						;	Utility.wait(1.0)
						;else
						;	BaboKidnapHelperRescue.setvalue(0)
						;endif
						;
						;if BaboActorDetectorGlobal.Getvalue() == 1
						;	BaboKidnapScenePlay(6);No kidnapper
						;else
						;	BaboKidnapScenePlay(5);Yes kidnapper
						;endif
						BaboKidnapFarAwayMessage.show()
					endif
					return false; No monologue
				elseif (choice == 2);Rest
					;Scene Starts
					RestOneHour()
					;TimeLapse(true, true)
					return true; monologue play
				elseif (choice == 3);Meditate
					Meditate()
					return true
				endif
			;endif
		;Endif
;	EndIf
Return true
EndFunction

Bool Function CageDoorChoice()

			float itotal
			float ir1
			float ir2
			float iSneak
			int ChanceEscape = Utility.randomint(0, 100)
			
			if GameHour.value >= 21.0 && GameHour.value < 8.0 && CageDoorA.Getreference().islocked()
				(BaboSexController as BaboSexControllerManager).SlaveryEventMessagebox(6)
				return false
			else
			int choice
			;if BaboPlayerGagged.getvalue() == 1
			;	choice = BaboKidnapCageGaggedOptionMessage.Show()
			;else
				
			;endif
				if BaboPlayerYoke.getvalue() == 1
					(BaboSexController as BaboSexControllerManager).SlaveryEventMessagebox(7)
				else
				choice = BaboKidnapCageDoorOptionMessage.Show()
					if (choice == 0);Struggle
						ir1 = PlayerRef.getactorvalue("OneHanded")
						ir2 = PlayerRef.getactorvalue("TwoHanded")
						iSneak = PlayerRef.getactorvalue("Sneak")
						itotal = ((ir1 + ir2) * 0.3);Lock Break
						LockDurability -= itotal
						if PlayerRef.GetActorValue("Stamina") > 20.0
							PlayerRef.DamageActorValue("Stamina", 20.0)
						else
							(BaboSexController as BaboSexControllerManager).SlaveryEventMessagebox(15)
							Return false
						endif
						if LockDurability < 0.0
							;(BaboSexController as BaboSexControllerManager).MiscSound(PlayerRef, 2); WIP Cracking Lock Sound
							;(BaboSexController as BaboSexControllerManager).SlaveryEventMessagebox(1)
							CageDoorA.Getreference().lock(false)
							;OnLOSRegister()
							;UnregisterForUpdateGameTime()
						else
							;(BaboSexController as BaboSexControllerManager).MiscSound(PlayerRef, 2); WIP Cracking Lock Sound
							Debug.notification("Lock Durability = " + LockDurability as int)
							if iSneak <= ChanceEscape;Detected
								(BaboSexController as BaboSexControllerManager).LosingControl()
								(BaboSexController as BaboSexControllerManager).SlaveryEventMessagebox(2)
								BaboKidnapScenePlay(7);sound
							else;Undetected
								(BaboSexController as BaboSexControllerManager).SlaveryEventMessagebox(14)
								StartUptheEvent(3);Slow down some pace.
							endif
						endif

					elseif (choice == 1);Use Magic
						ir1 = PlayerRef.getactorvalue("Destruction")
						ir2 = PlayerRef.getactorvalue("Alteration")
						iSneak = PlayerRef.getactorvalue("Sneak")
						itotal = ((ir1 + ir2) * 0.5)
						LockDurability -= itotal
						if PlayerRef.GetActorValue("Magicka") > 30.0
							PlayerRef.DamageActorValue("Magicka", 30.0)
						else
							(BaboSexController as BaboSexControllerManager).SlaveryEventMessagebox(5)
							Return false
						endif
						;Debug.sendanimationevent(PlayerRef, "")
						
						if LockDurability < 0.0
							;(BaboSexController as BaboSexControllerManager).SlaveryEventMessagebox(1)
							CageDoorA.Getreference().lock(false)
						else
							Debug.notification("Lock Durability = " + LockDurability as int)
							if iSneak <= ChanceEscape;Detected
								(BaboSexController as BaboSexControllerManager).LosingControl()
								(BaboSexController as BaboSexControllerManager).SlaveryEventMessagebox(2)
								BaboKidnapScenePlay(7);sound
							else;Undetected
								(BaboSexController as BaboSexControllerManager).SlaveryEventMessagebox(14)
								StartUptheEvent(3);Slow down some pace.
							endif
						endif
					endif
				endif
			endif

EndFunction

Event OnUpdate()
	bReadytoRest = true
	if BaboKidnapTiedUp.getvalue() == 1
		RegisterForSingleUpdate(360.0)
	else
	
		if BaboPlayerDetectorGlobal.getvalue() == 0
			int Openstate = (CageDoorA.Getreference()).GetOpenState()
			if  Openstate == 3
				RegisterForSingleUpdate(5.0)
				return
			endif
		endif
		
		if akactor01.isincombat()
			(BaboSexController as BaboSexControllerManager).ChallengeStart(Kidnapper01)
			return
		endif	
		
		if PlayerRef.IsDetectedBy(akactor01)
			Armor thisArmor = PlayerRef.GetWornForm(0x00000004) as Armor
			if (thisArmor) && (thisArmor != BaboTribalClotheTop);You retrieved your gear, Maybe a few keyword exceptions later? WIP
				(BaboSexController as BaboSexControllerManager).ChallengeStart(Kidnapper01);Battle
				(BaboSexController as BaboSexControllerManager).KidnapEvent01Messagebox(13)
				FrontDoor.Getreference().lock(true)
				UnRegisterForUpdate()
				return
			else
				Self.Nocollision(PlayerAlias)
				if PlayerRef.IsSneaking()
					PlayerRef.StartSneaking()
				endif
					BaboKidnapEventYouAreSpotted.forcestart()
					UnRegisterForUpdate()
					LOSUnRegister(akactor02, PlayerRef)
					LOSUnRegister(akactor03, PlayerRef)
					LOSUnRegister(akactor04, PlayerRef)
					LOSUnRegister(akactor05, PlayerRef)
				return
			endif
		endif
		RegisterForSingleUpdate(5.0)
	endif
EndEvent

Event OnUpdateGameTime()
	actor akactor = kidnapper01.getreference() as actor
	actor akactor2
	if kidnapper02
		akactor2 = kidnapper02.getreference() as actor
	endif
	bCanTalkwithGuards = true
	if kidnapper01.getreference().IsInDialogueWithPlayer() || akactor.GetCurrentScene() || akactor.isinfaction(SexLabAnimatingFaction)
		RegisterForSingleUpdateGameTime(0.1)
	endif
	if GameHour.value >= 22.0 || GameHour.value < 8.0
		if BaboKidnapGuardHelpPlayer.getvalue() > 0
			if !akactor.isdead() && !akactor2.isdead()
				BaboKidnapEventScenarioGuardKillMaster.forcestart()
			else
				RegisterForSingleUpdateGameTime(1.0)
			endif
			return
		endif
	elseif GameHour.value >= 16.0 && GameHour.value < 22
		if BaboActorDetectorGlobal.Getvalue() == 1
			; No master
		else
			BaboKidnapScenePlay(8);SexTime
			RegisterForSingleUpdateGameTime(12.0)
			return
		endif
	endif
	RegisterForSingleUpdateGameTime(0.1)
EndEvent

Event OnGainLOS(Actor akViewer, ObjectReference akTarget)

if (akTarget == PlayerRef)
	if (akViewer == akactor02) || (akViewer == akactor03) || (akViewer == akactor04) || (akViewer == akactor05)
	;if (akViewer == akactor01)
		;if BaboDebugging.getvalue() == 1
		;	Debug.notification("You are detected!")
		;endif
		if BaboPlayerDetectorGlobal.getvalue() == 0
			int Openstate = (CageDoorA.Getreference()).GetOpenState()
			if  Openstate == 3
				return
			endif
		endif
		
		if (BaboKidnapGuardHelpPlayer.getvalue() > 0) && (akViewer != akactor02)
			return
		endif
		
		if akViewer.isincombat()
			return
		endif	
		
		if (akViewer.GetSleepState() == 3)
			;nothing
		else
			if PlayerRef.IsDetectedBy(akViewer)
				Armor thisArmor = PlayerRef.GetWornForm(0x00000004) as Armor
				if (thisArmor) && (thisArmor != BaboTribalClotheTop);You retrieved your gear, Maybe a few keyword exceptions later? WIP
					if !PlayerRef.isincombat()
						(BaboSexController as BaboSexControllerManager).KidnapEvent01Messagebox(13)
					endif
					if BaboKidnapGuardHelpPlayer.getvalue() > 0
						akViewer.say(BaboKidnapEventBranchGuardSayT01);Kidnapper02 say
					else
						(BaboSexController as BaboSexControllerManager).ActorChallengeStart(akViewer);Battle
					endif
					LOSUnRegister(akViewer, PlayerRef)
					return
					;Maybe possibly some other dialogue trees? WIP
				else
					Self.Nocollision(PlayerAlias)
					if PlayerRef.IsSneaking()
						PlayerRef.StartSneaking()
					endif
						UnRegisterForUpdate()
						LOSUnRegister(akactor02, PlayerRef)
						LOSUnRegister(akactor03, PlayerRef)
						LOSUnRegister(akactor04, PlayerRef)
						LOSUnRegister(akactor05, PlayerRef)
						if (akViewer == akactor02)
							BaboKidnapEventYouAreSpottedA02.forcestart()
						elseif (akViewer == akactor03)
							BaboKidnapEventYouAreSpottedA03.forcestart()
						elseif (akViewer == akactor04)
							BaboKidnapEventYouAreSpottedA04.forcestart()
						else
							BaboKidnapEventYouAreSpottedA02.forcestart();just in case
						endif
					return
				endif
			endif
		endif
	endif
endif
Endevent

Function OnLOSRegister()
	akactor02 = Kidnapper02.getreference() as actor
	akactor03 = Kidnapper03.getreference() as actor
	akactor04 = Kidnapper04.getreference() as actor
	akactor05 = Kidnapper05.getreference() as actor
	if akactor02
		LOSRegister(akactor02, PlayerRef)
	endif
	
	if akactor03
		LOSRegister(akactor03, PlayerRef)
	endif
	
	if akactor04
		LOSRegister(akactor04, PlayerRef)
	endif
	
	if akactor05
		LOSRegister(akactor05, PlayerRef)
	endif
EndFunction

Function OnUpdateRegister()
	akactor01 = Kidnapper01.getreference() as actor
	BaboKidnapTiedUp.setvalue(0);You are not tied
	UnRegisterForUpdate()
	RegisterForSingleUpdate(1.0)
EndFunction

Function BedRollSleep()
	int choice = BaboKidnapSleepOptionMessage.Show()
	if (choice == 0);Sleep
		if GameHour.value >= 21.0 || GameHour.value < 8.0
			RegisterForSleep()
			FurnitureSafeA.getreference().activate(PlayerRef);Sleep
		else
			(BaboSexController as BaboSexControllerManager).SlaveryEventMessagebox(11)
		;elseif (GameHour.value >= 12.0 && GameHour.value < 18.0) && BaboActorDetectorGlobal.getvalue() == 1
			;SetGameHourCustom(false, 18.0)
		endif
	elseif (choice == 1)
		RestOneHour()
	elseif (choice == 2)
		Meditate()
	endif
EndFunction

Function YouGotSpotted(int Scenario)
if Scenario == 1;
	FadeinMoveScene(PlayerAlias, CenterMarkerPlayer, 0, false, true, "BaboRopeHit")
	(Kidnapper01.getreference() as actor).evaluatepackage()
elseif Scenario == 2;hit
	(BaboSexController as BaboSexControllerManager).EventPairMotion(Kidnapper01.getreference() as actor, 0, 0, 0, 1, false)
elseif Scenario == 3;hitrope
	(BaboSexController as BaboSexControllerManager).EventPairMotion(Kidnapper01.getreference() as actor, 0, 0, 0, 2, false)
elseif Scenario == 4;
	(BaboSexController as BaboSexControllerManager).SexCustom(PlayerAlias, Kidnapper01, None, None, None, "MF", "Aggressive", "Rape", True, "KidnapE04A", "KidnapEvent04A", True)
else;BadEnd / Kill
	AddTitle(4)
	GotoState("BaboSlaverDisposedStandby");Timid characters might let you go? WIP
endif
EndFunction

Function GivePunishment(int istage)

if istage == 1;blowjob Rape
	;FadeinMoveSceneFast(PlayerAlias, FurnitureSafeALink, 0, False)
	FadeinScene(true)
	MoveReftoPiont(PlayerAlias, FurnitureSafeALink)
	if BaboPlayerYoke.getvalue() == 1
		ShackleRestraint(false)
	endif
	MoveReftoPiont(Kidnapper01, FurnitureSafeALink)
	(BaboSexController as BaboSexControllerManager).SexCustom(PlayerAlias, Kidnapper01, None, None, None, "MF", "Aggressive", "Blowjob", True, "KidnapE20A", "KidnapEvent20A", True)
	FadeOutScene(true)
	StartUptheEvent(2)
elseif istage == 2;sex Rape
	;FadeinMoveSceneFast(PlayerAlias, FurnitureSafeALink, 0, False)
	FadeinScene(true)
	MoveReftoPiont(PlayerAlias, FurnitureSafeALink)
	if BaboPlayerYoke.getvalue() == 1
		ShackleRestraint(false)
	endif
	MoveReftoPiont(Kidnapper01, FurnitureSafeALink)
	(BaboSexController as BaboSexControllerManager).SexCustom(PlayerAlias, Kidnapper01, None, None, None, "MF", "Aggressive", "Rape", True, "KidnapE20A", "KidnapEvent20A", True)
	FadeOutScene(true)
	StartUptheEvent(2)
elseif istage == 3;Blowjob
	;FadeinMoveSceneFast(PlayerAlias, FurnitureSafeALink, 0, False)
	FadeinScene(true)
	MoveReftoPiont(PlayerAlias, FurnitureSafeALink)
	if BaboPlayerYoke.getvalue() == 1
		ShackleRestraint(false)
	endif
	MoveReftoPiont(Kidnapper01, FurnitureSafeALink)
	(BaboSexController as BaboSexControllerManager).SexCustom(PlayerAlias, Kidnapper01, None, None, None, "MF", "Blowjob", "", True, "KidnapE20B", "KidnapEvent20B", True)
	FadeOutScene(true)
	StartUptheEvent(2)
elseif istage == 4;drug
	BaboKidnapScenePlay(10)
elseif istage == 5;Violence
	BaboKidnapScenePlay(10)
elseif istage == 6;DDI
	FadeinMoveSceneFast(PlayerAlias, FurnitureSafeALink, 0, False)
	ShackleRestraint(true);Restrained
elseif istage == 7;GuardSex
	FadeinScene(true)
	MoveReftoPiont(PlayerAlias, FurnitureSafeALink)
	if BaboPlayerYoke.getvalue() == 1
		ShackleRestraint(false)
	endif
	MoveReftoPiont(Kidnapper02, FurnitureSafeALink)
	(BaboSexController as BaboSexControllerManager).SexCustom(PlayerAlias, Kidnapper02, None, None, None, "MF", "Aggressive", "Vaginal", True, "KidnapE20C", "KidnapEvent20C", True)
	FadeOutScene(true)
	StartUptheEvent(2)
elseif istage == 8;GuardSex and escape
	FadeinScene(true)
	MoveReftoPiont(PlayerAlias, FurnitureSafeALink)
	if BaboPlayerYoke.getvalue() == 1
		ShackleRestraint(false)
	endif
	MoveReftoPiont(Kidnapper02, FurnitureSafeALink)
	(BaboSexController as BaboSexControllerManager).SexCustom(PlayerAlias, Kidnapper02, None, None, None, "MF", "Aggressive", "Vaginal", True, "KidnapE20D", "KidnapEvent20D", True)
	FadeOutScene(true)
	StartUptheEvent(2)
else

endif

endfunction

Function AfterKidnapEvent(int istage)

if istage == 1

else;MarkerA 12hours later
	PlayerRef.moveto(CenterMarkerPlayer.getreference())
	(Kidnapper01.getreference() as actor).moveto(KidnapperMarker01.getreference())
	(Kidnapper01.getreference() as actor).evaluatepackage()
	(BaboSexController as BaboSexControllerManager).RecoverControl(false)
	RegisterForSingleUpdateGameTime(3.0)
endif

EndFunction

Function KidnapperDied()
	(BaboSexController as BaboSexControllerManager).KidnapEvent01Messagebox(12)
	(BaboMonitorScript as BaboDiaMonitorScript).CalcCorruptionExpLoss(12.0)
	(BaboMonitorScript as BaboDiaMonitorScript).CalcTraumaExpLoss(2.0)
	Gotostate("BaboSlaverDied")
EndFunction

Function SummonHelper(Bool Summon = true)
if Summon
	Helper01.forcerefto(KidnapperSafeMarkerB.getreference().PlaceActorAtMe(BaboBadEndGuardM, 4))
	Helper02.forcerefto(KidnapperSafeMarkerB.getreference().PlaceActorAtMe(BaboBadEndGuardM, 4))
else
	(Helper01.getreference() as actor).deletewhenable()
	(Helper02.getreference() as actor).deletewhenable()
	Helper01.clear()
	Helper02.clear()
endif
EndFunction

Function YouAreRescued()
	YesCollision(PlayerAlias, "IdleForceDefaultState")
	PlayerRef.moveto(RecoverMarker.getreference())
EndFunction

Function StartUptheEvent(int Scenarioe)
		;Clearallthealiases()
		if Scenarioe == 1
			Gotostate("BaboSlaverCabin")
		elseif Scenarioe == 2
			Gotostate("BaboSlaverStandby")
		elseif Scenarioe == 3
			Gotostate("BaboSlaverInterval")
		else
			Gotostate("BaboSlaverStandby")
		endif
EndFunction

Function BaboKidnapScenePlay(int Callstage)
if Callstage == 1
	BaboKidnapEventScenario04A.forcestart()
elseif Callstage == 2
	BaboKidnapEventScenario04B.forcestart()
elseif Callstage == 3
	BaboKidnapEventScenario04C.forcestart()
elseif Callstage == 4
	BaboKidnapEventScenario04D.forcestart()
elseif Callstage == 5
	BaboKidnapEventScenario04E.forcestart()
elseif Callstage == 6
	BaboKidnapEventScenario04EB.forcestart()
elseif Callstage == 7
	BaboKidnapEventScenario20A.forcestart()
elseif Callstage == 8
	BaboKidnapEventScenario20B.forcestart()
elseif Callstage == 9
	BaboKidnapEventScenario20C.forcestart()
elseif Callstage == 10
	BaboKidnapEventScenario20E.forcestart()
elseif Callstage == 11
	BaboKidnapEventScenarioCall.forcestart()
elseif Callstage == 12
	BaboKidnapEventScenarioCallFail.forcestart()
elseif Callstage == 13
	BaboKidnapEventScenarioPunishPunch.forcestart();WIP
elseif Callstage == 14
	BaboKidnapEventScenarioGuardSex.forcestart()
elseif Callstage == 15
	BaboKidnapEventScenarioGuardSexB.forcestart()
endif
EndFunction

Function KidnapQuestStopCheck()
	BaboKidnapEvent.stop()
EndFunction

Function TimeLapse(Bool OneHour, Bool Standby)
	if GameHour.value >= 21.0 || GameHour.value < 8.0
		(BaboSexController as BaboSexControllerManager).SlaveryEventMessagebox(10)
		return
	endif
	if OneHour
		SetGameHourCustom(true, 1.0)
	Endif

if Standby
	if (GameHour.value >= 8.0 && GameHour.value < 21.0) && BaboActorDetectorGlobal.getvalue() == 1
		SetGameHourCustom(false, 18.0)
	endif
else

endif
EndFunction

EndState

State BaboSlaverInterval

Event OnBeginState()
	UnRegisterforupdate()
	RegisterForSingleUpdate(30.0)
	;RegisterForSingleUpdateGameTime(4.0)
EndEvent

Event OnUpdate()
	StartUptheEvent(1)
EndEvent

Event OnUpdateGameTime()
;You go back to the cage. If any event is on process, ignore it. WIP
EndEvent

Bool Function KeyPress()
	UnRegisterforupdate()
	StartUptheEvent(1);Back to Normal State
	return false; No monologue
EndFunction

Bool Function CageDoorChoice();Wait!
	(BaboSexController as BaboSexControllerManager).SlaveryEventMessagebox(16)
	return false
EndFunction

Function BedRollSleep()
	UnRegisterforupdate()
	StartUptheEvent(1);Back to Normal State
EndFunction

Function StartUptheEvent(int Scenarioe)
		;Clearallthealiases()
		if Scenarioe == 1
			Gotostate("BaboSlaverCabin")
		elseif Scenarioe == 2
			Gotostate("BaboSlaverStandby")
		elseif Scenarioe == 3
			Gotostate("BaboSlaverInterval")
		else
			Gotostate("BaboSlaverStandby")
		endif
EndFunction

EndState

State BaboSlaverStandby

Bool Function KeyPress()
Return false
EndFunction

Event OnBeginState()
	bReadytoRest = true
	UnRegisterforupdate()
	UnRegisterForUpdateGameTime()
EndEvent

Event OnUpdate()
	bReadytoRest = true
	RegisterForSingleUpdate(3.0)
EndEvent

Event OnUpdateGameTime()
EndEvent

Event OnSleepStart(float afSleepStartTime, float afDesiredSleepEndTime)
endEvent

Function YouGotSpottedOG(actor akactor, int Scenario)
if scenario == 1
endif
EndFunction

Function YouGotSpotted(int Scenario)
if Scenario == 1;
	FadeinScene(true)
	MoveReftoPiont(PlayerAlias, FurnitureSafeALink)
	if BaboPlayerYoke.getvalue() == 1
		ShackleRestraint(false)
	endif
	MoveReftoPiont(Kidnapper01, FurnitureSafeALink)
	(BaboSexController as BaboSexControllerManager).SexCustom(PlayerAlias, Kidnapper01, None, None, None, "MF", "Aggressive", "Rape", True, "KidnapE20A", "KidnapEvent20A", True)
	FadeOutScene(true)
	StartUptheEvent(2)
elseif Scenario == 2;Guard take you
	FadeinScene(true)
	MoveReftoPiont(PlayerAlias, FurnitureSafeALink)
	(BaboSexController as BaboSexControllerManager).RecoverControl(false)
	FadeOutScene(true)
	StartUptheEvent(1)
elseif Scenario == 5;piercing WIP
else;BadEnd / Kill
	AddTitle(4)
	GotoState("BaboSlaverDisposedStandby");Timid characters might let you go? WIP
endif
EndFunction

Function GivePunishment(int istage)

if istage == 1;blowjob Rape
	;FadeinMoveSceneFast(PlayerAlias, FurnitureSafeALink, 0, False)
	FadeinScene(true)
	MoveReftoPiont(PlayerAlias, FurnitureSafeALink)
	if BaboPlayerYoke.getvalue() == 1
		ShackleRestraint(false)
	endif
	MoveReftoPiont(Kidnapper01, FurnitureSafeALink)
	(BaboSexController as BaboSexControllerManager).SexCustom(PlayerAlias, Kidnapper01, None, None, None, "MF", "Aggressive", "Blowjob", True, "KidnapE20A", "KidnapEvent20A", True)
	FadeOutScene(true)
	StartUptheEvent(2)
elseif istage == 2;sex Rape
	;FadeinMoveSceneFast(PlayerAlias, FurnitureSafeALink, 0, False)
	FadeinScene(true)
	MoveReftoPiont(PlayerAlias, FurnitureSafeALink)
	if BaboPlayerYoke.getvalue() == 1
		ShackleRestraint(false)
	endif
	MoveReftoPiont(Kidnapper01, FurnitureSafeALink)
	(BaboSexController as BaboSexControllerManager).SexCustom(PlayerAlias, Kidnapper01, None, None, None, "MF", "Aggressive", "Rape", True, "KidnapE20A", "KidnapEvent20A", True)
	FadeOutScene(true)
	StartUptheEvent(2)
elseif istage == 3;Normal Sex
	;FadeinMoveSceneFast(PlayerAlias, FurnitureSafeALink, 0, False)
	FadeinScene(true)
	MoveReftoPiont(PlayerAlias, FurnitureSafeALink)
	if BaboPlayerYoke.getvalue() == 1
		ShackleRestraint(false)
	endif
	MoveReftoPiont(Kidnapper01, FurnitureSafeALink)
	(BaboSexController as BaboSexControllerManager).SexCustom(PlayerAlias, Kidnapper01, None, None, None, "MF", "", "", True, "KidnapE20B", "KidnapEvent20B", True)
	FadeOutScene(true)
	StartUptheEvent(2)
elseif istage == 4;drug
	BaboKidnapScenePlay(5)
elseif istage == 5;Violence
	BaboKidnapScenePlay(5)
elseif istage == 6;DDI
	ShackleRestraint(true)
else

endif

endfunction

Function BaboKidnapScenePlay(int Callstage)
if Callstage == 1
	BaboKidnapEventScenario20A.forcestart()
elseif Callstage == 2
	BaboKidnapEventScenario20B.forcestart()
elseif Callstage == 3
	BaboKidnapEventScenario20C.forcestart()
elseif Callstage == 4
	BaboKidnapEventScenario20D.forcestart()
elseif Callstage == 5
	BaboKidnapEventScenario20E.forcestart()
elseif Callstage == 6
	BaboKidnapEventScenario20BAfter.forcestart()
elseif Callstage == 7
	BaboKidnapEventScenarioGuardAfterSex.forcestart()
elseif Callstage == 8
	BaboKidnapEventScenarioGuardAfterSexB.forcestart()
endif
EndFunction

Function StartUptheEvent(int Scenarioe)
		;Clearallthealiases()
		if Scenarioe == 1
			Gotostate("BaboSlaverCabin")
		elseif Scenarioe == 2
			;Blank
		elseif Scenarioe == 20
			Gotostate("BaboSlaverCabin")
		endif
EndFunction

Function AfterKidnapEvent(int istage)

if istage == 1;After Violence
	PlayerRef.moveto(CenterMarkerPlayer.getreference())
	(Kidnapper01.getreference() as actor).moveto(KidnapperMarker01.getreference())
	(Kidnapper01.getreference() as actor).evaluatepackage()
	(BaboSexController as BaboSexControllerManager).RecoverControl(false)
	RegisterForSingleUpdateGameTime(3.0)
	StartUptheEvent(1)
elseif istage == 2;After normal sex
	FadeinMoveSceneFast(PlayerAlias, CenterMarkerPlayer, 0, False)
	(Kidnapper01.getreference() as actor).moveto(KidnapperMarker02.getreference())
	(Kidnapper01.getreference() as actor).evaluatepackage()
	(BaboSexController as BaboSexControllerManager).RecoverControl(false)
	StartUptheEvent(1)
elseif istage == 3;After sex with guard
	FadeinMoveSceneFast(PlayerAlias, CenterMarkerPlayer, 0, False)
	ProvideLockpicks()
	PlaceFoodCheap(0, 1, true, FoodMarkerA)
	PlaceDrink(0, 1, true, FoodMarkerA)
	(Kidnapper02.getreference() as actor).moveto(KidnapperMarker02.getreference())
	(Kidnapper02.getreference() as actor).evaluatepackage()
	(BaboSexController as BaboSexControllerManager).RecoverControl(false)
	StartUptheEvent(1)
elseif istage == 4;After sex with guard + Escape Plan
	FadeinMoveSceneFast(PlayerAlias, CenterMarkerPlayer, 0, False)
	;ProvideLockpicks()
	GuardHelpPlayer(0)
	PlaceFoodCheap(0, 1, true, FoodMarkerA)
	PlaceDrink(0, 1, true, FoodMarkerA)
	(Kidnapper02.getreference() as actor).moveto(KidnapperMarker02.getreference())
	(Kidnapper02.getreference() as actor).evaluatepackage()
	(BaboSexController as BaboSexControllerManager).RecoverControl(true)
	StartUptheEvent(1)
elseif istage == 5;Get back to the cage
	FadeinScene(true)
	MoveReftoPiont(PlayerAlias, CenterMarkerPlayer)
	(CageDoorA as BaboKidnapCageDoorActivateScript).GotoNullState(true)
	(CageDoorA as BaboKidnapCageDoorActivateScript).ResetState()
	(BaboSexController as BaboSexControllerManager).RecoverControl(true)
	FadeOutScene(true)
	StartUptheEvent(1)
else;After Sex
	GuardFavor(15.0)
	FadeinMoveScene(PlayerAlias, CenterMarkerPlayer, 0, false, false, "")
	;PlayerRef.moveto(CenterMarkerPlayer.getreference())
	(Kidnapper01.getreference() as actor).moveto(KidnapperMarker01.getreference())
	(Kidnapper01.getreference() as actor).evaluatepackage()
	(BaboSexController as BaboSexControllerManager).RecoverControl(true)
	RegisterForSingleUpdateGameTime(3.0)
	StartUptheEvent(1)
endif

EndFunction


EndState

State BaboSlaverDisposedStandby

Event OnBeginState()
	(BaboSexController as BaboSexControllerManager).FadeinScene(true)
	;DisabledXmarkerEnable(true)
	;EnabledXmarkerDisable(true)
	GameDaysPassed.setvalue(GameDaysPassed.getvalue() + 3)
	(BaboSexController as BaboSexControllerManager).StuckControl()
	(Kidnapper01.GetReference() as actor).moveto(KidnapperMarker01.Getreference())
	PlayerRef.moveto(FurnitureSafeALink.Getreference())
	Debug.sendanimationevent(PlayerRef, "BaboWombHit")
	(BaboSexController as BaboSexControllerManager).FadeOutScene(true)
	RegisterForSingleUpdate(50.0)
EndEvent

Bool Function KeyPress()
return false; No monologue
EndFunction

Bool Function CageDoorChoice();Wait!
EndFunction

Event OnUpdate()
	GotoState("BaboSlaverDisposed")
EndEvent

Event OnUpdateGameTime()
EndEvent

EndState

State BaboSlaverDisposed

Event OnBeginState()
	YouGotSpotted(0)
EndEvent

Bool Function KeyPress()
Return false
EndFunction

Event OnUpdate()
	YouGotSpotted(0)
EndEvent

Function YouGotSpotted(int Scenario)
int choice = BaboKidnapStarvedMessage.Show()
	if (choice == 0);Die
		RegisterForSingleUpdate(60.0)
	else
		YouAreRescued()
	endif
EndFunction

Function YouAreRescued()
	(BaboMonitorScript as BaboDiaMonitorScript).CalcCorruptionExpGain(20.0)
	(BaboMonitorScript as BaboDiaMonitorScript).CalcTraumaExpGain(4.0)
	(BaboSexController as BaboSexControllerManager).ReputationDecrease(50, 10)
	(BaboSexController as BaboSexControllerManager).ReputationBitchIncrease(50)
	PlayerRef.moveto(RecoverMarker.getreference())
	EquipGag(PlayerRef, false)
	ShackleRestraint(false)
	EquipRestraints(PlayerRef, false)
	RecoverEquipments()
	YesCollision(PlayerAlias, "IdleForceDefaultState")
	SetvehicleRef(None, None)
	(BaboSexController as BaboSexControllerManager).RecoverControl(true)
	(BaboSexController as BaboSexControllerManager).KidnapEvent01Messagebox(15)
	KidnapQuestStopCheck()
EndFunction

Function KidnapQuestStopCheck()
	BaboKidnapEvent.stop()
EndFunction

EndState

State BaboSlaverDied

Event OnBeginState()
	(CageDoorA as BaboKidnapCageDoorActivateScript).GotoNullState(true)
	(BaboSexController as BaboSexControllerManager).RecoverControl(true)
	UnRegisterForupdate()
	UnRegisterForUpdateGameTime()
	UnRegisterForSleep()
EndEvent

Event OnUpdate()
EndEvent

Event OnUpdateGameTime()
EndEvent

Event OnGainLOS(Actor akViewer, ObjectReference akTarget)
EndEvent

Bool Function KeyPress()
return false; No monologue
EndFunction

Bool Function CageDoorChoice()
	CageDoorA.Getreference().lock(false)
EndFunction

Function AfterKidnapEvent(int istage)
	if istage == 1; You have to pay for his help WIP
		AliasSlaverGuardAddList()
		Dumptheactors()
		(BaboSexController as BaboSexControllerManager).SlaveryEventMessagebox(17)
	elseif istage == 2; You have to pay for his help WIP
		AliasSlaverGuardAddList()
		Dumptheactors()
		(BaboSexController as BaboSexControllerManager).SlaveryEventMessagebox(17)
	elseif istage == 3; You are enslaved again!
		FadeinScene(true)
		ConfiscateChest.getreference().removeallitems(BaboTempStolenGoodsRef, false, true)
		Utility.wait(1.0)
		ConfiscateChest.getreference().removeallitems(PlayerRef, false, true); Just in case
		akactor02 = Kidnapper02.getreference() as actor
		Kidnapper02.clear()
		GotoAbductionRoom(akactor02)
		BaboKidnapEvent.setstage(250)
	else;free to go
		;Nothing to do really
	endif
EndFunction

Function BedRollSleep()
EndFunction

EndState