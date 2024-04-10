Scriptname BaboDefaultLockedDoorScript extends ObjectReference  

Quest Property BaboFollowerQuest Auto
Int Property Nextstage Auto

;bool Property AlreadyLoaded Auto Hidden
bool Property DoOnce Auto

;EVENT OnLoad()
;	if AlreadyLoaded == FALSE
;	AlreadyLoaded = TRUE
;EndEVENT

Function ResetTrigger()
	GoToState("WaitingToBeOpened")
EndFunction

Auto STATE WaitingToBeOpened
	EVENT OnOpen (ObjectReference triggerRef)
		BaboFollowerQuest.setstage(Nextstage)
		If DoOnce == True
			GoToState("AlreadyOpened")
		EndIf
	EndEVENT
endSTATE

STATE AlreadyOpened
	;do nothing
EndSTATE
