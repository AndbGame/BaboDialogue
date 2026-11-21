Scriptname BaboEventNewgnisisMasterScript extends Quest  
{Argonians... They know nothing about dovaqueen's deeds...}

;\\\\\\\\\\\\\\\\
;\\\Property Zone\\\\\\\
;\\\\\\\\\\\\\\\\
ObjectReference Property BaboEventNewgnisisCheersPointA  Auto  
ObjectReference Property BaboEventNewgnisisCheersPointB  Auto  
ObjectReference Property BaboEventNewgnisisCheersPointC  Auto  
ObjectReference Property BaboEventNewGnisisArgonianAMarker  Auto  
ObjectReference Property BaboEventNewGnisisArgonianBMarker  Auto  
ObjectReference Property BaboEventNewGnisisArgonianCMarker  Auto

ObjectReference Property BaboEventNewGnisisTeleportMarker  Auto
ObjectReference Property BaboEventNewGnisisTeleportMarkerB  Auto
ObjectReference Property BaboEventNewGnisisTeleportMarkerC  Auto

ObjectReference Property BaboEventNewGnisisExitEndMarker  Auto

ObjectReference Property BaboEventNewGnisisInnkeeperXmarker  Auto
ObjectReference Property BaboEventNewGnisisArgonianGathering  Auto

ObjectReference Property BaboEventCornerClubTeleportBox  Auto  
BaboMCMRestart Property BaboMCMRestartScript Auto

BaboSexControllerManager Property BMQuest Auto

GlobalVariable Property VisitAgain auto
GlobalVariable Property TriggerCount auto

Quest Property BaboEvent Auto
Quest Property BaboSexController Auto

Armor property AnkleChain auto
Armor property CumFace auto
Armor property CumChest auto
Armor property CumVagina auto

Actorbase property HunterArgonian01 auto
Actorbase property HunterArgonian02 auto
Actorbase property HunterArgonian03 auto

ReferenceAlias Property InnKeeperRef Auto

ReferenceAlias Property ArgonianRaper01 Auto
ReferenceAlias Property ArgonianRaper01Copy Auto
ReferenceAlias Property ArgonianRaper02 Auto
ReferenceAlias Property ArgonianRaper03 Auto
ReferenceAlias Property ArgonianH04 Auto
ReferenceAlias Property ArgonianH05 Auto

ReferenceAlias Property PlayerAlias Auto
ReferenceAlias Property Citizen01Ref Auto
ReferenceAlias Property Citizen02Ref Auto
ReferenceAlias Property Citizen03Ref Auto
ReferenceAlias Property Citizen04Ref Auto
ReferenceAlias Property Citizen05Ref Auto
ReferenceAlias Property Citizen06Ref Auto
ReferenceAlias Property BrunwulfRef Auto

Actor Property PlayerActor Auto

Actor Property Calixto Auto
Actor Property Oengul Auto
Actor Property Revyn Auto
Actor Property Nils Auto
Actor Property Sussana Auto
Actor Property Viola Auto
Actor Property Belyn Auto
Actor Property Silda Auto
Actor Property Neetrenaza Auto
Actor Property Shahvee Auto
Actor Property Tulvur Auto
Actor Property Angrenor Auto

Actorbase Property BaboEventNPCArgonianMale Auto
Actorbase Property BaboEventNPCDarkelfMale Auto
Actorbase Property BaboEventNPCDarkelfFemale Auto
Actorbase Property BaboEventNPCNordMale Auto

Actorbase Property BaboEventOengul Auto
Actorbase Property BaboEventCalixto Auto
Actorbase Property BaboEventNils Auto
Actorbase Property BaboEventRevynSadri Auto
Actorbase Property BaboEventSusanna Auto
Actorbase Property BaboEventViolaGiordano Auto
Actorbase Property BaboEventSilda Auto
Actorbase Property BaboEventBelynHlaalu Auto
Actorbase Property BaboEventShahvee Auto
Actorbase Property BaboEventNeetrenaza Auto
Actorbase Property BaboEventTulvur Auto
Actorbase Property BaboEventAngrenor Auto
ActorBase Property BaboEventBrunwulf Auto
Actor Property Brunwulf Auto

ObjectReference property SpawnPlace auto

ObjectReference property BaboEventNewgnisisChainPoleRef auto
;ObjectReference property TorturePole auto
;ObjectReference property TortureLight auto
;ObjectReference property FirePlace auto
;ObjectReference property FireFX auto
ObjectReference property TheDoorRef auto


Idle property OrgasmAfter01 auto
Idle property PantingIdle auto

ObjectReference property XmarkerPlayerShowcase auto
ObjectReference property XmarkerHeadingArgonian auto
ObjectReference property XmarkerHeadingArgonianCopy auto
ObjectReference property XmarkerHeadingArgonianSub01 auto
ObjectReference property XmarkerHeadingArgonianSub02 auto
ObjectReference property XmarkerHeadingArgonianSub03 auto
ObjectReference property XmarkerHeadingArgonianSub04 auto
ObjectReference property XmarkerHeadingCitizen01 auto
ObjectReference property XmarkerHeadingCitizen02 auto
ObjectReference property XmarkerHeadingCitizen03 auto
ObjectReference property XmarkerHeadingCitizen04 auto
ObjectReference property XmarkerHeadingCitizen05 auto
ObjectReference property XmarkerHeadingCitizen06 auto
ObjectReference property XmarkerBruwulf01 auto

ObjectReference property XmarkerHeadingPlayerInn auto
ObjectReference property XmarkerHeadingBrunwulfInn auto

GlobalVariable Property BaboSimpleSlavery Auto
GlobalVariable Property BaboSimpleSlaveryChance Auto
GlobalVariable Property BaboEventDeathsCount Auto

Faction Property BaboPlayerSurrenderFaction Auto

message property BaboBrawlingSurrenderMsg Auto

int Property DeathCount = 0 Auto Hidden
int Property DeathCountGoal = 3 Auto

Quest Property BaboMsgScript Auto
Quest Property BaboSceneController Auto
Quest Property BaboStealingScript Auto
ObjectReference Property BaboEventNewgnisisXmarker Auto
ObjectReference Property BaboNewgnisisRemoveOnEnterTrigger Auto
Keyword Property BaboKidnapCallKeyword Auto

Potion Property BaboFakeVenom Auto
Potion Property BaboWinePoisoned Auto
GlobalVariable Property BaboPlayerPoisonLiquor Auto
GlobalVariable Property BaboPlayerPoisonLiquorSuccess Auto
Formlist Property BaboBoozeFormList Auto
;\\\\\\\\\\\\\\\\
;\\\Function Zone\\\\\\\
;\\\\\\\\\\\\\\\\

Function ConcoctBooze(actor akactor)
int iindex = BaboBoozeFormList.getsize()
While iindex > 0
iindex -= 1
	if akactor.getitemcount(BaboBoozeFormList.getat(iindex)) > 0
		akactor.removeitem(BaboBoozeFormList.getat(iindex), 1)
		akactor.additem(BaboWinePoisoned, 1)
		return
	endif
endWhile
EndFunction

Function ConcoctPoison()
	int ichance = Utility.randomint(0, 100)
	int iAlchemy = PlayerActor.getactorvalue("Alchemy") as int
	BaboPlayerPoisonLiquor.setvalue(1)
	if iAlchemy >= ichance 
		BaboPlayerPoisonLiquorSuccess.setvalue(1)
	else
		BaboPlayerPoisonLiquorSuccess.setvalue(0)
	endif
	ConcoctBooze(PlayerActor)
EndFunction

Function Poisoned(actor akactor)
	akactor.equipitem(akactor.additem(BaboFakeVenom, 1))
EndFunction

Function AltDefeated(int inum)
	if inum == 1
		if ScenePlay(6, true) == false
			PlayerActor.removefromfaction(BaboPlayerSurrenderFaction)
			BaboEvent.setstage(50)
		endif
	elseif inum == 2
		if ScenePlay(7, true) == false
			PlayerActor.removefromfaction(BaboPlayerSurrenderFaction)
			BaboEvent.setstage(50)
		endif
	endif
EndFunction

Function DeathCount()
	DeathCount += 1
	BaboEventDeathsCount.setvalue(DeathCount)
	if DeathCount == DeathCountGoal
		if BaboEvent.getstage() < 32
			BaboEvent.setstage(255)
		elseif BaboEvent.getstage() > 32 && BaboEvent.getstage() <= 40
			BaboEvent.setstage(92)
		endif
	Endif
EndFunction

Bool Function ScenePlay(int i, bool bplay = true)
	if (BaboSceneController as BaboSceneManager).EventAnimalCareWhiterunScenePlay(i, bplay) == true
		return true
	else
		return false
	endif
EndFunction


Function RegisterEvents()
	RegisterForModEvent("On_BaboDiaSurrender", "Surrender")
	(BaboSexController as BaboSexControllerManager).ReadySurrender(true)
	(BaboNewgnisisRemoveOnEnterTrigger as BaboRemoveOnEnterTrigger).gotostate("waiting")
EndFunction

Function UnRegisterEvents()
	UnregisterForModEvent("Surrender")
	(BaboSexController as BaboSexControllerManager).ReadySurrender(false)
	(BaboNewgnisisRemoveOnEnterTrigger as BaboRemoveOnEnterTrigger).gotostate("working")
EndFunction

Event Surrender()
	if BaboEvent.getstage() == 40
		BaboEvent.setstage(45)
		BaboBrawlingSurrenderMsg.show()
		Game.ForceThirdPerson()
		PlayerActor.RestoreActorValue("health", 100)
		(BaboSexController as BaboSexControllerManager).LosingControl()
		Utility.Wait(0.5)
		Debug.sendanimationevent(PlayerActor, "BaboDefeatSurrender")
		playeractor.addtofaction(BaboPlayerSurrenderFaction)
		PO3_Events_Alias.UnregisterForAllHitEventsEx(PlayerAlias)
		(BaboSexController as BaboSexControllerManager).MiscMessagebox(0)
		;UnregisterForModEvent("Surrender")
	endif
EndEvent

Function GoStateBefore()
	GotoState("Before200")
EndFunction

Function GoState()
	GotoState("After200")
EndFunction

Function RegisterUpdate(Int TimeLimit)
UnregisterForUpdateGameTime()
;Debug.notification("Babo Argonian Unregister Mod")
RegisterForSingleUpdateGameTime(TimeLimit); this is Customizable
EndFunction

Function RegisterUpdateOnLoad(Int TimeLimit)
UnregisterForUpdateGameTime()
;Debug.notification("Babo Argonian Unregister Mod")
RegisterForSingleUpdateGameTime(TimeLimit); this is Customizable
EndFunction

Function TeleportArgonianstoEventRoom()
	(ArgonianRaper01.getreference() as actor).moveto(BaboEventNewGnisisArgonianAMarker)
	(ArgonianRaper02.getreference() as actor).moveto(BaboEventNewGnisisArgonianBMarker)
	(ArgonianRaper03.getreference() as actor).moveto(BaboEventNewGnisisArgonianCMarker)
EndFunction

Function TeleportArgonianstoExitEnd()
	(ArgonianRaper01.getreference() as actor).moveto(BaboEventNewGnisisExitEndMarker)
	(ArgonianRaper02.getreference() as actor).moveto(BaboEventNewGnisisExitEndMarker)
	(ArgonianRaper03.getreference() as actor).moveto(BaboEventNewGnisisExitEndMarker)
EndFunction

State Before200
	Event Onbeginstate()
		RegisterEvents()
	EndEvent
	Event OnUpdateGameTime()
		If BaboEvent.GetStage() >= 73 && BaboEvent.GetStage() <= 76
			BaboEvent.SetStage(100)
		elseIf BaboEvent.GetStage() == 100 || BaboEvent.GetStage() == 120 || BaboEvent.GetStage() == 125
			BaboEvent.SetStage(150)
		Endif
	EndEvent
EndState

State After200
	Event OnUpdateGameTime()
		If (BaboEvent.GetStage() == 150) || (BaboEvent.GetStage() == 245)
			VisitAgainToggle(True)
			GotoState("Before200")
			BaboMCMRestartScript.UpdateNewgnisisQuest()
		Elseif  BaboEvent.GetStage() == 250
			GotoState("Before200")
			BaboMCMRestartScript.UpdateNewgnisisQuest()
		Elseif  BaboEvent.GetStage() == 255
			GotoState("Before200")
			BaboMCMRestartScript.UpdateNewgnisisQuest()
		Endif
	EndEvent
EndState

GlobalVariable Property BaboReputation Auto

Function SpawnArgonians()
	Actor ArgonianHunter01 = SpawnPlace.PlaceActorAtMe(HunterArgonian01, 4)
	Actor ArgonianHunter02 = SpawnPlace.PlaceActorAtMe(HunterArgonian02, 4)
	Actor ArgonianHunter03 = SpawnPlace.PlaceActorAtMe(HunterArgonian03, 4)
	ArgonianRaper01.ForceRefTo(ArgonianHunter01)
	ArgonianRaper02.ForceRefTo(ArgonianHunter02)
	ArgonianRaper03.ForceRefTo(ArgonianHunter03)
	(BaboSexController as BaboSexControllerManager).SLHHFilterActor(ArgonianHunter01 as form)
	(BaboSexController as BaboSexControllerManager).SLHHFilterActor(ArgonianHunter02 as form)
	(BaboSexController as BaboSexControllerManager).SLHHFilterActor(ArgonianHunter03 as form)
	int ichance = 100 + BaboReputation.getvalue() as int
	(BaboSexController as BaboSexControllerManager).IsactorRapist(ArgonianHunter01, ichance, true)
	(BaboSexController as BaboSexControllerManager).IsactorRapist(ArgonianHunter02, ichance, true)
	(BaboSexController as BaboSexControllerManager).IsactorRapist(ArgonianHunter03, ichance, true)
	(ArgonianRaper01 as BaboBrawlingNewgnisisREF).RegisterOnHitExExtra(PlayerActor)
	(ArgonianRaper02 as BaboBrawlingNewgnisisREF).RegisterOnHitExExtra(PlayerActor)
	(ArgonianRaper03 as BaboBrawlingNewgnisisREF).RegisterOnHitExExtra(PlayerActor)
EndFunction

Function ClearSpectators()
	Citizen01Ref.getreference().delete()
	Citizen02Ref.getreference().delete()
	Citizen03Ref.getreference().delete()
	Citizen04Ref.getreference().delete()
	Citizen05Ref.getreference().delete()
	Citizen06Ref.getreference().delete()
	BrunwulfRef.getreference().delete()
	
	Citizen01Ref.clear()
	Citizen02Ref.clear()
	Citizen03Ref.clear()
	Citizen04Ref.clear()
	Citizen05Ref.clear()
	Citizen06Ref.clear()
	BrunwulfRef.clear()
EndFunction

Function ClearArgonians(bool binstant = true)
	(ArgonianRaper01 as BaboBrawlingNewgnisisREF).UnRegisterOnHitExExtra()
	(ArgonianRaper02 as BaboBrawlingNewgnisisREF).UnRegisterOnHitExExtra()
	(ArgonianRaper03 as BaboBrawlingNewgnisisREF).UnRegisterOnHitExExtra()
	if binstant
		ArgonianRaper01.GetReference().delete()
		ArgonianRaper02.GetReference().delete()
		ArgonianRaper03.GetReference().delete()
		ArgonianH04.GetReference().delete()
		ArgonianH05.GetReference().delete()
		ArgonianRaper01.Clear()
		ArgonianRaper02.Clear()
		ArgonianRaper03.Clear()
		ArgonianH04.Clear()
		ArgonianH05.Clear()
	else
		Actor[] actors = New Actor[5]
		actors[0] = (ArgonianRaper01.getreference() as actor)
		actors[1] = (ArgonianRaper02.getreference() as actor)
		actors[2] = (ArgonianRaper03.getreference() as actor)
		actors[3] = (ArgonianH04.getreference() as actor)
		actors[4] = (ArgonianH05.getreference() as actor)
		(BaboSexController as BaboSexControllerManager).DeleteWhenAbleWithTimeout(actors, 60)
	endif
	ArgonianRaper01Copy.getreference().delete()
	ArgonianRaper01Copy.clear()
EndFunction

Function ClearQuest()
(BaboSceneController as BaboSceneManager).EventAnimalCareWhiterunScenePlay(0, false)

BMQuest.Recovercontrol()
;BaboEvent.Reset()
UnregisterForUpdateGameTime()
GotoState("Before200")
TheDoorRef.Lock(False, False)
ClearArgonians(true)
InnKeeperRef.Clear()
ClearSpectators()
TriggerBoxReset()
VisitAgainToggle(False)
BMQuest.CompatiblityCheck(False)
DeathCount = 0
BaboEventDeathsCount.setvalue(DeathCount)
BaboEvent.setstage(1)
;Debug.notification("Windhelm Newgnisis Event Clear")
EndFunction

Function SpawnArgonianMinions()
	Actor ArgonianHunter04 = XmarkerHeadingArgonianSub01.PlaceActorAtMe(HunterArgonian02, 4)
	Actor ArgonianHunter05 = XmarkerHeadingArgonianSub02.PlaceActorAtMe(HunterArgonian03, 4)
	ArgonianH04.ForceRefTo(ArgonianHunter04)
	ArgonianH05.ForceRefTo(ArgonianHunter05)
	(BaboSexController as BaboSexControllerManager).SLHHFilterActor(ArgonianHunter04 as form)
	(BaboSexController as BaboSexControllerManager).SLHHFilterActor(ArgonianHunter05 as form)
EndFunction

Function SpawnCopyArgonian()
	Actor ArgonianHunter01Copy = XmarkerHeadingArgonianCopy.PlaceActorAtMe(HunterArgonian01, 4)
	ArgonianRaper01Copy.ForceRefTo(ArgonianHunter01Copy)
EndFunction

Function ForAlias(Actor InnKeeper, Referencealias InnRef)
	InnRef.ForceRefto(InnKeeper)
EndFunction

Function MovetoShowcase()
	DesignatingCitizen()
	BaboEventNewgnisisXmarker.Enable()
	;TorturePole.Enable()
	;TortureLight.Enable()
	;FirePlace.Enable()
	;FireFX.Enable()
	(BaboEventNewgnisisChainPoleRef as BaboChainUpsidePoleScript).TActor = PlayerActor
	
	;Game.DisablePlayerControls( true, true, true, false, true, false, true, false )
	Game.SetPlayerAIDriven(true)
	PlayerActor.moveto(XmarkerPlayerShowcase)
	if (BaboEventNewgnisisChainPoleRef as BaboChainUpsidePoleScript).ActivateClutter() == 1
		(ArgonianRaper01.GetReference() as actor).moveto(XmarkerHeadingArgonian)
		SpawnArgonianMinions()
		if !(ArgonianRaper02.getreference() as actor).isdead()
			(ArgonianRaper02.GetReference() as actor).moveto(XmarkerHeadingArgonianSub04)
		endif
		if !(ArgonianRaper03.getreference() as actor).isdead()
			(ArgonianRaper03.GetReference() as actor).moveto(XmarkerHeadingArgonianSub03)
		endif
		;/ (Citizen01Ref.getreference() as actor).moveto(XmarkerHeadingCitizen01) /;
		;/ (Citizen02Ref.getreference() as actor).moveto(XmarkerHeadingCitizen02) /;
		;/ (Citizen03Ref.getreference() as actor).moveto(XmarkerHeadingCitizen03) /;
		;/ (Citizen04Ref.getreference() as actor).moveto(XmarkerHeadingCitizen04) /;
		;/ (Citizen05Ref.getreference() as actor).moveto(XmarkerHeadingCitizen05) /;
		;/ (Citizen06Ref.getreference() as actor).moveto(XmarkerHeadingCitizen06) /;
		;/ (BrunwulfRef.getreference() as actor).moveto(XmarkerBruwulf01) /;
	endif
	(BaboSexController as BaboSexControllerManager).ReputationDecrease(20, 0)
	(BaboSexController as BaboSexControllerManager).ReputationBitchDecrease(10)
	(BaboSexController as BaboSexControllerManager).CorruptionExp(5.0)
EndFunction

Function DesignatingCitizen()
	Actor Citizen01
	Actor Citizen02
	Actor Citizen03
	Actor Citizen04
	Actor Citizen05
	Actor Citizen06
	
	If Calixto.isdead()
		Citizen01 = XmarkerHeadingCitizen01.Placeactoratme(BaboEventOengul)
	Else
		Citizen01 = XmarkerHeadingCitizen01.Placeactoratme(BaboEventCalixto)
	EndIf
	If Revyn.isdead()
		Citizen02 = XmarkerHeadingCitizen02.Placeactoratme(BaboEventNils)
	Else
		Citizen02 = XmarkerHeadingCitizen02.Placeactoratme(BaboEventRevynSadri)
	EndIf
	If Sussana.isdead()
		Citizen03 = XmarkerHeadingCitizen03.Placeactoratme(BaboEventViolaGiordano)
	Else
		Citizen03 = XmarkerHeadingCitizen03.Placeactoratme(BaboEventSusanna)
	EndIf
	If Belyn.isdead()
		Citizen04 = XmarkerHeadingCitizen04.Placeactoratme(BaboEventSilda)
	Else
		Citizen04 = XmarkerHeadingCitizen04.Placeactoratme(BaboEventBelynHlaalu)
	EndIf
	If Neetrenaza.isdead()
		Citizen05 = XmarkerHeadingCitizen05.Placeactoratme(BaboEventShahvee)
	Else
		Citizen05 = XmarkerHeadingCitizen05.Placeactoratme(BaboEventNeetrenaza)
	EndIf
	If Angrenor.isdead()
		Citizen06 = XmarkerHeadingCitizen06.Placeactoratme(BaboEventTulvur)
	Else
		Citizen06 = XmarkerHeadingCitizen06.Placeactoratme(BaboEventAngrenor)
	EndIf

BrunwulfRef.ForceRefTo(XmarkerBruwulf01.Placeactoratme(BaboEventBrunwulf))
Citizen01Ref.ForceRefTo(Citizen01)
Citizen02Ref.ForceRefTo(Citizen02)
Citizen03Ref.ForceRefTo(Citizen03)
Citizen04Ref.ForceRefTo(Citizen04)
Citizen05Ref.ForceRefTo(Citizen05)
Citizen06Ref.ForceRefTo(Citizen06)
EndFunction

Function ShowingStart()
	Armor CurrentBody = PlayerActor.GetWornForm(0x00000004) as Armor ;This Form is for Cuirass
	;Armor CurrentPanty = PlayerActor.GetWornForm(0x00400000) as Armor ;This Form is for Panty
	PlayerActor.UnEquipItem(CurrentBody, true, true)
	;PlayerActor.UnEquipItem(CurrentPanty, true, true)
	(BaboStealingScript as BaboStealingArmorScript).FindThong(PlayerActor, None, False, False, None, False)
	(BaboStealingScript as BaboStealingArmorScript).FindPants(PlayerActor, None, False, False, None, False)
	EquipZazItem()
EndFunction

Function RescueInnMoving()
	if BrunwulfRef.getreference()
		BrunwulfRef.getreference().moveto(XmarkerHeadingBrunwulfInn)
	else
		BrunwulfRef.ForceRefTo(XmarkerHeadingBrunwulfInn.Placeactoratme(BaboEventBrunwulf))
	endif
	PlayerActor.moveto(XmarkerHeadingPlayerInn)
	RegisterUpdate(3)
	;Brunwulf.moveto(XmarkerHeadingBrunwulfInn)
EndFunction

Function BrunwulfGone()
	(BaboSexController as BaboSexControllerManager).FadeinScene(true)
	BrunwulfRef.getreference().moveto(XmarkerBruwulf01)
	BrunwulfRef.getreference().delete()
	BrunwulfRef.clear()
	UnEquipZazItem()
	DisableTorturePole()
	ClearArgonians()
	RegisterUpdate(24)
	(BaboSexController as BaboSexControllerManager).FadeoutScene(true)
EndFunction

Function EquipZazItem()
	(BaboSexController as BaboSexControllerManager).CustomMFGAhe(PlayerActor, 1, false, false)
	(BaboSexController as BaboSexControllerManager).EquipRestraints(PlayerActor, true)
	(BaboSexController as BaboSexControllerManager).EquipCumItem(PlayerActor)
;	PlayerActor.addItem(CumFace, 1, true)
;	PlayerActor.addItem(CumChest, 1, true)
;	PlayerActor.addItem(CumVagina, 1, true)
;	PlayerActor.addItem(AnkleChain, 1, true)
;	PlayerActor.EquipItem(CumFace, true, true)
;	PlayerActor.EquipItem(CumChest, true, true)
;	PlayerActor.EquipItem(CumVagina, true, true)
;	PlayerActor.EquipItem(AnkleChain, true, true)
EndFunction

Function UnEquipZazItem()
	(BaboSexController as BaboSexControllerManager).UnEquipRestraints(PlayerActor)
	(BaboSexController as BaboSexControllerManager).UnEquipCumItem(PlayerActor)
	(BaboSexController as BaboSexControllerManager).CustomMFGAhe(PlayerActor, 0, false, false)
;	PlayerActor.UnEquipItem(CumFace, true, true)
;	PlayerActor.UnEquipItem(CumChest, true, true)
;	PlayerActor.UnEquipItem(CumVagina, true, true)
;	PlayerActor.UnEquipItem(AnkleChain, true, true)
;	PlayerActor.RemoveItem(CumFace, 1, true)
;	PlayerActor.RemoveItem(CumChest, 1, true)
;	PlayerActor.RemoveItem(CumVagina, 1, true)
;	PlayerActor.RemoveItem(AnkleChain, 1, true)
EndFunction

Function PlayPantingAnim()
	PlayerActor.playIdle(pantingidle)
EndFunction

Function VisitAgainToggle(Bool Switch)
	VisitAgain.setvalue(switch as int)
EndFunction

Function TriggerCountPlus(int Count)
	TriggerCount.setvalue(TriggerCount.Getvalue() as int + Count)
EndFunction

Function DisableTorturePole()
	BaboEventNewgnisisXmarker.disable()
	;TorturePole.disable()
	;TortureLight.disable()
	;FirePlace.disable()
	;FireFX.disable()
EndFunction

Function TriggerBoxReset()
	BaboEventCornerClubTeleportBox.disable()
		Utility.wait(1.0)
	BaboEventCornerClubTeleportBox.enable()
		Utility.wait(1.0)
	(BaboEventCornerClubTeleportBox as BaboDefaultOnEnterTriggerScript).ReArmTrigger()
	BaboPlayerPoisonLiquor.setvalue(0)
	BaboPlayerPoisonLiquorSuccess.setvalue(0)
EndFunction

Function SendingSexEvent(ReferenceAlias Alias01, ReferenceAlias Alias02)
	Messagebox(2)
	(BaboSexController as BaboSexControllerManager).SexCustom(Alias01, Alias02, None, None, None, "Rape", "Vaginal", "MF", True, "WNAS01", "WindhelmNewgnisisAfterSex01", true)
EndFunction


Function Messagebox(int num)
	(BaboMsgScript as BaboMsgManager).WindhelmNewgnisisMessagebox(num)
EndFunction

Function WNAS01()
	(BaboSexController as BaboSexControllerManager).ExhaustionIdle(PlayerActor, "Back")
	;Debug.Sendanimationevent(PlayerActor, "BaboExhaustedBack02")
	If BaboEvent.getstage() == 50
		BaboEvent.setstage(55)
	ElseIf BaboEvent.getstage() == 60
		BaboEvent.setstage(65)
	EndIf
EndFunction

Function InnkeeperSceneStandby(int istage = 92)
	(BaboSexController as BaboSexControllerManager).FadeinScene(true)
	PlayerActor.moveto(BaboEventNewGnisisTeleportMarkerB)
	(InnKeeperRef.getreference() as actor).moveto(BaboEventNewGnisisTeleportMarkerC)
	;(BaboSexController as BaboSexControllerManager).IsactorRapist((InnKeeperRef.getreference() as actor), 500, false);Innkeeper may fuck you. WIP
	;Not Ready WIP
	(BaboSexController as BaboSexControllerManager).FadeOutScene(true)
	BaboEvent.setstage(istage)
EndFunction

Function WNAS02()
	(BaboSexController as BaboSexControllerManager).FadeinScene(true)
	TeleportArgonianstoEventRoom()
	PlayerActor.moveto(BaboEventNewGnisisTeleportMarkerB)
	(InnKeeperRef.getreference() as actor).moveto(BaboEventNewGnisisTeleportMarkerC)
	(BaboSexController as BaboSexControllerManager).LosingControl()
	(BaboSexController as BaboSexControllerManager).ExhaustionIdle(PlayerActor, "Back")
	(BaboSexController as BaboSexControllerManager).FadeOutScene(true)
	if ScenePlay(11, true) == false
		BaboEvent.setstage(92)
	endif
	;BaboEventWindhelmNewgnisisSceneExtra.forcestart()
	;(BaboSexController as BaboSexControllerManager).IsactorRapist((InnKeeperRef.getreference() as actor), 500, false);Innkeeper may fuck you. WIP
	;Not Ready WIP
	;BaboEvent.setstage(90)
EndFunction

Function BacktotheClub(int istage)
	(BaboSexController as BaboSexControllerManager).FadeinScene(true)
	(InnKeeperRef.getreference() as actor).moveto(BaboEventNewGnisisInnkeeperXmarker)
	PlayerActor.moveto(BaboEventNewGnisisArgonianGathering)
	(BaboSexController as BaboSexControllerManager).FadeOutScene(true)
	BaboEvent.setstage(istage)
EndFunction

Function RecovertotheClub()
	(BaboSexController as BaboSexControllerManager).FadeinScene(true)
	(InnKeeperRef.getreference() as actor).moveto(BaboEventNewGnisisInnkeeperXmarker)
	PlayerActor.moveto(BaboEventNewGnisisArgonianGathering)
	Debug.Sendanimationevent(PlayerActor, "BaboFaintFEnd")
	(BaboSexController as BaboSexControllerManager).FadeOutScene(true)
	BaboEvent.setstage(95)
EndFunction

Function RecovertotheInn()
	(BaboSexController as BaboSexControllerManager).FadeinScene(true)
	(InnKeeperRef.getreference() as actor).moveto(BaboEventNewGnisisInnkeeperXmarker)
	PlayerActor.moveto(XmarkerHeadingPlayerInn)
	Debug.Sendanimationevent(PlayerActor, "IdleForceDefaultState")
	(BaboSexController as BaboSexControllerManager).FadeOutScene(true)
	BaboEvent.setstage(95)
EndFunction

bool Function SucceedingBoss(ReferenceAlias akref);deprecated. 
	actor akactor = ArgonianRaper01.getreference() as actor
	ArgonianRaper01.clear()
	akactor.deletewhenable()
	;This keeps failing from here with no reason.
	actor akactorB
	if akref == ArgonianRaper02
		akactorB = ArgonianRaper02.getreference() as actor
		ArgonianRaper02.clear()
	elseif akref == ArgonianRaper03
		akactorB = ArgonianRaper03.getreference() as actor
		ArgonianRaper03.clear()
	endif
	ArgonianRaper01.forcerefto(akactorB)
	Debug.notification((ArgonianRaper01.getreference()).GetBaseObject().GetName() + " is filled")
	return true
EndFunction

Function GotoKidnapEvent()
	BaboKidnapCallKeyword.SendStoryEvent()
	BaboEvent.setstage(100)
EndFunction

Function SetDefaultActors()
	(BaboSexController as BaboSexControllerManager).PurgeRapistFactions((InnKeeperRef.getreference() as actor))
EndFunction

Function DraggingtoSexMarketWithPossibility()
	int random = Utility.RandomInt(0, 99)
	If BaboSimpleSlavery.getvalue() == 1
		If Random < BaboSimpleSlaveryChance.getvalue() as int
			BaboEvent.setstage(74)
		Else
			BaboEvent.setstage(73)
		EndIf
	Else
		BaboEvent.setstage(73)
	EndIf
EndFunction