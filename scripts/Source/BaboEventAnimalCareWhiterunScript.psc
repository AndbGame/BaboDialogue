Scriptname BaboEventAnimalCareWhiterunScript extends Quest  

Message Property BaboAnimalCareCheckup  Auto  
Message Property BaboAnimalCareCheckupDone  Auto  
Message Property BaboAnimalCareDiagnosis01  Auto  
Message Property BaboAnimalCareDiagnosis02  Auto
Message Property BaboAnimalCareDiagnosis03A  Auto
Message Property BaboAnimalCareDiagnosis03B  Auto
Message Property BaboSkipMsg  Auto
Message Property BaboSkipGamepadMsg  Auto

Quest Property BaboSexController Auto
Quest Property BaboEventAnimalCare Auto
Quest Property BaboReputationScript Auto
GlobalVariable Property BaboAnimalCareWanttoMatePlayerGlobal  Auto
GlobalVariable Property BaboAnimalCareOwnerOfferedGlobal  Auto
GlobalVariable Property BaboGlobalStallionSkewerTitle  Auto
int MolestedStack
int ChoiceMask
int property ChoiceA		= 0x01 autoreadonly hidden
int property ChoiceB		= 0x02 autoreadonly hidden
int property ChoiceC		= 0x04 autoreadonly hidden
Actor Property PlayerRef Auto
ReferenceAlias Property CreatureRef Auto
ReferenceAlias Property OwnerRef Auto
Bool Property PlayingAnimation Auto hidden
Actor Property CreatureActor auto hidden
Idle Property HorseIdleRearUp Auto
Faction Property PlayerHorseFaction Auto
Faction Property BaboPlayerHorseFaction Auto
Faction Property PlayerFaction Auto
Faction Property CrimeFactionWhiterun  Auto
Faction Property BaboFactionStallionSkewerTitle  Auto

ObjectReference Property BaboTalkingActivatorCreatureRef Auto
ObjectReference Property BaboMiscCellXmarker Auto

Function ResetVariables()
	ChoiceMask = 0
	BaboTalkingActivatorCreatureRef.moveto(BaboMiscCellXmarker)
EndFunction

Function Initial()
	MolestedStack = 0
	HorseArousal()
	BaboAnimalCareOwnerOfferedGlobal.setvalue(0)
	BaboAnimalCareWanttoMatePlayerGlobal.setvalue(0)
EndFunction

Function SetTimer(float ftime)
	RegisterForSingleUpdateGameTime(ftime)
EndFunction

Function OffTimer()
	UnRegisterForUpdateGameTime()
EndFunction
	
Event OnUpdateGameTime()
	if (CreatureRef.getreference() as actor).Is3DLoaded() && (OwnerRef.getreference() as actor).Is3DLoaded()
		SetTimer(1.0)
	elseif BaboEventAnimalCare.getstage() < 20 || BaboEventAnimalCare.getstage() >= 100
		BaboEventAnimalCare.setstage(255)
	elseif (CreatureRef.getreference() as actor).Is3DLoaded() && !(OwnerRef.getreference() as actor).Is3DLoaded()
		(BaboSexController as BaboSexControllerManager).ReputationDecrease(30, 10)
		CrimeFactionWhiterun.modcrimegold(3000)
		MyHorse()
		(BaboSexController as BaboSexControllerManager).AnimalCareEventMessagebox(6)
		BaboEventAnimalCare.setstage(255)
		;You are a thief!
	else
		(BaboSexController as BaboSexControllerManager).ReputationDecrease(15, 0)
		(BaboSexController as BaboSexControllerManager).AnimalCareEventMessagebox(8)
		BaboEventAnimalCare.setstage(255)
		;reputation down
	endif
EndEvent

Function CreatureBlockState(Bool Block)
	(CreatureRef as BaboEventAnimalCareCreatureAlias).SetCreatureBlockState(Block)
EndFunction

Function HorseTalk()
	if BaboEventAnimalCare.getstage() >= 20 && BaboEventAnimalCare.getstage() < 25
		BaboTalkingActivatorCreatureRef.MoveTo(CreatureRef.getreference() as actor)
		BaboTalkingActivatorCreatureRef.Activate(PlayerRef)
	elseif BaboEventAnimalCare.getstage() == 25
		BaboEventAnimalCare.setstage(30);just in case
	elseif BaboEventAnimalCare.getstage() >= 40 && BaboEventAnimalCare.getstage() <= 42
		BaboTalkingActivatorCreatureRef.MoveTo(CreatureRef.getreference() as actor)
		BaboTalkingActivatorCreatureRef.Activate(PlayerRef)
	endif
