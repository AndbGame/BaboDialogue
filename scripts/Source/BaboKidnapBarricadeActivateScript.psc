Scriptname BaboKidnapBarricadeActivateScript extends ReferenceAlias  

Bool property Cooltime = true auto hidden

Auto State Blocked

Event Onactivate(ObjectReference akActionRef)
	if Cooltime
		Cooltime = false
		(BaboKidnapEvent as BaboEventRiekling).BarricadeDoorChoice()
		Utility.wait(2.0)
		Cooltime = true
	endif
EndEvent

EndState

State Unblocked

Event Onactivate(ObjectReference akActionRef)
	(BaboKidnapEvent as BaboEventRiekling).OpenBarricade(false)
EndEvent

EndState

State Nullstate

EndState

Function StateSwitch(Bool bopen)
	if bopen
		gotostate("Unblocked")
	else
		gotostate("Blocked")
	endif
EndFunction

Quest property BaboSexController auto
Quest property BaboKidnapEvent auto
Int Property ConditionalStage = 20 Auto
