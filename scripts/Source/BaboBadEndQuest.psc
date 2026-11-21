Scriptname BaboBadEndQuest extends Quest Conditional

ObjectReference Property BakaRescuePointXmarker auto
Bool Property PlayerIsRestrained Auto
formlist property BaboSpawnRoads auto
formlist property BaboSpawnTrees auto
formlist property BaboSpawnAspenTrees auto
int Property NoLess Auto

ReferenceAlias Property Alias_PlayerRef auto
ReferenceAlias Property Alias_Centermarker auto
ReferenceAlias Property Alias_GuardM auto
ReferenceAlias Property Alias_GuardM2 auto
ReferenceAlias Property Alias_Raper auto
ReferenceAlias Property Alias_Raper2 auto
ReferenceAlias Property Alias_Creature auto
ReferenceAlias Property Alias_Helper auto
ReferenceAlias Property Alias_FarmerM auto
ReferenceAlias Property Alias_FarmerM2 auto
ReferenceAlias Property Alias_FarmerF auto
GlobalVariable Property BaboBadEndVariable auto
GlobalVariable Property BaboBadEndCount auto

ActorBase Property BaboBadEndGuardM  Auto  
ActorBase Property BaboBadEndFarmerM  Auto  
ActorBase Property BaboBadEndHelper  Auto  
ActorBase Property BaboBadEndThug  Auto  
ActorBase Property BaboBadEndThug02  Auto  
ActorBase Property BaboBadEndThief  Auto  
ActorBase Property BaboBadEndLvlAnimalTroll  Auto
Actor Property PlayerRef Auto

Furniture Property zbfTorturePoleCustom03StdWood  Auto  
GlobalVariable Property GameHour  Auto  
Scene Property BaboBadEndBrigandScene  Auto  
Scene Property BaboBadEndHelperScene  Auto  
Scene Property BaboBadEndGuardScene  Auto  
Scene Property BaboBadEndFarmerScene  Auto  
String Property MMF  Auto  
String Property Aggressive  Auto  
String Property AfterSexS  Auto  
String Property AfterSexScene  Auto  
Scene Property BaboBadEndBrigandAfterSexScene  Auto  
Scene Property BaboBadEndTrollAfterSexScene Auto  
Scene Property BaboBadEndFarmerAfterSexScene Auto  
Scene Property BaboBadEndThiefScene  Auto  
Scene Property BaboBadEndTrollScene  Auto  

Idle Property BaboBadEnding01 Auto
Idle Property BaboBadEnding02 Auto
Idle Property BaboBadEnding03 Auto
Idle Property BaboDefeatedPanting01 Auto

Quest Property BaboSexController Auto
BaboMsgManager Property MsgCtrl Auto
Int Property FarmerCallGuardChance = 70 Auto;Call Guard: % chance guards come

BaboDiaMonitorScript property BDMScript Auto
BaboDia_Util Property BDUtil Auto
BaboDialogueConfigMenu Property BDCM Auto
BaboReputationMasterScript Property BRMQuest  Auto  

GlobalVariable Property BaboSimpleSlavery Auto
GlobalVariable Property BaboSimpleSlaveryChance Auto
GlobalVariable Property BaboBadEndScenario Auto
actor SpawnActor1
actor SpawnActor2

Function PlayBaboBadEnding()
int chance = Utility.randomint(1,3)

if chance == 1
	PlayerRef.playidle(BaboBadEnding01)
elseif chance == 2
	PlayerRef.playidle(BaboBadEnding02)
else
	PlayerRef.playidle(BaboBadEnding03)
endif
PlayerIsRestrained = true
EndFunction

Function BadEndCount()
	BaboBadEndCount.setvalue(BaboBadEndCount.getvalue() + 1)
EndFunction

Function ResetAnimation()
	Debug.SendAnimationEvent(Alias_PlayerRef.getactorreference(), "IdleForceDefaultState")
EndFunction

Function StartScenarioe()

