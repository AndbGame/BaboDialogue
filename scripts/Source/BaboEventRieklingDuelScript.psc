Scriptname BaboEventRieklingDuelScript extends Quest  

Function RegisterEvents()
	RegisterForModEvent("On_BaboDiaSurrender", "Surrender")
	(BaboSexController as BaboSexControllerManager).ReadySurrender(true)
EndFunction

Function UnRegisterEvents()
	UnregisterForModEvent("Surrender")
	(BaboSexController as BaboSexControllerManager).ReadySurrender(false)
EndFunction

Function AllotActors()
	ThirskRieklingMinionA.forcerefto(RieklingAllyMarkerA.getreference().Placeactoratme(BaboEventRieklingThirskMeleeAlly, 4))
	AllyNPC01 = ThirskRieklingMinionA.GetReference() as actor
	if ThirskRieklingMinionB.GetReference()
		AllyNPC02 = ThirskRieklingMinionB.GetReference() as actor
	endif
	if ThirskRieklingMinionC.GetReference()
		AllyNPC03 = ThirskRieklingMinionC.GetReference() as actor
	endif
	if ThirskRieklingMinionD.GetReference()
		AllyNPC04 = ThirskRieklingMinionD.GetReference() as actor
	endif
	
	EnemyNPC01 = RieklingChallengerChief.GetReference() as actor
	EnemyNPC02 = RieklingChallengerMinionA.GetReference() as actor
	EnemyNPC03 = RieklingChallengerMinionB.GetReference() as actor
	EnemyNPC04 = RieklingChallengerMinionC.GetReference() as actor
	EnemyNPC05 = RieklingChallengerMinionD.GetReference() as actor
	EnemyNPC06 = RieklingChallengerMinionE.GetReference() as actor
	EnemyNPC07 = RieklingChallengerMinionF.GetReference() as actor
	
	BaboThirskRieklingReadyGlobal.setvalue(0)
	
	Utility.wait(1.0)
	ScenePlay(1)
EndFunction

Function PlayerFightAlone()
	PlayerRef.addtoFaction(BaboHateNPC01Faction)
	EnemyFightReady()
	
	EnemyNPC01.startCombat(PlayerRef)
	EnemyNPC02.startCombat(PlayerRef)
	EnemyNPC03.startCombat(PlayerRef)
	EnemyNPC04.startCombat(PlayerRef)
	EnemyNPC05.startCombat(PlayerRef)
	EnemyNPC06.startCombat(PlayerRef)
	EnemyNPC07.startCombat(PlayerRef)
EndFunction

Function EnemyFightReady()
	EnemyNPC01.addtoFaction(BaboHateNPC02Faction);This is Boss
	EnemyNPC02.addtoFaction(BaboHateNPC02Faction)
	EnemyNPC03.addtoFaction(BaboHateNPC02Faction)
	EnemyNPC04.addtoFaction(BaboHateNPC02Faction)
	EnemyNPC05.addtoFaction(BaboHateNPC02Faction)
	EnemyNPC06.addtoFaction(BaboHateNPC02Faction)
	EnemyNPC07.addtoFaction(BaboHateNPC02Faction)
	
	EnemyNPC01.addtoFaction(BaboPotentialSurrenderFaction);This is Boss
	EnemyNPC02.addtoFaction(BaboPotentialSurrenderFaction)
	EnemyNPC03.addtoFaction(BaboPotentialSurrenderFaction)
	EnemyNPC04.addtoFaction(BaboPotentialSurrenderFaction)
	EnemyNPC05.addtoFaction(BaboPotentialSurrenderFaction)
	EnemyNPC06.addtoFaction(BaboPotentialSurrenderFaction)
	EnemyNPC07.addtoFaction(BaboPotentialSurrenderFaction)
	
	EnemyNPC01.SetActorValue("Confidence", 4)
	EnemyNPC02.SetActorValue("Confidence", 4)
	EnemyNPC03.SetActorValue("Confidence", 4)
	EnemyNPC04.SetActorValue("Confidence", 4)
	EnemyNPC05.SetActorValue("Confidence", 4)
	EnemyNPC06.SetActorValue("Confidence", 4)
	EnemyNPC07.SetActorValue("Confidence", 4)
