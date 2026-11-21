Scriptname BaboEventRiekling extends Quest  

Function SlaveTrust(float fvalue)
	;fvalue += BaboSlaverTrust.getvalue()
	BaboSlaverTrust.Mod(fvalue)
EndFunction

Function ModTrauma(float fvalue);Plus
	(BaboMonitorScript as BaboDiaMonitorScript).CalcRieklingTraumaExpGain(fvalue)
EndFunction

Function ModConfidence(float fvalue)
	(BaboMonitorScript as BaboDiaMonitorScript).CalcConfidenceExpGain(fvalue)
EndFunction

Function ModCorruption(float fmult)
	(BaboMonitorScript as BaboDiaMonitorScript).CalcCorruptionExpGain(fmult)
EndFunction

Function ModLewdness(float fmult)
	(BaboMonitorScript as BaboDiaMonitorScript).CalcLewdnessExpGain(fmult)
EndFunction

Function QuestStart()
	SetAllSetstoDefault()
	(BaboSexController as BaboSexControllerManager).FadeinScene(false)
	escapepossibility = 0
	PassedDay = 0
	BaboGameStartingDay.setvalue(GameDaysPassed.value);After 14 days player fail to escape and will be their sex slave for years
	BE_Thirsk_Barricade_XmarkerB.disable()
	BE_Thirsk_EntranceObstacleControl_XmarkerA.enable()
	BE_Thirsk_CruxPole_Xmarker.disable()
	BE_Thirsk_ObstacleControl_XmarkerA.enable()
	BE_Thirsk_DancingControl_Xmarker.disable()
	BE_Thirsk_FirePlaceControl_Xmarker.enable()
	BE_Thirsk_Plank_Xmarker.disable()
	BE_Thirsk_TorturePoleControl_Xmarker.disable()
	BE_Thirsk_BossRoomControl_Xmarker.disable()
	BE_Thirsk_ChairControl_Xmarker.disable()
	BE_Thirsk_Sleep_Xmarker.disable()
	PlayerRef.moveto(BE_Thirsk_MainHall_FrontOfChair_Xmarker)
	(RieklingChief.getreference() as actor).moveto(KidnapMarkerA.getreference())
	SpawnRiekling()
	ConfiscateItems()
	AllotActors()
	
	(BaboSexController as BaboSexControllerManager).UseSexlabVoice(PlayerRef, true)
	(BaboSexController as BaboSexControllerManager).losingcontrol()
	Debug.SendAnimationEvent(PlayerRef, "Babo_Kneel")
	PlayerRef.moveto(BE_Thirsk_MainHall_FrontOfChair_Xmarker)
	(BaboSexController as BaboSexControllerManager).FadeOutScene(false)

	Utility.wait(2.0)
	Registerforsingleupdate(5.0)
	;BaboEventQuest.setstage(3)

	;(BaboSexController as BaboSexControllerManager).BERieklingThirskScenePlay(1)
	;if !BaboEventRieklingThirskScene01.isplaying()
	;	BaboEventQuest.setstage(5)
	;endif
EndFunction
Quest Property BaboSceneController Auto
Event onupdate()
	if bInitialSceneStarted
		return
	endif

	Actor chief = Riekling01
	if !chief
		chief = RieklingChief.getreference() as actor
	endif

	float fWaited = 0.0
	float fTimeout = 10.0
	While fWaited < fTimeout
		Bool bPlayerReady = (PlayerRef != None) && PlayerRef.Is3DLoaded()
		Bool bChiefReady = (chief != None) && !chief.IsDisabled() && chief.Is3DLoaded()
		if bPlayerReady && bChiefReady
			bInitialSceneStarted = true
			(BaboSceneController as BaboSceneManager).EventRieklingThirskScenePlay(1, true)
			return
		endif
		Utility.Wait(0.5)
		fWaited += 0.5
	EndWhile

	; Fallback so the quest does not soft-lock if 3D never reports ready
	bInitialSceneStarted = true
	(BaboSceneController as BaboSceneManager).EventRieklingThirskScenePlay(1, true)
EndEvent

Bool Function KeyPress()
	int ichoice = BaboEventSequenceMsg.show()
	if ichoice == 0
		if BaboEventQuest.getstage() == 0
			BaboEventQuest.setstage(5)
			return true
		elseif BaboEventQuest.getstage() == 5
			BaboEventQuest.setstage(10)
			return true
		elseif BaboEventQuest.getstage() == 10
			BaboEventQuest.setstage(20)
			return true
		else
			;Debug.notification("No next sequence")
			return false
		endif
	endif
EndFunction

Function FireInitialSex()
	(BaboSexController as BaboSexControllerManager).FadeinScene(true)
	Riekling01.moveto(BE_Thirsk_BossRoomMarkerA)
	PlayerRef.moveto(BE_Thirsk_BossRoomMarkerB)
	BE_Thirsk_BossRoomControl_Xmarker.enable()
	RieklingSexActor(PlayerRef, Riekling01,"BABO_TRIInitialSex", "TRIInitialSex", true, true)
	(BaboSexController as BaboSexControllerManager).FadeOutScene(true)
EndFunction

Function InitialSexSecondRound()
	RieklingSexActor(PlayerRef, Riekling01,"BABO_TRIInitialSex02", "TRIInitialSex02", true, true)
EndFunction

Function SetAllSetstoDefault()
	BaboKidnapStateGlobal.setvalue(0)
	BaboSlaverTrust.setvalue(30);initial value
	BaboKidnapHelperRescue.setvalue(0)
	BaboKidnapEscapeResponse.setvalue(0)
	BaboKidnapScenarioe.setvalue(0)
	BaboKidnapEscapeAttempts.setvalue(0)
	BaboKidnapTrappedCount.setvalue(0)
	BaboKidnapConfiscateChestAccessGlobal.setvalue(0)
EndFunction

Function RefillRiekling()
	int iarray = RieklingMinions.length;6
	While iarray >= 0
		iarray -= 1
		actor akactor = (RieklingMinions[iarray].getreference() as actor)
		if akactor.isdead()
			RieklingMinions[iarray].clear()
			akactor.delete()
			RieklingMinions[iarray].ForceRefTo(CenterMarker.getreference().PlaceActorAtMe(BaboRieklingMinionMelee, 4))
		endif
	EndWhile
	AllotActors()
EndFunction

Function SpawnRiekling()
	RieklingMinion01.ForceRefTo(BE_Thirsk_MainHall_Xmarker01.PlaceActorAtMe(BaboRieklingMinionMelee, 4))
	RieklingMinion02.ForceRefTo(BE_Thirsk_MainHall_Xmarker02.PlaceActorAtMe(BaboRieklingMinionMelee, 4))
	RieklingMinion03.ForceRefTo(BE_Thirsk_MainHall_Xmarker03.PlaceActorAtMe(BaboRieklingMinionMelee, 4))
	RieklingMinion04.ForceRefTo(BE_Thirsk_MainHall_Xmarker04.PlaceActorAtMe(BaboRieklingMinionMelee, 4))
	RieklingMinion05.ForceRefTo(BE_Thirsk_MainHall_Xmarker05.PlaceActorAtMe(BaboRieklingMinionMelee, 4))
	RieklingGateKeeper.ForceRefTo(BE_Thirsk_MainHallCenter_XmarkerA.PlaceActorAtMe(BaboRieklingMinionMelee, 4))
EndFunction

Function AllotActors()
	if BaboDebugging.getvalue() == 1
		Debug.notification("Allot Actors")
	endif
	Riekling01 = RieklingChief.getreference() as actor
	Riekling02 = RieklingMinion01.getreference() as actor
	Riekling03 = RieklingMinion02.getreference() as actor
	Riekling04 = RieklingMinion03.getreference() as actor
	Riekling05 = RieklingMinion04.getreference() as actor
	Riekling06 = RieklingMinion05.getreference() as actor
	AkRieklingGateKeeper = RieklingGateKeeper.getreference() as actor
EndFunction

Function MainStageStart()
	(BaboSexController as BaboSexControllerManager).FadeinScene(false)
	BE_Thirsk_BossRoomControl_Xmarker.disable()
	;BE_Thirsk_ChairControl_Xmarker.disable()
	AddFatigue(playerref, true)
	(BaboSexController as BaboSexControllerManager).RecoverControl()
	gotostate("NightTime")
	(BaboSexController as BaboSexControllerManager).FadeOutScene(false)
EndFunction

;###############################################
;##################Common#######################
;###############################################

Function DeathCount()
; Null WIP
	ModTrauma(-1.0)
	ModConfidence(2.0)
	escapepossibility += 20
EndFunction

Function PlayerSpeakerMove(Bool btoplayer)
	if btoplayer
		BaboEventRieklingSpeakerXmarker.moveto(PlayerRef)
	else
		BaboEventRieklingSpeakerXmarker.moveto(BaboSoliloquyXmarkerStandByRef)
	endif
EndFunction

Function FailEscape()
	SlaveTrust(-10)
	EscapeAttemptsCount(1)
EndFunction

Function EscapeAttemptsCount(int Num)
	BaboKidnapEscapeAttempts.setvalue(BaboKidnapEscapeAttempts.getvalue() + Num)
EndFunction

Function ConfiscateItems()

	WornItemsBackup = Utility.CreateFormArray(0)
	Int wornIndex = 0
	if BaboDebugging.getvalue() == 1
		Debug.notification("Player Equipment Remove Start")
	endif
	int slotMask = 0x01
	While slotMask < 0x80000000
		Form wornItem = PlayerRef.GetWornForm(slotMask)
		If wornItem
			WornItemsBackup = Utility.ResizeFormArray(WornItemsBackup, wornIndex + 1)
			WornItemsBackup[wornIndex] = wornItem
			
			PlayerRef.RemoveItem(wornItem, 1, true, BaboEventRieklingTempChest)
			wornIndex += 1
			;if BaboDebugging.getvalue() == 1
			;	Debug.notification("wornIndex " + wornIndex)
			;endif
		EndIf
		slotMask *= 2
	EndWhile
	if BaboDebugging.getvalue() == 1
		Debug.notification("Player Equipment Removed")
	endif
	PlayerRef.RemoveAllItems(ConfiscateChest.getreference(), false, false)
	
Int i = 0
	While i < WornItemsBackup.Length
		If WornItemsBackup[i]
			BaboEventRieklingTempChest.RemoveItem(WornItemsBackup[i], 1, true, PlayerRef)
			PlayerRef.EquipItem(WornItemsBackup[i], False, True)
		EndIf
		i += 1
	EndWhile
	if BaboDebugging.getvalue() == 1
		Debug.notification("Player Equipment Equipped")
	endif
EndFunction

Function Reevaluatepackage()
	Riekling01.evaluatepackage()
	Riekling02.evaluatepackage()
	Riekling03.evaluatepackage()
	Riekling04.evaluatepackage()
	Riekling05.evaluatepackage()
	Riekling06.evaluatepackage()
	AkRieklingGateKeeper.evaluatepackage()
EndFunction

Function BedRollSleep()
	(BaboSexController as BaboSexControllerManager).SlaveryEventMessagebox(11)
EndFunction

Function RestOneHour()
	(BaboSexController as BaboSexControllerManager).LosingControl()
	(BaboSexController as BaboSexControllerManager).FadeinScene(true)
	gamehour.mod(1.0)
	playerref.moveto(VictimMarkerP.getreference())
	Debug.sendanimationevent(PlayerRef, "BaboSleeponBedRoll")
	PlayerRef.RestoreActorValue("Health", 5)
	PlayerRef.RestoreActorValue("Stamina", 10)
	(BaboSexController as BaboSexControllerManager).FadeOutScene(true)
	Utility.wait(8.0)
	(BaboSexController as BaboSexControllerManager).FadeinScene(true)
	(BaboSexController as BaboSexControllerManager).RecoverControl(true)
	(BaboSexController as BaboSexControllerManager).FadeOutScene(true)
EndFunction

