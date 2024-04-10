Scriptname BaboPrisonerDetectorScript extends ObjectReference  

GlobalVariable Property BaboPrisonerDetectorGlobal Auto
GlobalVariable Property BaboPlayerDetectorGlobal Auto
bool Property ActorEnterBool Auto
bool Property PlayerEnterBool = false Auto
{Decide Enter and Exit}
bool Property DoOnce = true Auto  
{set to true if you want this trigger to fire only once
false means it will try to start the scene each time
the trigger actor enters it
}
Referencealias[] Property ReferenceArray Auto
bool Property ActorArrayToggle = false Auto 
{by default, it is set to false. set to true if you want this event to be triggered by kills}
Actor Property PlayerRef Auto


Bool Function CountActors()
Int iIndex = ReferenceArray.Length
	If iIndex != 0
	While iIndex
		iIndex -= 1
		Referencealias kalias = ReferenceArray[iIndex]
		Actor kActor = (kalias.getref() as actor)
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
	if !(actronaut as actor == PlayerRef)
		If CountActors() || !ActorArrayToggle
			if ActorEnterBool
				BaboPrisonerDetectorGlobal.setvalue(1)
			else
				BaboPrisonerDetectorGlobal.setvalue(0)
			endif
			if DoOnce
				gotoState("done")
			endif
		EndIf
	else
		if PlayerEnterBool
			if ActorEnterBool
				BaboPlayerDetectorGlobal.setvalue(1)
			else
				BaboPlayerDetectorGlobal.setvalue(0)
			endif
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
EndFunction

EVENT onTriggerEnter(objectReference actronaut)
; do nothing
endEvent
endState