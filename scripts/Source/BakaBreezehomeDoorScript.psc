Scriptname BakaBreezehomeDoorScript extends ObjectReference  

Event Onactivate(ObjectReference akActionRef)
if akActionRef == PlayerRef
	int choice
	if BaboEventWhiterunOrcVisitiors.getstage() < ConditionalStageA
		choice = BaboWhiterunBreezehomeDoorMessage.Show()
	else
		choice = BaboWhiterunBreezehomeDoorLeaveMessage.Show()
		if (choice == 0);Leave
			PlayerRef.moveto(BaboWhiterunBreezehomeEntrance)
			(BaboEventWhiterunOrcVisitiors as BaboEventWhiterunOrcVisitorsScript).DoorSwitch(false)
			(BaboEventWhiterunOrcVisitiors as BaboEventWhiterunOrcVisitorsScript).ActorinDefaultPlace()
		elseif (choice == 1);Waitforhelp
			if (BaboEventWhiterunOrcVisitiors as BaboEventWhiterunOrcVisitorsScript).waitforhelp()
				GotoState("Doonce")
			endif
		else
			;Nothing
		endif
	endif
endif
EndEvent

Function RearemTrigger()

EndFunction


State Doonce

Event Onactivate(ObjectReference akActionRef)
if akActionRef == PlayerRef
	int choice
	choice = BaboWhiterunBreezehomeDoorLeaveMessage.Show()
	if (choice == 0);Leave
		PlayerRef.moveto(BaboWhiterunBreezehomeEntrance)
		(BaboEventWhiterunOrcVisitiors as BaboEventWhiterunOrcVisitorsScript).ActorinDefaultPlace()
		(BaboEventWhiterunOrcVisitiors as BaboEventWhiterunOrcVisitorsScript).DoorSwitch(false)
		GotoState("")
	elseif (choice == 1);Waitforhelp
		(BaboEventWhiterunOrcVisitiors as BaboEventWhiterunOrcVisitorsScript).Messagebox(15)
	else
		;Nothing
	endif
endif
EndEvent

Function RearemTrigger()
	Gotostate("")
EndFunction

Endstate

actor property PlayerRef auto
Quest property BaboEventWhiterunOrcVisitiors auto
ObjectReference property BaboWhiterunBreezehomeEntrance auto
Message Property BaboWhiterunBreezehomeDoorMessage  Auto  
Message Property BaboWhiterunBreezehomeDoorLeaveMessage Auto  

Int Property ConditionalStageA Auto ;70