Function Meditate()
	(BaboSexController as BaboSexControllerManager).LosingControl()
	(BaboSexController as BaboSexControllerManager).FadeinScene(true)
	playerref.moveto(VictimMarkerP.getreference())
	PlayerRef.RestoreActorValue("Magicka", 15)
	Debug.sendanimationevent(PlayerRef, "BaboMeditate")
	gamehour.mod(0.5)
	(BaboSexController as BaboSexControllerManager).FadeOutScene(true)
	Utility.wait(8.0)
	(BaboSexController as BaboSexControllerManager).FadeinScene(true)
	gamehour.mod(0.5)
	(BaboSexController as BaboSexControllerManager).RecoverControl(true)
	(BaboSexController as BaboSexControllerManager).FadeOutScene(true)
	;Debug.sendanimationevent(PlayerRef, "IdleForceDefaultState")
	;Debug.sendanimationevent(PlayerRef, "IdleStop");Test
EndFunction

Function SexStart()
	;Null
EndFunction

Function SexRoundtwo()

EndFunction

Function SexRoundthree()

EndFunction

Function SexEnd()
	;Null
EndFunction

Function RieklingThreesomeRape(actor akactor1, actor akactor2, actor akactor3, string EventDummy = "", string EventName = "")
	(BaboSexController as BaboSexControllerManager).SexCustomactor(akactor1, akactor2, akactor3, None, None, "Aggressive", "CCF", "Threesome", True, EventDummy, EventName, true)
EndFunction

bool Function CheckMorning()
	if gamehour.value >= 6.0
		return true
	else
		return false
	endif	
EndFunction

Function AddFatigue(actor akactor, Bool PerkAdd)
if PerkAdd
	akactor.AddPerk(BaboAwfullyFatiguedPerk)
else
	akactor.RemovePerk(BaboAwfullyFatiguedPerk)
endif
EndFunction

int Function RieklingSchedulePattern()
;0 - nothing happens 1~2 - Chief sex 3~4 - Minion Approach 5 - Minion Approach Danger
	int randomi = Utility.randomint(0, 3)
	BaboEventRieklingPatternGlobal.setvalue(randomi)
	return randomi
EndFunction

Function BarricadeDoorChoice()
	int choice = BaboKidnapBarricadeDoorOptionMessage.Show()
	int chance = Utility.randomint(0, 100)
	if (choice == 0)
		if chance < 40;fail
			;Sound Play wip
			(BaboSexController as BaboSexControllerManager).SlaveryEventMessagebox(20)
			gotostate("NightTimeGateDetected")
		else;success
			OpenBarricade(true)
			(BaboSexController as BaboSexControllerManager).SlaveryEventMessagebox(18)
		endif
	elseif (choice == 1)
		OpenBarricade(true)
		(BaboSexController as BaboSexControllerManager).SlaveryEventMessagebox(18)
	elseif (choice == 2)
		OpenBarricade(true)
		(BaboSexController as BaboSexControllerManager).SlaveryEventMessagebox(18)
	endif
EndFunction

Function OpenBarricade(Bool bclear)
	if bclear
		(CageDoorA as BaboKidnapBarricadeActivateScript).StateSwitch(true)
	else
		(CageDoorA as BaboKidnapBarricadeActivateScript).StateSwitch(false)
	endif
	
	(BaboSexController as BaboSexControllerManager).FadeinScene(true)
	
	if bclear
		BE_Thirsk_Barricade_Xmarker.disable()
		BE_Thirsk_Barricade_XmarkerB.enable()
	else
		BE_Thirsk_Barricade_Xmarker.enable()
		BE_Thirsk_Barricade_XmarkerB.disable()
	endif
	;gotostate("NightTimeGateOpen")
	(BaboSexController as BaboSexControllerManager).FadeOutScene(true)
EndFunction

Function ChooseSelection()
;Null
EndFunction

Function ChooseSelectionEnd()
;Null
EndFunction

Function CombatStart()
	int iarray = RieklingMinions.length
	While iarray >= 0
	iarray -= 1
		(BaboSexController as BaboSexControllerManager).ActorCombatStart(RieklingMinions[iarray].getreference() as actor)
	EndWhile
EndFunction

Function RieklingSexActor(Actor Actor01, Actor Actor02, string EventDummy = "", string EventName = "", bool bevent = false, bool brape = false)
	SexCountRiekling.SetValue(SexCountRiekling.GetValue() + 1)
	actor[] Sexactor = new actor[1]
	Sexactor[0] = Actor02
	(BaboSexController as BaboSexControllerManager).AddHadSexFaction(Sexactor, false)
	(BaboSexController as BaboSexControllerManager).SexCustomactor(Actor01, Actor02, None, None, None, "Riekling", "Vaginal", "CF", bevent, EventDummy, EventName, brape)
EndFunction

Function ProvidePlacefood()
	float ftrust = Baboslavertrust.getvalue()
	BaboKidnapLastFoodTime.setvalue(GameDaysPassed.getvalue())
	
	if ftrust < 30
		PlaceFoodSuspicious(0, 1, true, FoodMarker);Semen
	elseif ftrust < 40
		PlaceFoodTrash(0, 1, false, FoodMarker);there's one menu
	elseif ftrust < 50
		PlaceFoodCheap(0, 1, false, FoodMarker)
	elseif ftrust < 60
		PlaceFoodCheap(1, 2, false, FoodMarker)
	elseif ftrust < 70
		PlaceFoodCheap(0, 2, true, FoodMarker)
	elseif ftrust < 100
		PlaceFoodCheap(0, 1, true, FoodMarker)
		PlaceFoodSoup(0, 1, true, FoodMarker)
	endif
EndFunction

Function PlaceFoodSuspicious(int Menu, int Times, Bool RandomMenu = false, referencealias placemarker)
int i = 0
While i < Times
if RandomMenu
	Menu = Utility.randomint(0, BaboEdibleSuspiciousFormList.GetSize() - 1)
endif
	placemarker.getreference().Placeatme(BaboEdibleSuspiciousFormList.getat(Menu), 1)
	Utility.wait(0.5)
i += 1
endWhile
EndFunction

Function PlaceFoodSoup(int Menu, int Times, Bool RandomMenu = false, referencealias placemarker)
int i = 0
While i < Times
if RandomMenu
	Menu = Utility.randomint(0, BaboEdibleSoupFormList.GetSize() - 1)
endif
	placemarker.getreference().Placeatme(BaboEdibleSoupFormList.getat(Menu), 1)
	Utility.wait(0.5)
i += 1
endWhile
EndFunction

Function PlaceFoodTrash(int Menu, int Times, Bool RandomMenu = false, referencealias placemarker)
int i = 0
While i < Times
if RandomMenu
	Menu = Utility.randomint(0, BaboEdibleTrashFormList.GetSize() - 1)
endif
	placemarker.getreference().Placeatme(BaboEdibleTrashFormList.getat(Menu), 1)
	Utility.wait(0.5)
i += 1
endWhile
EndFunction

Function PlaceFoodCheap(int Menu, int Times, Bool RandomMenu = false, referencealias placemarker)
int i = 0
While i < Times
if RandomMenu
	Menu = Utility.randomint(0, BaboEdibleCheapFormList.GetSize() - 1)
endif
	placemarker.getreference().Placeatme(BaboEdibleCheapFormList.getat(Menu), 1)
	Utility.wait(0.5)
i += 1
endWhile
EndFunction

Function PlaceDrink(int Menu, int Times, Bool RandomMenu = false, referencealias placemarker)
int i = 0
While i < Times
if RandomMenu
	Menu = Utility.randomint(0, BaboEdibleWaterFormList.GetSize() - 1)
endif
	placemarker.getreference().Placeatme(BaboEdibleWaterFormList.getat(Menu), 1)
	Utility.wait(0.5)
i += 1
endWhile
EndFunction

Function Restincross()
;Null
EndFunction

Function BacktoHome()
	PlayerRef.moveto(BE_Thirsk_SkaalVillage_Xmarker)
	Utility.Wait(3.0)
	(BaboSexController as BaboSexControllerManager).RecoverControl(false)
	BaboEventQuest.setstage(255)
EndFunction

Function Captured();wear yoke
	(BaboSexController as BaboSexControllerManager).FadeinScene(false)
	PlayerRef.moveto(BE_Thirsk_ThirskExterior_XmarkerP)
	Riekling02.moveto(BE_Thirsk_ThirskExterior_XmarkerA)
	Riekling03.moveto(BE_Thirsk_ThirskExterior_XmarkerB)
	Riekling04.moveto(BE_Thirsk_ThirskExterior_XmarkerC)
	Riekling05.moveto(BE_Thirsk_ThirskExterior_XmarkerD)
	EquipRestraints(true)
	(BaboSexController as BaboSexControllerManager).FadeOutScene(false)
	;scene play
EndFunction

Function RemoveTargetArmor(Actor target, Keyword TargetArmor, Bool RemoveSwitch)
	(BaboStealingScript as BaboStealingArmorScript).SimpleFindandMoveArmor(target, ConfiscateChest.getreference(), TargetArmor, RemoveSwitch)
EndFunction

Function RemoveTargetCuirass(Actor target, Bool RemoveSwitch)
	Armor thisArmor = target.GetWornForm(0x00000004) as Armor
	Target.UnequipItem(thisArmor)
	if RemoveSwitch
		Target.RemoveItem(thisArmor, 1, false, ConfiscateChest.getreference())
	endif
EndFunction

Function RemoveAllthePanties(Actor target, Bool RemoveSwitch)
	(BaboStealingScript as BaboStealingArmorScript).SimpleFindandMoveKeyword(target, ConfiscateChest.getreference(), BaboPantiesFormList, RemoveSwitch)
EndFunction

Function RemoveAlltheSkirts(Actor target, Bool RemoveSwitch)
	(BaboStealingScript as BaboStealingArmorScript).SimpleFindandMoveKeyword(target, ConfiscateChest.getreference(), BaboSkirtFormList, RemoveSwitch)
EndFunction

Function CalvarlyRescue()
	;Null
EndFunction

Function EndDay()
	(BaboSexController as BaboSexControllerManager).FadeinScene(false)
	;Maybe you go to the base? WIP
	(BaboMsgScript as BaboMsgManager).RieklingSlaveryEventMessagebox(20)
	int ichoice = BaboEventRieklingEndDayMsg.show()
	Float hours
	if ichoice == 0; 3years
		hours = 3 * 365.0 * 24.0
	elseif ichoice == 1; 2years
		hours = 2 * 365.0 * 24.0
	elseif ichoice == 2; 1year
		hours = 365.0 * 24.0
	elseif ichoice == 3; 6months
		hours = 180.0 * 24.0
	elseif ichoice == 4; 3months
		hours = 92.0 * 24.0
	elseif ichoice == 5; 1month
		hours = 31.0 * 24.0
	endif
	if BaboTimeLapseGlobal.GetValue() == 1 && BaboTimeLapseWarningMsg.Show() == 0
		GameHour.Mod(hours)
	endif
	
	(BaboSexController as BaboSexControllerManager).AddTraumaPerk("Riekling", true)
	PlayerRef.moveto(BE_EventInn_Xmarker)

	(BaboSexController as BaboSexControllerManager).FadeoutScene(false)
EndFunction

Function Addtitle(bool brescued)
	if brescued
		BRMQuest.AddingTitletoPlayerRef(BaboFactionRieklingPublicToiletTitle)
		BRMQuest.SetTitleGlobal(BaboGlobalRieklingPublicToiletTitle, 1)
	else
		BRMQuest.AddingTitletoPlayerRef(BaboFactionRieklingThirskFuckToyTitle)
		BRMQuest.SetTitleGlobal(BaboGlobalRieklingThirskFuckToyTitle, 1)
	endif
EndFunction


