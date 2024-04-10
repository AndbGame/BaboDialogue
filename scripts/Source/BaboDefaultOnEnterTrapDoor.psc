Scriptname BaboDefaultOnEnterTrapDoor extends ObjectReference  

Quest Property RequiredQuest Auto
Int Property RequestedStage Auto
Int Property RequestedStage02 Auto
bool Property DoOnce = true Auto  
{set to true if you want this trigger to fire only once
false means it will try to start the scene each time
the trigger actor enters it
}
Referencealias Property TrapDoorRef Auto
Actor property PlayerRef auto
Bool Property AutoDoor Auto
Bool Property OpenDoor Auto

Function ReArmTrigger()
;Debug.notification("No need to reset the Trigger Box.")
EndFunction

auto state waiting

EVENT onTriggerEnter(objectReference actronaut)
	if !(actronaut as actor == PlayerRef)
		if (RequiredQuest.GetStage() >= (RequestedStage)) && (RequiredQuest.GetStage() < (RequestedStage02)) || AutoDoor
			if DoOnce
				gotoState("done")
			endif
			if OpenDoor
				(TrapDoorRef.getreference()).setopen(true)
			else
				(TrapDoorRef.getreference()).setopen(false)
			endif
		endif
	else
	endif
endEVENT

endState

state done

Function ReArmTrigger()
gotoState("waiting")
Debug.notification("BaboDefaultOnEnterTrapDoor Reset.")
EndFunction

EVENT onTriggerEnter(objectReference actronaut)
; do nothing
endEvent
endState