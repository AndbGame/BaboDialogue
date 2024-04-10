Scriptname BaboDialogueHirelingsQuest extends Quest

Quest Property DialogueFollower Auto
Miscobject Property Gold001 Auto
Quest Property BaboDialogueHirelings Auto
GlobalVariable Property BaboPlayerFollowerCount Auto
GlobalVariable Property BaboHirelingBleedoutCountLimit Auto
GlobalVariable Property BaboTipHirelingGold Auto
GlobalVariable Property BaboEFF Auto
Faction Property BaboCurrentHireling Auto
Faction Property BaboPotentialHireling Auto
Faction Property PotentialHireling Auto
Faction Property BaboWasHireling Auto
ReferenceAlias Property PlayerAlias Auto
ReferenceAlias Property MercenaryRef Auto
ReferenceAlias property MercenaryAnimal Auto
ReferenceAlias Property WasMercenaryRef  Auto 
Int Property BleedoutStacks Auto
Message Property BaboFollowerMessageWait Auto
Message Property BaboFollowerDismissMessageWait Auto
Message Property BaboFollowerDismissMessage Auto
Message Property BaboFollowerDismissMessageRapeFailed Auto

Scene Property BaboDialogueHirelingsWasHirelingScene01 Auto
Scene Property BaboDialogueHirelingsWasHirelingScene02 Auto

FormList Property BaboBadRelationshipHirelingsList Auto
FormList Property BaboNPCRaperList Auto
FormList Property BaboNPCHadSexList Auto

Bool WasPotentialHireling

Actor Property PlayerRef Auto
Idle Property OrgasmAfter Auto
Quest Property BaboSexController Auto
GlobalVariable Property BaboNWS Auto


;Variable07
;1. Just a normal mercenary
;2. Opportunist
;3. Criminal

;Variable08
;0. Hire Quit
;1. After 3 days waiting for player, he will decide whether to chase after player either in a good intention or in a evil intention, we don't know.
;2. Sexlab Approach Redux integration part: he flirts player constantly.
;3. SLHH Activation
;4. Pissedoff


Function RegisterEvent()
	RegisterForModEvent("Babo_SLAPPMercenaryEvent", "BaboSLAPPMercenaryEvent")
	RegisterForSleep()
EndFunction

;Event OnSleepStart(Float afSleepStartTime, Float afDesiredSleepEndTime)
;
;EndEvent

Event OnSleepStop(bool abInterrupted)

;Scene Start

Endevent

Function Startthequest()
	if BaboDialogueHirelings.isrunning()
		Start()
	endif
EndFunction

Function FollowerWait()
	actor FollowerActor = MercenaryRef.GetActorRef() as Actor
	FollowerActor.SetAv("WaitingForPlayer", 1)
	FollowerActor.evaluatepackage()
	BaboFollowerMessageWait.Show()
	;BaboDialogueHirelings.setstage(15)
	;SetObjectiveDisplayed(10, abforce = true)
	;follower will wait 3 days
	MercenaryRef.RegisterForSingleUpdateGameTime(72)
EndFunction

Function FollowerAnimalWait()

actor FollowerAnimal = MercenaryAnimal.GetActorReference() as Actor

	FollowerAnimal.SetAv("WaitingForPlayer", 1)
	FollowerAnimal.evaluatepackage()
	BaboFollowerMessageWait.Show()
	BaboDialogueHirelings.setstage(16)
	MercenaryRef.RegisterForSingleUpdateGameTime(72)
EndFunction

Function FollowAgain()
	actor FollowerActor = MercenaryRef.GetActorRef() as Actor
	FollowerActor.SetAv("WaitingForPlayer", 0)
	FollowerActor.evaluatepackage()
	;BaboDialogueHirelings.setstage(20)
	MercenaryRef.UnregisterForUpdateGameTime()
EndFunction



Function SetFollower(Actor FollowerActor, Bool Seduction = false)

if MercenaryRef
	MercenaryRef.clear()