Function DogejaAnimationPlay()
	Debug.SendAnimationEvent(PlayerRef, "Babo_Dogeja")
	(BaboSexController as BaboSexControllerManager).PivotalMove(Riekling01, BE_Thirsk_MainHall_FrontOfChair_Xmarker, "riekling", 65, -20, 50, "Babo_Riekling_Crouch_leer_masturbation", true, true)
	(BaboSexController as BaboSexControllerManager).PivotalMove(Riekling02, BE_Thirsk_MainHall_FrontOfChair_Xmarker, "riekling", 0, -65, 0, "Babo_Riekling_Dogeja_LyingLeerB", true, true)
	(BaboSexController as BaboSexControllerManager).PivotalMove(Riekling03, BE_Thirsk_MainHall_FrontOfChair_Xmarker, "riekling", -65, 0, 0, "Babo_Riekling_Dogeja_Pair", true, true)
	PlayerRef.moveto(BE_Thirsk_MainHall_FrontOfChair_Xmarker)
EndFunction

Function WakeupBoxReady()
	(BE_Thirsk_SleepActivatorA as BaboEventRieklingTriggerActivator).Reset()
	(BE_Thirsk_SleepActivatorA2 as BaboEventRieklingTriggerActivator).Reset()
	(BE_Thirsk_SleepActivatorB as BaboEventRieklingTriggerActivator).Reset()
	(BE_Thirsk_SleepActivatorC as BaboEventRieklingTriggerActivator).Reset()
	(BE_Thirsk_SleepActivatorD as BaboEventRieklingTriggerActivator).Reset()
	(BE_Thirsk_SleepActivatorE as BaboEventRieklingTriggerActivator).Reset()
	(BE_Thirsk_SleepActivatorF as BaboEventRieklingTriggerActivator).Reset()
EndFunction

Function WakeupActor(int inum)
	if inum == 1
		Riekling01.activate(Riekling01)
	elseif inum == 2
		Riekling02.activate(Riekling02)
	elseif inum == 3
		Riekling03.activate(Riekling03)
	elseif inum == 4
		Riekling04.activate(Riekling04)
	elseif inum == 5
		Riekling05.activate(Riekling05)
	elseif inum == 6
		Riekling06.activate(Riekling06)
	elseif inum == 7
		AkRieklingGateKeeper.activate(AkRieklingGateKeeper)
	endif
EndFunction

;Babo_Dogeja
;Babo_Kneel
;Babo_Kneel_Naked

;Babo_Riekling_Dogeja_LyingLeer Y -65
;Babo_Riekling_Dogeja_LyingLeerB
;Babo_Riekling_Dogeja_Pair X -65
;Babo_Riekling_Crouch_leer X 65 Y -20 R 50
;Babo_Riekling_Crouch_leer_masturbation

;PairedMotionCreature


Function BacktoThirsk()
	gotostate("KneelBeforeChief")
EndFunction

Function OnLOSRegister()
	;BaboKidnapTiedUp.setvalue(0);You are not tied
	int iarray = RieklingMinions.length
		While iarray >= 0
		iarray -= 1
			RegisterForSingleLOSGain(RieklingMinions[iarray].getreference() as actor, PlayerRef)
		EndWhile
EndFunction

Function UnLOSRegister()
	int iarray = RieklingMinions.length
		While iarray >= 0
		iarray -= 1
			UnregisterForLOS(RieklingMinions[iarray].getreference() as actor, PlayerRef)
		EndWhile
EndFunction

Bool Function ChiefDecision();if true, you are saved, if false you go kneeld
	int irandom = Utility.randomint(0, 100)
	irandom += BaboSlaverTrust.value as int
	if irandom > 80
		return true
	else
		return false
	endif
EndFunction

Event OnGainLOS(Actor akViewer, ObjectReference akTarget)
;Null
EndEvent

Event OnSleepStart(float afSleepStartTime, float afDesiredSleepEndTime)
endEvent

bool Function CheckDays()
float fdaypassed = GameDaysPassed.value - BaboGameStartingDay.value
if fdaypassed >= 14.0
	return true
else
	return false
endif
EndFunction

;###############################################
;###############################################
;###############################################

;BaboKidnapStateGlobal
;0 - NightTime
;1 - Event happens WIP
;2 - NightTimeGateDetected
;3 - NightTimeGateOpen - Patrol
;4 - NightTimeGateOpen - Sleep
;5 - KneelBeforeChief - Different situations depending on trust value
;6 - NightTimeCrux
;7 - Punish - Torturepole - WIP

;20 - DayTime Nothing happens
;21 - DayEvent Minion Approach
;22 - DayEvent Minion Approach No guard
;23 - Riekling Chief Sex

;30 - Final Day

;(BaboSexController as BaboSexControllerManager).UnEquipCumItem(PlayerRef)

bool bRest
bool bMeditation

State NightTime
;What if player just waits until the sun rises? wip

Event Onbeginstate()

	bReadytoRest = true
	bRest = false
	bMeditation = false
	
	BaboKidnapStateGlobal.setvalue(0)
	Reevaluatepackage()
	GameHour.SetValue(fNighttime)
	BE_Thirsk_FirePlaceControl_Xmarker.enable()
	BE_Thirsk_Plank_Xmarker.disable()
	BE_Thirsk_TorturePoleControl_Xmarker.disable()
	BE_Thirsk_Barricade_Xmarker.enable()
	BE_Thirsk_Barricade_XmarkerB.disable()
	OpenBarricade(false)
	BE_Thirsk_BossRoomControl_Xmarker.disable()
	BE_Thirsk_ChairControl_Xmarker.disable()
	PlayerRef.moveto(FurnitureSafeALink.getreference())
	BaboEventRieklingNightMsg.show()
EndEvent

Function BedRollSleep()
	if !bReadytoRest
		return
	endif
	int choice = BaboKidnapSleepOptionMessage.Show()
	if (choice == 0);Sleep
		RegisterForSleep()
		FurnitureSafeA.getreference().activate(PlayerRef);Sleep
	elseif (choice == 1)
		if bRest
			(BaboSexController as BaboSexControllerManager).SlaveryEventMessagebox(21)
		else
			RestOneHour()
		endif
	elseif (choice == 2)
		if bMeditation
			(BaboSexController as BaboSexControllerManager).SlaveryEventMessagebox(21)
		else
			Meditate()
		endif
	endif
EndFunction

Function RestOneHour()
	if bReadytoRest
		bReadytoRest = false
		bRest = true
		(BaboSexController as BaboSexControllerManager).LosingControl()
		(BaboSexController as BaboSexControllerManager).FadeinScene(true)
		Reevaluatepackage()
		gamehour.mod(1.0)
		playerref.moveto(FurnitureSafeALink.getreference())
		Debug.sendanimationevent(PlayerRef, "BaboSleeponBedRoll")
		PlayerRef.RestoreActorValue("Health", 5)
		PlayerRef.RestoreActorValue("Stamina", 10)
		(BaboSexController as BaboSexControllerManager).FadeOutScene(true)
		Utility.wait(8.0)
		(BaboSexController as BaboSexControllerManager).FadeinScene(true)
		(BaboSexController as BaboSexControllerManager).RecoverControl(true)
		(BaboSexController as BaboSexControllerManager).FadeOutScene(true)
		(BaboSexController as BaboSexControllerManager).SlaveryEventMessagebox(13)
		bReadytoRest = true
	endif
EndFunction

Function Meditate()
	if bReadytoRest
		bReadytoRest = false
		bMeditation = true
		(BaboSexController as BaboSexControllerManager).LosingControl()
		(BaboSexController as BaboSexControllerManager).FadeinScene(true)
		playerref.moveto(FurnitureSafeALink.getreference())
		PlayerRef.RestoreActorValue("Magicka", 15)
		Debug.sendanimationevent(PlayerRef, "BaboMeditate")
		Reevaluatepackage()
		gamehour.mod(0.5)
		(BaboSexController as BaboSexControllerManager).FadeOutScene(true)
		Utility.wait(8.0)
		(BaboSexController as BaboSexControllerManager).FadeinScene(true)
		gamehour.mod(0.5)
		(BaboSexController as BaboSexControllerManager).RecoverControl(true)
		(BaboSexController as BaboSexControllerManager).FadeOutScene(true)
		bReadytoRest = true
	endif
EndFunction

Event OnSleepStart(float afSleepStartTime, float afDesiredSleepEndTime)
	Float SleepTime = (afDesiredSleepEndTime - afSleepStartTime) * 24
	if sleeptime > 8.0
		sleeptime = 8.0
	endif
	Utility.WaitMenuMode(Sleeptime)
	PlayerRef.MoveTo(PlayerRef)
	int ichance = Utility.randomint(0, 100 + (BaboSlaverTrust.value as int))
	if ichance > 30
		gotostate("SkipTheNight")
	else
		gotostate("SkipTheNight")
		;Riekling rape chance wip
	endif
	
endEvent

Function OpenBarricade(Bool bclear)
	(BaboSexController as BaboSexControllerManager).FadeinScene(true)
	if bclear
		(CageDoorA as BaboKidnapBarricadeActivateScript).StateSwitch(true)
		BE_Thirsk_Barricade_Xmarker.disable()
		BE_Thirsk_Barricade_XmarkerB.enable()
		gotostate("NightTimeGateOpen")
	else
		BE_Thirsk_Barricade_Xmarker.enable()
		BE_Thirsk_Barricade_XmarkerB.disable()
		(CageDoorA as BaboKidnapBarricadeActivateScript).StateSwitch(false)
	endif
	(BaboSexController as BaboSexControllerManager).FadeOutScene(true)
EndFunction

EndState

State NightTimeNoEscape
;What if player just waits until the sun rises? wip
;Get assaulted during sleep wip
Event Onbeginstate()
	bReadytoRest = true
	(BaboSexController as BaboSexControllerManager).FadeinScene(true)
	(BaboSexController as BaboSexControllerManager).LosingControl()
	;BaboKidnapStateGlobal.setvalue(0)
	BE_Thirsk_Barricade_Xmarker.enable()
	BE_Thirsk_Barricade_XmarkerB.disable()
	PlayerRef.moveto(FurnitureSafeALink.getreference())
	(BaboSexController as BaboSexControllerManager).RecoverControl()
	(BaboSexController as BaboSexControllerManager).FadeOutScene(true)
EndEvent

Function BarricadeDoorChoice()
	;Nothing
EndFunction

Function BedRollSleep()
	if !bReadytoRest
		return
	endif
	int choice = BaboKidnapSleepOptionMessage.Show()
	if (choice == 0);Sleep
		RegisterForSleep()
		FurnitureSafeA.getreference().activate(PlayerRef);Sleep
	elseif (choice == 1)
		if bRest
			(BaboSexController as BaboSexControllerManager).SlaveryEventMessagebox(21)
		else
			RestOneHour()
		endif
	elseif (choice == 2)
		if bMeditation
			(BaboSexController as BaboSexControllerManager).SlaveryEventMessagebox(21)
		else
			Meditate()
		endif
	endif
EndFunction

Function RestOneHour()
	if bReadytoRest
		bReadytoRest = false
		bRest = true
		(BaboSexController as BaboSexControllerManager).LosingControl()
		(BaboSexController as BaboSexControllerManager).FadeinScene(true)
		gamehour.mod(1.0)
		playerref.moveto(FurnitureSafeALink.getreference())
		Debug.sendanimationevent(PlayerRef, "BaboSleeponBedRoll")
		PlayerRef.RestoreActorValue("Health", 5)
		PlayerRef.RestoreActorValue("Stamina", 10)
		(BaboSexController as BaboSexControllerManager).FadeOutScene(true)
		Utility.wait(8.0)
		(BaboSexController as BaboSexControllerManager).FadeinScene(true)
		(BaboSexController as BaboSexControllerManager).RecoverControl(true)
		(BaboSexController as BaboSexControllerManager).FadeOutScene(true)
		(BaboSexController as BaboSexControllerManager).SlaveryEventMessagebox(13)
		bReadytoRest = true
	endif
EndFunction

