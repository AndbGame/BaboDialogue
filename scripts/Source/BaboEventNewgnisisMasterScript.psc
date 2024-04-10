Scriptname BaboEventNewgnisisMasterScript extends Quest  
{Argonians... They know nothing about dovaqueen's deeds...}

;\\\\\\\\\\\\\\\\
;\\\Property Zone\\\\\\\
;\\\\\\\\\\\\\\\\
ObjectReference Property BaboEventCornerClubStageTriggerBox  Auto  
BaboMCMRestart Property BaboMCMRestartScript Auto

BaboSexControllerManager Property BMQuest Auto

GlobalVariable Property VisitAgain auto
GlobalVariable Property TriggerCount auto

Quest Property BaboEvent Auto
Quest Property BaboSexController Auto

Armor property AnkleChain auto
Armor property CumFace auto
Armor property CumChest auto
Armor property CumVagina auto

Actor Citizen01
Actor Citizen02
Actor Citizen03
Actor Citizen04
Actor Citizen05
Actor Citizen06

Actorbase property HunterArgonian01 auto
Actorbase property HunterArgonian02 auto
Actorbase property HunterArgonian03 auto

ReferenceAlias Property InnKeeperRef Auto
ReferenceAlias Property TriggerBox Auto

ReferenceAlias Property ArgonianRaper01 Auto
ReferenceAlias Property ArgonianRaper01Copy Auto
ReferenceAlias Property ArgonianRaper02 Auto
ReferenceAlias Property ArgonianRaper03 Auto

ReferenceAlias Property Citizen01Ref Auto
ReferenceAlias Property Citizen02Ref Auto
ReferenceAlias Property Citizen03Ref Auto
ReferenceAlias Property Citizen04Ref Auto
ReferenceAlias Property Citizen05Ref Auto
ReferenceAlias Property Citizen06Ref Auto
ReferenceAlias Property BrunwulfRef Auto

Actor Property PlayerActor Auto

Actor Property Calixto Auto
Actor Property Oengul Auto

Actor Property Revyn Auto
Actor Property Nils Auto

Actor Property Sussana Auto
Actor Property Viola Auto

Actor Property Belyn Auto
Actor Property Silda Auto

Actor Property Neetrenaza Auto
Actor Property Shahvee Auto

Actor Property Tulvur Auto
Actor Property Angrenor Auto

Actor Property Brunwulf Auto

ObjectReference property SpawnPlace auto

ObjectReference property TorturePole auto
ObjectReference property TortureLight auto
ObjectReference property FirePlace auto
ObjectReference property FireFX auto
ObjectReference property TheDoorRef auto


Idle property OrgasmAfter01 auto
Idle property PantingIdle auto
Idle property Showcase01 auto

ObjectReference property XmarkerHeadingPlayer auto
ObjectReference property XmarkerHeadingArgonian auto
ObjectReference property XmarkerHeadingArgonianCopy auto
ObjectReference property XmarkerHeadingArgonianSub auto
ObjectReference property XmarkerHeading01 auto
ObjectReference property XmarkerHeading02 auto
ObjectReference property XmarkerHeading03 auto
ObjectReference property XmarkerHeading04 auto
ObjectReference property XmarkerHeading05 auto
ObjectReference property XmarkerHeading06 auto

ObjectReference property XmarkerHeadingPlayerInn auto
ObjectReference property XmarkerHeadingBrunwulfInn auto

Scene property BaboEventWindhelmNewgnisisScene01 auto
Scene property BaboEventWindhelmNewgnisisScene02 auto
Scene property BaboEventWindhelmNewgnisisScene03 auto
Scene property BaboEventWindhelmNewgnisisScene04 auto
Scene property BaboEventWindhelmNewgnisisScene05 auto
Scene property BaboEventWindhelmNewgnisisSceneExtra auto

GlobalVariable Property BaboSimpleSlavery Auto
GlobalVariable Property BaboSimpleSlaveryChance Auto
;\\\\\\\\\\\\\\\\
;\\\Function Zone\\\\\\\
;\\\\\\\\\\\\\\\\

Function GoStateBefore()
	GotoState("Before200")
EndFunction

Function GoState()
	GotoState("After200")
EndFunction

Function RegisterUpdate(Int TimeLimit)
UnregisterForUpdateGameTime()
;Debug.notification("Babo Argonian Unregister Mod")
RegisterForSingleUpdateGameTime(TimeLimit); this is Customizable
EndFunction

Function RegisterUpdateOnLoad(Int TimeLimit)
UnregisterForUpdateGameTime()
;Debug.notification("Babo Argonian Unregister Mod")
RegisterForSingleUpdateGameTime(TimeLimit); this is Customizable
EndFunction

State Before200
Event OnUpdateGameTime()
	If BaboEvent.GetStage() == 100
		BaboEvent.SetStage(150)
	Endif
EndEvent
EndState

State After200
Event OnUpdateGameTime()
	If (BaboEvent.GetStage() == 150) || (BaboEvent.GetStage() == 245)
		VisitAgainToggle(True)
		GotoState("Before200")
		BaboMCMRestartScript.UpdateNewgnisisQuest()
	Elseif  BaboEvent.GetStage() == 250
		GotoState("Before200")
		BaboMCMRestartScript.UpdateNewgnisisQuest()
	Elseif  BaboEvent.GetStage() == 255
		GotoState("Before200")
		BaboMCMRestartScript.UpdateNewgnisisQuest()
	Endif
EndEvent
EndState

Function SpawnArgonians()

Actor ArgonianHunter01 = SpawnPlace.PlaceActorAtMe(HunterArgonian01, 4)
Actor ArgonianHunter02 = SpawnPlace.PlaceActorAtMe(HunterArgonian02, 4)
Actor ArgonianHunter03 = SpawnPlace.PlaceActorAtMe(HunterArgonian03, 4)
ArgonianRaper01.ForceRefTo(ArgonianHunter01)
ArgonianRaper02.ForceRefTo(ArgonianHunter02)
ArgonianRaper03.ForceRefTo(ArgonianHunter03)

EndFunction

Function ClearArgonians()

ArgonianRaper01.GetReference().DeleteWhenAble()
ArgonianRaper02.GetReference().DeleteWhenAble()
ArgonianRaper03.GetReference().DeleteWhenAble()
ArgonianRaper01.Clear()
ArgonianRaper02.Clear()
ArgonianRaper03.Clear()

EndFunction

Function SpawnCopyArgonian()

Actor ArgonianHunter01Copy = XmarkerHeadingArgonianCopy.PlaceActorAtMe(HunterArgonian01, 4)
ArgonianRaper01Copy.ForceRefTo(ArgonianHunter01Copy)

EndFunction

Function ForAlias(Actor InnKeeper, Referencealias InnRef)
	InnRef.ForceRefto(InnKeeper)
EndFunction

Function MovetoShowcase()
	DesignatingCitizen()
	TorturePole.Enable()
	TortureLight.Enable()
	FirePlace.Enable()
	FireFX.Enable()
	Debug.SendAnimationEvent(PlayerActor, "IdleForceDefaultState")
	Utility.wait(1)
	TorturePole.Activate(PlayerActor)
	Utility.wait(1)
	Game.DisablePlayerControls( true, true, true, false, true, false, true, false )
	Game.SetPlayerAIDriven( true )
	PlayerActor.moveto(XmarkerHeadingPlayer)
	(ArgonianRaper01.GetReference() as actor).moveto(XmarkerHeadingArgonian)
	(ArgonianRaper02.GetReference() as actor).moveto(XmarkerHeadingArgonianSub)
	(ArgonianRaper03.GetReference() as actor).moveto(XmarkerHeadingArgonianSub)
	Citizen01.moveto(XmarkerHeading01)
	Citizen02.moveto(XmarkerHeading02)
	Citizen03.moveto(XmarkerHeading03)
	Citizen04.moveto(XmarkerHeading04)
	Citizen05.moveto(XmarkerHeading05)
	Citizen06.moveto(XmarkerHeading06)
	Brunwulf.moveto(XmarkerHeading06)
EndFunction

Function DesignatingCitizen()
	If Calixto.isdead()
		Citizen01 = Oengul
	Else
		Citizen01 = Calixto
	EndIf
	If Revyn.isdead()
		Citizen02 = Nils
	Else
		Citizen02 = Revyn
	EndIf
	If Sussana.isdead()
		Citizen03 = Viola
	Else
		Citizen03 = Sussana
	EndIf
	If Belyn.isdead()
		Citizen04 = Silda
	Else
		Citizen04 = Belyn
	EndIf
	If Neetrenaza.isdead()
		Citizen05 = Shahvee
	Else
		Citizen05 = Neetrenaza
	EndIf
	If Angrenor.isdead()
		Citizen06 = Tulvur
	Else
		Citizen06 = Angrenor
	EndIf
BrunwulfRef.ForceRefTo(Brunwulf)
Citizen01Ref.ForceRefTo(Citizen01)
Citizen02Ref.ForceRefTo(Citizen02)
Citizen03Ref.ForceRefTo(Citizen03)
Citizen04Ref.ForceRefTo(Citizen04)
Citizen05Ref.ForceRefTo(Citizen05)
Citizen06Ref.ForceRefTo(Citizen06)
EndFunction

Function ShowingStart()
	Armor CurrentBody = PlayerActor.GetWornForm(0x00000004) as Armor ;This Form is for Cuirass
	Armor CurrentPanty = PlayerActor.GetWornForm(0x00400000) as Armor ;This Form is for Panty
	PlayerActor.UnEquipItem(CurrentBody, true, true)
	PlayerActor.UnEquipItem(CurrentPanty, true, true)
	EquipZazItem()
EndFunction

Function RescueInnMoving()
	PlayerActor.moveto(XmarkerHeadingPlayerInn)
	Brunwulf.moveto(XmarkerHeadingBrunwulfInn)
EndFunction

Function EquipZazItem()
	PlayerActor.addItem(CumFace, 1, true)
	PlayerActor.addItem(CumChest, 1, true)
	PlayerActor.addItem(CumVagina, 1, true)
	PlayerActor.addItem(AnkleChain, 1, true)
	PlayerActor.EquipItem(CumFace, true, true)
	PlayerActor.EquipItem(CumChest, true, true)
	PlayerActor.EquipItem(CumVagina, true, true)
	PlayerActor.EquipItem(AnkleChain, true, true)
EndFunction

Function UnEquipZazItem()
	PlayerActor.UnEquipItem(CumFace, true, true)
	PlayerActor.UnEquipItem(CumChest, true, true)
	PlayerActor.UnEquipItem(CumVagina, true, true)
	PlayerActor.UnEquipItem(AnkleChain, true, true)
	PlayerActor.RemoveItem(CumFace, 1, true)
	PlayerActor.RemoveItem(CumChest, 1, true)
	PlayerActor.RemoveItem(CumVagina, 1, true)
	PlayerActor.RemoveItem(AnkleChain, 1, true)
EndFunction

Function PlayPantingAnim()
	PlayerActor.playIdle(pantingidle)
EndFunction

Function VisitAgainToggle(Bool Switch)
	VisitAgain.setvalue(switch as int)
EndFunction

Function TriggerCountPlus(int Count)
	TriggerCount.setvalue(TriggerCount.Getvalue() as int + Count)
EndFunction

Function DisableTorturePole()
	TorturePole.disable()
	TortureLight.disable()
	FirePlace.disable()
	FireFX.disable()
EndFunction

Function TriggerBoxReset()
	BaboEventCornerClubStageTriggerBox.disable()
		Utility.wait(1.0)
	BaboEventCornerClubStageTriggerBox.enable()
		Utility.wait(1.0)
	(BaboEventCornerClubStageTriggerBox as BaboDefaultOnEnterTriggerScript).ReArmTrigger()
EndFunction

Function ClearQuest()

BaboEventWindhelmNewgnisisScene01.stop()
BaboEventWindhelmNewgnisisScene02.stop()
BaboEventWindhelmNewgnisisScene03.stop()
BaboEventWindhelmNewgnisisScene04.stop()
BaboEventWindhelmNewgnisisScene05.stop()
BaboEventWindhelmNewgnisisSceneextra.stop()

BMQuest.Recovercontrol()
;BaboEvent.Reset()
UnregisterForUpdateGameTime()
GotoState("Before200")
TheDoorRef.Lock(False, False)
ArgonianRaper01.GetReference().DeleteWhenAble()
ArgonianRaper01Copy.GetReference().DeleteWhenAble()
ArgonianRaper02.GetReference().DeleteWhenAble()
ArgonianRaper03.GetReference().DeleteWhenAble()
ArgonianRaper01.Clear()
ArgonianRaper01Copy.Clear()
ArgonianRaper02.Clear()
ArgonianRaper03.Clear()
InnKeeperRef.Clear()
BrunwulfRef.Clear()
Citizen01Ref.Clear()
Citizen02Ref.Clear()
Citizen03Ref.Clear()
Citizen04Ref.Clear()
Citizen05Ref.Clear()
Citizen06Ref.Clear()
TriggerBoxReset()
VisitAgainToggle(False)
BMQuest.CompatiblityCheck(False)
BaboEvent.setstage(1)

;Debug.notification("Windhelm Newgnisis Event Clear")

EndFunction

Function SendingSexEvent(ReferenceAlias Alias01, ReferenceAlias Alias02)
	Messagebox(2)
	(BaboSexController as BaboSexControllerManager).SexCustom(Alias01, Alias02, None, None, None, "Rape", "Vaginal", "MF", True, "WNAS01", "WindhelmNewgnisisAfterSex01", true)
EndFunction

Function Messagebox(int num)
	(BaboSexController as BaboSexControllerManager).WindhelmNewgnisisMessagebox(num)
EndFunction

Function WNAS01()
	Debug.Sendanimationevent(PlayerActor, "BaboExhaustedBack02")
	If BaboEvent.getstage() == 50
		BaboEvent.setstage(55)
	ElseIf BaboEvent.getstage() == 60
		BaboEvent.setstage(65)
	EndIf
EndFunction

Function WNAS02()
	Debug.Sendanimationevent(PlayerActor, "BaboExhaustedFront02")
	BaboEventWindhelmNewgnisisSceneExtra.forcestart()
	Utility.wait(2.0)
	BaboEvent.setstage(90)
EndFunction

Function DraggingtoSexMarketWithPossibility()
	int random = Utility.RandomInt(0, 99)
	If BaboSimpleSlavery.getvalue() == 1
		If Random < BaboSimpleSlaveryChance.getvalue() as int
			BaboEvent.setstage(74)
		Else
			BaboEvent.setstage(73)
		EndIf
	Else
		BaboEvent.setstage(73)
	EndIf
EndFunction