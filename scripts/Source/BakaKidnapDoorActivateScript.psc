Scriptname BakaKidnapDoorActivateScript extends ObjectReference


Function LeavePlace()
int choice
if BaboKidnapEvent.getstage() >= ConditionalStage
	choice = BaboKidnapDoorEscapeMessage.Show()
	if (choice == 0)
		(BaboKidnapEvent as BaboKidnapEvenScript).MoveActortoPiont(PlayerRef, RecoverMarker)
		if NextStageSwitch
			if CumRemove
				(BaboSexController as BaboSexControllerManager).UnEquipCumItem(PlayerRef)
			endif
			BaboKidnapEvent.setstage(NextStage)
		endif
	endif
else
	choice = BaboKidnapDoorEscapeNotYetMessage.Show()
endif
EndFunction

Event OnLockStateChanged()
;if akActionRef == PlayerRef
if self.IsLocked()
	Gotostate("LockedState")
else
	Gotostate("UnlockedState")
	LeavePlace()
endif
EndEvent

Auto State LockedState

Event Onactivate(ObjectReference akActionRef)
if DontNeedLockPick
	LeavePlace()
endif
EndEvent

EndState

State UnlockedState

Event Onactivate(ObjectReference akActionRef)
	LeavePlace()
EndEvent

EndState




actor property PlayerRef auto
Quest property BaboKidnapEvent auto
Quest property BaboSexController auto
referencealias property RecoverMarker auto
Message Property BaboKidnapDoorEscapeMessage  Auto  
Message Property BaboKidnapDoorEscapeNotYetMessage Auto  

Bool Property DontNeedLockPick = False Auto
Bool Property CumRemove = true Auto
Bool Property NextStageSwitch = true Auto
Int Property NextStage Auto

Int Property ConditionalStage Auto