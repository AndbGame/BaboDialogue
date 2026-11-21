Scriptname BaboEventAnimalCareMarkarthScript extends Quest  

BaboSceneManager property SceneManager Auto

Actorbase property BaboEventAnimalCareOwner Auto
Actorbase property BaboEventAnimalCareOwnerBoy Auto
Actorbase property BabolvlWolf Auto
Actorbase property BabolvlSkeever Auto
Actorbase property BabolvlDog Auto
Actorbase property BabolvlFox Auto

Quest Property BaboSexController Auto
Quest Property BaboEventAnimalCareMarkarth Auto
Quest Property BaboReputationScript Auto
GlobalVariable Property BaboAnimalCareMarkarthDialogueGlobal  Auto
GlobalVariable Property BaboAnimalCareMarkarthWanttoMatePlayerGlobal  Auto

GlobalVariable Property BaboGlobalDoggyWaifuTitle  Auto
GlobalVariable Property BaboAnimalCareMarkarthViolatedGlobal  Auto
GlobalVariable Property BaboEventAnimalCareMarkarthScenario  Auto

Actor Property PlayerRef Auto

ReferenceAlias Property CreatureRef Auto
ReferenceAlias Property OwnerRef Auto
ReferenceAlias Property SpawnMarkerOwner Auto
ReferenceAlias Property SpawnMarkerCreature Auto
Actor Property CreatureActor auto hidden


Faction Property PlayerFaction Auto
Faction Property CrimeFactionReach  Auto
Faction Property BaboFactionDoggyWaifuTitle  Auto
Faction Property PlayerPotentialAnimalFaction   Auto
Faction Property BaboPlayerAnimalFaction   Auto
Faction Property BaboEventAnimalCareOwnerFaction   Auto
Faction Property BaboAnimalOwnedFaction   Auto

ObjectReference Property BaboTalkingActivatorCreatureRef Auto
ObjectReference Property BaboMiscCellXmarker Auto

Message Property BaboAnimalCareMatemsg Auto
Message Property BaboAnimalCareChoiceMsg Auto
Message Property BaboAnimalCareMarkarthPetMsg Auto
Message Property BaboAnimalCareMarkarthPetS50Msg Auto
Message Property BaboAnimalCareOwnPetChoiceMsg Auto
Message Property BaboSkipMsg  Auto
Message Property BaboSkipGamepadMsg  Auto

Faction Property SLAX_AggressiveFaction Auto

LeveledItem Property BaboListAnimalCareReward Auto
LeveledItem Property BaboListAnimalCareRewardGrand Auto
MiscObject Property Gold001  Auto  
Idle Property IdleSearchBody Auto
Quest Property BaboAnimalCareAdopt Auto

Formlist Property BaboFavorCharmPotions Auto
Message Property BaboAnimalCareKillmsg Auto

int property HelpStageA = 5 auto hidden
int property KillStagePermit = 80 auto hidden
int property GoKillStagePermit = 120 auto hidden
int property GoKillStage = 110 auto hidden
int property GoKillStageByUnknown = 115 auto hidden

int property RescindStage = 210 auto hidden
int property OwnerKilledStageDetected = 245 auto hidden
int property OwnerKilledStage = 250 auto hidden
BaboMsgManager property MsgCtrl auto

bool PlayingAnimation


Function ResetVariables()
	BaboAnimalCareMarkarthWanttoMatePlayerGlobal.setvalue(0)
	BaboAnimalCareMarkarthViolatedGlobal.setvalue(0)
EndFunction

Function PlaceOwner()
	int randomi = Utility.randomint(0, 1)
	if randomi
		OwnerRef.forcerefto((SpawnMarkerOwner.Getreference()).placeatme(BaboEventAnimalCareOwner))
	else
		OwnerRef.forcerefto((SpawnMarkerOwner.Getreference()).placeatme(BaboEventAnimalCareOwnerBoy))
	endif
Endfunction

Function PlacePet(int ic)
	if ic == 0;skeever
		CreatureRef.forcerefto((SpawnMarkerCreature.Getreference()).placeatme(BabolvlSkeever))
	elseif ic == 1
		CreatureRef.forcerefto((SpawnMarkerCreature.Getreference()).placeatme(BabolvlDog))
	elseif ic == 2
		CreatureRef.forcerefto((SpawnMarkerCreature.Getreference()).placeatme(BabolvlFox))
	elseif ic == 3
		CreatureRef.forcerefto((SpawnMarkerCreature.Getreference()).placeatme(BabolvlWolf))
	endif