EndFunction

Function HandleChiefFaction(Bool bremove);to prevent his minions go mad.
	if bremove
		EnemyNPC01.removefromfaction(BaboThirskRieklingInvaderChiefFaction)
	else
		EnemyNPC01.addtofaction(BaboThirskRieklingInvaderChiefFaction)
	endif
EndFunction

Function AllyCalm()
	AllyNPC01.RemoveFromFaction(BaboHateNPC01Faction)
	AllyNPC02.RemoveFromFaction(BaboHateNPC01Faction)
	AllyNPC03.RemoveFromFaction(BaboHateNPC01Faction)
	AllyNPC04.RemoveFromFaction(BaboHateNPC01Faction)
	
	AllyNPC01.AddSpell(BaboCalmSpell)
	AllyNPC02.AddSpell(BaboCalmSpell)
	AllyNPC03.AddSpell(BaboCalmSpell)
	AllyNPC04.AddSpell(BaboCalmSpell)

	AllyNPC01.SetActorValue("Confidence", 2)
	AllyNPC02.SetActorValue("Confidence", 2)
	AllyNPC03.SetActorValue("Confidence", 2)
	AllyNPC04.SetActorValue("Confidence", 2)
	
	AllyNPC01.stopcombat()
	AllyNPC02.stopcombat()
	AllyNPC03.stopcombat()
	AllyNPC04.stopcombat()
EndFunction

Function EnemyCalm()
	EnemyNPC01.RemoveFromFaction(BaboHateNPC02Faction)
	EnemyNPC01.RemoveFromFaction(BaboHateNPC02Faction)
	EnemyNPC02.RemoveFromFaction(BaboHateNPC02Faction)
	EnemyNPC03.RemoveFromFaction(BaboHateNPC02Faction)
	EnemyNPC04.RemoveFromFaction(BaboHateNPC02Faction)
	EnemyNPC05.RemoveFromFaction(BaboHateNPC02Faction)
	EnemyNPC06.RemoveFromFaction(BaboHateNPC02Faction)
	EnemyNPC07.RemoveFromFaction(BaboHateNPC02Faction)
	
	EnemyNPC01.RemoveFromFaction(BaboPotentialSurrenderFaction)
	EnemyNPC01.RemoveFromFaction(BaboPotentialSurrenderFaction)
	EnemyNPC02.RemoveFromFaction(BaboPotentialSurrenderFaction)
	EnemyNPC03.RemoveFromFaction(BaboPotentialSurrenderFaction)
	EnemyNPC04.RemoveFromFaction(BaboPotentialSurrenderFaction)
	EnemyNPC05.RemoveFromFaction(BaboPotentialSurrenderFaction)
	EnemyNPC06.RemoveFromFaction(BaboPotentialSurrenderFaction)
	EnemyNPC07.RemoveFromFaction(BaboPotentialSurrenderFaction)
	
	EnemyNPC01.AddSpell(BaboCalmSpell)
	EnemyNPC02.AddSpell(BaboCalmSpell)
	EnemyNPC03.AddSpell(BaboCalmSpell)
	EnemyNPC04.AddSpell(BaboCalmSpell)
	EnemyNPC05.AddSpell(BaboCalmSpell)
	EnemyNPC06.AddSpell(BaboCalmSpell)
	EnemyNPC07.AddSpell(BaboCalmSpell)
	
	EnemyNPC01.SetActorValue("Confidence", 2)
	EnemyNPC02.SetActorValue("Confidence", 2)
	EnemyNPC03.SetActorValue("Confidence", 2)
	EnemyNPC04.SetActorValue("Confidence", 2)
	EnemyNPC05.SetActorValue("Confidence", 2)
	EnemyNPC06.SetActorValue("Confidence", 2)
	EnemyNPC07.SetActorValue("Confidence", 2)
	
	EnemyNPC01.stopcombat()
	EnemyNPC02.stopcombat()
	EnemyNPC03.stopcombat()
	EnemyNPC04.stopcombat()
	EnemyNPC05.stopcombat()
	EnemyNPC06.stopcombat()
	EnemyNPC07.stopcombat()
