Scriptname BakaDoortoGuardHouseScript extends ObjectReference  

Event Onactivate(ObjectReference akActionRef)
if akActionRef == PlayerRef
	int choice = BaboDoortoRandomGuardHouse.Show()
	if (choice == 0)
		BaboRescuePointKeyword.SendStoryEvent()
	endif
endif
EndEvent

actor property PlayerRef auto
Message Property BaboDoortoRandomGuardHouse  Auto
Keyword Property BaboRescuePointKeyword Auto