Function Meditate()
	if bReadytoRest
		bReadytoRest = false
		bMeditation = true
		(BaboSexController as BaboSexControllerManager).LosingControl()
		(BaboSexController as BaboSexControllerManager).FadeinScene(true)
		playerref.moveto(FurnitureSafeALink.getreference())
		PlayerRef.RestoreActorValue("Magicka", 15)
		Debug.sendanimationevent(PlayerRef, "BaboMeditate")
		gamehour.mod(0.5)
		(BaboSexController as BaboSexControllerManager).FadeOutScene(true)
		Utility.wait(8.0)
		(BaboSexController as BaboSexControllerManager).FadeinScene(true)
		gamehour.mod(0.5)
		(BaboSexController as BaboSexControllerManager).RecoverControl(true)
		(BaboSexController as BaboSexControllerManager).FadeOutScene(true)
		bReadytoRest = true
	endif
EndFunction

Event OnSleepStart(float afSleepStartTime, float afDesiredSleepEndTime)
	Float SleepTime = (afDesiredSleepEndTime - afSleepStartTime) * 24
	if sleeptime > 8.0
		sleeptime = 8.0
	endif
	Utility.WaitMenuMode(Sleeptime)
	PlayerRef.MoveTo(PlayerRef)
	int ichance = Utility.randomint(0, 100 + (BaboSlaverTrust.value as int))
	if ichance > 30
		gotostate("SkipTheNight")
	else
		gotostate("SkipTheNight")
		;Riekling rape chance wip
	endif
	
endEvent

EndState

State NightTimeCrux

	Event Onbeginstate()
		(BaboSexController as BaboSexControllerManager).FadeinScene(false)
		FTimetopass = 0.0
		BaboKidnapStateGlobal.setvalue(6)
		Reevaluatepackage()
		GameHour.SetValue(fNighttime)
		BE_Thirsk_ObstacleControl_XmarkerA.disable()
		BE_Thirsk_CruxPole_Xmarker.disable()
		BE_Thirsk_FirePlaceControl_Xmarker.enable()
		BE_Thirsk_Plank_Xmarker.disable()
		BE_Thirsk_TorturePoleControl_Xmarker.disable()
		BE_Thirsk_Barricade_Xmarker.enable()
		BE_Thirsk_Barricade_XmarkerB.disable()
		BE_Thirsk_BossRoomControl_Xmarker.disable()
		
		BE_Thirsk_ChairControl_Xmarker.enable()
		PlayerRef.moveto(RestrainMarker.getreference())
		(BaboSexController as BaboSexControllerManager).LosingControl()
		Debug.SendAnimationEvent(PlayerRef, "BaboDia_CrossCrux02")
		(BaboSexController as BaboSexControllerManager).FadeoutScene(false)
		if (BaboSceneController as BaboSceneManager).EventRieklingThirskScenePlay(3, true) == false
			ChooseSelection()
		endif
		;BaboEventRieklingThirskScene03.forceStart()
	EndEvent


	Function ChooseSelection()
		(BaboSexController as BaboSexControllerManager).LosingControl()

		;Debug.SendAnimationEvent(PlayerRef, "BaboDia_CrossCrux01")
		(BaboSexController as BaboSexControllerManager).FadeinScene(true)
		PlayerRef.DamageActorValue("Magicka", 5)
		PlayerRef.DamageActorValue("Stamina", 5)
		;speed slow
		gamehour.mod(12.0)
		
		(BaboSexController as BaboSexControllerManager).FadeoutScene(true)
		(BaboMsgScript as BaboMsgManager).RieklingSlaveryEventMessagebox(17)
		Utility.wait(12.0)
		
		
		Restincross()
		;BE_Thirsk_TorturePoleControl_Xmarker.enable()
		;int ichoice = BaboEventRieklingCruxMsg.show(); WIP
		;if ichoice == 1
		;	(BaboSexController as BaboSexControllerManager).FadeinScene(true)
		;	
		;elseif ichoice == 2
		;
		;else
		;
		;endif
	EndFunction
	
	Function SexStart()
		(BaboSexController as BaboSexControllerManager).FadeinScene(true)
		int ichoice = BaboEventRieklingCruxSexMsg.show()
		if ichoice == 0
			BE_Thirsk_CruxPole_Xmarker.enable()
			Playerref.moveto(BaboDia_RieklingCrossCruxLookD)
			Riekling01.moveto(BaboDia_RieklingCrossCruxLookD)
			Riekling02.moveto(BaboDia_RieklingCrossCruxLookD)
			(BaboSexController as BaboSexControllerManager).SexCustomactor(playerref, Riekling02, Riekling03, None, None, "Riekling", "Vaginal", "CCF", true, "BABO_TRIThreesomeState6", "TRIThreesomeState6", true)
			(BaboSexController as BaboSexControllerManager).FadeoutScene(true)
			return
		else
			(BaboSexController as BaboSexControllerManager).UseSexlabVoice(PlayerRef, true)
			(BaboSexController as BaboSexControllerManager).FHUInflationEvent(Riekling02, playerref, true, Utility.randomint(1, 4), 0.15, 1.0, "")
			ModCorruption(1.0)
			gamehour.mod(1.0)
			Utility.wait(2.0)
			(BaboSexController as BaboSexControllerManager).UseSexlabVoice(PlayerRef, true)
			(BaboSexController as BaboSexControllerManager).FHUInflationEvent(Riekling03, playerref, true, Utility.randomint(1, 4), 0.15, 1.0, "")
			gamehour.mod(1.0)
			Utility.wait(2.0)
			Debug.SendAnimationEvent(PlayerRef, "BaboDia_CrossCrux01")
			(BaboSexController as BaboSexControllerManager).FadeoutScene(true)
			(BaboMsgScript as BaboMsgManager).RieklingSlaveryEventMessagebox(19)
			Utility.wait(10.0)
			gamehour.mod(1.0)
			Utility.wait(10.0)
			SexRoundTwo()
		endif
	EndFunction

	Function SexRoundTwo()
		(BaboSexController as BaboSexControllerManager).FadeinScene(true)
		PlayerRef.moveto(RestrainMarker.getreference())
		Debug.SendAnimationEvent(PlayerRef, "BaboDia_CrossCrux01")
		gamehour.mod(36.0)
		(BaboSexController as BaboSexControllerManager).FadeoutScene(true)
		Riekling01.moveto(BaboDia_RieklingCrossCruxLookD)
		Riekling02.moveto(BaboDia_RieklingCrossCruxLookD)
		
		int ichoice = BaboEventRieklingCruxSexRound2Msg.show()
		if ichoice == 0
			(BaboSexController as BaboSexControllerManager).FadeinScene(true)
			BE_Thirsk_CruxPole_Xmarker.enable()
			Playerref.moveto(BaboDia_RieklingCrossCruxLookD)
			Riekling01.moveto(BaboDia_RieklingCrossCruxLookD)
			Riekling02.moveto(BaboDia_RieklingCrossCruxLookD)
			(BaboSexController as BaboSexControllerManager).SexCustomactor(playerref, Riekling02, Riekling03, None, None, "Riekling", "Vaginal", "CCF", true, "BABO_TRIThreesomeState6B", "TRIThreesomeState6B", true)
			(BaboSexController as BaboSexControllerManager).FadeoutScene(true)
			return
		else
			(BaboSexController as BaboSexControllerManager).FadeinScene(true)
			(BaboSexController as BaboSexControllerManager).UseSexlabVoice(PlayerRef, true)
			(BaboSexController as BaboSexControllerManager).FHUInflationEvent(Riekling02, playerref, true, Utility.randomint(1, 4), 0.15, 1.0, "")
			ModCorruption(1.0)
			gamehour.mod(1.0)
			Utility.wait(2.0)
			(BaboSexController as BaboSexControllerManager).UseSexlabVoice(PlayerRef, true)
			(BaboSexController as BaboSexControllerManager).FHUInflationEvent(Riekling03, playerref, true, Utility.randomint(1, 4), 0.15, 1.0, "")
			gamehour.mod(1.0)
			Utility.wait(2.0)
			(BaboSexController as BaboSexControllerManager).UseSexlabVoice(PlayerRef, true)
			(BaboSexController as BaboSexControllerManager).FHUInflationEvent(Riekling04, playerref, true, Utility.randomint(1, 4), 0.15, 1.0, "")
			gamehour.mod(1.0)
			Utility.wait(2.0)
			(BaboSexController as BaboSexControllerManager).UseSexlabVoice(PlayerRef, true)
			(BaboSexController as BaboSexControllerManager).FHUInflationEvent(Riekling05, playerref, true, Utility.randomint(1, 4), 0.15, 1.0, "")
			gamehour.mod(1.0)
			Utility.wait(2.0)
			Debug.SendAnimationEvent(PlayerRef, "BaboDia_CrossCrux01")
			(BaboSexController as BaboSexControllerManager).FadeoutScene(true)
			(BaboMsgScript as BaboMsgManager).BadRieklingDuelMessagebox(19)
		endif
	EndFunction
	
	Function SexRoundThree()
		(BaboSexController as BaboSexControllerManager).SexCustomactor(playerref, Riekling02, Riekling03, None, None, "Riekling", "Vaginal", "CCF", true, "BABO_TRIThreesomeState6C", "TRIThreesomeState6C", true)
	EndFunction
	
	Function Restincross()
		(BaboSexController as BaboSexControllerManager).LosingControl()

		;Debug.SendAnimationEvent(PlayerRef, "BaboDia_CrossCrux01")
		(BaboSexController as BaboSexControllerManager).FadeinScene(true)
		float fhealth = playerref.GetActorValue("Health")
		if fhealth > 200
			PlayerRef.DamageActorValue("Health", 100)
		elseif fhealth > 100
			PlayerRef.DamageActorValue("Health", 50)
		elseif fhealth > 50
			PlayerRef.DamageActorValue("Health", 35)
		elseif fhealth > 30
			PlayerRef.DamageActorValue("Health", 20)
		endif
		;Skip 3 days damage stamina health magicka
		PlayerRef.DamageActorValue("Magicka", 45)
		PlayerRef.DamageActorValue("Stamina", 60)
		;speed slow
		GameHour.Mod(60.0)
		(BaboMsgScript as BaboMsgManager).RieklingSlaveryEventMessagebox(18)

		playerref.moveto(FurnitureSafeALink.getreference())
		(BaboSexController as BaboSexControllerManager).ExhaustionIdle(playerref, "Front")
		gotostate("NightTime")
		(BaboSexController as BaboSexControllerManager).RecoverControl(true)
		(BaboSexController as BaboSexControllerManager).FadeoutScene(true)
	EndFunction
EndState