int i = Utility.randomint(0, 99)

if i < 20
	BaboBadEndVariable.setvalue(0);Guard
elseif i < 25
	BaboBadEndVariable.setvalue(1);Helper
elseif i < 40
	BaboBadEndVariable.setvalue(2);Brigands
elseif i < 55
	BaboBadEndVariable.setvalue(3);Thief
elseif i < 60
	BaboBadEndVariable.setvalue(4);Creature
else
	BaboBadEndVariable.setvalue(5);Farmer
endif

EndFunction


Function SelectScenarioe()

int i = Utility.randomint(0, 99)

if i < 20
	BaboBadEndScenario.setvalue(0);Run
elseif i < 60
	BaboBadEndScenario.setvalue(1);Help
elseif i < 75
	BaboBadEndScenario.setvalue(2);Rape
else
	BaboBadEndScenario.setvalue(3);Call Guard
endif

EndFunction

Function SpawnVariable(int num)
	if num == 0
		SpawnNPCs(BaboBadEndGuardM, BaboBadEndGuardM)
		Alias_PlayerRef.Getowningquest().setstage(15)
	elseif num == 1
		SpawnNPCs(BaboBadEndHelper, none)
		Alias_PlayerRef.Getowningquest().setstage(15)
	elseif num == 2
		SpawnNPCs(BaboBadEndThug, BaboBadEndThug02)
		Alias_PlayerRef.Getowningquest().setstage(15)
	elseif num == 3
		SpawnNPCs(BaboBadEndThief, None)
		Alias_PlayerRef.Getowningquest().setstage(15)
	elseif num == 4
		SpawnNPCs(BaboBadEndLvlAnimalTroll, None)
		Alias_PlayerRef.Getowningquest().setstage(15)
	elseif num == 5
		SpawnNPCs(BaboBadEndFarmerM, None)
		(BaboSexController as BaboSexControllerManager).SetRandomCharacterRank(SpawnActor1)
		Alias_PlayerRef.Getowningquest().setstage(15)
	elseif num == 6
		SpawnNPCs(BaboBadEndFarmerM, BaboBadEndFarmerM)
		Alias_PlayerRef.Getowningquest().setstage(15)
	endif
EndFunction

Event Onupdate()

If BaboBadEndVariable.getvalue() == 0
	(Alias_GuardM.Getreference() as actor).moveto(PlayerRef)
	(Alias_GuardM2.Getreference() as actor).moveto(PlayerRef)
ElseIf BaboBadEndVariable.getvalue() == 1
	(Alias_Helper.Getreference() as actor).moveto(PlayerRef)
Elseif BaboBadEndVariable.getvalue() == 2
	(Alias_Raper.Getreference() as actor).moveto(PlayerRef)
	(Alias_Raper2.Getreference() as actor).moveto(PlayerRef)
Elseif BaboBadEndVariable.getvalue() == 3
	(Alias_Raper.Getreference() as actor).moveto(PlayerRef)
Elseif BaboBadEndVariable.getvalue() == 4
	(Alias_Creature.Getreference() as actor).moveto(PlayerRef)
Elseif BaboBadEndVariable.getvalue() == 5
	(Alias_FarmerM.Getreference() as actor).moveto(PlayerRef)
Elseif BaboBadEndVariable.getvalue() == 6
	(Alias_FarmerM.Getreference() as actor).moveto(PlayerRef)
	(Alias_FarmerM2.Getreference() as actor).moveto(PlayerRef)
Endif

EndEvent

Function UnregisterUpdate()
	UnRegisterForUpdate()
EndFunction

Function ClearRestraints()
	if PlayerIsRestrained
		
		(BaboSexController as BaboSexControllerManager).UnEquipRestraints(PlayerRef)
		Utility.wait(1.0)
		(BaboSexController as BaboSexControllerManager).UnEquipCumItem(PlayerRef)
		(BaboSexController as BaboSexControllerManager).RecoverControl(true)
		BDCM.RecoverEquipments()
		PlayerIsRestrained = false
	endif
