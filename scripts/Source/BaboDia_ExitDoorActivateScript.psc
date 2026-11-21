Scriptname BaboDia_ExitDoorActivateScript extends ObjectReference  

Function LeavePlace()
	int choice = BaboDoorEscapeMessage.Show()
	if (choice == 0)
		if bcondition && BaboEventQuest.getstage() == conditionalstage
			BaboEventQuest.setstage(queststage)
		else
			BaboMustRetrieveGearMsg.show()
		endif
	endif
endfunction

Event Onactivate(ObjectReference akActionRef)
	if akActionRef == PlayerRef
		LeavePlace()
	endif
EndEvent

Message Property BaboDoorEscapeMessage Auto
Message Property BaboMustRetrieveGearMsg Auto
Actor Property PlayerRef Auto
Quest Property BaboEventQuest Auto
int property queststage auto
int property conditionalstage auto
bool property bcondition auto