EndFunction

Function Initial()
	CreatureArousal()
	BaboAnimalCareMarkarthWanttoMatePlayerGlobal.setvalue(0)
	BaboAnimalCareMarkarthViolatedGlobal.setvalue(0)
	Debug.sendanimationevent((CreatureRef.getreference() as actor), "CanineRelaxIdle")
EndFunction

Function SetTimer(float ftime)
	RegisterForSingleUpdateGameTime(ftime)
EndFunction

Function OffTimer()
	UnRegisterForUpdateGameTime()
EndFunction
	
Event OnUpdateGameTime()
	int istage = BaboEventAnimalCareMarkarth.getstage()
	int imatevariable = BaboAnimalCareMarkarthWanttoMatePlayerGlobal.getvalue() as int
	int ivariable = BaboAnimalCareMarkarthDialogueGlobal.getvalue() as int
	if (CreatureRef.getreference() as actor).Is3DLoaded() && (OwnerRef.getreference() as actor).Is3DLoaded()
		SetTimer(1.0)
		return
	elseif  (CreatureRef.getreference() as actor).Is3DLoaded() && !(OwnerRef.getreference() as actor).Is3DLoaded();You are a thief! istage >= 50 && istage <= 55
		(BaboSexController as BaboSexControllerManager).ReputationDecrease(30, 10)
		CrimeFactionReach.modcrimegold(3000)
		StealPet()
		MsgCtrl.AnimalCareEventMessagebox(14)
		BaboEventAnimalCareMarkarth.setstage(255)
	elseif istage == 5; You are supposed to examine
		(BaboSexController as BaboSexControllerManager).ReputationDecrease(5, 0)
	elseif istage == 10; The creature violated player
		(BaboSexController as BaboSexControllerManager).ReputationBitchCreature(5)
		(BaboSexController as BaboSexControllerManager).ReputationDecrease(5, 0)
	elseif istage == 16; The owner is looking for another dog
		(BaboSexController as BaboSexControllerManager).ReputationDecrease(3, 0)
	elseif istage == 17; You are supposed to bring him a potion.
		(BaboSexController as BaboSexControllerManager).ReputationRatioModify(0.9)

	elseif istage == 20
		if ivariable == 1
			;Nothing
		elseif ivariable == 2 || ivariable == 4
			(BaboSexController as BaboSexControllerManager).ReputationRatioModify(0.9)
		elseif ivariable == 3; Not gonna help
			if imatevariable == 0 || BaboEventAnimalCareMarkarthScenario.getvalue() == 2
				(BaboSexController as BaboSexControllerManager).ReputationIncrease(3, 0)
			elseif imatevariable == 1
				(BaboSexController as BaboSexControllerManager).ReputationDecrease(5, 0)
			elseif imatevariable == 2
				(BaboSexController as BaboSexControllerManager).ReputationRatioModify(0.9)
			endif
		elseif ivariable == 5; Get Partner
			(BaboSexController as BaboSexControllerManager).ReputationDecrease(3, 0)
		endif
	elseif istage == 40; You left him for good
		if ivariable;mad
			if imatevariable == 0
				(BaboSexController as BaboSexControllerManager).ReputationRatioModify(0.9)
			elseif imatevariable == 1
				(BaboSexController as BaboSexControllerManager).ReputationDecrease(5, 0)
			endif
		endif

	elseif istage == 60 || istage == 61; You abandoned pet
		(BaboSexController as BaboSexControllerManager).ReputationRatioModify(0.9)
	elseif istage >= 65 && istage < 70; You gave potion
		(BaboSexController as BaboSexControllerManager).ReputationIncrease(20, 20)
		(BaboSexController as BaboSexControllerManager).ReputationBitchRatioModify(0.9)
	elseif istage == 100; You bought a pet
		(BaboSexController as BaboSexControllerManager).ReputationIncrease(15, 10)
	elseif istage == 150; You had sex
		if (CreatureRef.getreference() as actor).getfactionrank(BaboEventAnimalCareOwnerFaction) == 0
			if (OwnerRef.getreference() as actor).getactorbase() == BaboEventAnimalCareOwnerBoy
				(BaboSexController as BaboSexControllerManager).ReputationIncrease(10, 5)
			else
				(BaboSexController as BaboSexControllerManager).ReputationIncrease(5, 5)
			endif
		else
			(BaboSexController as BaboSexControllerManager).ReputationIncrease(0, 5);He witnessed.
			(BaboSexController as BaboSexControllerManager).ReputationBitchCreature(10)
		endif
	elseif istage == 160; You take the pet
		(BaboSexController as BaboSexControllerManager).ReputationIncrease(5, 10)
	elseif istage == RescindStage; You rescind
		(BaboSexController as BaboSexControllerManager).ReputationDecrease(10, 0)
		
	elseif istage == OwnerKilledStageDetected; 245 You killed the owner and detected
		(BaboSexController as BaboSexControllerManager).ReputationDecrease(10, 0)
	elseif istage == OwnerKilledStage; 250 The owner killed
		;Nothing
	elseif istage == 255
		BaboEventAnimalCareMarkarth.stop()
	elseif (CreatureRef.getreference() as actor).Is3DLoaded() && !(OwnerRef.getreference() as actor).Is3DLoaded()
		(BaboSexController as BaboSexControllerManager).ReputationDecrease(30, 10)
		CrimeFactionReach.modcrimegold(3000)
		MsgCtrl.AnimalCareEventMessagebox(6)
		;You are a thief!
	else
		(BaboSexController as BaboSexControllerManager).ReputationDecrease(10, 0)
	endif
	
	if BaboEventAnimalCareMarkarth.getstage() == 255
		BaboEventAnimalCareMarkarth.stop()
	else
		BaboEventAnimalCareMarkarth.setstage(255)
		BaboEventAnimalCareMarkarth.stop()
	endif
