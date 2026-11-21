Scriptname BaboEventRieklingTriggerActivator extends ObjectReference  

bool property doOnce = TRUE auto
Actor property playerref auto
BaboEventRiekling Property BERiekling Auto
int property actornumber = 1 auto

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
				BERiekling.WakeupActor(actornumber)
				;activate(self)
		endif
	endEvent
endState

;************************************

State allDone
	;do nothing
endState

;************************************