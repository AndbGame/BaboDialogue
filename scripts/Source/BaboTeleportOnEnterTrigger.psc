Scriptname BaboTeleportOnEnterTrigger extends ObjectReference  

Quest Property RequiredQuest Auto
Int Property RequestedStage Auto
Int Property RequestedStage02 Auto
Int Property NextStage Auto
Int Property ChoiceStage Auto
bool Property MoveQuestStageSwitch = false Auto

bool Property Goback = true Auto
bool Property TeleportSwitch = true Auto
{You wish to teleport the actor?}
ObjectReference Property TeleportDestination Auto
{Teleport Destination}
Message Property Teleportmsg Auto
bool Property DoOnce = true Auto  
{set to true if you want this trigger to fire only once
false means it will try to start the scene each time
the trigger actor enters it
}
actor property triggerActor auto
{by default, the player}


Function Goback(objectReference akref)
	akref.moveto(self.GetNthLinkedRef(0))
EndFunction

Function ReArmTrigger()
;Debug.notification("No need to reset the Trigger Box.")
EndFunction

auto state waiting

EVENT onTriggerEnter(objectReference actronaut)
if (triggerActor == None || actronaut as actor == triggerActor)
	if (RequiredQuest.GetStage() >= (RequestedStage)) && (RequiredQuest.GetStage() < (RequestedStage02))
		int choice = Teleportmsg.show()
		if choice == 0
			actronaut.moveto(TeleportDestination)
		elseif choice == 1
			actronaut.moveto(TeleportDestination)
			RequiredQuest.SetStage(ChoiceStage)
		else
			if Goback
				Goback(actronaut)
			endif
			return
		endif
		
		if MoveQuestStageSwitch
			RequiredQuest.SetStage(NextStage)
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
;Debug.notification("Newgnisis Trigger Box Reset.")
EndFunction

EVENT onTriggerEnter(objectReference actronaut)
; do nothing
endEvent
endState