EndEvent

Function GivePotion(actor akactor)
	If akactor.ShowGiftMenu(True, BaboFavorCharmPotions) > 0
		BaboEventAnimalCareMarkarth.setstage(65)
	endif
EndFunction

Function ShowChoiceMsg()
	int choice = BaboAnimalCareChoiceMsg.show()
	if choice == 0
		BaboAnimalCareMarkarthDialogueGlobal.setvalue(2)
	elseif choice == 1
		BaboAnimalCareMarkarthDialogueGlobal.setvalue(3)
	elseif choice == 2
		BaboAnimalCareMarkarthDialogueGlobal.setvalue(4)
	endif
	BaboEventAnimalCareMarkarth.setstage(20)
EndFunction

Function CreatureBlockState(Bool Block)
	;AnimalCareCreatureAlias.SetCreatureBlockState(Block)
	(CreatureRef as BaboEventAnimalCareMarkarthAlias).SetCreatureBlockState(Block)
EndFunction

Function ScenePlay(int i)
	SceneManager.EventAnimalCareMarkarthScenePlay(i, true)
endfunction

int Function RollRChance(actor akactor)
	return (BaboSexController as BaboSexControllerManager).RollRapeChance(akactor, 0)
EndFunction

Function PetTalk()
actor akcreature = CreatureRef.getreference() as actor
int choice
int irank = akcreature.getfactionrank(SLAX_AggressiveFaction)
	if BaboEventAnimalCareMarkarth.getstage() == HelpStageA;5
		if BaboAnimalCareMarkarthDialogueGlobal.getvalue() == 2;kill
			choice = BaboAnimalCareKillmsg.show()
			if choice == 0
				PetKillMotion(PlayerRef);killmove
			endif
		elseif BaboAnimalCareMarkarthDialogueGlobal.getvalue() == 4;mate
			choice = BaboAnimalCareMatemsg.show()
			if choice == 0
				BaboEventAnimalCareMarkarth.setstage(50)
			endif
		else
			choice = BaboAnimalCareMarkarthPetMsg.show()
			if choice == 0;Inspect if this creature is after human or not.
				
				if irank == 2 || irank == 3
					(BaboSexController as BaboSexControllerManager).PairedMotionCreature(akcreature, playerref, 1, "canine", true, true)
					PlayingAnimation = true
					BaboAnimalCareMarkarthWanttoMatePlayerGlobal.setvalue(1);interested
				elseif irank == 4
					(BaboSexController as BaboSexControllerManager).PairedMotionCreature(akcreature, playerref, 2, "canine", true, true)
					PlayingAnimation = true
					BaboAnimalCareMarkarthWanttoMatePlayerGlobal.setvalue(2);want sex
				else
					if (BaboSexController as BaboSexControllerManager).NudeCalc(PlayerRef) > 30
						akcreature.setfactionrank(SLAX_AggressiveFaction, 2)
						(BaboSexController as BaboSexControllerManager).PairedMotionCreature(akcreature, playerref, 1, "canine", true, true)
						PlayingAnimation = true
						BaboAnimalCareMarkarthWanttoMatePlayerGlobal.setvalue(1)
					else
						PlayerRef.playidle(IdleSearchBody)
						BaboAnimalCareMarkarthWanttoMatePlayerGlobal.setvalue(0)
						;Utility.wait(3.0)
						;Debug.sendanimationevent(PlayerRef, "IdleForceDefaultState")
					endif
				endif
				UpdateKeyRegistery(true)
				Utility.wait(3.0)
				if Game.UsingGamepad()
					BaboSkipGamepadMsg.ShowAsHelpMessage("", 5, 30, 3)
				else
					BaboSkipMsg.ShowAsHelpMessage("", 5, 30, 3)
				endif
			elseif choice == 1
				choice = BaboAnimalCareKillmsg.show()
				if choice == 0
					PetKillMotion(PlayerRef);killmove
				endif
			elseif choice == 2
				choice = BaboAnimalCareMatemsg.show()
				if choice == 0
					BaboEventAnimalCareMarkarth.setstage(50)
				endif
			endif
		endif
	elseif BaboEventAnimalCareMarkarth.getstage() == 15
		MsgCtrl.AnimalCareMarkarthEventMessagebox(9)
	elseif BaboEventAnimalCareMarkarth.getstage() == 20
		if BaboAnimalCareMarkarthDialogueGlobal.getvalue() == 2;potion
			MsgCtrl.AnimalCareMarkarthEventMessagebox(10)
		elseif BaboAnimalCareMarkarthDialogueGlobal.getvalue() == 3;Leave
			MsgCtrl.AnimalCareMarkarthEventMessagebox(12)
		elseif BaboAnimalCareMarkarthDialogueGlobal.getvalue() == 4;mate
			choice = BaboAnimalCareMatemsg.show()
			if choice == 0
				BaboEventAnimalCareMarkarth.setstage(50)
			endif
		else
			return
		endif
	elseif BaboEventAnimalCareMarkarth.getstage() == KillStagePermit
		PetKillMotion(PlayerRef);killmove
	elseif BaboEventAnimalCareMarkarth.getstage() == 158;The owner gave up the pet
		choice = BaboAnimalCareOwnPetChoiceMsg.show()
		if choice == 0
			OwnPet()
		endif

	endif