EndFunction

;/ Function LetThemHandleChallenger() /;
	;/ int i = RieklingWarriors.length /;
	;/ While 0 < i /;
		;/ i -= 1 /;
		;/ if RieklingWarriors[i].getreference() /;
			;/ (BaboSexController as BaboSexControllerManager).NPCChallengeStart(RieklingWarriors[i], RieklingChief) /;
		;/ endif /;
	;/ endwhile /;
	;/ ;I just ordered my boys to deal with him instead. He's not worth a single drip of my sweat. /;
;/ EndFunction /;

Function TriggerGroupFight(Bool bPlayerJoin)
	
	EnemyFightReady()
	
	AllyNPC01.addtoFaction(BaboHateNPC01Faction);It always exists.
	AllyNPC01.SetActorValue("Confidence", 4)
	AllyNPC01.startCombat(EnemyNPC02)
	if AllyNPC02
		AllyNPC02.addtoFaction(BaboHateNPC01Faction)
		AllyNPC02.SetActorValue("Confidence", 4)
		AllyNPC02.startCombat(EnemyNPC03)
	endif
	if AllyNPC03
		AllyNPC03.addtoFaction(BaboHateNPC01Faction)
		AllyNPC03.SetActorValue("Confidence", 4)
		AllyNPC03.startCombat(EnemyNPC04)
	endif
	if AllyNPC04
		AllyNPC04.addtoFaction(BaboHateNPC01Faction)
		AllyNPC04.SetActorValue("Confidence", 4)
		AllyNPC04.startCombat(EnemyNPC05)
	endif
	
	if bPlayerJoin
		PlayerRef.addtoFaction(BaboHateNPC01Faction)
		EnemyNPC01.startCombat(PlayerRef)
		EnemyNPC02.startCombat(PlayerRef)
		EnemyNPC03.startCombat(PlayerRef)
		Gotostate("GroupFight")
	else
		EnemyNPC01.startCombat(AllyNPC01)
		EnemyNPC02.startCombat(AllyNPC01)
		EnemyNPC03.startCombat(AllyNPC01)
		Gotostate("PlayerRetreat")
	endif
	EnemyNPC04.startCombat(AllyNPC01)
	EnemyNPC05.startCombat(AllyNPC01)
	EnemyNPC06.startCombat(AllyNPC01)
	EnemyNPC07.startCombat(AllyNPC01)

EndFunction

Function GotoArena()
	;BaboArenaBossXmarker
	EnemyNPC01.moveto(BaboArenaBossXmarker)
	PlayerRef.moveto(BaboArenaPlayerXmarker)
EndFunction

Function BacktoThirskHall()
	PlayerRef.moveto(LocationCenter.getreference())
	AllyNPC01.moveto(RieklingAllyMarkerA.getreference())
	AllyNPC02.moveto(RieklingAllyMarkerB.getreference())
	AllyNPC03.moveto(RieklingAllyMarkerC.getreference())
	AllyNPC04.moveto(RieklingAllyMarkerD.getreference())
	
	EnemyNPC01.moveto(RieklingSpawnMarkerBoss.getreference())
	EnemyNPC02.moveto(RieklingSpawnMarkerA.getreference())
	EnemyNPC03.moveto(RieklingSpawnMarkerB.getreference())
	EnemyNPC04.moveto(RieklingSpawnMarkerC.getreference())
	EnemyNPC05.moveto(RieklingSpawnMarkerD.getreference())
	EnemyNPC06.moveto(RieklingSpawnMarkerE.getreference())
	EnemyNPC07.moveto(RieklingSpawnMarkerF.getreference())
EndFunction

Function GainSlayerTitle()
	(BaboReputationScript as BaboReputationMasterScript).AddingTitletoPlayerRef(BaboFactionRieklingSlayerTitle)
	(BaboReputationScript as BaboReputationMasterScript).SetTitleGlobal(BaboGlobalRieklingSlayerTitle, 1)
EndFunction

