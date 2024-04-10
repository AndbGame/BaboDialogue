Scriptname BaboWhiterunOrcOnEnterTriggerScript extends ObjectReference  

Quest Property BaboEventWhiterunOrcVisitiors Auto
bool Property DoOnce = true Auto  
Actor Property PlayerRef Auto

Function ReArmTrigger()
;Debug.notification("No need to reset the Trigger Box.")
EndFunction

auto state waiting

EVENT onTriggerEnter(objectReference actronaut)
	if actronaut as actor == PlayerRef
		if BaboEventWhiterunOrcVisitiors.getstage() == 35
			(BaboEventWhiterunOrcVisitiors as BaboEventWhiterunOrcVisitorsScript).MoveOrcs()
			if DoOnce
				gotoState("done")
			endif
		endif
	endif
endEVENT
endState

state done

Function ReArmTrigger()
gotoState("waiting")
;Debug.notification("Newgnisis Trigger Box Reset.")
EndFunction

EVENT onTriggerEnter(objectReference actronaut)
; do nothing
endEvent
endState