EndFunction

Function CreatureArousal()
	actor akcreature = CreatureRef.getreference() as actor
	int randomi = Utility.randomint(0, 100); if 60~80 not after human, if over 80 after human
	if randomi < 20
		akcreature.setfactionrank(SLAX_AggressiveFaction, 0)
	elseif randomi < 40
		akcreature.setfactionrank(SLAX_AggressiveFaction, 1)
	elseif randomi < 60
		akcreature.setfactionrank(SLAX_AggressiveFaction, 2)
	elseif randomi < 80
		akcreature.setfactionrank(SLAX_AggressiveFaction, 3)
	else
		akcreature.setfactionrank(SLAX_AggressiveFaction, 4)
	endif
	(BaboSexController as BaboSexControllerManager).SetSLAArousal(CreatureRef.getreference() as actor, randomi)
EndFunction

bool Function PetKillMotion(actor akactor)
	bool bresult
	Idle TheKillmove
	actor akcreature = CreatureRef.getreference() as actor
	idle[] kiillmovearray = (BaboSexController as BaboSexControllerManager).WolfKillMove()
	Int WeaponType = akactor.GetEquippedItemType(1)
	If ((WeaponType == 1) || (WeaponType == 2))
		TheKillmove = kiillmovearray[1]
	Elseif ((WeaponType == 3) || (WeaponType == 4))
		TheKillmove = kiillmovearray[2]
	Elseif ((WeaponType == 5) || (WeaponType == 6))
		TheKillmove = kiillmovearray[0]
	Else
		if akactor == playerRef
			MsgCtrl.AnimalCareEventMessagebox(15)
		endif
		bresult = false
	Endif
	
	if !akactor.IsWeaponDrawn()
		akactor.DrawWeapon()
		Utility.wait(1.0)
	endif
	
	if akactor == playerRef
		(BaboSexController as BaboSexControllerManager).ActorChallengeStart(akcreature);The target needs to start combat against Player because of compatibility with combat mods.
	else
		(BaboSexController as BaboSexControllerManager).NPCChallengeStart(CreatureRef, OwnerRef)
	endif
	
	If akactor.PlayIdleWithTarget(TheKillmove, akcreature)
		PetKill(akactor)
		bresult = true
	else
		bresult = false
	Endif
	Utility.wait(2.0)
	if akactor == playerRef
		(BaboSexController as BaboSexControllerManager).pacifyAlias(CreatureRef)
	else
		(BaboSexController as BaboSexControllerManager).NPCpacifyAlias(CreatureRef, OwnerRef)
	endif
	return bresult