Function AllyToArenaSpectator()
	AllyNPC01.moveto(BaboArenaSpectatorXmarkerG)
	AllyNPC02.moveto(BaboArenaSpectatorXmarkerK)
	AllyNPC03.moveto(BaboArenaSpectatorXmarkerI)
	AllyNPC04.moveto(BaboArenaSpectatorXmarkerJ)
EndFunction

Function EnemyToArenaSpectator()
	EnemyNPC02.moveto(BaboArenaSpectatorXmarkerA)
	EnemyNPC03.moveto(BaboArenaSpectatorXmarkerB)
	EnemyNPC04.moveto(BaboArenaSpectatorXmarkerC)
	EnemyNPC05.moveto(BaboArenaSpectatorXmarkerD)
	EnemyNPC06.moveto(BaboArenaSpectatorXmarkerE)
	EnemyNPC07.moveto(BaboArenaSpectatorXmarkerF)
EndFunction

Function EnemyToArena()
	EnemyNPC02.moveto(BaboArenaLackeyXmarkerA)
	EnemyNPC03.moveto(BaboArenaLackeyXmarkerB)
	EnemyNPC04.moveto(BaboArenaLackeyXmarkerC)
	EnemyNPC05.moveto(BaboArenaLackeyXmarkerD)
	EnemyNPC06.moveto(BaboArenaLackeyXmarkerE)
	EnemyNPC07.moveto(BaboArenaLackeyXmarkerF)
EndFunction

Function CountDeath();This function only works in Stage 45
	BaboEventDeathsCount.value += 1
	if BaboEventDeathsCount.getvalue() >= DeathCount
		Victory()
		return
	endif
EndFunction

Function Defeated()
	PO3_Events_Alias.UnregisterForAllHitEventsEx(PlayerAlias)
EndFunction

Event Surrender()
EndEvent

Location Property BaboKidnapperRieklingLocation01 Auto

Function Enslaved()
	BaboRieklingThirskKidnapCallKeyword.SendStoryEvent(BaboKidnapperRieklingLocation01, PlayerRef, EnemyNPC01);This leads to Rieklng Slave Quest. Location is fixed for now.
EndFunction

Function CleanupActors(bool bChief)
Actor[] RieklingArray
if bChief
	RieklingArray = New Actor[7]
	RieklingArray[0] = EnemyNPC01
	RieklingArray[1] = EnemyNPC02
	RieklingArray[2] = EnemyNPC03
	RieklingArray[3] = EnemyNPC04
	RieklingArray[4] = EnemyNPC05
	RieklingArray[5] = EnemyNPC06
	RieklingArray[6] = EnemyNPC07
else
	RieklingArray = New Actor[6]
	RieklingArray[0] = EnemyNPC02
	RieklingArray[1] = EnemyNPC03
	RieklingArray[2] = EnemyNPC04
	RieklingArray[3] = EnemyNPC05
	RieklingArray[4] = EnemyNPC06
	RieklingArray[5] = EnemyNPC07
endif

(BaboSexController as BaboSexControllerManager).DeleteWhenAbleWithTimeout(RieklingArray, 30.0)

EndFunction

Function Victory()
	;null
EndFunction

Event Onupdategametime()
	if BaboEventQuest.getstage() == 110
		BaboEventQuest.setstage(250)
	endif
EndEvent

State PlayerFight;Arena

Event Onbeginstate()
	RegisterEvents()
	(PlayerAlias as BaboRieklingThirskDuelRefScript).CheckEssential()
	(PlayerAlias as BaboRieklingThirskDuelRefScript).RegisterOnHitExExtra(true)
	HandleChiefFaction(true)
	(BaboSexController as BaboSexControllerManager).ActorChallengeStart(EnemyNPC01)
EndEvent

Function Defeated()
	;PO3_Events_Alias.UnregisterForAllHitEventsEx(PlayerAlias)
	(PlayerAlias as BaboRieklingThirskDuelRefScript).ClearEssential()
	PlayerRef.removefromfaction(BaboHateNPC01Faction)
	EnemyCalm()
	BaboEventRieklingDefeatNum.value += 1
	(BaboSexController as BaboSexControllerManager).RandomExhaustionIdle(PlayerRef)
	gotostate("")
EndFunction

