Scriptname BakaDoorActivateScript extends ObjectReference  

Event Onactivate(ObjectReference akActionRef)
if akActionRef == PlayerRef
	int choice
if BaboEventQuest.getstage() >= ConditionalStage
	choice = BaboDoorEscapeMessage.Show()
	if (choice == 0)
		if NextStageSwitch
			BaboEventQuest.setstage(NextStage)
		endif
		PlayerRef.moveto(RecoverMarker)
	endif
else
	choice = BaboDoorNotYetMessage.Show()
endif
endif
EndEvent

actor property PlayerRef auto
Quest property BaboEventQuest auto
ObjectReference property RecoverMarker auto
Message Property BaboDoorEscapeMessage  Auto  
Message Property BaboDoorNotYetMessage Auto  

Bool Property NextStageSwitch = false Auto
Int Property NextStage Auto

Int Property ConditionalStage Auto