EndFunction

Function PetKill(actor akactor)
	(CreatureRef.getreference() as actor).killsilent(akactor)
EndFunction

Function OnPetDied(Actor akKiller)
	if BaboEventAnimalCareMarkarth.getstage() >= OwnerKilledStageDetected
		return
	endif
	if akKiller == PlayerRef && PlayerRef.IsDetectedBy((OwnerRef.getreference() as actor))
		if BaboEventAnimalCareMarkarth.GetStage() <= HelpStageA;5
			if BaboAnimalCareMarkarthDialogueGlobal.getvalue() == 2
				BaboEventAnimalCareMarkarth.setstage(GoKillStagePermit)
			else
				BaboEventAnimalCareMarkarth.setstage(GoKillStage)
			endif
		elseif BaboEventAnimalCareMarkarth.GetStage() == KillStagePermit;80
			BaboEventAnimalCareMarkarth.setstage(GoKillStagePermit)
		else
			BaboEventAnimalCareMarkarth.setstage(GoKillStage)
		endif
	elseif akKiller == (OwnerRef.getreference() as actor)
		;Nothing
	else
		BaboEventAnimalCareMarkarth.setstage(GoKillStageByUnknown)
	endif
EndFunction

Function OnOwnerDied(Actor akKiller)
	if akKiller == PlayerRef && PlayerRef.IsDetectedBy((CreatureRef.getreference() as actor))
		BaboEventAnimalCareMarkarth.setstage(OwnerKilledStageDetected)
	else
		BaboEventAnimalCareMarkarth.setstage(OwnerKilledStage)
	endif
EndFunction

Function PetDied()
	(BaboSexController as BaboSexControllerManager).ReputationDecrease(15, 0)
	CrimeFactionReach.modcrimegold(150)
EndFunction

Function PetDiedPermit()
	(BaboSexController as BaboSexControllerManager).ReputationDecrease(5, 0)
	(BaboSexController as BaboSexControllerManager).ReputationBitchDecrease(10)
EndFunction

Function CanineAssault()
	(BaboSexController as BaboSexControllerManager).DefineStruggleActor(CreatureRef)
	(BaboSexController as BaboSexControllerManager).gotostate("BaboEventAnimalCareMarkarthState")
	;(BaboSexController as BaboSexControllerManager).
EndFunction

Bool Function RouletteAssault(int ichance)
	int chance = (BaboSexController as BaboSexControllerManager).CalcPlayerAttractiveness()
	
	if chance >= ichance
		CanineAssault()
		return true
	else
		return false
	endif
EndFunction

Function GetViolated(Bool NextScene, String EventRegisterDummy, String EventName, Bool Rape)
	(BaboSexController as BaboSexControllerManager).SexCustomActorTag(PlayerRef, CreatureRef.getreference() as actor, None, None, None, "CF", "Aggressive", NextScene, EventRegisterDummy, EventName, Rape)
EndFunction

