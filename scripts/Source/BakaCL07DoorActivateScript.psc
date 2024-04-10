Scriptname BakaCL07DoorActivateScript extends ObjectReference  

Event Onactivate(ObjectReference akActionRef)
if akActionRef == PlayerRef
	int choice
if BaboChangeLocationEvent07.getstage() >= ConditionalStage
	choice = BaboKidnapDoorEscapeMessage.Show()
	if (choice == 0)
		if NextStageSwitch
			if CumRemove
				(BaboSexController as BaboSexControllerManager).UnEquipCumItem(PlayerRef)
			endif
			BaboChangeLocationEvent07.setstage(NextStage)
		endif
		PlayerRef.moveto(RecoverMarker.getreference())
	endif
else
	choice = BaboKidnapDoorEscapeNotYetMessage.Show()
endif
endif
EndEvent

actor property PlayerRef auto
Quest property BaboChangeLocationEvent07 auto
Quest property BaboSexController auto
referencealias property RecoverMarker auto
Message Property BaboKidnapDoorEscapeMessage  Auto  
Message Property BaboKidnapDoorEscapeNotYetMessage Auto  

Bool Property CumRemove = true Auto
Bool Property NextStageSwitch = true Auto
Int Property NextStage Auto

Int Property ConditionalStage Auto