endif
String FollowerName = FollowerActor.getbaseobject().getname()
	FollowerActor.RemoveFromFaction(BaboPotentialHireling)
	if FollowerActor.isinfaction(PotentialHireling)
		FollowerActor.RemoveFromFaction(PotentialHireling)
		WasPotentialHireling = true
	endif
	FollowerActor.AddtoFaction(BaboCurrentHireling)
	If FollowerActor.GetRelationshipRank(Game.GetPlayer()) < 3 && FollowerActor.GetRelationshipRank(Game.GetPlayer()) >= 0
		FollowerActor.SetRelationshipRank(Game.GetPlayer(), 3)
	EndIf
	
	If BaboNWS.getvalue() == 1
		MiscObject nwsIgnoreToken = Game.GetFormFromFile(0x001CFC8D, "nwsFollowerFramework.esp") as MiscObject
		FollowerActor.additem(nwsIgnoreToken, 1)
		(DialogueFollower as DialogueFollowerScript).SetFollower(FollowerActor)
	Elseif BaboEFF.getvalue() == 1
		Quest EFFQuest = Quest.GetQuest("FollowerExtension")
		(EFFQuest as EFFCore).XFL_SetFollow(FollowerActor)
	Else
		(DialogueFollower as DialogueFollowerScript).SetFollower(FollowerActor);Register current hireling on the vanilla follower system.
	Endif

	;FollowerActor.SetPlayerTeammate()
	FollowerActor.SetActorValue("Morality", 0)
	MercenaryRef.ForceRefTo(FollowerActor)
	BaboPlayerFollowerCount.SetValue(1)
	
	int RandomChar = Utility.Randomint(1, 3) 
	
	if FollowerActor.isinfaction(BaboWasHireling)
		FollowerActor.removefromfaction(BaboWasHireling)
	else
		FollowerActor.setactorvalue("Variable07", RandomChar)
	endif
	
	;if BaboNPCRaperList.Hasform(FollowerActor)
	;	FollowerActor.setactorvalue("Variable07", 3)
	;endif

	FollowerActor.setactorvalue("Variable08", 2)
EndFunction

Function DismissFollower(Int iMessage = 0)
	actor DismissedFollowerActor = MercenaryRef.GetActorRef() as Actor
	If BaboEFF.getvalue() == 1
		Quest EFFQuest = Quest.GetQuest("FollowerExtension")
		(EFFQuest as EFFCore).XFL_RemoveFollower(DismissedFollowerActor, 0, 0)
	elseIf BaboNWS.getvalue() == 1
		MiscObject nwsIgnoreToken = Game.GetFormFromFile(0x001CFC8D, "nwsFollowerFramework.esp") as MiscObject
		DismissedFollowerActor.removeitem(nwsIgnoreToken, 1)
		(DialogueFollower as DialogueFollowerScript).DismissFollower(0, 0)
	else
		(DialogueFollower as DialogueFollowerScript).DismissFollower(0, 0)
	Endif

	If MercenaryRef && MercenaryRef.GetActorRef().IsDead() == False
		If iMessage == 0
			BaboFollowerDismissMessage.Show()
		elseif iMessage == 1
			BaboFollowerDismissMessageWait.Show()
		elseif iMessage == 2
			;Nothing
		elseif iMessage == 3
			BaboFollowerDismissMessageRapeFailed.Show()
		Else
			BaboFollowerDismissMessage.Show()
		EndIf
		

		DismissedFollowerActor.StopCombatAlarm()
		if WasPotentialHireling
			DismissedFollowerActor.AddToFaction(PotentialHireling)
		endif
		;DismissedFollowerActor.setactorvalue("Variable08", 0)
		DismissedFollowerActor.AddToFaction(BaboPotentialHireling)
		DismissedFollowerActor.AddToFaction(BaboWasHireling)
		DismissedFollowerActor.SetPlayerTeammate(false)
		DismissedFollowerActor.RemoveFromFaction(BaboCurrentHireling)
		DismissedFollowerActor.SetAV("WaitingForPlayer", 0)	

		MercenaryRef.Clear()
		BaboPlayerFollowerCount.SetValue(0)
	EndIf

EndFunction

Function BadRelationshipHireling(actor akactor)
	BaboBadRelationshipHirelingsList.addform(akactor)
EndFunction

Function AfterRapeSceneStart()
	BaboDialogueHirelingsWasHirelingScene02.ForceStart()
	Game.DisablePlayerControls(abmenu = true)
	Utility.wait(1.0)
	;PlayerRef.playIdle(OrgasmAfter)
	(BaboSexController as BaboSexControllerManager).RandomExhaustionIdle(PlayerRef)
EndFunction

Function Givetips()

