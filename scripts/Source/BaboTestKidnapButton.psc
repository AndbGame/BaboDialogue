Scriptname BaboTestKidnapButton extends ObjectReference  

Location Property BaboEventMorthalLocation Auto
ActorBase Property BaboEventChangeLoactaion07Traveller01 Auto
ActorBase Property BaboEventChangeLoactaion07Traveller02 Auto
Actor Property PlayerRef Auto
Keyword Property BaboKidnapKeyword Auto
Quest Property BaboKidnapEvent Auto
Referencealias Property TeleportMarker Auto

event onActivate(objectReference akActivator)
	Actor A1 = PlayerRef.PlaceActorAtMe(BaboEventChangeLoactaion07Traveller01, 4)
	Actor A2 = PlayerRef.PlaceActorAtMe(BaboEventChangeLoactaion07Traveller02, 4)
	Debug.notification("BaboEventKidnapTest")
	BaboKidnapKeyword.SendStoryEvent(BaboEventMorthalLocation, A1, A2)
	Utility.wait(7.0)
	(BaboKidnapEvent as BaboKidnapEvenScript).StartUptheEvent(1)
	Gotostate("Teleport")
endevent

State Teleport
event onActivate(objectReference akActivator)
	PlayerRef.moveto(TeleportMarker.getreference())
	Gotostate("")
endevent
EndState