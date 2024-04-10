Scriptname BaboDefaultOnEnterTriggerScript extends ObjectReference  

Quest Property RequiredQuest Auto
Int Property RequestedStage Auto
Int Property RequestedStage02 Auto
Int Property NextStage Auto
Scene Property SceneToStart  Auto  
{scene to start}
bool Property SceneSwitch = false Auto
bool Property DoOnce = true Auto  
{set to true if you want this trigger to fire only once
false means it will try to start the scene each time
the trigger actor enters it
}

Referencealias[] Property ReferenceArray Auto

bool Property ActorArrayToggle = false Auto 
{by default, it is set to false. set to true if you want this event to be triggered by kills}

objectReference property triggerActor auto
{by default, the player}


Bool Function CountActors()
Int iIndex = ReferenceArray.Length
	If iIndex != 0
	While iIndex
		iIndex -= 1 ; 29'th element is 30'th Draugr
		Referencealias kalias = ReferenceArray[iIndex]
		Actor kActor = (kalias.getref() as actor)
		If kActor.isdead()
		Else
			Return false
		EndIf
	EndWhile
	Else
		Return false
	EndIf
	Return True
EndFunction

Function ReArmTrigger()
;Debug.notification("No need to reset the Trigger Box.")
EndFunction

auto state waiting

EVENT onTriggerEnter(objectReference actronaut)
	if (triggerActor == None || actronaut as actor == triggerActor)
		if (RequiredQuest.GetStage() >= (RequestedStage)) && (RequiredQuest.GetStage() < (RequestedStage02))
			If CountActors() || !ActorArrayToggle
			if SceneSwitch
				SceneToStart.forceStart()
			endif
			if DoOnce
				gotoState("done")
			endif
			RequiredQuest.SetStage(NextStage)
			EndIf
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