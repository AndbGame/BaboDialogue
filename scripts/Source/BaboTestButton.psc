Scriptname BaboTestButton extends ObjectReference  

location property myholdlocation auto
Keyword property WERoadStartCriminal Auto
Keyword property WEStartCriminal Auto
objectreference property BaboTestTriggerBoxRef auto

Quest property BaboEncounter01 auto
Quest property BaboEncounter02 auto
Quest property BaboEncounter03 auto
Quest property BaboEncounter04 auto
Quest property BaboEncounter05 auto
Quest property BaboEncounter06 auto
Quest property BaboEncounter07 auto
Quest property BaboEncounter08 auto
Quest property BaboEncounter09 auto
Quest property BaboEncounter10 auto
Quest property BaboEncounter11 auto
Quest property BaboEncounter12 auto
Quest property BaboEncounter13 auto
Quest property BaboChangeLocationEvent02 auto


event onCellAttach()
	self.blockActivation(false)
endevent

event onActivate(objectReference akActivator)
	Debug.notification("BaboEventrandomrunning")
	WERoadStartCriminal.SendStoryEvent(myHoldLocation, BaboTestTriggerBoxRef, none)
	gotostate("QR")
endevent

Function Stopallbaboquests()
	BaboEncounter01.stop()
	BaboEncounter02.stop()
	BaboEncounter03.stop()
	BaboEncounter04.stop()
	BaboEncounter05.stop()
	BaboEncounter06.stop()
	BaboEncounter07.stop()
	BaboEncounter08.stop()
	BaboEncounter09.stop()
	BaboEncounter10.stop()
	BaboEncounter11.stop()
	BaboEncounter12.stop()
	BaboEncounter13.stop()
	BaboChangeLocationEvent02.stop()
EndFunction

State QR
event onActivate(objectReference akActivator)
	Stopallbaboquests()
	(BaboTestTriggerBoxRef as WETriggerScript).ReArmTrigger()
	gotostate("")
	Debug.notification("BaboEventRearmtrigger")
endevent
EndState