Event Surrender()
	EnemyCalm()
	(PlayerAlias as BaboRieklingThirskDuelRefScript).ClearEssential()
	BaboEventQuest.setstage(70)
	HandleChiefFaction(false)
	PO3_Events_Alias.UnregisterForAllHitEventsEx(PlayerAlias)
	PlayerRef.addtofaction(BaboPlayerSurrenderFaction)
	BaboEventRieklingDefeatNum.value += 1
	(BaboSexController as BaboSexControllerManager).LosingControl()
	BaboBrawlingSurrenderMsg.show()
	Game.ForceThirdPerson()
	PlayerRef.RestoreActorValue("health", 100)
	Debug.sendanimationevent(PlayerRef, "BaboDefeatSurrender")
	ScenePlay(4);This goes to 240
	gotostate("")
EndEvent

Function CountDeath()
	;WillPower Up, Reputation Up
	MsgCtrl.BadRieklingDuelMessagebox(29)
	;Fade
	(BaboSexController as BaboSexControllerManager).FadeinScene(false)
	BacktoThirskHall()
	(BaboSexController as BaboSexControllerManager).FadeOutScene(false)
	;FadeOut
	BaboEventQuest.setstage(130)
EndFunction

EndState

State PlayerFightSolo;Arena Solo

Event Onbeginstate()
	BaboEventDeathsCount.setvalue(0);Reset
	RegisterEvents()
	(PlayerAlias as BaboRieklingThirskDuelRefScript).CheckEssential()
	(PlayerAlias as BaboRieklingThirskDuelRefScript).RegisterOnHitExExtra(false)
	PlayerFightAlone()
EndEvent

Function CountDeath();This function only works in Stage 45
	;BaboEventDeathsCount.setvalue(BaboEventDeathsCount.getvalue() + 1)
	BaboEventDeathsCount.value += 1
	if BaboEventDeathsCount.getvalue() >= DeathCount
		Victory()
		return
	endif
EndFunction

Function Victory()
	;WillPower Up, Reputation Up
	;Fade
	Utility.wait(5.0)
	(BaboSexController as BaboSexControllerManager).FadeinScene(false)
	MsgCtrl.BadRieklingDuelMessagebox(29)
	BacktoThirskHall()
	GainSlayerTitle()
	(BaboSexController as BaboSexControllerManager).FadeOutScene(false)
	;FadeOut
	BaboEventQuest.setstage(130)
EndFunction

Function BacktoThirskHall()
	PlayerRef.moveto(LocationCenter.getreference())
	AllyNPC01.moveto(RieklingAllyMarkerA.getreference())
	AllyNPC02.moveto(RieklingAllyMarkerB.getreference())
	AllyNPC03.moveto(RieklingAllyMarkerC.getreference())
	AllyNPC04.moveto(RieklingAllyMarkerD.getreference())
	
	EnemyNPC01.moveto(RieklingSpawnMarkerBoss.getreference())
	EnemyNPC02.moveto(RieklingCorpseMarker.getreference())
	EnemyNPC03.moveto(RieklingCorpseMarker.getreference())
	EnemyNPC04.moveto(RieklingCorpseMarker.getreference())
	EnemyNPC05.moveto(RieklingCorpseMarker.getreference())
	EnemyNPC06.moveto(RieklingCorpseMarker.getreference())
	EnemyNPC07.moveto(RieklingCorpseMarker.getreference())
EndFunction

Function Defeated()
	(PlayerAlias as BaboRieklingThirskDuelRefScript).ClearEssential()
	PlayerRef.removefromfaction(BaboHateNPC01Faction)
	EnemyCalm()
	BaboEventRieklingDefeatNum.value += 1
	(BaboSexController as BaboSexControllerManager).RandomExhaustionIdle(PlayerRef)
	gotostate("")
EndFunction

