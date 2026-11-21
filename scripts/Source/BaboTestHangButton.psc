Scriptname BaboTestHangButton extends ObjectReference  

Actor Property PlayerRef Auto
Actor akTest
Quest Property BaboSexController Auto
objectreference property BaboTestRef auto
Actorbase Property BaboDefeatedSlaveF Auto
Int Property inttest = 1 Auto
{0 = misc, 1 = baborope}

event onCellAttach()
	self.blockActivation(false)
endevent

event onActivate(objectReference akActivator)
	if akTest
		akTest.delete()
	endif
	if inttest == 1
		Debug.notification("Hanging Event Test")
		akTest = GetNthLinkedRef(0).placeactoratme(BaboDefeatedSlaveF)
		(BaboSexController as BaboSexControllerManager).HangingActor(akTest, BaboTestRef, True, false)
		gotostate("QR")
	else
		Debug.notification("Misc Event Test")
		akTest = GetNthLinkedRef(0).placeactoratme(BaboDefeatedSlaveF)
		(BaboTestRef as BaboChainUpsidePoleScript).TActor = akTest
		(BaboTestRef as BaboChainUpsidePoleScript).ActivateClutter()
	endif
endevent


State QR
event onActivate(objectReference akActivator)
	gotostate("")
	Debug.notification("BaboEventRearmtrigger")
endevent
EndState