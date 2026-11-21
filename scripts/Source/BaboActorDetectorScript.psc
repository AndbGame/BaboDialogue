Scriptname BaboActorDetectorScript extends ObjectReference  

GlobalVariable Property BaboActorDetectorGlobal Auto
bool Property ActorEnterBool Auto
{Decide Enter and Exit}
bool Property DoOnce = false Auto  
{set to true if you want this trigger to fire only once
false means it will try to start the scene each time
the trigger actor enters it
}
Referencealias[] Property ReferenceArray Auto
bool Property ActorArrayToggle = false Auto 
{by default, it is set to false. set to true if you want this event to be triggered by kills}
Actor Property PlayerRef Auto


Bool Function CountActors()
; --- andb: ported from crajjjj stability patch 6.1.1.3 (BaboActorDetectorScript) the 6.51 loop
; computes kActor and discards it, so CountActors() returns True whenever ReferenceArray is
; non-empty regardless of whether any watched alias actually holds an actor. With
; ActorArrayToggle=true (14 of 20 detector triggers in the 6.51 ESP, all watching
; BaboKidnapEvent's alias #1) the detector fires even when the watched actor does not exist.
	Int iIndex = ReferenceArray.Length
	if iIndex == 0
		return false
	endif

	while iIndex
		iIndex -= 1
		Referencealias kalias = ReferenceArray[iIndex]
		Actor kActor = (kalias.getref() as actor)
		if kActor != None
			return true
		endif
	endwhile

	return false
EndFunction

Function ReArmTrigger()
;Debug.notification("No need to reset the Trigger Box.")
EndFunction

auto state waiting

EVENT onTriggerEnter(objectReference actronaut)
	if !(actronaut as actor == PlayerRef)
		If CountActors() || !ActorArrayToggle
			if ActorEnterBool
				BaboActorDetectorGlobal.setvalue(1)
			else
				BaboActorDetectorGlobal.setvalue(0)
			endif
			if DoOnce
				gotoState("done")
			endif
		EndIf
	endif
endEVENT
endState

state done

Function ReArmTrigger()
gotoState("waiting")
EndFunction

EVENT onTriggerEnter(objectReference actronaut)
; do nothing
endEvent
endState