Function AddTitle()
	(BaboReputationScript as BaboReputationMasterScript).AddingTitletoPlayerRef(BaboFactionDoggyWaifuTitle)
	(BaboReputationScript as BaboReputationMasterScript).SetTitleGlobal(BaboGlobalDoggyWaifuTitle, 1)
EndFunction

Function StealPet()
	CreatureActor = CreatureRef.getreference() as actor
	if (BaboAnimalCareAdopt as BaboAnimalCareConfig).TakePet(CreatureActor, 0)
		CreatureActor.addtofaction(BaboPlayerAnimalFaction)
		CreatureActor.SetFactionRank(BaboAnimalOwnedFaction, 0)
		CreatureActor.SetFactionOwner(PlayerFaction)
		CreatureRef.clear()
	endif
EndFunction

Function OwnPet()
	CreatureActor = CreatureRef.getreference() as actor
	if (BaboAnimalCareAdopt as BaboAnimalCareConfig).TakePet(CreatureActor, 0)
		CreatureActor.addtofaction(BaboPlayerAnimalFaction)
		CreatureActor.SetFactionRank(BaboAnimalOwnedFaction, 0)
		CreatureActor.SetFactionOwner(PlayerFaction)
		CreatureRef.clear()
		BaboEventAnimalCareMarkarth.setstage(165)
	else
		BaboEventAnimalCareMarkarth.setstage(166);Abandoned
	endif
EndFunction

Function TakeCarePet()
	CreatureActor = CreatureRef.getreference() as actor
	if (BaboAnimalCareAdopt as BaboAnimalCareConfig).TakePet(CreatureActor, 7)
		CreatureActor.addtofaction(BaboPlayerAnimalFaction)
		CreatureActor.SetFactionRank(BaboAnimalOwnedFaction, 1)
		CreatureRef.clear()
		BaboEventAnimalCareMarkarth.setstage(160)
	else
		BaboEventAnimalCareMarkarth.setstage(61)
	endif
EndFunction

Function MatewithPet()
	Actor akcreature = CreatureRef.getreference() as actor
	int irank = akcreature.getfactionrank(SLAX_AggressiveFaction)
	String SexTag01
	String SexTag02
	if irank == 2
		SexTag01 = "Anal"
		SexTag02 = "CF"
	elseif irank == 3
		SexTag01 = "Aggressive"
		SexTag02 = "Anal"
	elseif irank == 4
		SexTag01 = "Aggressive"
		SexTag02 = "Vaginal"
	else
		SexTag01 = "Oral"
		SexTag02 = "CF"
	endif
	
	(BaboSexController as BaboSexControllerManager).SexCustomActor(PlayerRef, akcreature, None, None, None, SexTag01, SexTag02, None, true, "AnimalCareEventMarkarthAS", "AnimalCareEventMarkarthAfterSex", false)
	(BaboSexController as BaboSexControllerManager).SpectatorWOEnemyActivate(PlayerRef, None)
	ScenePlay(2)
EndFunction

Function Reward(actor akactor)
	if akactor.getactorbase() == BaboEventAnimalCareOwnerBoy
		PlayerRef.additem(BaboListAnimalCareReward, 1)
		PlayerRef.additem(gold001, 30)
	else
		PlayerRef.additem(BaboListAnimalCareRewardGrand, 2)
		PlayerRef.additem(gold001, 500)
	endif
EndFunction

Function PayFemalePet(int ivalue, actor akTarget = none)
	PlayerRef.removeitem(gold001, ivalue, false, akTarget)
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

Event OnKeyDown( int keyCode )
	If (!Utility.IsInMenuMode())
		If (0x12 == keyCode || 0x114 == keyCode)
			if PlayingAnimation
				(BaboSexController as BaboSexControllerManager).PairedMotionCreature(CreatureRef.getreference() as actor, playerref, 0, "", false, true)
			else
				(BaboSexController as BaboSexControllerManager).SimpleAnmSequence(CreatureRef.getreference() as actor, playerref, "ReturnToDefault", "IdleForceDefaultState")
			endif
			if BaboEventAnimalCareMarkarth.getstage() == 5
				BaboEventAnimalCareMarkarth.setstage(15)
			endif
		endif
	EndIf
EndEvent