State DayTime;Crossroads
	Event Onbeginstate()
		if CheckDays()
			gotostate("FinalDay")
			return
		endif
		PassedDay += 1;wip - after 5 days, Give up choice appears
		bReadytoRest = true
		bRest = false
		bMeditation = false
		
		BE_Thirsk_Barricade_Xmarker.enable()
		BE_Thirsk_Barricade_XmarkerB.disable()
		BaboKidnapStateGlobal.setvalue(20)
		Reevaluatepackage()
		ProvidePlacefood()
		AkRieklingGateKeeper.moveto(KidnapMarkerF.getreference())
		PlayerRef.moveto(VictimMarkerP.getreference())
		BaboEventRieklingDayMsg.show()
	EndEvent


	Function BarricadeDoorChoice()
		int ichoice = BaboEventRieklingSkipDayMsg.show()
		if ichoice == 0
			int ipattern = RieklingSchedulePattern()
			if ipattern >= 1 && ipattern <= 2
				gotostate("DayServeChief")
			elseif ipattern >= 3 && ipattern <= 4
				if AkRieklingGateKeeper.isdead()
					gotostate("DayMinionApproachNoGuard")
				else
					gotostate("DayMinionApproach")
				endif
			elseif ipattern == 5; - possible rape event
				gotostate("DayMinionApproachNoGuard")
			else
				gotostate("DayTimeNothing")
			endif
		endif
	EndFunction

	Function BedRollSleep()
		if !bReadytoRest
			return
		endif
		int choice = BaboKidnapSleepOptionMessage.Show()
		if (choice == 0);Sleep
			(BaboSexController as BaboSexControllerManager).SlaveryEventMessagebox(11)
		elseif (choice == 1)
			if bRest
				(BaboSexController as BaboSexControllerManager).SlaveryEventMessagebox(21)
			else
				RestOneHour()
			endif
		elseif (choice == 2)
			if bMeditation
				(BaboSexController as BaboSexControllerManager).SlaveryEventMessagebox(21)
			else
				Meditate()
			endif
		endif
	EndFunction
	
	Function RestOneHour()
		if bReadytoRest
			bReadytoRest = false
			bRest = true
			(BaboSexController as BaboSexControllerManager).LosingControl()
			(BaboSexController as BaboSexControllerManager).FadeinScene(true)
			Reevaluatepackage()
			gamehour.mod(1.0)
			playerref.moveto(FurnitureSafeALink.getreference())
			Debug.sendanimationevent(PlayerRef, "BaboSleeponBedRoll")
			PlayerRef.RestoreActorValue("Health", 5)
			PlayerRef.RestoreActorValue("Stamina", 10)
			(BaboSexController as BaboSexControllerManager).FadeOutScene(true)
			Utility.wait(8.0)
			(BaboSexController as BaboSexControllerManager).FadeinScene(true)
			(BaboSexController as BaboSexControllerManager).RecoverControl(true)
			(BaboSexController as BaboSexControllerManager).FadeOutScene(true)
			(BaboSexController as BaboSexControllerManager).SlaveryEventMessagebox(13)
			bReadytoRest = true
		endif
	EndFunction

	Function Meditate()
		if bReadytoRest
			bReadytoRest = false
			bMeditation = true
			(BaboSexController as BaboSexControllerManager).LosingControl()
			(BaboSexController as BaboSexControllerManager).FadeinScene(true)
			playerref.moveto(FurnitureSafeALink.getreference())
			PlayerRef.RestoreActorValue("Magicka", 15)
			Debug.sendanimationevent(PlayerRef, "BaboMeditate")
			Reevaluatepackage()
			gamehour.mod(0.5)
			(BaboSexController as BaboSexControllerManager).FadeOutScene(true)
			Utility.wait(8.0)
			(BaboSexController as BaboSexControllerManager).FadeinScene(true)
			gamehour.mod(0.5)
			(BaboSexController as BaboSexControllerManager).RecoverControl(true)
			(BaboSexController as BaboSexControllerManager).FadeOutScene(true)
			bReadytoRest = true
		endif
	EndFunction
	
EndState

State DayServeChief
	Event Onbeginstate()
		(BaboSexController as BaboSexControllerManager).FadeinScene(false)
		BE_Thirsk_BossRoomControl_Xmarker.enable()
		BE_Thirsk_ChairControl_Xmarker.enable()
		Riekling01.moveto(KidnapperRoomMarkerA.getreference())
		PlayerRef.moveto(KidnapperRoomMarkerP.getreference())
		
		(BaboSexController as BaboSexControllerManager).FadeOutScene(false)
		
		BaboEventRieklingChoiceGlobal.setvalue(0)
		;BaboEventRieklingThirskSceneSex.forcestart()
		if (BaboSceneController as BaboSceneManager).EventRieklingThirskScenePlay(9, true) == false
			;ChooseSelection()
			SexStart()
		endif
	EndEvent

	Function ChooseSelection()
		int choice = BaboEventRieklingSexChoiceMsg.show()
		if choice == 2;Do nothing
			int irandom = Utility.randomint(1,3); 1-rape 2-crux 3-skip
			BaboEventRieklingChoiceGlobal.setvalue(choice + irandom)
		else
			BaboEventRieklingChoiceGlobal.setvalue(choice + 1)
		endif
	EndFunction

	Function SexStart()
		if BaboEventRieklingChoiceGlobal.getvalue() == 1
			RieklingSexActor(PlayerRef, Riekling01,"BABO_TRISubmmisiveSex", "TRISubmmisiveSex", true, false)
		elseif BaboEventRieklingChoiceGlobal.getvalue() == 2
			RieklingSexActor(PlayerRef, Riekling01,"BABO_TRIRapeSex", "TRIRapeSex", true, true)
		elseif BaboEventRieklingChoiceGlobal.getvalue() >= 3
			RieklingSexActor(PlayerRef, Riekling01,"BABO_TRIRapeSex", "TRIRapeSex", true, true)
		;elseif BaboEventRieklingChoiceGlobal.getvalue() == 4;WIP
			;CruxPole
		;elseif BaboEventRieklingChoiceGlobal.getvalue() == 5;WIP
			;JustLeave
		endif
	EndFunction
	
	Function SexEnd()
		(BaboSexController as BaboSexControllerManager).FadeinScene(true)
		;if BaboEventRieklingChoiceGlobal.value < 4.0
			
			playerref.moveto(FurnitureSafeALink.getreference())
			(BaboSexController as BaboSexControllerManager).ExhaustionIdle(playerref, "Front")
			gotostate("NightTime")
		;elseif BaboEventRieklingChoiceGlobal.value == 4.0
		;	Riekling01.moveto(KidnapMarkerA.getreference())
		;endif
			;(BaboMsgScript as BaboMsgManager).RieklingSlaveryEventMessagebox(2)
		(BaboSexController as BaboSexControllerManager).FadeOutScene(true)
	EndFunction
	
EndState

State DayTimeNothing
	Event Onbeginstate()
		;Let's go to bed msg wip
	EndEvent

	Function BarricadeDoorChoice()
		;Already tried msag wip
		BaboKidnapGotoBedMsg.show()
	EndFunction

	Function BedRollSleep()
		int choice = BaboEventRieklingDaySkipMsg.show()
		if choice == 0
			(BaboSexController as BaboSexControllerManager).FadeInScene(false)
			gotostate("NightTime")
			(BaboMsgScript as BaboMsgManager).RieklingSlaveryEventMessagebox(2)
			(BaboSexController as BaboSexControllerManager).FadeOutScene(false)
		else
			return		
		endif
	EndFunction	

EndState

State DayMinionApproachNoGuard
	Event Onbeginstate()
		BaboEventRieklingChoiceGlobal.setvalue(0)
		BaboKidnapStateGlobal.setvalue(22)
		if BaboDebugging.getvalue() == 1
			Debug.notification("BaboKidnapStateGlobal 22")
		endif
		Reevaluatepackage()
		;BaboEventRieklingThirskMinionSceneB.forcestart() wip
		;BaboEventRieklingThirskMinionSceneA.forcestart()
		(BaboSceneController as BaboSceneManager).EventRieklingThirskScenePlay(7, true)
	EndEvent
	
	Function BarricadeDoorChoice()
		;Nothing
		if (BaboSceneController as BaboSceneManager).ConfirmSelectedScene() == false
			(BaboSceneController as BaboSceneManager).RePlaySelectedScene()
		endif
		;if BaboEventRieklingThirskMinionSceneA.isplaying() == false
		;	BaboEventRieklingThirskMinionSceneA.forcestart()
		;endif
	EndFunction
	
	Function ChooseSelection()
		int choice = BaboEventRieklingMinionApproachMsg.show()
		BaboEventRieklingChoiceGlobal.setvalue(choice + 1)
	EndFunction
	
	Function ChooseSelectionEnd()
		int choice = BaboEventRieklingChoiceGlobal.value as int
		
		if choice == 0
			(BaboMsgScript as BaboMsgManager).RieklingSlaveryEventMessagebox(6)
			;stay slient
			PlayerRef.DamageActorValue("Magicka", -15)
			PlayerRef.DamageActorValue("Stamina", -15)
		elseif choice == 1
			(BaboMsgScript as BaboMsgManager).RieklingSlaveryEventMessagebox(7)
			gotostate("DayMinionApproachRape")
			;Mock
		elseif choice == 2
			;Roar
			(BaboMsgScript as BaboMsgManager).RieklingSlaveryEventMessagebox(8)
			gotostate("DayMinionApproachRape")
		endif
	EndFunction
	
	Function BedRollSleep()
		;Nothing
	EndFunction
EndState

State DayMinionApproachRape
	Event Onbeginstate()
		(BaboSexController as BaboSexControllerManager).FadeinScene(true)
		Riekling02.moveto(WPMarker.getreference())
		Riekling03.moveto(WPMarker.getreference())
		PlayerRef.moveto(VictimMarkerP.getreference())
		(BaboSexController as BaboSexControllerManager).FadeOutScene(true)
	EndEvent
	
	Function SexStart()
		RieklingThreesomeRape(PlayerRef, Riekling02, Riekling03, "BABO_TRIThreesomeState22", "TRIThreesomeState22")
	EndFunction
	
	Function SexEnd()
		(BaboSexController as BaboSexControllerManager).FadeinScene(true)
		Riekling02.moveto(CenterMarker.getreference())
		Riekling03.moveto(CenterMarker.getreference())
		playerref.moveto(FurnitureSafeALink.getreference())
		(BaboSexController as BaboSexControllerManager).RandomExhaustionIdle(playerref)
		gotostate("NightTime")
		(BaboSexController as BaboSexControllerManager).FadeOutScene(true)
	EndFunction
	
	Function BarricadeDoorChoice()
		;Nothing
	EndFunction
	
	Function BedRollSleep()
		;Nothing
	EndFunction
	
EndState

State DayMinionApproach
	Event Onbeginstate()
		BaboEventRieklingChoiceGlobal.setvalue(0)
		BaboKidnapStateGlobal.setvalue(21)
		if BaboDebugging.getvalue() == 1
			Debug.notification("BaboKidnapStateGlobal 21")
		endif
		Reevaluatepackage()
		;BaboEventRieklingThirskMinionSceneA.forcestart()
		(BaboSceneController as BaboSceneManager).EventRieklingThirskScenePlay(7, true)
	EndEvent
	
	Function ChooseSelection()
		int choice = BaboEventRieklingMinionApproachMsg.show()
		BaboEventRieklingChoiceGlobal.setvalue(choice + 1)
	EndFunction
	
	Function BarricadeDoorChoice()
		;Nothing
		if (BaboSceneController as BaboSceneManager).ConfirmSelectedScene() == false
			(BaboSceneController as BaboSceneManager).RePlaySelectedScene()
		endif
		;if BaboEventRieklingThirskMinionSceneA.isplaying() == false
		;	BaboEventRieklingThirskMinionSceneA.forcestart()
		;endif
	EndFunction
	
	Function ChooseSelectionEnd()
		int choice = BaboEventRieklingChoiceGlobal.value as int
		
		if choice == 0
			(BaboMsgScript as BaboMsgManager).RieklingSlaveryEventMessagebox(3)
			;stay slient
		elseif choice == 1
			(BaboMsgScript as BaboMsgManager).RieklingSlaveryEventMessagebox(4)
			PlayerRef.DamageActorValue("Magicka", 20)
			ModConfidence(1.0)
			;Mock
		elseif choice == 2
			(BaboMsgScript as BaboMsgManager).RieklingSlaveryEventMessagebox(5)
			PlayerRef.DamageActorValue("Magicka", 25)
			SlaveTrust(5)
			;Roar
		endif
		(BaboSexController as BaboSexControllerManager).FadeinScene(false)
		gotostate("NightTime")
		(BaboSexController as BaboSexControllerManager).FadeOutScene(false)
	EndFunction
	
	Function BedRollSleep()
		;Nothing
	EndFunction

EndState

State SkipTheNight
	Event Onbeginstate()
		(BaboSexController as BaboSexControllerManager).LosingControl()
		(BaboSexController as BaboSexControllerManager).FadeinScene(true)
		SlaveTrust(1.0)
		if gamehour.value <= 24.0
			GameDaysPassed.Mod(1.0)
			Gamehour.setvalue(7.0)
		else
			Gamehour.setvalue(7.0)
		endif
		Utility.Wait(0.1)
		float maxStamina = playerref.GetActorValueMax("Stamina")
		playerref.RestoreActorValue("Stamina", maxStamina * 0.1)
		(BaboMsgScript as BaboMsgManager).RieklingSlaveryEventMessagebox(1)
		(BaboSexController as BaboSexControllerManager).RecoverControl(true)
		(BaboSexController as BaboSexControllerManager).FadeOutScene(true)
		gotostate("DayTime")
	EndEvent