EndFunction

Function RescueFromGuards()
	ClearRestraints()
	Utility.wait(1.0)
	RescuetoSaferoom()
	BRMQuest.DecreaseReputation(20, 0)
	Alias_PlayerRef.Getowningquest().setstage(100)
EndFunction

Function RevertQuest(int num)

	if num == 0
		MsgCtrl.BadEndMessagebox(10)
		RescueFromGuards()
	elseif num == 1
		ClearRestraints()
	elseif num == 2
		MsgCtrl.BadEndMessagebox(1)
		BRMQuest.DecreaseReputation(10, 0)
		(BaboSexController as BaboSexControllerManager).FadeinScene(true)
		Debug.SendAnimationEvent(PlayerRef, "IdleForceDefaultState")
		Alias_Raper.getactorreference().delete()
		Alias_Raper2.getactorreference().delete()
		Alias_Raper.clear()
		Alias_Raper2.clear()
		
		Alias_FarmerM.getactorreference().delete()
		Alias_FarmerM.clear()
		
		utility.wait(2)
		PlayBaboBadEnding()
		(BaboSexController as BaboSexControllerManager).FadeOutScene(true)

		MiscUtil.SetFreeCameraState(true)
		MiscUtil.SetFreeCameraSpeed(2)
		utility.wait(2)
		MiscUtil.SetFreeCameraState(false)

		;BaboBadEndVariable.setvalue(Utility.Randomint(0, 5))
		;if BaboBadEndVariable.getvalue() == 2;Only helper for now
		;	BaboBadEndVariable.setvalue(1)
		;endif
		StartScenarioe()
		utility.wait(1)
		Alias_PlayerRef.Getowningquest().setstage(5)
	elseif num == 3
		BRMQuest.DecreaseReputation(5, 0)
		Alias_FarmerM.getactorreference().delete()
		Alias_Raper.getactorreference().delete()
		Alias_Raper.clear()
		Alias_FarmerM.clear()
		BaboBadEndVariable.setvalue(Utility.Randomint(0, 5))
		if BaboBadEndVariable.getvalue() == 3;Only helper for now
			BaboBadEndVariable.setvalue(1)
		endif
		Alias_PlayerRef.Getowningquest().setstage(5)
	elseif num == 4
		Alias_Creature.getactorreference().delete()
		Alias_Creature.clear()
		ClearRestraints()
		Alias_PlayerRef.Getowningquest().setstage(100)
	elseif num == 5
		;Alias_FarmerM.getactorreference().delete()
		;Alias_FarmerM.clear()
		ClearRestraints()
		Alias_PlayerRef.Getowningquest().setstage(100)
	elseif num == 6;Farmer Call Guard
		BRMQuest.DecreaseReputation(10, 0)
		Alias_FarmerM.getactorreference().delete()
		Alias_FarmerM2.getactorreference().delete()
		Alias_FarmerM.clear()
		Alias_FarmerM2.clear()
		BaboBadEndVariable.setvalue(0)
		Alias_PlayerRef.Getowningquest().setstage(5)
	endif

EndFunction

Function SpawnNPCs(Actorbase SpawnNPC, Actorbase SpawnNPC2)
	objectreference SpawnPoint = Game.FindRandomReferenceOfAnyTypeInListFromRef(BaboSpawnRoads, PlayerRef, 512.0)
	if !SpawnPoint || PlayerRef.GetDistance(SpawnPoint) <= NoLess as Float
		SpawnPoint = Game.FindRandomReferenceOfAnyTypeInListFromRef(BaboSpawnTrees, PlayerRef, 512.0)
		if !SpawnPoint || PlayerRef.GetDistance(SpawnPoint) <= NoLess as Float
			SpawnPoint = Game.FindRandomReferenceOfAnyTypeInListFromRef(BaboSpawnAspenTrees, PlayerRef, 512.0)
			if !SpawnPoint || PlayerRef.GetDistance(SpawnPoint) <= NoLess as Float
				SpawnPoint = Alias_CenterMarker.GetReference()
			endif
		endif
	endif
	SpawnActor1 = SpawnPoint.PlaceActorAtMe(SpawnNPC, 4, none)
	if SpawnNPC2
		SpawnActor2 = SpawnPoint.PlaceActorAtMe(SpawnNPC2, 4, none)
		DesignateAlias(SpawnActor1, SpawnActor2)
		StatsSet(SpawnActor1)
		StatsSet(SpawnActor2)
	else
		DesignateAlias(SpawnActor1, None)
		StatsSet(SpawnActor1)
	endif
