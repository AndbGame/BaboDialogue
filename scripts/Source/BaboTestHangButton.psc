Scriptname BaboTestHangButton extends ObjectReference  

Actor Property PlayerRef Auto
Quest Property BaboSexController Auto
objectreference property BaboTestRopeRef auto


event onCellAttach()
	self.blockActivation(false)
endevent

event onActivate(objectReference akActivator)
	Debug.notification("Hanging Event Test")
	(BaboSexController as BaboSexControllerManager).HangingActor(PlayerRef, BaboTestRopeRef, True, False)
	gotostate("QR")
endevent


State QR
event onActivate(objectReference akActivator)
	gotostate("")
	Debug.notification("BaboEventRearmtrigger")
endevent
EndState