Int Gold = BaboTipHirelingGold.getvalue() as int
	PlayerRef.removeitem(Gold001, Gold, false, MercenaryRef.Getreference() as actor)
	
	If Gold < 300
		BleedoutCoiuntsDiminish(1)
	elseif (Gold >= 300) && (Gold < 600)
		BleedoutCoiuntsDiminish(2)
	elseif (Gold >= 600) && (Gold < 900)
		BleedoutCoiuntsDiminish(3)
	else
		BleedoutCoiuntsDiminish(4)
	endif

EndFunction


Function Havesex(Bool Rough = false, Bool ScenePlay = false)

Actor MercenaryActorRef = MercenaryRef.Getreference() as actor

If Rough == true
BaboNPCRaperList.addform(MercenaryActorRef)
	If ScenePlay == true
		(BaboSexController as BaboSexControllerManager).SexCustomActorTag(PlayerRef, MercenaryActorRef, None, NOne, None, "Aggressive, Rape, MF", "Femdom, BigGuy", True, "AfterSexSH", "AfterSexSceneHireling", true)
	else
		(BaboSexController as BaboSexControllerManager).SexCustomActorTag(PlayerRef, MercenaryActorRef, None, NOne, None, "Aggressive, Rape, MF", "Femdom, BigGuy", False, "", "", true)
	endif
	BleedoutCoiuntsDiminish(2)
	(BaboSexController as BaboSexControllerManager).AddSexCount(1)
Else
	BaboNPCHadSexList.addform(MercenaryActorRef)
	(BaboSexController as BaboSexControllerManager).SexCustomActorTag(PlayerRef, MercenaryActorRef, None, NOne, None, "Cowgirl, Missionary, Doggy", "", false, "", "", false)
	BleedoutCoiuntsDiminish(4)
	(BaboSexController as BaboSexControllerManager).AddSexCount(1)
Endif

EndFunction

Function SexCustom(Actor Actor01, Actor Actor02, Actor Actor03, Actor Actor04, Actor Actor05, Bool NextScene, String Tag01, String Tag02, String EventRegisterDummy, String EventName, Bool Rape = true)
	(BaboSexController as BaboSexControllerManager).SexCustomActorTag(Actor01, Actor02, Actor03, Actor04, Actor05, Tag01, Tag02, NextScene, EventRegisterDummy, EventName, Rape)
EndFunction

Function TestSex()
	(BaboSexController as BaboSexControllerManager).SexCustomActorTag(PlayerRef, MercenaryRef.getreference() as actor, None, None, None, "Aggressive", "", false, "", "", true)
EndFunction


Function BleedoutCoiuntsDiminish(int Count)
	BleedoutStacks -= 1
	If BleedoutStacks < BaboHirelingBleedoutCountLimit.getvalue() as int
		MercenaryRef.GetActorRef().setav("Variable08", 2);Turn to the normal state.
	endif
EndFunction

int Function BleedoutCounts(Bool BacktoInitialStage = false)

If BacktoInitialStage
	BleedoutStacks = 0
Else
	BleedoutStacks += 1
	If (BleedoutStacks >= BaboHirelingBleedoutCountLimit.getvalue() as int)
		if MercenaryRef.GetActorRef().getactorvalue("Variable08") <= 2
			MercenaryRef.GetActorRef().setav("Variable08", 4);Ready to take advantage of Player
		endif
	endif

EndIf

Return BleedoutStacks

EndFunction

Function ChasingPlayer();Needs to be improved
actor FollowerActor = MercenaryRef.GetActorRef() as Actor
	If FollowerActor.getactorvalue("Variable07") == 1
		FollowAgain()
	elseif FollowerActor.getactorvalue("Variable07") == 2
		DismissFollower(1)
	elseif FollowerActor.getactorvalue("Variable07") == 3
		FollowAgain()
		BleedoutStacks += BaboHirelingBleedoutCountLimit.getvalue() as int
		FollowerActor.setactorvalue("Variable08", 4)
	else
	
	endif
EndFunction

Function SexlabApproachRegister(Actor akRef)
	;Debug.notification("WasHired Scene Activated")
	
	if akRef == MercenaryRef.getreference() as actor
		SexlabApproachQuit()
	else
		WasMercenaryRef.forcerefto(akref)
		BaboDialogueHirelingsWasHirelingScene01.start()	
	endif

EndFunction

Function SexlabApproachQuit()
	WasMercenaryRef.clear()
	BaboDialogueHirelingsWasHirelingScene01.stop()
EndFunction

Event BaboSLAPPMercenaryEvent(actor MercenaryRef)
;BaboNPCRaperList.addform(MercenaryRef.getactorbase())
;WIP
Endevent