EndFunction

Function DesignateAlias(Actor akactor, Actor akactor2)

If BaboBadEndVariable.getvalue() == 0
	Alias_GuardM.forcerefto(akactor)
	Alias_GuardM2.forcerefto(akactor2)
ElseIf BaboBadEndVariable.getvalue() == 1
	Alias_Helper.forcerefto(akactor)
Elseif BaboBadEndVariable.getvalue() == 2
	Alias_Raper.forcerefto(akactor)
	Alias_Raper2.forcerefto(akactor2)
Elseif BaboBadEndVariable.getvalue() == 3
	Alias_Raper.forcerefto(akactor)
Elseif BaboBadEndVariable.getvalue() == 4
	Alias_Creature.forcerefto(akactor)
Elseif BaboBadEndVariable.getvalue() == 5
	Alias_FarmerM.forcerefto(akactor)
Elseif BaboBadEndVariable.getvalue() == 6
	Alias_FarmerM.forcerefto(akactor)
	Alias_FarmerM2.forcerefto(akactor2)
Endif

EndFunction

Function StatsSet(Actor Dude)

dude.SetActorValue("Aggression", 1.0)	; ensure is aggressive
dude.SetActorValue("Confidence", 3.0)	; brave
dude.SetActorValue("Energy", 99.0)   ; super energetic
dude.SetActorValue("Mood", 4.0)	; Not angry
dude.SetActorValue("Morality", 1.0)	; violence against enemies
dude.EnableAI(True)
dude.evaluatepackage()

endfunction

Function StripandGetdressed()

PlayerRef.RemoveItem(PlayerRef.GetWornForm(0x00000004), 1, false, BDCM.BaboTempStolenGoodsRef)
BDUtil.StripPlayerTopBottom(BDCM.BaboTempStolenGoodsRef)
(BaboSexController as BaboSexControllerManager).EquipRestraints(Alias_PlayerRef.getactorreference(), true)
Utility.wait(1.0)
(BaboSexController as BaboSexControllerManager).EquipCumItem(Alias_PlayerRef.getactorreference())

EndFunction

Function Fadein()
(BaboSexController as BaboSexControllerManager).FadeinScene(true)
StripandGetdressed()
Debug.SendAnimationEvent(PlayerRef, "IdleForceDefaultState")

PlayBaboBadEnding()

MiscUtil.SetFreeCameraState(true)
MiscUtil.SetFreeCameraSpeed(2)
utility.wait(2)
MiscUtil.SetFreeCameraState(false)
(BaboSexController as BaboSexControllerManager).FadeoutScene(true)
EndFunction

Function PastTime()

Float CurrentTime = GameHour.GetValue()
BDMScript.RandomPainMenu(Alias_PlayerRef.getactorreference())
GameHour.SetValue(CurrentTime + Utility.randomfloat(1, 3))
MsgCtrl.BadEndMessagebox(2)

EndFunction


Faction Property SLAX_AggressiveFaction Auto

Function ForceSceneStart(int num)

if num == 0
	MsgCtrl.BadEndMessagebox(8)
	BaboBadEndGuardScene.forcestart()
elseif num == 1
	MsgCtrl.BadEndMessagebox(3)
	BaboBadEndHelperScene.Forcestart()
