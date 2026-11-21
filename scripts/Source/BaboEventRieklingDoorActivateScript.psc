Scriptname BaboEventRieklingDoorActivateScript extends ReferenceAlias  


Function LeavePlace()
int choice
if BaboEventRieklingThirsk.getstage() >= ConditionalStage
	choice = BaboKidnapDoorEscapeMessage.Show()
	if (choice == 0)
		(BaboEventRieklingThirsk as BaboEventRiekling).BacktoHome()
	endif
else
	choice = BaboKidnapDoorEscapeNotYetMessage.Show()
endif
EndFunction

Event Onactivate(ObjectReference akActionRef)
	if akActionRef == PlayerRef
		LeavePlace()
	endif
EndEvent

Actor Property PlayerRef Auto
Quest property BaboEventRieklingThirsk auto
Message Property BaboKidnapDoorEscapeMessage  Auto  
Message Property BaboKidnapDoorEscapeNotYetMessage Auto  


Int Property ConditionalStage = 20 Auto
