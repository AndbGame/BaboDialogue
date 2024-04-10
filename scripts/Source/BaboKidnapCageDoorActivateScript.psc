Scriptname BaboKidnapCageDoorActivateScript extends ReferenceAlias  

Function GotoNullState(Bool bState)

if bState
	GotoState("NullState")
else
	GotoState("LockedState")
endif

EndFunction

Function ResetState()
	(Self.getreference()).SetOpen(false)
	(Self.getreference()).lock(true)
	GotoState("LockedState")
EndFunction

Function HowtoPickLock()
if BaboKidnapEvent.getstage() >= ConditionalStage
	(BaboKidnapEvent as BaboKidnapEvenScript).CageDoorChoice()
endif
EndFunction

Event OnLockStateChanged()
if (self.getreference()).IsLocked()
	Gotostate("LockedState")
else
	Gotostate("UnlockedState")
endif
EndEvent


Auto State LockedState

Event Onactivate(ObjectReference akActionRef)
	HowtoPickLock()
EndEvent

EndState



State UnlockedState

Event OnBeginState()
	(BaboSexController as BaboSexControllerManager).SlaveryEventMessagebox(1)
	(BaboKidnapEvent as BaboKidnapEvenScript).OnLOSRegister()
	(BaboKidnapEvent as BaboKidnapEvenScript).UnregisterForUpdateGameTime()
	(BaboKidnapEvent as BaboKidnapEvenScript).OnUpdateRegister()
EndEvent

Event Onactivate(ObjectReference akActionRef)
EndEvent

Event OnLockStateChanged()

EndEvent

EndState



State NullState

Event OnLockStateChanged()
	;Nothing
EndEvent

Event Onactivate(ObjectReference akActionRef)
	;Nothing
EndEvent

EndState



Quest property BaboSexController auto
Quest property BaboKidnapEvent auto
Message Property BaboKidnapCageDoorOptionMessage  Auto  
Int Property ConditionalStage Auto