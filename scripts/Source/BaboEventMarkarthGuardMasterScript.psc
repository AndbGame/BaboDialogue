Scriptname BaboEventMarkarthGuardMasterScript extends Quest  

Function GoStateBefore()
	GotoState("Before40")
EndFunction

Function GoState()
	GotoState("After40")
EndFunction

Function RegisterUpdate(Int TimeLimit)
	RegisterForSingleUpdateGameTime(TimeLimit); this is Customizable
EndFunction

State Before40
Event OnUpdateGameTime()
	If BaboEvent.GetStage() < 100
		BaboEvent.SetStage(148)
	ElseIf BaboEvent.GetStage() >= 100
		BaboEvent.SetStage(150)
	Endif
EndEvent
EndState

State After40
Event OnUpdateGameTime()
	If BaboEvent.GetStage() == 150 || 160
		BaboEvent.Reset()
		BaboMarkerthStrictGuardTriggerGlobal.setvalue(0)
		BaboEvent.SetStage(0)
		Utility.wait(1.0)
		BaboEvent.SetStage(1)
		GotoState("Before40")
	Endif
EndEvent
EndState


Function StartQuest()
;	If
	Actor SGuard01 = GuardSpawnSpot01.PlaceActorAtMe(GuardImperial01, 4)
	Actor SGuard02 = GuardSpawnSpot02.PlaceActorAtMe(GuardImperial02, 4)
	GuardRef01.ForceRefTo(SGuard01)
	GuardRef02.ForceRefTo(SGuard02)
	SGuard01.EvaluatePackage()
	SGuard02.EvaluatePackage()
;	ElseIf
;	EndIf
EndFunction

Function EvaluateAlias(Actor Guard)
	If Guard == GuardRef01.GetReference() as actor
		GuardRef01.Clear()
		GuardRef03.ForceRefTo(Guard)
	ElseIf Guard == GuardRef02.GetReference() as actor
		GuardRef02.Clear()
		GuardRef03.ForceRefTo(Guard)
	EndIf
EndFunction

Function ConfiscateInventory()
	BMQuest.PlayerRef.RemoveAllItems(ConfiscatedChest, True, False)
EndFunction

Function ConfiscateInventory02()
	ConfiscatedChest.RemoveAllItems(ConfiscatedChest02, True, True)
EndFunction

Function Exhaustion(Actor Player, Bool Animate = True)
	If Animate
	Game.DisablePlayerControls( true, true, true, false, true, false, true, false )
	Game.SetPlayerAIDriven( true )
	int Random = Utility.RandomInt(0, 99)
		If Random < 33
			Debug.SendAnimationEvent(Player, "BaboExhaustedBack01")
		ElseIf Random >= 33 && Random < 66
			Debug.SendAnimationEvent(Player, "BaboExhaustedBack02")
		ElseIf Random >= 66 && Random < 100
			Debug.SendAnimationEvent(Player, "BaboExhaustedBack03")
		EndIf
	Else
		Debug.SendAnimationEvent(Player, "IdleForceDefaultState")
		Utility.Wait(5.0)
		Game.EnablePlayerControls()
		Game.SetPlayerAIDriven(false)
	EndIf	
EndFunction

Actorbase Property GuardSons01 Auto
Actorbase Property GuardSons02 Auto
Actorbase Property GuardImperial01 Auto
Actorbase Property GuardImperial02 Auto

ObjectReference Property ConfiscatedChest Auto
ObjectReference Property ConfiscatedChest02 Auto

ObjectReference Property GuardSpawnSpot01 Auto
ObjectReference Property GuardSpawnSpot02 Auto
ReferenceAlias Property GuardRef01 Auto
ReferenceAlias Property GuardRef02 Auto
ReferenceAlias Property GuardRef03 Auto

Quest Property BaboEvent Auto

GlobalVariable Property BaboMarkerthStrictGuardTriggerGlobal Auto

BaboDiaMonitorScript Property BMQuest Auto