EndState

State CalltheGuard;WIP
	Event Onbeginstate()
		BaboKidnapStateGlobal.setvalue(1)
	EndEvent
EndState

State NightTimeGateOpen
	Event Onbeginstate()
		int irandom = Utility.randomint(0, 100)
		irandom += BaboSlaverTrust.value as int
		OnLOSRegister()
		if irandom <= 80
			BaboKidnapStateGlobal.setvalue(3)
			if BaboDebugging.getvalue() == 1
				Debug.notification("BaboKidnapStateGlobal 3")
			endif
			Reevaluatepackage()
		elseif irandom > 80
			gotostate("NightTimeGateOpenSleep")
			return
		endif
	EndEvent
	
	Event OnGainLOS(Actor akViewer, ObjectReference akTarget)
	int sneakav = playerref.getactorvalue("Sneak") as int
	;int ichance = Utility.randomint(0, 100)
	Bool bweapondrawn = PlayerRef.IsWeaponDrawn()
	int i
		if akViewer.isincombat()
			return
		endif	
		
		if (akViewer.GetSleepState() == 3) || (akViewer.GetSitState() 	== 3);Riekling get up when player come near wip
			;RegisterForSingleLOSGain(akViewer, akTarget)
			return
		endif
			BaboPlayerDetected.setvalue(1)
			UnLOSRegister()
			(BaboSexController as BaboSexControllerManager).LosingControl()
			if (BaboSceneController as BaboSceneManager).EventRieklingThirskScenePlay(5, true) == false
				ChooseSelection()
			endif
			;BaboEventRieklingThirskSpottedScene.forcestart()
	Endevent

	Function ChooseSelection()
		if BaboKidnapConfiscateChestAccessGlobal.value >= 1;Player opened the chest
			int choice = BaboKidnapDetectedMessage.show()
			if choice == 0
				gotostate("NightTimeEscapeDetectedBattle")
			else
				gotostate("NightTimeEscapeDetected")
			endif
		else
			gotostate("NightTimeEscapeDetected")
		endif		
	EndFunction

	Function BacktoHome()
		int ichance = Utility.randomint(0, 100);wip
		if escapepossibility > ichance
			EquipCollar(false)
			PlayerRef.moveto(BE_Thirsk_SkaalVillage_Xmarker)
			Utility.Wait(3.0)
			AddFatigue(playerref, false)
			(BaboMsgScript as BaboMsgManager).BadRieklingDuelMessagebox(10)
		else
			if escapepossibility > 0
				RefillRiekling()
				escapepossibility = 0
			endif
			Captured()
		endif
	EndFunction

	Function Captured()
		(BaboSexController as BaboSexControllerManager).FadeinScene(false)
		PlayerRef.moveto(BE_Thirsk_ThirskExterior_XmarkerP)
		Riekling02.moveto(BE_Thirsk_ThirskExterior_XmarkerA)
		Riekling03.moveto(BE_Thirsk_ThirskExterior_XmarkerB)
		Riekling04.moveto(BE_Thirsk_ThirskExterior_XmarkerC)
		Riekling05.moveto(BE_Thirsk_ThirskExterior_XmarkerD)
		EquipRestraints(true)
		(BaboSexController as BaboSexControllerManager).FadeOutScene(false)
		;BaboEventRieklingEscapeFailScene.forcestart()
		if (BaboSceneController as BaboSceneManager).EventRieklingThirskScenePlay(8, true) == false
			BacktoThirsk()
		endif
	EndFunction

	Function BacktoThirsk()
		gotostate("KneelBeforeChief")
	EndFunction

EndState

State NightTimeGateOpenSleep
	Event Onbeginstate()
		BE_Thirsk_Sleep_Xmarker.enable()
		WakeupBoxReady()
		BaboKidnapStateGlobal.setvalue(4)
		Reevaluatepackage()
	EndEvent
	
	Event OnGainLOS(Actor akViewer, ObjectReference akTarget)
	int sneakav = playerref.getactorvalue("Sneak") as int
	;int ichance = Utility.randomint(0, 100)
	Bool bweapondrawn = PlayerRef.IsWeaponDrawn()
		if akViewer.isincombat()
			return
		endif	
		
		if (akViewer.GetSleepState() == 3) || (akViewer.GetSitState() 	== 3);Riekling get up when player come near wip
			;RegisterForSingleLOSGain(akViewer, akTarget)
			return
		endif
			BaboPlayerDetected.setvalue(1)
			UnLOSRegister()
			(BaboSexController as BaboSexControllerManager).LosingControl()
			BaboKidnapStateGlobal.setvalue(2)
			if (BaboSceneController as BaboSceneManager).EventRieklingThirskScenePlay(5, true) == false
				ChooseSelection()
			endif
			;BaboEventRieklingThirskSpottedScene.forcestart()
	Endevent

	Function ChooseSelection()
		int choice = BaboKidnapDetectedMessage.show()
		if choice == 0
			gotostate("NightTimeEscapeDetectedBattle")
		else
			gotostate("NightTimeEscapeDetected")
		endif
	EndFunction
	
EndState

State NightTimeEscapeDetectedBattle
	Event Onbeginstate()
		if PlayerRef.IsSneaking()
			PlayerRef.StartSneaking()
		endif
		(BaboSexController as BaboSexControllerManager).RecoverControl()
		(BaboMsgScript as BaboMsgManager).RieklingSlaveryEventMessagebox(11)
		CombatStart()
	EndEvent
EndState

State NightTimeGateDetected

	Event Onbeginstate()
		(BaboSexController as BaboSexControllerManager).LosingControl()
		if AkRieklingGateKeeper.isdead()
			ChooseSelection()
		else
			if (BaboSceneController as BaboSceneManager).EventRieklingThirskScenePlay(6, true) == false
				ChooseSelection()
			endif
			;BaboEventRieklingThirskSceneGateKeeper.forcestart()
		endif
	EndEvent
	
	Function ChooseSelection(); No choice for a moment. It could lead to callguard state.
		gotostate("NightTimeNoEscape")
	EndFunction
EndState

State NightTimeEscapeDetected
	Event Onbeginstate()
		(BaboSexController as BaboSexControllerManager).LosingControl()
		if PlayerRef.IsSneaking()
			PlayerRef.StartSneaking()
		endif
		Debug.sendanimationevent(playerref, "BaboDefeatSurrender")
		;Riekling minions mate player before they bring her to the chief? wip
		int i = 1
		while i < 8
			WakeupActor(i)
			i += 1
		EndWhile
		gotostate("KneelBeforeChief")
	EndEvent
EndState

State KneelBeforeChief
	Event Onbeginstate()
		BaboKidnapStateGlobal.setvalue(5)
		if ChiefDecision()
			(BaboSexController as BaboSexControllerManager).LosingControl()
			(BaboSexController as BaboSexControllerManager).FadeinScene(true)
			SlaveTrust(-5.0)
			if gamehour.value <= 24.0
				GameDaysPassed.Mod(1.0)
				Gamehour.setvalue(7.0)
			else
				Gamehour.setvalue(7.0)
			endif
			Utility.Wait(0.1)
			PlayerRef.moveto(VictimMarkerP.getreference())
			(BaboMsgScript as BaboMsgManager).RieklingSlaveryEventMessagebox(14)
			(BaboSexController as BaboSexControllerManager).RecoverControl(true)
			EquipRestraints(false)
			(BaboSexController as BaboSexControllerManager).FadeOutScene(true)
			gotostate("DayTime")
		else
			(BaboSexController as BaboSexControllerManager).LosingControl()
			(BaboSexController as BaboSexControllerManager).FadeinScene(true)
			(BaboMsgScript as BaboMsgManager).RieklingSlaveryEventMessagebox(13)
			EquipRestraints(false)
			RemoveTargetCuirass(playerref, true)
			RemoveAllthePanties(playerref, true)
			RemoveAlltheSkirts(playerref, true)
			Captured()
			SlaveTrust(-10.0)
			(BaboSexController as BaboSexControllerManager).FadeOutScene(true)
			if (BaboSceneController as BaboSceneManager).EventRieklingThirskScenePlay(4, true) == false
				SexStart()
			endif
			;BaboEventRieklingKneelBeforeScene.forcestart()
		endif
	EndEvent

	Function Captured()
		;Unequip player's torso if equipped. wip
		BE_Thirsk_ChairControl_Xmarker.enable()
		PlayerRef.moveto(BE_Thirsk_MainHall_FrontOfChair_Xmarker)
		Riekling01.moveto(KidnapMarkerA.getreference())
		Riekling02.moveto(BE_Thirsk_MainHall_Xmarker02)
		Riekling03.moveto(BE_Thirsk_MainHall_Xmarker03)
		Riekling04.moveto(BE_Thirsk_MainHall_Xmarker01)
		Riekling05.moveto(CenterMarker.getreference())
		Riekling06.moveto(CenterMarker.getreference())
		;scene play
		int TrustValue = BaboSlaverTrust.value as int
		if TrustValue < 20;You are all minions'
			;Dogeja
			;Debug.SendAnimationEvent(PlayerRef, "Babo_Dogeja")
			(BaboSexController as BaboSexControllerManager).SingleMotion(PlayerRef, BE_Thirsk_MainHall_FrontOfChair_Xmarker, "Babo_Dogeja", true, true)
			(BaboSexController as BaboSexControllerManager).PivotalMove(Riekling04, BE_Thirsk_MainHall_FrontOfChair_Xmarker, "riekling", -65, 0, 0, "Babo_Riekling_Dogeja_Pair", true, true)
			(BaboSexController as BaboSexControllerManager).PivotalMove(Riekling02, BE_Thirsk_MainHall_FrontOfChair_Xmarker, "riekling", 65, -20, 50, "Babo_Riekling_Crouch_leer_masturbation", true, true)
			(BaboSexController as BaboSexControllerManager).PivotalMove(Riekling03, BE_Thirsk_MainHall_FrontOfChair_Xmarker, "riekling", 0, -65, 0, "Babo_Riekling_Dogeja_LyingLeerB", true, true)
			PlayerRef.moveto(BE_Thirsk_MainHall_FrontOfChair_Xmarker)
		else
			(BaboSexController as BaboSexControllerManager).SingleMotion(PlayerRef, BE_Thirsk_MainHall_FrontOfChair_Xmarker, "Babo_Kneel_Naked", true, true)
			(BaboSexController as BaboSexControllerManager).PivotalMove(Riekling02, BE_Thirsk_MainHall_FrontOfChair_Xmarker, "riekling", 65, -20, 50, "Babo_Riekling_Crouch_leer", true, true)
			(BaboSexController as BaboSexControllerManager).PivotalMove(Riekling03, BE_Thirsk_MainHall_FrontOfChair_Xmarker, "riekling", 0, -65, 0, "Babo_Riekling_Dogeja_LyingLeer", true, true)
			PlayerRef.moveto(BE_Thirsk_MainHall_FrontOfChair_Xmarker)
			;Kneel naked  if trust value below 40 it could lead to 30 staright.
		endif
	EndFunction

	Function DogejaAnimationPlay()
		(BaboSexController as BaboSexControllerManager).FadeinScene(true)
		(BaboSexController as BaboSexControllerManager).SingleMotion(PlayerRef, BE_Thirsk_MainHall_FrontOfChair_Xmarker, "Babo_Dogeja", true, true)
		(BaboSexController as BaboSexControllerManager).PivotalMove(Riekling04, BE_Thirsk_MainHall_FrontOfChair_Xmarker, "riekling", -65, 0, 0, "Babo_Riekling_Dogeja_Pair", true, true)
		(BaboSexController as BaboSexControllerManager).PivotalMove(Riekling02, BE_Thirsk_MainHall_FrontOfChair_Xmarker, "riekling", 65, -20, 50, "Babo_Riekling_Crouch_leer_masturbation", true, true)
		(BaboSexController as BaboSexControllerManager).PivotalMove(Riekling03, BE_Thirsk_MainHall_FrontOfChair_Xmarker, "riekling", 0, -65, 0, "Babo_Riekling_Dogeja_LyingLeerB", true, true)
		(BaboSexController as BaboSexControllerManager).MiscSound(playerref, 1)
		(BaboSexController as BaboSexControllerManager).UseSexlabVoice(PlayerRef, true)
		Utility.wait(1.0)
		(BaboSexController as BaboSexControllerManager).UseSexlabVoice(PlayerRef, true)
		PlayerRef.moveto(BE_Thirsk_MainHall_FrontOfChair_Xmarker)
		(BaboSexController as BaboSexControllerManager).FadeOutScene(true)
	EndFunction

	Function SexStart()
		(BaboSexController as BaboSexControllerManager).FadeinScene(false)
		(BaboSexController as BaboSexControllerManager).SingleMotion(PlayerRef, none, "", false, true)
		(BaboSexController as BaboSexControllerManager).PivotalMove(Riekling02, none, "riekling", 0, 0, 0, "", false, true)
		(BaboSexController as BaboSexControllerManager).PivotalMove(Riekling03, none, "riekling", 0, 0, 0, "", false, true)
		(BaboSexController as BaboSexControllerManager).PivotalMove(Riekling04, none, "riekling", 0, 0, 0, "", false, true)
		
		if BaboSlaverTrust.value >= 45
			RieklingSexActor(PlayerRef, Riekling01,"BABO_TRIRapeSexState5", "TRIRapeSexState5", true, true)
		elseif BaboSlaverTrust.value < 20;Crux ending
			RieklingThreesomeRape(PlayerRef, Riekling02, Riekling03, "BABO_TRIThreesomeState5Crux", "TRIThreesomeState5Crux")
		else
			RieklingThreesomeRape(PlayerRef, Riekling02, Riekling03, "BABO_TRIThreesomeState5", "TRIThreesomeState5")
		endif
		(BaboSexController as BaboSexControllerManager).FadeOutScene(false)
	EndFunction
	
	Function SexRoundTwo()
		(BaboMsgScript as BaboMsgManager).BadRieklingDuelMessagebox(15)
		ModTrauma(2.0)
		if Riekling04&& Riekling05
			RieklingThreesomeRape(PlayerRef, Riekling04, Riekling05, "BABO_TRIThreesomeState5B", "TRIThreesomeState5B")
		else
			RieklingThreesomeRape(PlayerRef, Riekling02, Riekling03, "BABO_TRIThreesomeState5B", "TRIThreesomeState5B")
		endif
	EndFunction
	
	Function SexRoundThree()
		(BaboMsgScript as BaboMsgManager).BadRieklingDuelMessagebox(16)
		ModTrauma(3.0)
		if Riekling04
			RieklingThreesomeRape(PlayerRef, Riekling03, Riekling04, "BABO_TRIThreesomeState5C", "TRIThreesomeState5C")
		else
			RieklingThreesomeRape(PlayerRef, Riekling03, Riekling02, "BABO_TRIThreesomeState5C", "TRIThreesomeState5C")
		endif
	EndFunction
	
	Function SexEnd()
		(BaboSexController as BaboSexControllerManager).FadeinScene(true)
		;BaboEventRieklingKneelBeforeScene.stop()
		(BaboSceneController as BaboSceneManager).EventRieklingThirskScenePlay(0, false)
		playerref.moveto(FurnitureSafeALink.getreference())
		(BaboSexController as BaboSexControllerManager).ExhaustionIdle(playerref, "Front")
		gotostate("NightTime")
		(BaboSexController as BaboSexControllerManager).Recovercontrol()
		ModTrauma(2.0)
		(BaboSexController as BaboSexControllerManager).FadeOutScene(true)
	EndFunction