Event Surrender()
	EnemyCalm()
	(PlayerAlias as BaboRieklingThirskDuelRefScript).ClearEssential()
	BaboEventQuest.setstage(70)
	HandleChiefFaction(false)
	PO3_Events_Alias.UnregisterForAllHitEventsEx(PlayerAlias)
	PlayerRef.addtofaction(BaboPlayerSurrenderFaction)
	BaboEventRieklingDefeatNum.value += 1
	(BaboSexController as BaboSexControllerManager).LosingControl()
	BaboBrawlingSurrenderMsg.show()
	Game.ForceThirdPerson()
	PlayerRef.RestoreActorValue("health", 100)
	Debug.sendanimationevent(PlayerRef, "BaboDefeatSurrender")
	if EnemyNPC01.isdead()
		EnemyNPC01 = RieklingSpawnMarkerBoss.getreference().Placeactoratme(BaboRieklingChiefInvaderChief, 4)
		BaboEventQuest.setstage(240)
	else
		ScenePlay(4);This goes to 240
	endif
	gotostate("")
EndEvent

EndState

State PlayerRetreat; WIP - Reputation, WillPower

	Event Onbeginstate()
		RegisterForSingleUpdateGameTime(2.0)
	EndEvent

	Event Onupdategametime()
		;if !EnemyNPC01.Is3DLoaded() && !EnemyNPC01.isdead()
		if playerRef.GetDistance(RieklingSpawnMarkerBoss.getreference()) > 1500.0
			MsgCtrl.BadRieklingDuelMessagebox(28)
			setstage(110)
			UnregisterForUpdateGameTime()
		else
			RegisterForSingleUpdateGameTime(0.5)
		endif
	EndEvent
	
	Function Victory()
		UnregisterForUpdateGameTime()
		gotostate("")
	EndFunction
EndState

State GroupFight

	Event Onbeginstate()
		RegisterForSingleUpdateGameTime(4.0)
	EndEvent
	
	Event Onupdategametime();TimeOut
		;if !EnemyNPC01.Is3DLoaded() && !EnemyNPC01.isdead()
		if playerRef.GetDistance(RieklingSpawnMarkerBoss.getreference()) > 1500.0
			;Player Run away
			setstage(105)
			UnregisterForUpdateGameTime()
		else;Enemy Death trigger is monitored by Aliasscript. Not here.
			RegisterForSingleUpdateGameTime(0.5)
		endif
	EndEvent
	
	Function Victory()
		;Player WillPower Increase, Reputation Increase
		UnregisterForUpdateGameTime()
		gotostate("")
	EndFunction
	
EndState



Bool Function ScenePlay(int inum, bool bplay = true)
	Return SceneManager.EventRieklingThirskDulScenePlay(inum, bplay)
EndFunction

Function ResetCooltime()
	(BaboDialogueRiekling as BaboDialogueRieklingScript).FireUpdate()
EndFunction

Function CountAssault()
	BaboEventRieklingThirskAssaultCount.value += 1
EndFunction

Function CountVictory()
	BaboEventRieklingVictoryNum.value += 1
EndFunction

BaboSceneManager Property SceneManager Auto

GlobalVariable Property BaboThirskRieklingReadyGlobal Auto
GlobalVariable Property BaboEventRieklingVictoryNum Auto;How many times player was victorious. wip(dialogue)
GlobalVariable Property BaboEventRieklingDefeatNum Auto;How many times player was defeated.
GlobalVariable Property BaboEventRieklingThirskAssaultCount Auto
GlobalVariable Property BaboGlobalRieklingSlayerTitle Auto
Faction Property BaboFactionRieklingSlayerTitle Auto
Quest Property BaboDialogueRiekling Auto;BaboReputationMasterScript
Quest Property BaboReputationScript Auto;BaboReputationMasterScript

ActorBase Property BaboRieklingChiefInvaderChief Auto
ActorBase Property BaboEventRieklingThirskMeleeAlly Auto

Actor Property AllyNPC01 Auto Hidden
Actor Property AllyNPC02 Auto Hidden
Actor Property AllyNPC03 Auto Hidden
Actor Property AllyNPC04 Auto Hidden

Actor Property EnemyNPC01 Auto Hidden
Actor Property EnemyNPC02 Auto Hidden
Actor Property EnemyNPC03 Auto Hidden
Actor Property EnemyNPC04 Auto Hidden
Actor Property EnemyNPC05 Auto Hidden
Actor Property EnemyNPC06 Auto Hidden
Actor Property EnemyNPC07 Auto Hidden

