Scriptname BaboRemoveOnEnterTrigger extends ObjectReference  

bool Property bremove Auto
bool Property bdisable Auto

Faction Property RemoveFaction Auto
bool Property NeedFaction = true Auto

{Teleport Destination}
bool Property DoOnce = true Auto  
{set to true if you want this trigger to fire only once
false means it will try to start the scene each time
the trigger actor enters it
}
actor property triggerActor auto
{by default, the player}




Function RemovetoLinkedObject(objectReference akref)
	if bremove
		akref.moveto(self.GetNthLinkedRef(0))
	elseif bdisable
		akref.disable()
	else
		akref.delete()
	endif
EndFunction

Function ReArmTrigger()
;Debug.notification("No need to reset the Trigger Box.")
EndFunction

auto state waiting

EVENT onTriggerEnter(objectReference actronaut)
EndEvent

endstate

state working

EVENT onTriggerEnter(objectReference actronaut)
	if (triggerActor == None || actronaut as actor == triggerActor)
		if (actronaut as actor).isinfaction(RemoveFaction) && NeedFaction
			RemovetoLinkedObject(actronaut)
		elseif !NeedFaction
			RemovetoLinkedObject(actronaut)
		endif

		if DoOnce
			gotoState("done")
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
