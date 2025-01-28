Scriptname BaboTestKidnapButton extends ObjectReference  

Location Property BaboEventMorthalLocation Auto
ActorBase Property BaboEventChangeLoactaion07Traveller01 Auto
ActorBase Property BaboEventChangeLoactaion07Traveller02 Auto
ActorBase Property BaboSlaverNobleNPC Auto
ActorBase Property BaboBigGuyOrcVisitor01 Auto
ActorBase Property BaboBigGuyOrcVisitor02 Auto
ActorBase Property BaboBigGuyOrcVisitor03 Auto
ActorBase Property BaboBigGuyOrc01 Auto
ActorBase Property BaboBigGuyOrc02 Auto
ActorBase Property BaboBigGuyOrc03 Auto
ActorBase Property BaboBigGuyOrc04 Auto
ActorBase Property BaboDefeatedSlaveFRestrained Auto
Actor Property PlayerRef Auto
Keyword Property BaboKidnapKeyword Auto
Keyword Property BaboKidnapCallKeyword Auto
Quest Property BaboKidnapEvent Auto
Quest Property BaboSexController Auto
Referencealias Property TeleportMarker Auto
Message Property BaboKidnapTestMsg Auto
Actor[] Property Kidnappers Auto Hidden
Faction Property SLAX_RapistFaction Auto

event onActivate(objectReference akActivator)
	int choice = BaboKidnapTestMsg.Show()
	int randomi
	if choice == 0
		Kidnappers = new actor[2]
		Kidnappers[0] = PlayerRef.PlaceActorAtMe(BaboEventChangeLoactaion07Traveller01, 4)
		Kidnappers[1] = PlayerRef.PlaceActorAtMe(BaboEventChangeLoactaion07Traveller02, 4)
		
		(BaboSexController as BaboSexControllerManager).SetRandomCharacterRank(Kidnappers[0])
		(BaboSexController as BaboSexControllerManager).SetRandomCharacterRank(Kidnappers[1])
		if (BaboSexController as BaboSexControllerManager).IsactorRapist(Kidnappers[0], 50, false)
			Kidnappers[1].addtofaction(SLAX_RapistFaction)
		endif
		
		if (BaboSexController as BaboSexControllerManager).KidnapQuestStart(Kidnappers[0], Kidnappers[1], 0, BaboEventMorthalLocation)
			(BaboKidnapEvent as BaboKidnapEvenScript).StartUptheEvent(1)
		endif
	elseif choice == 1
		Kidnappers = new actor[1]
		Kidnappers[0] = PlayerRef.PlaceActorAtMe(BaboSlaverNobleNPC, 4)
		(BaboSexController as BaboSexControllerManager).SetRandomCharacterRank(Kidnappers[0])
		randomi = Utility.randomint(4,7)
		if (BaboSexController as BaboSexControllerManager).KidnapQuestStart(Kidnappers[0], None, randomi, None)
			(BaboKidnapEvent as BaboKidnapEvenScript).StartUptheEvent(4)
		endif
	elseif choice == 2
		(BaboSexController as BaboSexControllerManager).FindSOSAddon()
		Kidnappers = new actor[10]
		Kidnappers[0] = PlayerRef.PlaceActorAtMe(BaboBigGuyOrcVisitor01, 4)
		Kidnappers[1] = PlayerRef.PlaceActorAtMe(BaboBigGuyOrcVisitor02, 4)
		Kidnappers[2] = PlayerRef.PlaceActorAtMe(BaboBigGuyOrcVisitor03, 4)
		Kidnappers[3] = PlayerRef.PlaceActorAtMe(BaboBigGuyOrc01, 4)
		Kidnappers[4] = PlayerRef.PlaceActorAtMe(BaboBigGuyOrc02, 4)
		Kidnappers[5] = PlayerRef.PlaceActorAtMe(BaboBigGuyOrc03, 4)
		Kidnappers[6] = PlayerRef.PlaceActorAtMe(BaboBigGuyOrc04, 4)
		Kidnappers[7] = PlayerRef.PlaceActorAtMe(BaboDefeatedSlaveFRestrained, 4)
		Kidnappers[8] = PlayerRef.PlaceActorAtMe(BaboDefeatedSlaveFRestrained, 4)
		Kidnappers[9] = PlayerRef.PlaceActorAtMe(BaboDefeatedSlaveFRestrained, 4)
		(BaboSexController as BaboSexControllerManager).SetRandomCharacterRank(Kidnappers[0])
		(BaboSexController as BaboSexControllerManager).SetRandomCharacterRank(Kidnappers[1])
		(BaboSexController as BaboSexControllerManager).SetRandomCharacterRank(Kidnappers[2])
		(BaboSexController as BaboSexControllerManager).SetRandomCharacterRank(Kidnappers[3])
		(BaboSexController as BaboSexControllerManager).SetRandomCharacterRank(Kidnappers[4])
		(BaboSexController as BaboSexControllerManager).SetRandomCharacterRank(Kidnappers[5])
		(BaboSexController as BaboSexControllerManager).SetRandomCharacterRank(Kidnappers[6])
		(BaboSexController as BaboSexControllerManager).AssignSchlong(Kidnappers[0], 6, true)
		(BaboSexController as BaboSexControllerManager).AssignSchlong(Kidnappers[1], 6, true)
		(BaboSexController as BaboSexControllerManager).AssignSchlong(Kidnappers[2], 6, true)
		(BaboSexController as BaboSexControllerManager).AssignSchlong(Kidnappers[3], 6, true)
		(BaboSexController as BaboSexControllerManager).AssignSchlong(Kidnappers[4], 6, true)
		(BaboSexController as BaboSexControllerManager).AssignSchlong(Kidnappers[5], 6, true)
		(BaboSexController as BaboSexControllerManager).AssignSchlong(Kidnappers[6], 6, true)
		randomi = Utility.randomint(11,13)
		if (BaboSexController as BaboSexControllerManager).KidnapQuestStart(Kidnappers[0], Kidnappers[1], randomi, None)
			(BaboKidnapEvent as BaboKidnapEvenScript).FillKidnapperActors(None, None, Kidnappers[2], Kidnappers[3], Kidnappers[4], Kidnappers[5], Kidnappers[6], None)
			(BaboKidnapEvent as BaboKidnapEvenScript).FillVictimActors(Kidnappers[7], Kidnappers[8], Kidnappers[9])
			(BaboKidnapEvent as BaboKidnapEvenScript).StartUptheEvent(10)
		endif
	elseif choice == 3
		BaboKidnapCallKeyword.SendStoryEvent()
	endif

	Utility.wait(7.0)
	Gotostate("Teleport")
endevent

State Teleport
event onActivate(objectReference akActivator)
	PlayerRef.moveto(TeleportMarker.getreference())
	Gotostate("")
endevent
EndState