EndState

State FinalDay;WIP
	Event Onbeginstate()
		BaboKidnapStateGlobal.setvalue(30)
		Reevaluatepackage()
		(BaboSexController as BaboSexControllerManager).FadeinScene(false)
		(BaboMsgScript as BaboMsgManager).RieklingSlaveryEventMessagebox(20)
		BE_Thirsk_EntranceObstacleControl_XmarkerA.disable()
		BE_Thirsk_FirePlaceControl_Xmarker.disable()
		BE_Thirsk_TorturePoleControl_Xmarker.disable()
		BE_Thirsk_DancingControl_Xmarker.disable()
		BE_Thirsk_Sleep_Xmarker.disable()
		playerref.moveto(VictimMarkerA.getreference())
		Riekling01.moveto(BE_Thirsk_MainHallCenter_XmarkerA)
		Riekling02.moveto(BE_Thirsk_MainHallCenter_XmarkerB)
		Riekling03.moveto(BE_Thirsk_MainHallCenter_XmarkerC)
		Riekling04.moveto(BE_Thirsk_MainHallCenter_XmarkerD)
		Riekling05.moveto(BE_Thirsk_MainHallCenter_XmarkerE)
		;.moveto(VictimMarkerB.getreference());slaves spawn wip
		;.moveto(VictimMarkerC.getreference())
		EquipCollar(false)
		EquipRestraints(true)
		(BaboSexController as BaboSexControllerManager).FadeoutScene(false)
	EndEvent
	
	Function ChooseSelection()
		Utility.wait(5.0);wait for actors to take place.
		int ichoice = BaboKidnapFinalDayMessage.show()
		if ichoice == 0
			if (BaboSceneController as BaboSceneManager).EventRieklingThirskScenePlay(10, true) == false
				EndDay()
			endif
			;BaboEventRieklingThirskEndScene.forcestart()
		else
			RescuerA.forcerefto(KidnapperSafeMarkerA.getreference().Placeactoratme(BaboBadEndGuardDLC2RRM, 4))
			RescuerB.forcerefto(KidnapperSafeMarkerB.getreference().Placeactoratme(BaboBadEndGuardDLC2RRM, 4))
			Utility.wait(1.0)
			;BaboEventRieklingThirskEndRescueScene.forcestart()
			if (BaboSceneController as BaboSceneManager).EventRieklingThirskScenePlay(11, true) == false
				CalvarlyRescue()
			endif
		endif
	EndFunction

	Function CalvarlyRescue()
		actor akactor
		int iarray = RieklingMinions.length;6
		While iarray >= 0
			iarray -= 1
			akactor = (RieklingMinions[iarray].getreference() as actor)
			akactor.addtoFaction(BaboEnemyRieklingFaction)
			akactor.SetActorValue("Confidence", 4)
			akactor.startCombat(RescuerA.getreference() as actor)
		EndWhile
		
		Riekling01.addtoFaction(BaboEnemyRieklingFaction)
		Riekling01.SetActorValue("Confidence", 4)
		Riekling01.startCombat(RescuerA.getreference() as actor)
		(RescuerA.getreference() as actor).startCombat(Riekling01)
		Utility.wait(10.0)
		(BaboSexController as BaboSexControllerManager).FadeinScene(false)
		playerref.moveto(BE_RRBulwark_Player_Xmarker);teleport to the barrack
		RedoranGuard.forcerefto(BE_RRBulwark_Guard_Xmarker.Placeactoratme(BaboBulwarkGuardDLC2RRM, 4))
		BaboEventRieklingTempChest.Removeallitems(BaboEventBulwarkConfiscateChest, false, true)
		EquipRestraints(false)
		;Changclothes wip
		(BaboSexController as BaboSexControllerManager).FadeoutScene(false)
		Utility.wait(2.0)
		BaboEventQuest.SetStage(100);Player got rescued
		;(BaboSexController as BaboSexControllerManager).BadRieklingDuelMessagebox(4)
		Addtitle(false)
		;BaboEventRieklingRRGuardSCene.forcestart()
		(BaboSceneController as BaboSceneManager).EventRieklingThirskScenePlay(12, true)
	EndFunction

	Function EndDay()
		(BaboSexController as BaboSexControllerManager).FadeinScene(false)
		;Maybe you go to the base? WIP
		(BaboMsgScript as BaboMsgManager).RieklingSlaveryEventMessagebox(21)
		int ichoice = BaboEventRieklingEndDayMsg.show()
		float fmult
		Float hours
		if ichoice == 0; 3years
			hours = 3 * 365.0 * 24.0
			fmult = 30.0
		elseif ichoice == 1; 2years
			hours = 2 * 365.0 * 24.0
			fmult = 20.0
		elseif ichoice == 1; 1year
			hours = 365.0 * 24.0
			fmult = 15.0
		elseif ichoice == 1; 6months
			hours = 180.0 * 24.0
			fmult = 8.0
		elseif ichoice == 1; 3months
			hours = 92.0 * 24.0
			fmult = 4.0
		elseif ichoice == 1; 1month
			hours = 31.0 * 24.0
			fmult = 2.0
		endif
		if BaboTimeLapseGlobal.GetValue() == 1 && BaboTimeLapseWarningMsg.Show() == 0
			GameHour.Mod(hours)
		endif

		ModTrauma(fmult * 1.5)
		ModConfidence(fmult * -1.0)
		ModCorruption(fmult)
		ModLewdness(fmult)
		(BaboMonitorScript as BaboDiaMonitorScript).AdjustSexlabStats(playerref, "Vaginal", (fmult * 40) as int)
		(BaboMonitorScript as BaboDiaMonitorScript).AdjustSexlabStats(playerref, "Anal", (fmult * 25) as int)
		(BaboMonitorScript as BaboDiaMonitorScript).AdjustSexlabStats(playerref, "Oral", (fmult * 20) as int)
		(BaboMonitorScript as BaboDiaMonitorScript).AdjustSexlabStats(playerref, "Creatures", (fmult * 70) as int)
		(BaboMonitorScript as BaboDiaMonitorScript).AdjustSexlabStats(playerref, "Victim", (fmult * 70) as int)
		(BaboMonitorScript as BaboDiaMonitorScript).AdjustSexlabStats(playerref, "SexCount", (fmult * 70) as int)
		(BaboSexController as BaboSexControllerManager).AddTraumaPerk("Riekling", true)
		PlayerRef.moveto(BE_EventInn_Xmarker)
		Addtitle(true)
		BaboEventRieklingTempChest.Removeallitems(PlayerRef, false, true)
		(BaboSexController as BaboSexControllerManager).FadeoutScene(false)
		BaboEventQuest.SetStage(150)
		(BaboMsgScript as BaboMsgManager).RieklingSlaveryEventMessagebox(22)
		(BaboSexController as BaboSexControllerManager).Recovercontrol()
		BaboEventQuest.SetStage(255)
		;Title acquired message box? wip
	EndFunction

EndState

Function ToRavenRock()
	PlayerRef.moveto(BE_RRBulwark_Exit_Xmarker)
EndFunction

Function ClearStage()
	AddFatigue(playerref, false)
	(RedoranGuard.getreference() as actor).delete()
	(RescuerA.getreference() as actor).delete()
	(RescuerB.getreference() as actor).delete()
	(RieklingChief.getreference() as actor).delete()
	(RieklingMinion01.getreference() as actor).delete()
	(RieklingMinion02.getreference() as actor).delete()
	(RieklingMinion03.getreference() as actor).delete()
	(RieklingMinion04.getreference() as actor).delete()
	(RieklingMinion05.getreference() as actor).delete()
	(RieklingGateKeeper.getreference() as actor).delete()
	
	BE_Thirsk_EntranceObstacleControl_XmarkerA.enable()
	BE_Thirsk_CruxPole_Xmarker.disable()
	BE_Thirsk_Barricade_Xmarker.enable()
	BE_Thirsk_Barricade_XmarkerB.disable()
	BE_Thirsk_Plank_Xmarker.disable()
	BE_Thirsk_TorturePoleControl_Xmarker.disable()
	BE_Thirsk_FirePlaceControl_Xmarker.disable()
	BE_Thirsk_ObstacleControl_XmarkerA.enable()
EndFunction