Spell Property BaboCalmSpell Auto

Quest Property BaboSexController Auto
Quest Property BaboEventQuest Auto
Quest Property BaboEventRieklingThirsk Auto
Message Property BaboBrawlingSurrenderMsg Auto
Actor Property PlayerRef Auto

ReferenceAlias Property ThirskRieklingMinionA Auto
ReferenceAlias Property ThirskRieklingMinionB Auto
ReferenceAlias Property ThirskRieklingMinionC Auto
ReferenceAlias Property ThirskRieklingMinionD Auto

ReferenceAlias Property RieklingChallengerChief Auto
ReferenceAlias Property RieklingChallengerMinionA Auto
ReferenceAlias Property RieklingChallengerMinionB Auto
ReferenceAlias Property RieklingChallengerMinionC Auto
ReferenceAlias Property RieklingChallengerMinionD Auto
ReferenceAlias Property RieklingChallengerMinionE Auto
ReferenceAlias Property RieklingChallengerMinionF Auto

ReferenceAlias Property LocationCenter Auto
ReferenceAlias Property RieklingAllyMarkerA Auto
ReferenceAlias Property RieklingAllyMarkerB Auto
ReferenceAlias Property RieklingAllyMarkerC Auto
ReferenceAlias Property RieklingAllyMarkerD Auto

ReferenceAlias Property RieklingSpawnMarkerBoss Auto
ReferenceAlias Property RieklingSpawnMarkerA Auto
ReferenceAlias Property RieklingSpawnMarkerB Auto
ReferenceAlias Property RieklingSpawnMarkerC Auto
ReferenceAlias Property RieklingSpawnMarkerD Auto
ReferenceAlias Property RieklingSpawnMarkerE Auto
ReferenceAlias Property RieklingSpawnMarkerF Auto
ReferenceAlias Property RieklingCorpseMarker Auto

ReferenceAlias Property PlayerAlias Auto
Faction Property BaboHateNPC01Faction Auto
Faction Property BaboHateNPC02Faction Auto
Faction Property BaboPlayerSurrenderFaction Auto
Faction Property BaboPotentialSurrenderFaction Auto

Faction Property BaboThirskRieklingInvaderChiefFaction Auto
Faction Property BaboThirskRieklingInvaderFaction Auto
Keyword Property BaboDetectSpectatorKeyword Auto
Keyword Property BaboRieklingThirskKidnapCallKeyword Auto


;Arena Location Xmarkers
ObjectReference Property BaboArenaPlayerXmarker Auto
ObjectReference Property BaboArenaBossXmarker Auto
ObjectReference Property BaboArenaSpectatorXmarkerA Auto
ObjectReference Property BaboArenaSpectatorXmarkerB Auto
ObjectReference Property BaboArenaSpectatorXmarkerC Auto
ObjectReference Property BaboArenaSpectatorXmarkerD Auto
ObjectReference Property BaboArenaSpectatorXmarkerE Auto
ObjectReference Property BaboArenaSpectatorXmarkerF Auto
ObjectReference Property BaboArenaSpectatorXmarkerG Auto
ObjectReference Property BaboArenaSpectatorXmarkerI Auto
ObjectReference Property BaboArenaSpectatorXmarkerJ Auto
ObjectReference Property BaboArenaSpectatorXmarkerK Auto

ObjectReference Property BaboArenaLackeyXmarkerA Auto
ObjectReference Property BaboArenaLackeyXmarkerB Auto
ObjectReference Property BaboArenaLackeyXmarkerC Auto
ObjectReference Property BaboArenaLackeyXmarkerD Auto
ObjectReference Property BaboArenaLackeyXmarkerE Auto
ObjectReference Property BaboArenaLackeyXmarkerF Auto
ObjectReference Property BaboArenaLackeyXmarkerG Auto
ObjectReference Property BaboArenaLackeyXmarkerH Auto


GlobalVariable Property BaboEventDeathsCount Auto
int Property DeathCount = 7 Auto;This is the number of minions.

BaboMsgManager Property MsgCtrl Auto