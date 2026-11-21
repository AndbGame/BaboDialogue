Scriptname Babo_TriggerOnEnterScript extends ObjectReference  


bool property doOnce = TRUE auto
Actor property playerref auto

Function ResetTrigger()
	gotostate("waiting")
EndFunction

;************************************
auto State waiting
	Event onTriggerEnter(objectReference triggerRef)
		Actor actorRef = triggerRef as Actor
		if (actorRef == playerref)
			if doOnce == TRUE
				gotoState("allDone")
			endif
				activate(self)
		endif
	endEvent
endState

;************************************

State allDone
	;do nothing
endState

;************************************