elseif num == 2
	MsgCtrl.BadEndMessagebox(4)
	BaboBadEndBrigandScene.Forcestart()
elseif num == 3
	MsgCtrl.BadEndMessagebox(5)
	BaboBadEndThiefScene.forcestart()
elseif num == 4
	MsgCtrl.BadEndMessagebox(6)
	BaboBadEndTrollScene.forcestart()
elseif num == 5
	MsgCtrl.BadEndMessagebox(7)
	if (Alias_FarmerM.getreference() as actor).getfactionrank(SLAX_AggressiveFaction) >= 3
		BaboBadEndScenario.setvalue(2)
	else
		SelectScenarioe()
	endif
	BaboBadEndFarmerScene.forcestart()
endif
RegisterForSingleUpdate(360.0)
EndFunction

Function RapeStart(Referencealias Alias01, Referencealias Alias02, Referencealias Alias03, Referencealias Alias04, String Tag01, String Tag02, String Tag03, Bool NextScene, String EventRegisterDummy, String EventName, Bool Rape)

;BDMScript.FurnitureDespawn(PlayerRef)
Debug.SendAnimationEvent(PlayerRef, "IdleForceDefaultState")
Utility.wait(1.0)
(BaboSexController as BaboSexControllerManager).SexCustom(Alias_PlayerREF, Alias01, Alias02, Alias03, Alias04, Tag01, Tag02, Tag03, NextScene, EventRegisterDummy, EventName, Rape)
;(BaboSexController as BaboSexControllerManager).SexCustom(Alias_PlayerREF, Alias01, Alias02, Alias03, Alias04, MMF, Aggressive, None, True, "BEAS01", "BadEndAfterSex01", true)

EndFunction

Function CreatureRapeStart()
Debug.SendAnimationEvent(PlayerRef, "IdleForceDefaultState")
Utility.wait(1.0)
(BaboSexController as BaboSexControllerManager).SexCustom(Alias_PlayerREF, Alias_Creature, None, None, None, "CF", "Aggressive", None, True, "BEAS01", "BadEndAfterSex01", true)

EndFunction

Function FarmerCallGuard()
	Utility.Wait(5.0)
	(BaboSexController as BaboSexControllerManager).FadeinScene(true)
	GameHour.Mod(Utility.RandomFloat(2.0, 4.0));Time skip under black
	Alias_FarmerM.getactorreference().delete()
	if Utility.RandomInt(0, 99) < FarmerCallGuardChance
		RevertQuest(6);Guards came
	else
		RevertQuest(3);Nobody came, re-roll
	endif
	(BaboSexController as BaboSexControllerManager).FadeOutScene(true)
EndFunction

Function RescuetoSaferoom()
	PlayerRef.moveto(BakaRescuePointXmarker)
EndFunction

Function AfterSex(int scenario)

if scenario == 1

elseif scenario == 2
	Self.DraggingtoSexMarketWithPossibility()
	BaboBadEndBrigandAfterSexScene.forcestart()
elseif scenario == 3

elseif scenario == 4
	BaboBadEndTrollAfterSexScene.forcestart()
elseif scenario == 5
	BaboBadEndFarmerAfterSexScene.forcestart()
endif

EndFunction

Function BEAS01()
	Utility.wait(2.0)
	PlayerRef.playidle(BaboDefeatedPanting01)
	Alias_PlayerRef.Getowningquest().setstage(55)
EndFunction

Function DraggingtoSexMarketWithPossibility()
	int random = Utility.RandomInt(0, 99)
	If BaboSimpleSlavery.getvalue() == 1
		If Random < BaboSimpleSlaveryChance.getvalue() as int
			Alias_PlayerRef.Getowningquest().setstage(57)
		Else
			Alias_PlayerRef.Getowningquest().setstage(56)
		EndIf
	Else
		Alias_PlayerRef.Getowningquest().setstage(56)
	EndIf
EndFunction