EndFunction

Function HorseArousal()
	(BaboSexController as BaboSexControllerManager).SetSLAArousal(CreatureRef.getreference() as actor, 100)
EndFunction

Function HorseDied()
	(BaboSexController as BaboSexControllerManager).ReputationDecrease(30, 15)
	CrimeFactionWhiterun.modcrimegold(500)
	;BaboEventAnimalCare.setstage(255)
EndFunction

Function MyHorse()
CreatureActor = CreatureRef.getreference() as actor
CreatureActor.SetFactionRank(PlayerHorseFaction, 1)
CreatureActor.SetFactionRank(BaboPlayerHorseFaction, 1)
CreatureActor.SetFactionOwner(PlayerFaction)
;PlayersHorse.ForceRefTo(Alias_Horse.GetActorRef())
;game.IncrementStat( "Horses Owned" )
CreatureRef.clear()
EndFunction

Function AddTitle()
(BaboReputationScript as BaboReputationMasterScript).AddingTitletoPlayerRef(BaboFactionStallionSkewerTitle)
(BaboReputationScript as BaboReputationMasterScript).SetTitleGlobal(BaboGlobalStallionSkewerTitle, 1)
EndFunction

Function FinalInspection()
BaboTalkingActivatorCreatureRef.moveto(BaboMiscCellXmarker)
int choice = BaboAnimalCareDiagnosis01.Show()
	if (choice == 0)
		;Restoration End
		BaboEventAnimalCare.setstage(50)
	else
		choice = BaboAnimalCareDiagnosis02.Show()
		if (choice == 0)
			;Alchemy End
			BaboEventAnimalCare.setstage(55)
		else
			if BaboAnimalCareWanttoMatePlayerGlobal.getvalue() >= 2
				choice = BaboAnimalCareDiagnosis03A.Show()
				if (choice == 0)
					BaboEventAnimalCare.setstage(40)
				endif
			else
				choice = BaboAnimalCareDiagnosis03B.Show()
				if (choice == 0)
					BaboEventAnimalCare.setstage(60)
				elseif (choice == 1)
					BaboEventAnimalCare.setstage(40)
				endif
			endif
		endif
	endif

EndFunction