Function EquipRopes(bool bequip)
	if bequip
		playerref.Additem(BaboAnkleRopePlayable, 1, true)
		playerref.Additem(BaboCollarRopePlayable, 1, true)
		playerref.Additem(BaboWristRopePlayable, 1, true)
		playerref.EquipItem(BaboAnkleRopePlayable, true, true)
		playerref.EquipItem(BaboCollarRopePlayable, true, true)
		playerref.EquipItem(BaboWristRopePlayable, true, true)
	else
		playerref.UnequipItem(BaboAnkleRopePlayable, true, true)
		playerref.UnequipItem(BaboCollarRopePlayable, true, true)
		playerref.UnequipItem(BaboWristRopePlayable, true, true)
		playerref.removeitem(BaboAnkleRopePlayable, 1)
		playerref.removeitem(BaboCollarRopePlayable, 1)
		playerref.removeitem(BaboWristRopePlayable, 1)
	endif
EndFunction

Function EquipCollar(bool bequip)
	if bequip
		playerref.Additem(BaboCollarIronPlayable, 1, true)
		playerref.Additem(AnkleChain, 1, true)
		playerref.EquipItem(BaboCollarIronPlayable, true, true)
		playerref.EquipItem(AnkleChain, true, true)
	else
		playerref.UnequipItem(BaboCollarIronPlayable, true, true)
		playerref.UnequipItem(AnkleChain, true, true)
		playerref.removeitem(BaboCollarIronPlayable, 1)
		playerref.removeitem(AnkleChain, 1)
	endif
EndFunction

Function EquipRestraints(bool bequip)
	if bequip
		playerref.Additem(Yoke, 1, true)
		playerref.Additem(AnkleChain, 1, true)
		playerref.EquipItem(Yoke, true, true)
		playerref.EquipItem(AnkleChain, true, true)
	else
		playerref.UnequipItem(Yoke, true, true)
		playerref.UnequipItem(AnkleChain, true, true)
		playerref.removeitem(Yoke, 1)
		playerref.removeitem(AnkleChain, 1)
	endif
EndFunction


;===================================== This is property zone ========================================
;===================================== This is property zone ========================================

Bool Property bInitialSceneStarted = false Auto

BaboReputationMasterScript Property BRMQuest Auto
ObjectReference property BE_RRBulwark_Exit_Xmarker Auto
ObjectReference property BaboEventBulwarkConfiscateChest Auto
actorbase property BaboBulwarkGuardDLC2RRM Auto
Faction Property BaboEnemyRieklingFaction Auto


float property fNighttime = 20.0 auto hidden
message property BaboEventRieklingEndDayMsg auto
message property BaboKidnapFinalDayMessage auto
referencealias property VictimMarkerA auto
referencealias property VictimMarkerB auto
referencealias property VictimMarkerC auto
referencealias property RedoranGuard auto
ObjectReference property BE_EventInn_Xmarker auto
ObjectReference property BE_Thirsk_MainHallCenter_XmarkerA auto
ObjectReference property BE_Thirsk_MainHallCenter_XmarkerB auto
ObjectReference property BE_Thirsk_MainHallCenter_XmarkerC auto
ObjectReference property BE_Thirsk_MainHallCenter_XmarkerD auto
ObjectReference property BE_Thirsk_MainHallCenter_XmarkerE auto
Actorbase Property BaboBadEndGuardDLC2RRM Auto

Armor property BaboAnkleRopePlayable auto
Armor property BaboCollarRopePlayable auto
Armor property BaboWristRopePlayable auto
Armor property BaboCollarIronPlayable auto
Armor property Yoke auto
Armor property AnkleChain auto

SexLabFramework Property SexLab Auto
Quest Property BaboEventQuest Auto
Quest Property BaboSexController Auto
Quest Property BaboMsgScript Auto

GlobalVariable Property SexCountRiekling Auto;BaboSexCountRieklingQuest
;GlobalVariable Property SexCountNewRiekling Auto
;GlobalVariable Property BaboEventRieklingSexOnOff Auto

Actorbase property BaboRieklingMinionMelee auto

GlobalVariable Property GameHour Auto
Quest Property BaboStealingScript Auto
Quest Property BaboMonitorScript Auto
ObjectReference Property BaboSoliloquyXmarkerStandByRef  Auto
ObjectReference Property BaboEventRieklingSpeakerXmarker  Auto
ObjectReference Property BaboEventRieklingTempChest  Auto
ObjectReference Property BE_Thirsk_BossRoomControl_Xmarker Auto
ObjectReference Property BE_Thirsk_ChairControl_Xmarker Auto
ObjectReference Property BE_Thirsk_BossRoomMarkerA Auto
ObjectReference Property BE_Thirsk_BossRoomMarkerB Auto
ObjectReference Property BE_Thirsk_SkaalVillage_Xmarker Auto
ObjectReference Property BE_Thirsk_SleepActivatorA Auto
ObjectReference Property BE_Thirsk_SleepActivatorA2 Auto
ObjectReference Property BE_Thirsk_SleepActivatorB Auto
ObjectReference Property BE_Thirsk_SleepActivatorC Auto
ObjectReference Property BE_Thirsk_SleepActivatorD Auto
ObjectReference Property BE_Thirsk_SleepActivatorE Auto
ObjectReference Property BE_Thirsk_SleepActivatorF Auto

ObjectReference Property BE_Thirsk_EntranceObstacleControl_XmarkerA Auto
ObjectReference Property BE_Thirsk_ThirskExterior_XmarkerP Auto
ObjectReference Property BE_Thirsk_ThirskExterior_XmarkerA Auto
ObjectReference Property BE_Thirsk_ThirskExterior_XmarkerB Auto
ObjectReference Property BE_Thirsk_ThirskExterior_XmarkerC Auto
ObjectReference Property BE_Thirsk_ThirskExterior_XmarkerD Auto

ObjectReference Property BE_RRBulwark_Player_Xmarker Auto
ObjectReference Property BE_RRBulwark_Guard_Xmarker Auto
ObjectReference Property BE_Thirsk_Barricade_Xmarker Auto
ObjectReference Property BE_Thirsk_Barricade_XmarkerB Auto
ObjectReference Property BE_Thirsk_CruxPole_Xmarker Auto
ObjectReference Property BE_Thirsk_ObstacleControl_XmarkerA Auto
ObjectReference Property BE_Thirsk_DancingControl_Xmarker Auto
ObjectReference Property BE_Thirsk_Sleep_Xmarker Auto
ObjectReference Property BE_Thirsk_TorturePoleControl_Xmarker Auto
ObjectReference Property BE_Thirsk_FirePlaceControl_Xmarker Auto
ObjectReference Property BE_Thirsk_Plank_Xmarker Auto
ObjectReference Property BE_Thirsk_MainHall_FrontOfChair_Xmarker Auto

ObjectReference Property BE_Thirsk_MainHall_Xmarker01 Auto
ObjectReference Property BE_Thirsk_MainHall_Xmarker02 Auto
ObjectReference Property BE_Thirsk_MainHall_Xmarker03 Auto
ObjectReference Property BE_Thirsk_MainHall_Xmarker04 Auto
ObjectReference Property BE_Thirsk_MainHall_Xmarker05 Auto
Actor Property Riekling01 Auto Hidden
Actor Property Riekling02 Auto Hidden
Actor Property Riekling03 Auto Hidden
Actor Property Riekling04 Auto Hidden
Actor Property Riekling05 Auto Hidden
Actor Property Riekling06 Auto Hidden
Actor Property AkRieklingGateKeeper Auto Hidden
Actor Property PlayerRef Auto

ReferenceAlias Property ConfiscateChest Auto

ReferenceAlias Property RieklingChief Auto
ReferenceAlias Property RieklingMinion01 Auto
ReferenceAlias Property RieklingMinion02 Auto
ReferenceAlias Property RieklingMinion03 Auto
ReferenceAlias Property RieklingMinion04 Auto
ReferenceAlias Property RieklingMinion05 Auto
ReferenceAlias Property RieklingGateKeeper Auto
ReferenceAlias[] Property RieklingMinions Auto

;ReferenceAlias Property PlayerAlias Auto


Referencealias Property RestrainMarker Auto
Referencealias Property FurnitureSafeA Auto
Referencealias Property FurnitureSafeALink Auto
Referencealias Property FoodMarker Auto

Referencealias Property VictimMarkerP Auto

Referencealias Property RescuerA Auto
Referencealias Property RescuerB Auto
Referencealias Property RescuerMarkerA Auto
Referencealias Property RescuerMarkerB Auto



Referencealias Property CageDoorA Auto
Referencealias Property KidnapMarkerA Auto
Referencealias Property KidnapMarkerB Auto
Referencealias Property KidnapMarkerC Auto
Referencealias Property KidnapMarkerD Auto
Referencealias Property KidnapMarkerE Auto
Referencealias Property KidnapMarkerF Auto
Referencealias Property KidnapMarkerG Auto
Referencealias Property KidnapMarkerH Auto

ReferenceAlias Property KidnapperRoomMarkerA Auto
ReferenceAlias Property KidnapperRoomMarkerP Auto

GlobalVariable Property BaboKidnapStateGlobal Auto
GlobalVariable Property BaboSlaverTrust Auto
GlobalVariable Property BaboKidnapHelperRescue Auto
GlobalVariable Property BaboKidnapEscapeResponse Auto
GlobalVariable Property BaboKidnapScenarioe Auto
GlobalVariable Property BaboKidnapEscapeAttempts Auto
GlobalVariable Property BaboKidnapTrappedCount Auto
GlobalVariable Property BaboKidnapConfiscateChestAccessGlobal Auto

formlist Property BaboEdibleCheapFormList Auto
formlist Property BaboEdibleWaterFormList Auto

Perk Property BaboAwfullyFatiguedPerk Auto

Bool bReadytoRest
Message Property BaboEventRieklingSexChoiceMsg  Auto

Faction Property BaboFactionRieklingPublicToiletTitle Auto
Faction Property BaboFactionRieklingThirskFuckToyTitle Auto
GlobalVariable Property BaboGlobalRieklingThirskFuckToyTitle Auto
GlobalVariable Property BaboGlobalRieklingPublicToiletTitle Auto

GlobalVariable Property BaboEventRieklingPatternGlobal Auto
GlobalVariable Property GameDaysPassed Auto
GlobalVariable Property BaboGameStartingDay Auto
GlobalVariable Property BaboEventRieklingChoiceGlobal Auto

formlist property BaboSkirtFormList Auto
formlist property BaboPantiesFormList Auto

Message Property BaboEventRieklingCruxSexMsg Auto
Message Property BaboEventRieklingCruxSexRound2Msg Auto
Message Property BaboEventRieklingSkipDayMsg Auto
Message Property BaboEventRieklingDaySkipMsg Auto
Message Property BaboKidnapGotoBedMsg Auto
Message Property BaboEventRieklingDayMsg Auto
Message Property BaboEventRieklingNightMsg Auto
Message Property BaboKidnapSleepOptionMessage Auto
Message Property BaboEventRieklingMinionApproachMsg Auto
Message Property BaboKidnapBarricadeDoorOptionMessage Auto
Message Property BaboEventSequenceMsg Auto



GlobalVariable Property BaboKidnapLastFoodTime Auto
formlist Property BaboEdibleSuspiciousFormList Auto
formlist Property BaboEdibleSoupFormList Auto
formlist Property BaboEdibleTrashFormList Auto

GlobalVariable Property BaboPlayerDetected Auto
referencealias property WPMarker Auto
referencealias property CenterMarker Auto
Referencealias Property KidnapperSafeMarkerA Auto
Referencealias Property KidnapperSafeMarkerB Auto
Message Property BaboKidnapDetectedMessage Auto
;Scene Property BaboEventRieklingKneelBeforeScene Auto
ObjectReference Property BE_Thirsk_MainHall_PlayerMarker Auto
GlobalVariable Property BaboDebugging Auto

int property PassedDay = 0 auto hidden
int property escapepossibility auto hidden

Form[] Property WornItemsBackup Auto Hidden

float property FTimetopass  auto hidden
ObjectReference property BaboDia_RieklingCrossCruxLookD  auto
GlobalVariable Property BaboTimeLapseGlobal Auto
Message Property BaboTimeLapseWarningMsg Auto