Function InspectHorse()
BaboTalkingActivatorCreatureRef.moveto(BaboMiscCellXmarker)
int choice = BaboAnimalCareCheckup.Show()
CreatureActor = CreatureRef.getreference() as actor
int chance = (BaboSexController as BaboSexControllerManager).CalcPlayerAttractiveness()
UpdateKeyRegistery(true)
	
	if BaboEventAnimalCare.getstage() == 25
		FinalInspection()
		return
	endif
	
	if (choice == 0)
		if ChoiceA == Math.LogicalAnd(ChoiceMask, ChoiceA)
			BaboAnimalCareCheckupDone.show()
		else
			ChoiceMask = Math.LogicalOr(ChoiceMask, ChoiceA)
			(BaboSexController as BaboSexControllerManager).FadeinScene(false)
			PlayingAnimation = true
			if chance < 100
				;(BaboSexController as BaboSexControllerManager).RemoveHeelEffect(PlayerRef)
				(BaboSexController as BaboSexControllerManager).PairedMotionCreature(CreatureActor, playerref, 1, "horse", true, true)
				BaboEventAnimalCare.setstage(22)
				(BaboSexController as BaboSexControllerManager).FadeOutScene(false)
			else
				;(BaboSexController as BaboSexControllerManager).RemoveHeelEffect(PlayerRef)
				(BaboSexController as BaboSexControllerManager).PairedMotionCreature(CreatureActor, playerref, 3, "horse", true, true)
				MolestedStack += 1
				BaboAnimalCareWanttoMatePlayerGlobal.setvalue(MolestedStack)
				BaboEventAnimalCare.setstage(22)
				(BaboSexController as BaboSexControllerManager).FadeOutScene(false)
				if playerref.WaitForAnimationEvent("BaboSoothingHorseFrontFailLoop")
					;(BaboSexController as BaboSexControllerManager).SimpleAnmSequence(CreatureActor, playerref, "SoothingHorseFrontFailLoop", "BaboSoothingHorseFrontFailLoop")
					Debug.sendanimationevent(CreatureActor, "SoothingHorseFrontFailLoop")
				endif
				
			endif

			Utility.wait(3.0)
			if Game.UsingGamepad()
				BaboSkipGamepadMsg.ShowAsHelpMessage("", 5, 30, 3)
			else
				BaboSkipMsg.ShowAsHelpMessage("", 5, 30, 3)
			endif
			
			if ChoiceA + ChoiceB == Math.LogicalAnd(ChoiceMask, ChoiceA + ChoiceB)
				BaboEventAnimalCare.setstage(25)
			endif
		endif
	elseif (choice == 1)
		if ChoiceB == Math.LogicalAnd(ChoiceMask, ChoiceB)
			BaboAnimalCareCheckupDone.show()
		else
			ChoiceMask = Math.LogicalOr(ChoiceMask, ChoiceB)
			(BaboSexController as BaboSexControllerManager).FadeinScene(false)
			PlayingAnimation = true
			if chance < 100
				;(BaboSexController as BaboSexControllerManager).RemoveHeelEffect(PlayerRef)
				(BaboSexController as BaboSexControllerManager).PairedMotionCreature(CreatureActor, playerref, 2, "horse", true, true)
				BaboEventAnimalCare.setstage(23)
				(BaboSexController as BaboSexControllerManager).FadeOutScene(false)
			else
				;(BaboSexController as BaboSexControllerManager).RemoveHeelEffect(PlayerRef)
				(BaboSexController as BaboSexControllerManager).PairedMotionCreature(CreatureActor, playerref, 4, "horse", true, true)
				MolestedStack += 1
				BaboAnimalCareWanttoMatePlayerGlobal.setvalue(MolestedStack)
				BaboEventAnimalCare.setstage(23)
				(BaboSexController as BaboSexControllerManager).FadeOutScene(false)
				if playerref.WaitForAnimationEvent("BaboSoothingHorseFlankFailLoop")
					;(BaboSexController as BaboSexControllerManager).SimpleAnmSequence(CreatureActor, playerref, "SoothingHorseFlankFailLoop", "BaboSoothingHorseFlankFailLoop")
					Debug.sendanimationevent(CreatureActor, "SoothingHorseFlankFailLoop");For some reason, sequence animation doesn't work for horse
				endif
					
			endif

			Utility.wait(3.0)
			if Game.UsingGamepad()
				BaboSkipGamepadMsg.ShowAsHelpMessage("", 5, 30, 3)
			else
				BaboSkipMsg.ShowAsHelpMessage("", 5, 30, 3)
			endif
			
			if ChoiceA + ChoiceB == Math.LogicalAnd(ChoiceMask, ChoiceA + ChoiceB)
				BaboEventAnimalCare.setstage(25)
			endif
			
		endif
	else
		Return
	endif

EndFunction

Function MatewithHorse(String SexTag)
	Actor HorseActor = CreatureRef.getreference() as actor
	(BaboSexController as BaboSexControllerManager).SexCustomActor(PlayerRef, HorseActor, None, None, None, SexTag, None, None, true, "AnimalCareEventAS", "AnimalCareEventAfterSex", false)
	(BaboSexController as BaboSexControllerManager).SpectatorWOEnemyActivate(PlayerRef, None)
EndFunction

Function UpdateKeyRegistery(bool register)
	If register
		if Game.UsingGamepad()
			RegisterForKey(0x114); A Button
		else
			RegisterForKey(0x12)
		endif
	else
		UnregisterForKey(0x12)
		UnregisterForKey(0x114)
	EndIf
EndFunction

Function QuitInspectHorse()
	UpdateKeyRegistery(false)
	PlayingAnimation = false
	(BaboSexController as BaboSexControllerManager).FadeinScene(false)
	(BaboSexController as BaboSexControllerManager).PairedMotionCreature(CreatureActor, playerref, 1, "horse", false, true)
	Utility.wait(3.0)
	;(BaboSexController as BaboSexControllerManager).ResetHeelEffect(PlayerRef)
	(BaboSexController as BaboSexControllerManager).SimpleAnmSequence(CreatureActor, playerref, "ReturnToDefault", "IdleForceDefaultState");WIP add FHU animaiton
	(BaboSexController as BaboSexControllerManager).FadeOutScene(false)
EndFunction

Event OnKeyDown( int keyCode )
	If (!Utility.IsInMenuMode())
		If (0x12 == keyCode || 0x114 == keyCode)
			if PlayingAnimation
				QuitInspectHorse()
				Utility.wait(3.0)
				if BaboEventAnimalCare.getstage() == 25
					BaboEventAnimalCare.setstage(30)
				endif
			endif
		endif
	EndIf
EndEvent