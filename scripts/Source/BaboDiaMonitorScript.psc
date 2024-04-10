Scriptname BaboDiaMonitorScript extends Quest Conditional

Import Game

;\\\\\\\\\Property Zone\\\\\\\\\\
Quest Property BaboSexController Auto

BaboReputationMasterScript Property BRMQuest Auto
BaboXmarkerMover Property BaboXmarkerMoverScript Auto

ObjectReference Property MiscReferences Auto

SexLabFramework Property SexLab Auto
;Location[] Property EventLocations Auto
Location Property WhiterunBreezehomeLocation Auto
Location Property BYOHHouse1LocationInterior Auto
Location Property BYOHHouse2LocationInterior Auto
Location Property BYOHHouse3LocationInterior Auto
BaboDialogueConfigMenu Property BDConfig Auto
BaboDialogueHirelingsQuest Property BaboDialogueHirelings Auto
BaboBoyFriendVariableScript Property BaboBoyFriendVariable Auto
Quest Property BDDibella Auto
Quest Property BaboDialogueWhiterun Auto
Quest Property sla_Framework Auto
Perk Property AllurePerkPlus Auto
Actor Property PlayerRef Auto
Actor crosshairRef = None
ReferenceAlias Property ViceCaptainRef Auto
GlobalVariable Property GameDaysPassed Auto
GlobalVariable Property BaboWhiterunBreezehomeGameDay Auto
GlobalVariable Property BaboWhiterunBreezehomeGameDayInterval Auto
GlobalVariable Property BaboBYOHHouse1LocationInteriorGameDay Auto
GlobalVariable Property BaboBYOHHouse1LocationInteriorGameDayInterval Auto
GlobalVariable Property BaboBYOHHouse2LocationInteriorGameDay Auto
GlobalVariable Property BaboBYOHHouse2LocationInteriorGameDayInterval Auto
GlobalVariable Property BaboBYOHHouse3LocationInteriorGameDay Auto
GlobalVariable Property BaboBYOHHouse3LocationInteriorGameDayInterval Auto

GlobalVariable Property BaboMonitorScriptCreaturePackageActive Auto
GlobalVariable Property BaboHorribleHarassment Auto
GlobalVariable Property BaboSexlabStatVaginal Auto
GlobalVariable Property BaboSexlabStatAnal Auto
GlobalVariable Property BaboSexlabStatOral Auto
GlobalVariable Property BaboSexlabStatMales Auto
GlobalVariable Property BaboSexlabStatFemales Auto
GlobalVariable Property BaboSexlabStatCreatures Auto
GlobalVariable Property BaboSexlabStatCreaturesCum Auto
GlobalVariable Property BaboSexlabStatVictim Auto
GlobalVariable Property BaboSexlabStatAggressor Auto

GlobalVariable Property BaboSexlabStatCorruptionSpeed Auto
GlobalVariable Property BaboSexlabStatCorruption Auto
GlobalVariable Property BaboSexlabStatExhibitionist Auto
GlobalVariable Property BaboSexlabStatLewdness Auto

GlobalVariable Property BaboDetectSpectatorUpdateInterval Auto
GlobalVariable Property BaboDetectSpectatorHowMany Auto

GlobalVariable Property BaboReputation Auto
GlobalVariable Property BaboReputationBitch Auto
GlobalVariable Property BaboSeducingAttemptCount Auto
GlobalVariable Property BaboSeducingMercenaryAttemptCount Auto
GlobalVariable Property BaboSeducingMerchantAttemptCount Auto

Faction Property sla_Arousal Auto
Faction Property sla_Exposure Auto
Faction Property BaboCreatureMatePartnerFaction Auto
Faction Property BaboCreatureArousedFaction Auto
Faction Property BaboTrollFaction Auto
Faction Property TrollFaction Auto
Faction Property Babopacifiedcreaturefaction Auto
Faction Property BaboTrollAllyFaction Auto
Faction Property JobMerchantFaction Auto
Faction Property PotentialHireling Auto

Faction Property SLAX_SubmissiveFaction Auto
Faction Property SLAX_CumFilledFaction Auto
Faction Property SLAX_WillBrokenFaction Auto
Faction Property SLAX_WillfulFaction Auto
Faction Property SLAX_SexAddictFaction Auto
Faction Property SLAX_NudismAddictFaction Auto


Package Property DoNothing Auto
Spell Property EnthrallMerchantSpell Auto
Bool Isplaying = false

Float Property DistanceZ Auto
Float Property DistanceInFront Auto

ObjectReference Dummy

ReferenceAlias[] Property CreatureReferences Auto
FormList Property BaboCreatureNonPacifiedRace  Auto
FormList Property BaboCreaturePacified  Auto
FormList Property BaboCreatureTrollRace  Auto
Keyword Property ActorTypeUndead Auto
Keyword Property ActorTypeDragon Auto
Keyword Property ActorTypeDaedra Auto
Keyword Property ActorTypeDwarven Auto
Keyword Property ActorTypeFamiliar Auto
Keyword Property ActorTypeGhost Auto
Keyword Property ActorTypeNPC Auto
Race Property TrollRace Auto
Race Property TrollFrostRace Auto
Race Property DLC1TrollRaceArmored Auto
Race Property DLC1TrollFrostRaceArmored Auto

Keyword Property SLA_ArmorSpendex Auto
Keyword Property SLA_ArmorPretty Auto
Keyword Property EroticArmor Auto
Keyword Property SLA_ArmorHalfNakedBikini Auto
Keyword Property SLA_ArmorHalfNaked Auto
Keyword Property SLA_ArmorTransparent Auto
Keyword Property SLA_ArmorLewdLeotard Auto
Keyword Property SLA_ArmorCurtain Auto


Quest Property zadquest Auto

Keyword Property zad_Lockable Auto Hidden
Keyword Property zad_DeviousCollar Auto Hidden
Keyword Property zad_DeviousBelt Auto Hidden
Keyword Property zad_DeviousArmbinder Auto Hidden
Keyword Property zad_DeviousHarness Auto Hidden
Keyword Property zad_DeviousBra Auto Hidden
Keyword Property zad_DeviousSuit Auto Hidden
Keyword Property zad_DeviousYoke Auto Hidden
Keyword Property zad_DeviousGag Auto Hidden
Keyword Property zad_DeviousPlug Auto Hidden
Keyword Property zad_DeviousBlindfold Auto Hidden
Keyword Property zad_DeviousPiercingsVaginal Auto Hidden
Keyword Property zad_DeviousPlugVaginal Auto Hidden
Keyword Property zad_DeviousPlugAnal Auto Hidden
Keyword Property zad_DeviousBoots Auto Hidden
Keyword Property zad_DeviousHood Auto Hidden
Keyword Property zad_DeviousCorset Auto Hidden
Keyword Property zad_DeviousArmCuffs Auto Hidden
Keyword Property zad_DeviousPiercingsNipple Auto Hidden

;LeveledItem Property zad_dev_armbinders Auto Hidden
;LeveledItem Property zad_dev_yokes Auto Hidden
;LeveledItem Property zad_dev_collars_metal Auto Hidden
;LeveledItem Property zad_dev_gags_ring Auto
;LeveledItem Property zad_dev_blindfolds_leather Auto Hidden
;LeveledItem Property zad_dev_plugs_anal Auto Hidden
;LeveledItem Property zad_dev_plugs_vaginal Auto Hidden
;LeveledItem Property zad_dev_piercings_nipple Auto Hidden
;LeveledItem Property zad_dev_piercings_vaginal Auto Hidden
;LeveledItem Property zad_dev_chastitybelts_closed Auto Hidden
;LeveledItem Property zad_dev_armcuffs Auto Hidden

Key Property zad_ChastityKey Auto
Key Property zad_PiercingsRemovalTool Auto
Key Property zad_RestraintsKey Auto

Faction Property _BF_ParentFaction Auto
GlobalVariable Property _BFPlayerState Auto; 0"Follicular_State" / 1"Ovulation_State" / 2"Luteal_State" / 3"Menstruation_State" / 4"PregnancyFirst_State" / 5"PregnancySecond_State" / 6"PregnancyThird_State" / 7"LaborPains_State" / 8"Replanish_State"

Faction Property zzEstrusChaurusBreederFaction Auto

Faction Property SR_InflateFaction Auto Hidden

Potion Property _JSW_BB_PotionFertility Auto

Float[] Property FertilityLastBirth Auto

Float Property ExhibitionistExp = 0.0 Auto Hidden
Float Property CorruptionExp = 0.0 Auto Hidden
Float Property LewdnessExp = 0.0 Auto Hidden

Float Property BikExp = 0.0 Auto Hidden
Float Property ExpPerLevel = 100.0 Auto Hidden
Float LastUpdate = 0.0
Float InflationFloat = 0.0

Quest Property MQ101 Auto

GlobalVariable Property BaboDebugging Auto

GlobalVariable Property BaboSexlabStatConfidenceWill Auto
GlobalVariable Property BaboSexlabStatTrauma Auto
GlobalVariable Property BaboSexlabStatSkimpySpeed Auto
GlobalVariable Property BaboSexlabStatSkimpyExpLevel Auto
GlobalVariable Property BaboSexlabStatExhibitionistSpeed Auto
GlobalVariable Property BaboSexlabStatSkimpyDecrease  Auto
GlobalVariable Property BaboSexlabStatLewdnessSpeed Auto
GlobalVariable Property BaboPlayerPubicHair Auto

GlobalVariable Property BaboSexCountRiekling Auto
GlobalVariable Property BaboSexCountTroll Auto
GlobalVariable Property BaboSexCountChaurus Auto
GlobalVariable Property BaboSexCountGiant Auto
GlobalVariable Property BaboSexCountHorse Auto
GlobalVariable Property BaboSexCountDraugr Auto
GlobalVariable Property BaboSexCountFalmer Auto
GlobalVariable Property BaboSexCountBeast Auto
GlobalVariable Property BaboSexCountGargoyle Auto
GlobalVariable Property BaboSexCountCanine Auto
GlobalVariable Property BaboSexCountDwarven Auto
GlobalVariable Property BaboSexCountDragon Auto
GlobalVariable Property BaboSexCountSpider Auto
GlobalVariable Property BaboSexCountSpriggan Auto
GlobalVariable Property BaboSexCountSkeever Auto
GlobalVariable Property BaboSexCountStormAtronach Auto
GlobalVariable Property BaboSexCountFrostAtronach Auto
GlobalVariable Property BaboSexCountHorker Auto
GlobalVariable Property BaboSexCountCreatureRape Auto

GlobalVariable Property BaboSexlabStatCreaturesGiant Auto
GlobalVariable Property BaboSexlabStatCreaturesRiekling Auto
GlobalVariable Property BaboSexlabStatCreaturesFalmer Auto
GlobalVariable Property BaboSexlabStatCreaturesTroll Auto
GlobalVariable Property BaboSexlabStatCreaturesGargoyle Auto
GlobalVariable Property BaboSexlabStatCreaturesChaurus Auto
GlobalVariable Property BaboSexlabStatCreaturesSpider Auto
GlobalVariable Property BaboSexlabStatCreaturesBeast Auto
GlobalVariable Property BaboSexlabStatCreaturesDraugr Auto
GlobalVariable Property BaboSexlabStatCreaturesCanine Auto
GlobalVariable Property BaboSexlabStatCreaturesDwarven Auto
GlobalVariable Property BaboSexlabStatCreaturesHorse Auto
GlobalVariable Property BaboSexlabStatCreaturesSpriggan Auto
GlobalVariable Property BaboSexlabStatCreaturesStormAtronach Auto
GlobalVariable Property BaboSexlabStatCreaturesFrostAtronach Auto
GlobalVariable Property BaboSexlabStatCreaturesSkeever Auto
GlobalVariable Property BaboSexlabStatCreaturesHorker Auto

GlobalVariable Property BaboSexlabStatGiantTrauma Auto
GlobalVariable Property BaboSexlabStatSkeeverTrauma Auto
GlobalVariable Property BaboSexlabStatDraugrTrauma Auto
GlobalVariable Property BaboSexlabStatCanineTrauma Auto
GlobalVariable Property BaboSexlabStatRieklingTrauma Auto
GlobalVariable Property BaboSexlabStatBeastTrauma Auto
GlobalVariable Property BaboSexlabStatFalmerTrauma Auto
GlobalVariable Property BaboSexlabStatTrollTrauma Auto
GlobalVariable Property BaboSexlabStatHorseTrauma Auto
GlobalVariable Property BaboSexlabStatChaurusTrauma Auto
GlobalVariable Property BaboSexlabStatSpiderTrauma Auto
GlobalVariable Property BaboSexlabStatSprigganTrauma Auto
GlobalVariable Property BaboSexlabStatDwarvenTrauma Auto
GlobalVariable Property BaboSexlabStatGargoyleTrauma Auto
GlobalVariable Property BaboSexlabStatFrostAtronachTrauma Auto
GlobalVariable Property BaboSexlabStatStormAtronachTrauma Auto
GlobalVariable Property BaboSexlabStatHorkerTrauma Auto

GlobalVariable Property BaboSexlabStatusFHU  Auto

GlobalVariable Property BaboSexlabSurvivalGlobal Auto
GlobalVariable Property BaboFHU Auto
GlobalVariable Property BaboBF Auto
GlobalVariable Property BaboBeeingFemale Auto
GlobalVariable Property BaboDDI Auto
GlobalVariable Property BaboFertility Auto
GlobalVariable Property BaboEstrusChaurus Auto

GlobalVariable Property BaboSexlabApproach Auto
GlobalVariable Property BaboSexlabApproachBackHugged Auto
GlobalVariable Property BaboSexlabApproachBackHugMolested Auto
GlobalVariable Property BaboSexlabApproachForcedKiss Auto
GlobalVariable Property BaboSexlabApproachForSex Auto
GlobalVariable Property BaboSexlabApproachForHello Auto
GlobalVariable Property BaboSexlabApproachForSpank Auto

Keyword Property _SLS_BikiniArmor Auto
Keyword Property ArmorLight Auto
Keyword Property ArmorHeavy Auto
Keyword Property Armorcuirass Auto
Keyword Property ClothingBody Auto
Keyword Property SLA_BraBikini Auto
Keyword Property SLA_PantyNormal Auto
Keyword Property SLA_ThongCString Auto
Keyword Property SLA_ThongGString Auto
Keyword Property SLA_ThongLowleg Auto
Keyword Property SLA_ThongT Auto
Keyword Property SLA_MicroHotpants Auto
Keyword Property SLA_PantsNormal Auto

;SLS_Mcm Property Menu Auto
;_SLS_InterfaceSlax Property Sla Auto

Book Property _SLS_LicenceMagic Auto
Book Property _SLS_LicenceArmor Auto
Book Property _SLS_LicenceWeapon Auto
Book Property _SLS_LicenceBikini Auto
Book Property _SLS_LicenceClothes Auto

Faction Property BaboFactionStatWill Auto
Faction Property BaboFactionStatCorruption Auto
Faction Property BaboFactionStatExhibitionist Auto
Faction Property BaboFactionStatLewdness Auto

Quest Property BaboDetectSpectatorQuest Auto

Keyword Property BaboDetectSpectatorKeyword Auto
Keyword Property BaboKidnapCallKeyword Auto


Alias AM01
Alias AM02
Alias AM03
Alias AF01
referencealias Alias_ViceCaptain
Actor akAM01
Actor akAM02
Actor akAM03
Actor akAF01
Actor ViceCaptain

Race Property FalmerRace Auto
Race Property ChaurusRace Auto
Race Property ChaurusReaperRace Auto
Race Property DLC1_BF_ChaurusRace Auto
Race Property DLC1ChaurusHunterRace Auto

Race Property GiantRace Auto
Race Property DLC2GhostFrostGiantRace Auto

Race Property WerewolfBeastRace Auto
Race Property DLC2WerebearBeastRace Auto

Race Property SabreCatRace Auto
Race Property SabreCatSnowyRace Auto
Race Property DLC1SabreCatGlowRace Auto

Race Property BearBlackRace Auto
Race Property BearBrownRace Auto
Race Property BearSnowRace Auto

Race Property WolfRace Auto

Keyword Property ActorTypeCreature Auto
Keyword Property DLC2RieklingKeyword Auto
Keyword Property ActorTypeTroll Auto

Globalvariable Property BaboSexlabStatCreatureTrauma Auto

Faction Property BaboFactionAlmostEatenTitle Auto
Faction Property BaboFactionStallionSkewerTitle Auto
Faction Property BaboFactionWhiterunOrcFuckToyTitle Auto
Faction Property BaboFactionRieklingThirskFuckToyTitle Auto
Faction Property BaboFactionNightgateInnVictoryTitle Auto
Faction Property BaboFactionNightgateInnFuckedTitle Auto
Faction Property BaboFactionInvestigationMarkarthTitle Auto
Faction Property BaboFactionDeviousNobleSonFuckToyTitle Auto
Faction Property BaboFactionChallengerFucktoyTitle Auto
Faction Property BaboFactionArgonianDisplayedFuckToyTitle Auto
Faction Property BaboFactionArgonianDefeatedTitle Auto
Faction Property BaboFactionWarMaidenTitle Auto
Faction Property BaboFactionPitifulHeroineTitle Auto
Faction Property BaboFactionLoanSharkSlaveTitle Auto
Faction Property BaboFactionBoozethatleadstoTitle Auto

Faction Property BaboNPCAnimating Auto

;Bool bTriggeredEvent = false
;======================================
;===============Event Zone================
;======================================

Quest Property BaboKidnapEvent Auto

Event OnInit()
	RegisterFunction()
EndEvent

Event OnKeyDown( int keyCode )
	If (!Utility.IsInMenuMode() && BDConfig.NotificationKey == keyCode)
	(BaboSexController as BaboSexControllerManager).AppearanceCalc();evaluate total attractiveness sum
		if playerref.isinfaction(BaboNPCAnimating)
			return;in the middle of animation
		endif
		If BaboKidnapEvent.isrunning() && BaboKidnapEvent.getstage() >= 8
			Bool bkey = (BaboKidnapEvent as BaboKidnapEvenScript).KeyPress()
			if bkey
				BaboXmarkerMoverScript.KeyPressSelfCommentary(6)
				return
			else
				return
			endif
		endif
		
		If BDDibella.getstage() >= 20 && !PlayerRef.isincombat()
			;Debug.Notification("I press it!")

			If (crosshairRef != None)
				if EnthrallMerchants(crosshairRef)
					;Nothing
				else
					BaboXmarkerMoverScript.KeyPressSelfCommentary(0)
				endif
			Else
				BaboXmarkerMoverScript.KeyPressSelfCommentary(0)
			EndIf
		Elseif PlayerRef.isincombat()
			;(BaboSexController as BaboSexControllerManager).;Surrender? WIP
		Else
			BaboXmarkerMoverScript.KeyPressSelfCommentary(0)
		Endif
	EndIf
EndEvent

Event OnCrosshairRefChange(ObjectReference ref)
	crosshairRef = ref as actor

EndEvent

Event BaboSLAPPMercenaryEvent(form akSpeakerform)
	Actor akspeaker = akspeakerform as actor
	BaboDialogueHirelings.SexlabApproachRegister(akspeaker)
EndEvent

Event BaboSLAPPBoyFriendEvent(form akSpeakerform)
	Actor akspeaker = akspeakerform as actor
EndEvent

Event BaboCustomKidnapEvent(form akactorformA, form akactorformB, int iScenario)
	Actor akactorA = akactorformA as actor
	Actor akactorB = akactorformB as actor
	if iScenario >= 4 && iScenario < 10
		iScenario = 4
		akactorB = None
	endif
	
	if iScenario >= 10 && iScenario < 20
		iScenario = 10
	endif
	(BaboSexController as BaboSexControllerManager).KidnapQuestStart(akactorA, akactorB, iScenario, None)
	Utility.wait(7.0)
	(BaboKidnapEvent as BaboKidnapEvenScript).StartUptheEvent(iScenario)
EndEvent

Event ShiftPositionStart(Form FormRef, int tid)
	;Debug.Notification("BaboSexlabStart Check")
EndEvent

Event OnAnimationEvent(ObjectReference akSource, string asEventName)
	if (akSource == PlayerRef) && (asEventName == "Babo_Drunk_S04_A01") ; Failed
		CalcCorruptionExpGain(1.0)
	endIf
	if (akSource == PlayerRef) && (asEventName == "Babo_Drunk_S05_A01") ; Success
		CalcCorruptionExpLoss(1.0)
	endIf

	if (akSource == PlayerRef) && (asEventName == "Babo_ChokeHug_S04_A01") ; Failed
		CalcCorruptionExpGain(2.0)
	endIf
	if (akSource == PlayerRef) && (asEventName == "Babo_ChokeHug_S05_A01") ; Success
		CalcCorruptionExpLoss(2.0)
	endIf

	if (akSource == PlayerRef) && (asEventName == "Babo_Struggle_S04_A01")
		CalcCorruptionExpGain(1.0)
	endIf

	if (akSource == PlayerRef) && (asEventName == "Babo_Struggle_S05_A01")
		CalcCorruptionExpLoss(1.0)
	endIf

	if (akSource == PlayerRef) && (asEventName == "Babo_Troll_S04_A01")
		CalcCorruptionExpGain(1.0)
	endIf

	if (akSource == PlayerRef) && (asEventName == "Babo_Troll_S05_A01")
		CalcCorruptionExpLoss(1.0)
	endIf
	
	if (akSource == PlayerRef) && (asEventName == "Babo_Riekling_S04_A01")
		CalcCorruptionExpGain(1.0)
	endIf

	if (akSource == PlayerRef) && (asEventName == "Babo_RieklingQTE_S01_A01")
		CalcCorruptionExpLoss(1.0)
	endIf
endEvent

Event OnBaboEnslavedEvent()
	BaboKidnapCallKeyword.SendStoryEvent()
	if BaboDebugging.getvalue() == 1
		Debug.notification("BaboKidnapCallKeyword")
	endif
;SendModEvent("BaboEnslavedEvent")
EndEvent

;======================================
;===============Functions================
;======================================
Function CreatureRegister(Actor creatureRef, Race CreatureRace)
	if creatureRef.haskeyword(ActorTypeNPC)
		return
	endif

	if creatureRef.haskeyword(ActorTypeUndead) || creatureRef.haskeyword(ActorTypeDragon) || creatureRef.haskeyword(ActorTypeDaedra) || creatureRef.haskeyword(ActorTypeDwarven) || creatureRef.haskeyword(ActorTypeFamiliar) || creatureRef.haskeyword(ActorTypeGhost)
		return
	endif

	if creatureRef.isinfaction(Babopacifiedcreaturefaction) || creatureRef.isinfaction(BaboCreatureMatePartnerFaction)
		return
	endif

	if BaboCreatureNonPacifiedRace.hasform(CreatureRace)
		return
	endif

	; Filter non-sexually aroused creatures
	Bool IsSexCreature = 0

	if (BaboCreatureTrollRace.hasform(CreatureRace)) && !(creatureRef.isinFaction(BaboTrollAllyFaction)) && !(creatureRef.isinFaction(BaboCreatureArousedFaction))
		creatureRef.AddToFaction(BaboTrollAllyFaction)
		BaboCreaturePacified.addform(creatureref)
		creatureRef.stopcombatalarm()
		IsSexCreature = 0
	elseif creatureRef.isinFaction(BaboTrollAllyFaction)
		creatureRef.removefromFaction(BaboTrollAllyFaction)
		creatureRef.removefromFaction(TrollFaction)
		creatureRef.removefromFaction(BaboTrollFaction)
		creatureRef.AddToFaction(BaboCreatureArousedFaction)
		IsSexCreature = 0
	elseif creatureRef.isinFaction(BaboCreatureArousedFaction)
		if creatureRef.isincombat()
			return
		else
			IsSexCreature = 1
		endif
	else
		creatureRef.AddToFaction(Babopacifiedcreaturefaction)
		BaboCreaturePacified.addform(creatureref)
		IsSexCreature = 0
		return
	endif

	if isSexCreature == 1
		;Float ArousalState = creatureRef.getfactionrank(sla_Exposure)
		int ArousalState = (sla_Framework as slaFrameworkScr).GetActorExposure(creatureRef)
		if PlayerRef.WornHasKeyword(SLA_Armorpretty)
			ArousalState += 10
		elseif PlayerRef.WornHasKeyword(EroticArmor)
			ArousalState += 20
		elseif PlayerRef.WornHasKeyword(SLA_ArmorSpendex) || PlayerRef.WornHasKeyword(SLA_ArmorLewdLeotard)
			ArousalState += 40
		elseif PlayerRef.WornHasKeyword(SLA_ArmorHalfNakedBikini) || PlayerRef.WornHasKeyword(SLA_ArmorCurtain)
			ArousalState += 60
		elseif PlayerRef.WornHasKeyword(SLA_ArmorHalfNaked) || PlayerRef.WornHasKeyword(SLA_ArmorTransparent)
			ArousalState += 70
		endif
		
		if ArousalState >= 95
			;creatureRef.SetFactionRank(sla_Arousal, 100 as int)
			(sla_Framework as slaFrameworkScr).SetActorExposure(creatureRef, 100)
		else
			(sla_Framework as slaFrameworkScr).SetActorExposure(creatureRef, ArousalState + 5)
			;creatureRef.SetFactionRank(sla_Arousal, (ArousalState + 5) as int)
		endif
		
		;Debug.notification("ArousalState is" + creatureRef.GetFactionRank(sla_Arousal) as int)
		if BaboMonitorScriptCreaturePackageActive.getvalue() == 0
			if ManageCreature(creatureRef)
				BaboMonitorScriptCreaturePackageActive.setvalue(1)
				creatureRef.evaluatepackage()
			endif
		elseif BaboMonitorScriptCreaturePackageActive.getvalue() == 1
			if creatureRef == CreatureReferences[0].GetReference() as Actor || creatureRef == CreatureReferences[1].GetReference() as Actor || creatureRef == CreatureReferences[2].GetReference() as Actor
				creatureRef.evaluatepackage()
			else
				if ManageCreature(creatureRef)
					creatureRef.evaluatepackage()
				endif
			endif
		endif
	endif
EndFunction

Function Creatureunregister()
	int iIndex = BaboCreaturePacified.getsize()
	While iIndex > 0
		Actor akList = BaboCreaturePacified.GetAt(iIndex) as actor

		if !(akList as actor).is3dLoaded()
			BaboCreaturePacified.RemoveAddedForm(akList)
			akList.Removefromfaction(Babopacifiedcreaturefaction)
			akList.Removefromfaction(BaboTrollAllyFaction)
			akList.Removefromfaction(BaboCreatureArousedFaction)
		endIf
		iIndex -= 1
	EndWhile
EndFunction

Bool Function ManageCreature(actor ArousedAnimal)
	Debug.trace("ManageCreature")
	int iIndex = 0
	While iIndex < 3
	Actor a1 = CreatureReferences[iIndex].GetReference() as Actor
		if !a1 || a1.isdead() || !a1.is3dLoaded()
			;Debug.notification(iIndex)
			CreatureReferences[iIndex].clear()
			CreatureReferences[iIndex].forcerefto(ArousedAnimal)
			return true
		endif
		iIndex += 1
	EndWhile
	return false
EndFunction

Function PlayerChangeLocation(Location akOldLoc, Location akNewLoc)
	if akNewLoc == WhiterunBreezehomeLocation
		if (BaboDialogueWhiterun.getstage() >= 30) && (BaboDialogueWhiterun.getstage() < 65)
			if BaboWhiterunBreezehomeGameDayInterval.getvalue() <= (GameDaysPassed.getvalue() - BaboWhiterunBreezehomeGameDay.getvalue())
				ViceCaptain = ViceCaptainRef.GetReference() as Actor
				if ViceCaptain.is3dloaded()
					;vice captain's variable change
					BaboBoyFriendVariable.Variable06DiceRoll(ViceCaptain, 1)
				endif
			endif
			BaboWhiterunBreezehomeGameDay.setvalue(GameDaysPassed.getvalue())
		endif
	elseif akNewLoc == BYOHHouse1LocationInterior
	elseif akNewLoc == BYOHHouse2LocationInterior
	elseif akNewLoc == BYOHHouse3LocationInterior
	endif
EndFunction

Function RegisterExternalModEvent()
	RegisterForModEvent("Babo_SLAPPMercenaryEvent", "BaboSLAPPMercenaryEvent")
	RegisterForModEvent("Babo_SLAPPBoyFriendEvent", "BaboSLAPPBoyFriendEvent")
	RegisterForModEvent("Babo_CustomKidnapEvent", "BaboCustomKidnapEvent")
	RegisterForModEvent("BaboEnslavedEvent", "OnBaboEnslavedEvent")
	;RegisterForModEvent("Babo_RandomKidnapEvent", "BaboRandomKidnapEvent") ;WIP
EndFunction

Function RegisterFunction()
	RegisterForCrosshairRef()
	UpdateKeyRegistery()
	RegisterForSexLabEvents()
	RegisterExternalModEvent()
	BeginUpdates()
	
	CD_FHU()
	CD_BF()
	CD_SLS()
	CD_DDI()
	CD_Fertility()
	CD_EstrusChaurus()
	
	Debug.Trace("BaboDialogue Keysetting Completed")
EndFunction

Function RegisterForSexLabEvents()
	;RegisterForModEvent("PlayerTrack_Start", "BaboPlayerTrackStart") ;PlayerTrack event call doesn't seem to work. Maybe because of separateorgasm?
	;RegisterForModEvent("PlayerTrack_End", "BaboPlayerTrackEnd")
	RegisterForModEvent("SexLabOrgasmSeparate", "BaboOrgasmSeparate")
	RegisterForModEvent("HookOrgasmStart", "BaboOrgasm")
	RegisterForModEvent("HookAnimationEnd", "BaboSexlabEnd")
	
	if BaboHorribleHarassment.getvalue() == 1
		SLHHRegisterAnimationEvent()
	endif
EndFunction

Event BaboSexlabEnd(int tid, bool HasPlayer)
;Debug.notification("BaboSexlabEnd Check")

	sslBaseAnimation anim = sexlab.HookAnimation(tid)
	
	if !HasPlayer
		return
	endif
	
;	If anim.hasTag("Creature") || anim.hasTag("Bestiality") || anim.hasTag("Animal")
	
		If anim.hasTag("Giant") || anim.hasTag("Lurker")
			BaboSexCountGiant.setvalue(BaboSexCountGiant.getvalue() + 1);Sex Count
		elseIf anim.hasTag("Skeever")
			BaboSexCountSkeever.setvalue(BaboSexCountSkeever.getvalue() + 1)
		elseIf anim.hasTag("Draugr") || anim.hasTag("Dragonpriest")
			BaboSexCountDraugr.setvalue(BaboSexCountDraugr.getvalue() + 1)
		elseIf anim.hasTag("Wolf") || anim.hasTag("Werewolf") || anim.hasTag("Dog")
			BaboSexCountCanine.setvalue(BaboSexCountCanine.getvalue() + 1)
		elseIf anim.hasTag("Riekling")
			BaboSexCountRiekling.setvalue(BaboSexCountRiekling.getvalue() + 1)
		elseIf anim.hasTag("Sabrecat") || anim.hasTag("Bear")  || anim.hasTag("Boar")
			BaboSexCountBeast.setvalue(BaboSexCountBeast.getvalue() + 1)
		elseIf anim.hasTag("Falmer")
			BaboSexCountFalmer.setvalue(BaboSexCountFalmer.getvalue() + 1)
		elseIf anim.hasTag("Troll")
			BaboSexCountTroll.setvalue(BaboSexCountTroll.getvalue() + 1)
		elseIf anim.hasTag("Horse")
			BaboSexCountHorse.setvalue(BaboSexCountHorse.getvalue() + 1)
		elseIf anim.hasTag("Chaurus") || anim.hasTag("ChaurusReapers") || anim.hasTag("ChaurusHunter")
			BaboSexCountChaurus.setvalue(BaboSexCountChaurus.getvalue() + 1)
		elseIf anim.hasTag("Spider") || anim.hasTag("LargeSpider") || anim.hasTag("GiantSpider")
			BaboSexCountSpider.setvalue(BaboSexCountSpider.getvalue() + 1)
		elseIf anim.hasTag("Spriggan")
			BaboSexCountSpriggan.setvalue(BaboSexCountSpriggan.getvalue() + 1)
		elseIf anim.hasTag("DwarvenSpider") || anim.hasTag("DwarvenCenturion") || anim.hasTag("DwarvenSphere")
			BaboSexCountDwarven.setvalue(BaboSexCountDwarven.getvalue() + 1)
		elseIf anim.hasTag("Gargoyle")
			BaboSexCountGargoyle.setvalue(BaboSexCountGargoyle.getvalue() + 1)
		elseIf anim.hasTag("FrostAtronach")
			BaboSexCountFrostAtronach.setvalue(BaboSexCountFrostAtronach.getvalue() + 1)
		elseIf anim.hasTag("StormAtronach")
			BaboSexCountStormAtronach.setvalue(BaboSexCountStormAtronach.getvalue() + 1)
		elseIf anim.hasTag("Horker")
			BaboSexCountHorker.setvalue(BaboSexCountHorker.getvalue() + 1)
		endif
;	endif


	BaboSexlabStatVaginal.setvalue(SexLab.Stats.GetInt(SexLab.PlayerRef, "Vaginal"))
	BaboSexlabStatAnal.setvalue(SexLab.Stats.GetInt(SexLab.PlayerRef, "Anal"))
	BaboSexlabStatOral.setvalue(SexLab.Stats.GetInt(SexLab.PlayerRef, "Oral"))
	BaboSexlabStatMales.setvalue(SexLab.Stats.GetInt(SexLab.PlayerRef, "Males"))
	BaboSexlabStatFemales.setvalue(SexLab.Stats.GetInt(SexLab.PlayerRef, "Females"))
	BaboSexlabStatCreatures.setvalue(SexLab.Stats.GetInt(SexLab.PlayerRef, "Creatures"))
	BaboSexlabStatAggressor.setvalue(SexLab.Stats.GetInt(SexLab.PlayerRef, "Aggressor"))
	
	int Victimint = BaboSexlabStatVictim.getvalue() as int
	Utility.wait(0.5)
	BaboSexlabStatVictim.setvalue(SexLab.Stats.GetInt(SexLab.PlayerRef, "Victim"))
	if Victimint < BaboSexlabStatVictim.getvalue() as int
		;CalcTraumaExpGain(1.0)
		CalcCorruptionExpGain(1.0)
		CalcLewdnessExpGain(1.0)
		If anim.hasTag("Creature") || anim.hasTag("Bestiality") || anim.hasTag("Animal")
			CalcCreatureTraumaExpGain(1.0)
			BaboSexCountCreatureRape.setvalue(BaboSexCountCreatureRape.getvalue() + 1)
		endif
		
		If anim.hasTag("Giant") || anim.hasTag("Lurker")
			BaboSexlabStatGiantTrauma.setvalue(BaboSexlabStatGiantTrauma.getvalue() + 1);Trauma Count
		elseIf anim.hasTag("Skeever")
			BaboSexlabStatSkeeverTrauma.setvalue(BaboSexlabStatSkeeverTrauma.getvalue() + 1)
		elseIf anim.hasTag("Draugr") || anim.hasTag("Dragonpriest")
			BaboSexlabStatDraugrTrauma.setvalue(BaboSexlabStatDraugrTrauma.getvalue() + 1)
		elseIf anim.hasTag("Wolf") || anim.hasTag("Werewolf") || anim.hasTag("Dog")
			BaboSexlabStatCanineTrauma.setvalue(BaboSexlabStatCanineTrauma.getvalue() + 1)
		elseIf anim.hasTag("Riekling")
			BaboSexlabStatRieklingTrauma.setvalue(BaboSexlabStatRieklingTrauma.getvalue() + 1)
		elseIf anim.hasTag("Sabrecat") || anim.hasTag("Bear")  || anim.hasTag("Boar")
			BaboSexlabStatBeastTrauma.setvalue(BaboSexlabStatBeastTrauma.getvalue() + 1)
		elseIf anim.hasTag("Falmer")
			BaboSexlabStatFalmerTrauma.setvalue(BaboSexlabStatFalmerTrauma.getvalue() + 1)
		elseIf anim.hasTag("Troll")
			BaboSexlabStatTrollTrauma.setvalue(BaboSexlabStatTrollTrauma.getvalue() + 1)
		elseIf anim.hasTag("Horse")
			BaboSexlabStatHorseTrauma.setvalue(BaboSexlabStatHorseTrauma.getvalue() + 1)
		elseIf anim.hasTag("Chaurus") || anim.hasTag("ChaurusReapers") || anim.hasTag("ChaurusHunter")
			BaboSexlabStatChaurusTrauma.setvalue(BaboSexlabStatChaurusTrauma.getvalue() + 1)
		elseIf anim.hasTag("Spider") || anim.hasTag("LargeSpider") || anim.hasTag("GiantSpider")
			BaboSexlabStatSpiderTrauma.setvalue(BaboSexlabStatSpiderTrauma.getvalue() + 1)
		elseIf anim.hasTag("Spriggan")
			BaboSexlabStatSprigganTrauma.setvalue(BaboSexlabStatSprigganTrauma.getvalue() + 1)
		elseIf anim.hasTag("DwarvenSpider") || anim.hasTag("DwarvenCenturion") || anim.hasTag("DwarvenSphere")
			BaboSexlabStatDwarvenTrauma.setvalue(BaboSexlabStatDwarvenTrauma.getvalue() + 1)
		elseIf anim.hasTag("Gargoyle")
			BaboSexlabStatGargoyleTrauma.setvalue(BaboSexlabStatGargoyleTrauma.getvalue() + 1)
		elseIf anim.hasTag("FrostAtronach")
			BaboSexlabStatFrostAtronachTrauma.setvalue(BaboSexlabStatFrostAtronachTrauma.getvalue() + 1)
		elseIf anim.hasTag("StormAtronach")
			BaboSexlabStatStormAtronachTrauma.setvalue(BaboSexlabStatStormAtronachTrauma.getvalue() + 1)
		elseIf anim.hasTag("Horker")
			BaboSexlabStatHorkerTrauma.setvalue(BaboSexlabStatHorkerTrauma.getvalue() + 1)
		endif
	endif
	
	
EndEvent

Event BaboOrgasmSeparate(Form ActorRef, Int Thread)

	sslBaseAnimation anim = sexlab.HookAnimation(Thread)
	Actor akactor = ActorRef as actor
	
	if akactor != PlayerRef
		return
	endif

	If anim.hasTag("Creature") || anim.hasTag("Bestiality") || anim.hasTag("Animal")
		If anim.hasTag("Vaginal") || anim.hasTag("Anal")
		
			BaboSexlabStatCreaturesCum.setvalue(BaboSexlabStatCreaturesCum.getvalue() + 1);Total creature cum inside count
	
			If anim.hasTag("Giant") || anim.hasTag("Lurker")
				BaboSexlabStatCreaturesGiant.setvalue(BaboSexlabStatCreaturesGiant.getvalue() + 1);Cum inside count

			elseIf anim.hasTag("Skeever")
				BaboSexlabStatCreaturesSkeever.setvalue(BaboSexlabStatCreaturesSkeever.getvalue() + 1)
			
			elseIf anim.hasTag("Draugr") || anim.hasTag("Dragonpriest")
				BaboSexlabStatCreaturesDraugr.setvalue(BaboSexlabStatCreaturesDraugr.getvalue() + 1)
				
			elseIf anim.hasTag("Wolf") || anim.hasTag("Werewolf") || anim.hasTag("Dog")
				BaboSexlabStatCreaturesCanine.setvalue(BaboSexlabStatCreaturesCanine.getvalue() + 1)

			elseIf anim.hasTag("Riekling")
				BaboSexlabStatCreaturesRiekling.setvalue(BaboSexlabStatCreaturesRiekling.getvalue() + 1)
				
			elseIf anim.hasTag("Sabrecat") || anim.hasTag("Bear")  || anim.hasTag("Boar")
				BaboSexlabStatCreaturesBeast.setvalue(BaboSexlabStatCreaturesBeast.getvalue() + 1)

			elseIf anim.hasTag("Falmer")
				BaboSexlabStatCreaturesFalmer.setvalue(BaboSexlabStatCreaturesFalmer.getvalue() + 1)
				
			elseIf anim.hasTag("Troll")
				BaboSexlabStatCreaturesTroll.setvalue(BaboSexlabStatCreaturesTroll.getvalue() + 1)

			elseIf anim.hasTag("Horse")
				BaboSexlabStatCreaturesHorse.setvalue(BaboSexlabStatCreaturesHorse.getvalue() + 1)

			elseIf anim.hasTag("Chaurus") || anim.hasTag("ChaurusReapers") || anim.hasTag("ChaurusHunter")
				BaboSexlabStatCreaturesChaurus.setvalue(BaboSexlabStatCreaturesChaurus.getvalue() + 1)
				
			elseIf anim.hasTag("Spriggan")
				BaboSexlabStatCreaturesSpriggan.setvalue(BaboSexlabStatCreaturesSpriggan.getvalue() + 1)
				
			elseIf anim.hasTag("Spider") || anim.hasTag("LargeSpider") || anim.hasTag("GiantSpider")
				BaboSexlabStatCreaturesSpider.setvalue(BaboSexlabStatCreaturesSpider.getvalue() + 1)
				
			elseIf anim.hasTag("DwarvenSpider") || anim.hasTag("DwarvenCenturion") || anim.hasTag("DwarvenSphere")
				BaboSexlabStatCreaturesDwarven.setvalue(BaboSexlabStatCreaturesDwarven.getvalue() + 1)
				
			elseIf anim.hasTag("Gargoyle")
				BaboSexlabStatCreaturesGargoyle.setvalue(BaboSexlabStatCreaturesGargoyle.getvalue() + 1)

			elseIf anim.hasTag("FrostAtronach")
				BaboSexlabStatCreaturesFrostAtronach.setvalue(BaboSexlabStatCreaturesFrostAtronach.getvalue() + 1)

			elseIf anim.hasTag("StormAtronach")
				BaboSexlabStatCreaturesStormAtronach.setvalue(BaboSexlabStatCreaturesStormAtronach.getvalue() + 1)

			elseIf anim.hasTag("Horker")
				BaboSexlabStatCreaturesHorker.setvalue(BaboSexlabStatCreaturesHorker.getvalue() + 1)

			endif
		endif
	endif
EndEvent

Event BaboOrgasm(int thread, bool hasPlayer)
	sslBaseAnimation anim = sexlab.HookAnimation(thread)
	
	if !hasplayer
		return
	endif

	If anim.hasTag("Creature") || anim.hasTag("Bestiality") || anim.hasTag("Animal")
		If anim.hasTag("Vaginal") || anim.hasTag("Anal")
		
			BaboSexlabStatCreaturesCum.setvalue(BaboSexlabStatCreaturesCum.getvalue() + 1);Total creature cum inside count
	
			If anim.hasTag("Giant") || anim.hasTag("Lurker")
				BaboSexlabStatCreaturesGiant.setvalue(BaboSexlabStatCreaturesGiant.getvalue() + 1);Cum inside count

			elseIf anim.hasTag("Skeever")
				BaboSexlabStatCreaturesSkeever.setvalue(BaboSexlabStatCreaturesSkeever.getvalue() + 1)

			elseIf anim.hasTag("Draugr") || anim.hasTag("Dragonpriest")
				BaboSexlabStatCreaturesDraugr.setvalue(BaboSexlabStatCreaturesDraugr.getvalue() + 1)
				
			elseIf anim.hasTag("Wolf") || anim.hasTag("Werewolf") || anim.hasTag("Dog")
				BaboSexlabStatCreaturesCanine.setvalue(BaboSexlabStatCreaturesCanine.getvalue() + 1)

			elseIf anim.hasTag("Riekling")
				BaboSexlabStatCreaturesRiekling.setvalue(BaboSexlabStatCreaturesRiekling.getvalue() + 1)
				
			elseIf anim.hasTag("Sabrecat") || anim.hasTag("Bear")  || anim.hasTag("Boar")
				BaboSexlabStatCreaturesBeast.setvalue(BaboSexlabStatCreaturesBeast.getvalue() + 1)

			elseIf anim.hasTag("Falmer")
				BaboSexlabStatCreaturesFalmer.setvalue(BaboSexlabStatCreaturesFalmer.getvalue() + 1)
				
			elseIf anim.hasTag("Troll")
				BaboSexlabStatCreaturesTroll.setvalue(BaboSexlabStatCreaturesTroll.getvalue() + 1)

			elseIf anim.hasTag("Horse")
				BaboSexlabStatCreaturesHorse.setvalue(BaboSexlabStatCreaturesHorse.getvalue() + 1)

			elseIf anim.hasTag("Chaurus") || anim.hasTag("ChaurusReapers") || anim.hasTag("ChaurusHunter")
				BaboSexlabStatCreaturesChaurus.setvalue(BaboSexlabStatCreaturesChaurus.getvalue() + 1)
				
			elseIf anim.hasTag("Spriggan")
				BaboSexlabStatCreaturesSpriggan.setvalue(BaboSexlabStatCreaturesSpriggan.getvalue() + 1)
				
			elseIf anim.hasTag("Spider") || anim.hasTag("LargeSpider") || anim.hasTag("GiantSpider")
				BaboSexlabStatCreaturesSpider.setvalue(BaboSexlabStatCreaturesSpider.getvalue() + 1)
				
			elseIf anim.hasTag("DwarvenSpider") || anim.hasTag("DwarvenCenturion") || anim.hasTag("DwarvenSphere")
				BaboSexlabStatCreaturesDwarven.setvalue(BaboSexlabStatCreaturesDwarven.getvalue() + 1)
				
			elseIf anim.hasTag("Gargoyle")
				BaboSexlabStatCreaturesGargoyle.setvalue(BaboSexlabStatCreaturesGargoyle.getvalue() + 1)

			elseIf anim.hasTag("FrostAtronach")
				BaboSexlabStatCreaturesFrostAtronach.setvalue(BaboSexlabStatCreaturesFrostAtronach.getvalue() + 1)

			elseIf anim.hasTag("StormAtronach")
				BaboSexlabStatCreaturesStormAtronach.setvalue(BaboSexlabStatCreaturesStormAtronach.getvalue() + 1)

			elseIf anim.hasTag("Horker")
				BaboSexlabStatCreaturesHorker.setvalue(BaboSexlabStatCreaturesHorker.getvalue() + 1)

			endif
		endif
	endif
EndEvent


Function SLHHRegisterAnimationEvent()
	RegisterForAnimationEvent(PlayerRef, "Babo_DeathLoop")
	RegisterForAnimationEvent(PlayerRef, "Babo_Drunk_SBD_A01Loop")
	RegisterForAnimationEvent(PlayerRef, "Babo_Struggle_S04_A01")
	RegisterForAnimationEvent(PlayerRef, "Babo_Struggle_S05_A01")
	RegisterForAnimationEvent(PlayerRef, "Babo_Drunk_S04_A01")
	RegisterForAnimationEvent(PlayerRef, "Babo_Drunk_S05_A01")
	RegisterForAnimationEvent(PlayerRef, "Babo_ChokeHug_S04_A01")
	RegisterForAnimationEvent(PlayerRef, "Babo_ChokeHug_S05_A01")
	RegisterForAnimationEvent(PlayerRef, "Babo_Troll_S04_A01")
	RegisterForAnimationEvent(PlayerRef, "Babo_Troll_S05_A01")
	RegisterForAnimationEvent(PlayerRef, "Babo_Riekling_S04_A01")
	RegisterForAnimationEvent(PlayerRef, "Babo_RieklingQTE_S01_A01")
EndFunction

Function UpdateKeyRegistery()
	UnregisterForAllKeys()
	If BDConfig.NotificationKey != -1
		RegisterForKey(BDConfig.NotificationKey)
		Debug.Trace(self + ": Updated notification key to " + BDConfig.NotificationKey)
	EndIf
EndFunction

Bool Function EnthrallMerchants(Actor akactor)
	If akactor && !akactor.isincombat()
		If akactor.IsinFaction(JobMerchantFaction)
			;akactor.addperk(AllurePerkPlus)
			EnthrallAnimationPlay(akactor)
			EnthrallMerchantSpell.cast(akactor)
			BaboSeducingAttemptCount.setvalue(BaboSeducingAttemptCount.getvalue() + 1)
			BaboSeducingMerchantAttemptCount.setvalue(BaboSeducingMerchantAttemptCount.getvalue() + 1)
			BRMQuest.IncreaseReputationBitch(1)
			Return true
		elseif akactor.IsinFaction(PotentialHireling)
			EnthrallAnimationPlay(akactor)
			EnthrallMerchantSpell.cast(akactor)
			BaboSeducingAttemptCount.setvalue(BaboSeducingAttemptCount.getvalue() + 1)
			BaboSeducingMercenaryAttemptCount.setvalue(BaboSeducingMercenaryAttemptCount.getvalue() + 1)
			BaboDialogueHirelings.Startthequest()
			BRMQuest.IncreaseReputationBitch(1)
		EndIf
	Else
		(BaboSexController as BaboSexControllerManager).MonitorMessagebox(1)
	EndIf

	Return False
EndFunction

Function EnthrallAnimationPlay(Actor akactor)
	Debug.SendAnimationEvent(akactor, "IdleForceDefaultState")
	Utility.wait(1.0)
	akactor.setlookat(PlayerRef, True)
	Utility.wait(2.0)
	int random = Utility.RandomInt(1, 5)
	If random == 1
		Debug.SendAnimationEvent(PlayerRef, "BaboAllurePussyShowing01")
		Debug.SendAnimationEvent(akactor, "BaboAllureManPussyResponse01")
	ElseIf random == 2
		Debug.SendAnimationEvent(PlayerRef, "BaboAllureBreastShowing01")
		Debug.SendAnimationEvent(akactor, "BaboAllureManBreastResponse01")
	ElseIf random == 3
		Debug.SendAnimationEvent(PlayerRef, "BaboAllureBreastShowing02")
		Debug.SendAnimationEvent(akactor, "BaboAllureManBreastResponse01")
	ElseIf random == 4
		Debug.SendAnimationEvent(PlayerRef, "BaboAllureSeducingkiss01")
		Debug.SendAnimationEvent(akactor, "IdleExamine")
	ElseIf random == 5
		Debug.SendAnimationEvent(PlayerRef, "BaboAllureSeducingkiss02")
		Debug.SendAnimationEvent(akactor, "IdleExamine")
	EndIf

EndFunction

Function BeginUpdates()
	LastUpdate = GameDaysPassed.GetValue()
	RegisterForSingleUpdateGameTime(1.0)
EndFunction

Event OnUpdateGameTime()
	DoUpdate()
	DoStatus()
EndEvent

;======================================
;===============Status=================
;======================================

Function DoStatus()

if BaboFHU.getvalue() == 1
	SR_InflateFaction = Game.GetFormFromFile(0x00A991, "sr_FillHerUp.esp") as Faction
	InflationFloat = PlayerRef.getfactionrank(SR_InflateFaction)
	
	if InflationFloat < 5
		BaboSexlabStatusFHU.setvalue(0)
	elseif InflationFloat >= 5 && InflationFloat < 20
		BaboSexlabStatusFHU.setvalue(1)
	elseif InflationFloat >= 20 && InflationFloat < 40
		BaboSexlabStatusFHU.setvalue(2)
	elseif InflationFloat >= 40 && InflationFloat < 60
		BaboSexlabStatusFHU.setvalue(3)
	elseif InflationFloat >= 60 && InflationFloat < 80
		BaboSexlabStatusFHU.setvalue(4)
	elseif InflationFloat >= 80
		BaboSexlabStatusFHU.setvalue(5)
	endif
	PlayerRef.setfactionrank(SLAX_CumFilledFaction, BaboSexlabStatusFHU.getvalue() as int) ; It will be replaced by FillHerUp mod
endif
ExportStatus()
ImportStatus()
EndFunction

;======================================
;===============Experience=============
;======================================


;===================================================================================
;========SSLV - Trauma 10
;========Rape - Corruption 1
;========RapeMMF - Corruption 3
;========RapeMMMF - Corruption 6
;========RapeCreature - CreatureCorruption 1
;========RapeCreatureMMF - CreatureCorruption 3
;========RapeCreatureMMMF - CreatureCorruption 6
;========

Quest Property BaboBoyFriendVariableSetting Auto

Function DoUpdate()
	BaboDetectSpectatorKeyword.SendStoryEvent(None, PlayerRef)
	
	Utility.wait(5.0);Wait for the quest to start
	if BaboDebugging.getvalue() == 1
		Debug.Notification("Doupdate")
		Debug.Notification(BaboDetectSpectatorQuest.getalias(0).getname())
	endif
	
	akAM01 = (BaboDetectSpectatorQuest.getalias(1) as referencealias).getreference() as actor
	akAM02 = (BaboDetectSpectatorQuest.getalias(2) as referencealias).getreference() as actor
	akAM03 = (BaboDetectSpectatorQuest.getalias(3) as referencealias).getreference() as actor
	akAF01 = (BaboDetectSpectatorQuest.getalias(4) as referencealias).getreference() as actor
	Alias_ViceCaptain = BaboDetectSpectatorQuest.getalias(5) as referencealias
	ViceCaptain = Alias_ViceCaptain.GetReference() as Actor

	int HowManyPeople = 0
	if akAM01
		HowManyPeople += 1
	endif
	if akAM02
		HowManyPeople += 1
	endif
	if akAM03
		HowManyPeople += 1
	endif
	if ViceCaptain
		if BaboDebugging.getvalue() == 1
			Debug.Notification("ViceCaptain")
		endif
		if (BaboDialogueWhiterun.getstage() >= 30) && (BaboDialogueWhiterun.getstage() < 65)
			if ViceCaptain.getactorvalue("Variable06") == 4
				(BaboBoyFriendVariableSetting as BaboBoyFriendVariableScript).ViceCaptainRefreshPackage()
			endif
		endif
	endif

	BRMQuest.DecreaseReputationBitch(1)
	BaboDetectSpectatorHowMany.setvalue(HowManyPeople)

	If (_SLS_BikiniArmor && PlayerRef.WornHasKeyword(_SLS_BikiniArmor)) ||  PlayerRef.WornHasKeyword(SLA_ArmorPretty) || PlayerRef.WornHasKeyword(EroticArmor) || PlayerRef.WornHasKeyword(SLA_ArmorSpendex) || PlayerRef.WornHasKeyword(SLA_ArmorHalfNakedBikini) || PlayerRef.WornHasKeyword(SLA_ArmorLewdLeotard) || PlayerRef.WornHasKeyword(SLA_ArmorCurtain) || PlayerRef.WornHasKeyword(SLA_ArmorHalfNaked) || PlayerRef.WornHasKeyword(SLA_ArmorTransparent)
		CalcExpGain()
	ElseIf PlayerRef.WornHasKeyword(Armorcuirass) || PlayerRef.WornHasKeyword(ClothingBody)
		CalcExpLoss()
	Elseif !PlayerRef.WornHasKeyword(Armorcuirass) && !PlayerRef.WornHasKeyword(ClothingBody)
		CalcExpNakedGain()
	EndIf

	CalcLevel()
	SkyrimAchievement()
	LastUpdate = GameDaysPassed.GetValue()
	RegisterForSingleUpdateGameTime(BaboDetectSpectatorUpdateInterval.getvalue())
EndFunction

Function SkyrimAchievement()

;game.querystat("Main Quests Completed")
;game.querystat("Side Quests Completed")
;game.querystat("Misc Objectives Completed")

;game.querystat("People Killed")

EndFunction

GlobalVariable Property BaboPlayerAppearanceValue Auto
GlobalVariable Property BaboPlayerBreastsValue Auto
GlobalVariable Property BaboPlayerButtocksValue Auto

Function CalcExpNakedGain()
	;Alias_Male01.getreference() as actor  I am not sure if an alias alone can detect whether there is a designated actor or not
	
	if akAM01
		ExhibitionistExp += ((GameDaysPassed.GetValue() - LastUpdate) * 24.0) * (BaboSexlabStatExhibitionistSpeed.getvalue() * 3)
		CalcLewdnessExpGain(3.0)
		;BRMQuest.DecreaseReputation(1, 0)
		BRMQuest.IncreaseReputationBitch(1)
	endif

	if	akAM02 && akAM03
		ExhibitionistExp *= 3
		CalcLewdnessExpGain(2.0)
		BRMQuest.IncreaseReputationBitch(2)
	elseif akAM02 || akAM03
		ExhibitionistExp *= 2
		CalcLewdnessExpGain(1.0)
		BRMQuest.IncreaseReputationBitch(1)
	endif
EndFunction

Function CalcExpGain()
	Float ExhibitionistExpT = 0.0
	Float LewdnessExpT = 0.0
	Float ReputationBitchT = 0.0
	Float GetRepFloat = 0.0

	if	PlayerRef.WornHasKeyword(SLA_Brabikini) && !(PlayerRef.WornHasKeyword(SLA_PantyNormal)) && !(PlayerRef.WornHasKeyword(SLA_ThongCString)) && !(PlayerRef.WornHasKeyword(SLA_ThongLowleg)) && !(PlayerRef.WornHasKeyword(SLA_ThongT)) && !(PlayerRef.WornHasKeyword(SLA_ThongGString)) && !(PlayerRef.WornHasKeyword(SLA_PantsNormal)) && !(PlayerRef.WornHasKeyword(SLA_MicroHotpants))
		ExhibitionistExpT += ((GameDaysPassed.GetValue() - LastUpdate) * 24.0) * (BaboSexlabStatExhibitionistSpeed.getvalue() * 1.4)
	endif

	if PlayerRef.WornHasKeyword(SLA_ArmorHalfNaked) || PlayerRef.WornHasKeyword(SLA_ArmorTransparent)
		BikExp += ((GameDaysPassed.GetValue() - LastUpdate) * 24.0) * (BaboSexlabStatSkimpySpeed.getvalue() * 1.5)
	elseif PlayerRef.WornHasKeyword(SLA_ArmorHalfNakedBikini) || PlayerRef.WornHasKeyword(SLA_ArmorCurtain)
		BikExp += ((GameDaysPassed.GetValue() - LastUpdate) * 24.0) * (BaboSexlabStatSkimpySpeed.getvalue() * 1.3)
	elseif PlayerRef.WornHasKeyword(SLA_ArmorSpendex) || PlayerRef.WornHasKeyword(SLA_ArmorLewdLeotard)
		BikExp += ((GameDaysPassed.GetValue() - LastUpdate) * 24.0) * (BaboSexlabStatSkimpySpeed.getvalue() * 1.1)
	elseif PlayerRef.WornHasKeyword(EroticArmor)
		BikExp += ((GameDaysPassed.GetValue() - LastUpdate) * 24.0) * (BaboSexlabStatSkimpySpeed.getvalue() * 1.0)
	elseif PlayerRef.WornHasKeyword(SLA_ArmorPretty)
		BikExp += ((GameDaysPassed.GetValue() - LastUpdate) * 24.0) * (BaboSexlabStatSkimpySpeed.getvalue() * 0.8)
	elseif _SLS_BikiniArmor && PlayerRef.WornHasKeyword(_SLS_BikiniArmor)
		BikExp += ((GameDaysPassed.GetValue() - LastUpdate) * 24.0) * BaboSexlabStatSkimpySpeed.getvalue()
	endif

	if akAM01
		if PlayerRef.WornHasKeyword(SLA_ArmorHalfNaked) || PlayerRef.WornHasKeyword(SLA_ArmorTransparent)
			ExhibitionistExpT += ((GameDaysPassed.GetValue() - LastUpdate) * 24.0) * (BaboSexlabStatExhibitionistSpeed.getvalue() * 2)
			LewdnessExpT += 2.0
			ReputationBitchT += 3.0
		elseif PlayerRef.WornHasKeyword(SLA_ArmorHalfNakedBikini) || PlayerRef.WornHasKeyword(SLA_ArmorCurtain)
			ExhibitionistExpT += ((GameDaysPassed.GetValue() - LastUpdate) * 24.0) * (BaboSexlabStatExhibitionistSpeed.getvalue() * 1.3)
			LewdnessExpT += 1.2
			ReputationBitchT += 2.0
		elseif PlayerRef.WornHasKeyword(SLA_ArmorSpendex) || PlayerRef.WornHasKeyword(SLA_ArmorLewdLeotard)
			ExhibitionistExpT += ((GameDaysPassed.GetValue() - LastUpdate) * 24.0) * (BaboSexlabStatExhibitionistSpeed.getvalue() * 1.15)
			LewdnessExpT += 0.5
			ReputationBitchT += 1.5
		elseif PlayerRef.WornHasKeyword(EroticArmor)
			ExhibitionistExpT += ((GameDaysPassed.GetValue() - LastUpdate) * 24.0) * (BaboSexlabStatExhibitionistSpeed.getvalue() * 1.1)
			LewdnessExpT += 1.0
			ReputationBitchT += 1.0
		endif

		if BaboPlayerPubicHair.getvalue() >= 1 
			if PlayerRef.WornHasKeyword(SLA_ThongCString)
				ExhibitionistExpT += ((GameDaysPassed.GetValue() - LastUpdate) * 24.0) * (BaboSexlabStatExhibitionistSpeed.getvalue() * 1.3)
				LewdnessExpT += 0.8
			elseif PlayerRef.WornHasKeyword(SLA_ThongLowleg) || PlayerRef.WornHasKeyword(SLA_ThongGstring)
				ExhibitionistExpT += ((GameDaysPassed.GetValue() - LastUpdate) * 24.0) * (BaboSexlabStatExhibitionistSpeed.getvalue() * 1.25);Including G String
				LewdnessExpT += 0.6
			elseif PlayerRef.WornHasKeyword(SLA_ThongT) || PlayerRef.WornHasKeyword(SLA_MicroHotpants)
				ExhibitionistExpT += ((GameDaysPassed.GetValue() - LastUpdate) * 24.0) * (BaboSexlabStatExhibitionistSpeed.getvalue() * 1.1)
				LewdnessExpT += 0.4
			endif
		else
			if PlayerRef.WornHasKeyword(SLA_ThongCString)
				ExhibitionistExpT += ((GameDaysPassed.GetValue() - LastUpdate) * 24.0) * (BaboSexlabStatExhibitionistSpeed.getvalue() * 1.15)
				LewdnessExpT += 0.7
			elseif PlayerRef.WornHasKeyword(SLA_ThongLowleg) || PlayerRef.WornHasKeyword(SLA_ThongGstring)
				ExhibitionistExpT += ((GameDaysPassed.GetValue() - LastUpdate) * 24.0) * (BaboSexlabStatExhibitionistSpeed.getvalue() * 1.1)
				LewdnessExpT += 0.5
			elseif PlayerRef.WornHasKeyword(SLA_ThongT) || PlayerRef.WornHasKeyword(SLA_MicroHotpants)
				ExhibitionistExpT += ((GameDaysPassed.GetValue() - LastUpdate) * 24.0) * (BaboSexlabStatExhibitionistSpeed.getvalue() * 1.05)
				LewdnessExpT += 0.3
			endif
		endif

		if	akAM02 && akAM03
			ExhibitionistExpT *= 3
			LewdnessExpT *= 3
			ReputationBitchT *= 3
		elseif	akAM02 || akAM03
			ExhibitionistExpT *= 2
			LewdnessExpT *= 2
			ReputationBitchT *= 2
		endif
	endif
	GetRepFloat += (BaboPlayerAppearanceValue.getvalue() / 2)
	GetRepFloat += (BaboPlayerBreastsValue.getvalue() / 5)
	GetRepFloat += (BaboPlayerButtocksValue.getvalue() / 6)
	
	if GetRepFloat as int >= Utility.randomint(0, 100)	
		BRMQuest.IncreaseReputationBitchbyExposure(ReputationBitchT)
	endif
	
	ExhibitionistExp += ExhibitionistExpT
	if BaboSexlabStatLewdness.getvalue() < 40
		CalcLewdnessExpGain(LewdnessExpT)
	endif
	If BikExp > ExpPerLevel * 7.5 ; Cap experience
		BikExp = ExpPerLevel * 7.5
	EndIf
	;Debug.Messagebox("OldExp: " + OldExp + "\nExpGain: " + ExpGain + "\nNewExp: " + BikExp)
EndFunction

Function CalcCreatureTraumaExpGain(Float Mult)
	BaboSexlabStatCreatureTrauma.setvalue(BaboSexlabStatCreatureTrauma.getvalue() + Mult)
EndFunction

Function CalcCreatureTraumaExpLoss(Float Mult)
	BaboSexlabStatCreatureTrauma.setvalue(BaboSexlabStatCreatureTrauma.getvalue() - Mult)
EndFunction

Function CalcCorruptionExpGain(Float Mult)
	BaboSexlabStatCorruption.setvalue(BaboSexlabStatCorruption.getvalue() + (BaboSexlabStatCorruptionSpeed.getvalue() * Mult))
	if BaboSexlabStatCorruption.getvalue() > 50
		BaboSexlabStatCorruption.setvalue(50)
	elseif BaboSexlabStatCorruption.getvalue() < 0
		BaboSexlabStatCorruption.setvalue(0)
	endif
	CorruptionFinalCheck()
EndFunction

Function CalcCorruptionExpLoss(Float Mult)
	BaboSexlabStatCorruption.setvalue(BaboSexlabStatCorruption.getvalue() - (BaboSexlabStatCorruptionSpeed.getvalue() * Mult))
	if BaboSexlabStatCorruption.getvalue() < 0
		BaboSexlabStatCorruption.setvalue(0)
	endif
	CorruptionFinalCheck()
EndFunction


Function CorruptionFinalCheck()
int Stat = BaboSexlabStatCorruption.getvalue() as int

if Stat <= 5
	PlayerRef.setfactionrank(SLAX_SubmissiveFaction, 0)
	PlayerRef.setfactionrank(BaboFactionStatCorruption, 0)
elseif Stat <= 10
	PlayerRef.setfactionrank(SLAX_SubmissiveFaction, 1)
	PlayerRef.setfactionrank(BaboFactionStatCorruption, 1)
elseif Stat <= 20
	PlayerRef.setfactionrank(SLAX_SubmissiveFaction, 2)
	PlayerRef.setfactionrank(BaboFactionStatCorruption, 2)
elseif Stat <= 30
	PlayerRef.setfactionrank(SLAX_SubmissiveFaction, 3)
	PlayerRef.setfactionrank(BaboFactionStatCorruption, 3)
elseif Stat <= 40
	PlayerRef.setfactionrank(SLAX_SubmissiveFaction, 4)
	PlayerRef.setfactionrank(BaboFactionStatCorruption, 4)
elseif Stat <= 50
	PlayerRef.setfactionrank(SLAX_SubmissiveFaction, 5)
	PlayerRef.setfactionrank(BaboFactionStatCorruption, 5)
endif

EndFunction

Function CalcConfidenceExpGain(Float Mult)
	BaboSexlabStatConfidenceWill.setvalue(BaboSexlabStatConfidenceWill.getvalue() + Mult)
	if BaboSexlabStatConfidenceWill.getvalue() > 100
		BaboSexlabStatConfidenceWill.setvalue(100)
	elseif BaboSexlabStatConfidenceWill.getvalue() < 0
		BaboSexlabStatConfidenceWill.setvalue(0)
	endif
WillFinalCheck()
EndFunction

Function CalcTraumaExpGain(Float Mult)
	BaboSexlabStatTrauma.setvalue(BaboSexlabStatTrauma.getvalue() + Mult)
	if BaboSexlabStatTrauma.getvalue() > 200
		BaboSexlabStatTrauma.setvalue(200)
	elseif BaboSexlabStatTrauma.getvalue() < 0
		BaboSexlabStatTrauma.setvalue(0)
	endif
WillFinalCheck()
EndFunction

Function CalcTraumaExpLoss(Float Mult);De
	BaboSexlabStatTrauma.setvalue(BaboSexlabStatTrauma.getvalue() - Mult)
	if BaboSexlabStatTrauma.getvalue() < 0
		BaboSexlabStatTrauma.setvalue(0)
	endif
WillFinalCheck()
EndFunction

Function CalcGiantTraumaExpGain(Float Mult)
	BaboSexlabStatGiantTrauma.setvalue(BaboSexlabStatGiantTrauma.getvalue() + Mult)
	if BaboSexlabStatGiantTrauma.getvalue() > 200
		BaboSexlabStatGiantTrauma.setvalue(200)
	endif
EndFunction

Function CalcSkeeverTraumaExpGain(Float Mult)
	BaboSexlabStatSkeeverTrauma.setvalue(BaboSexlabStatSkeeverTrauma.getvalue() + Mult)
	if BaboSexlabStatSkeeverTrauma.getvalue() > 200
		BaboSexlabStatSkeeverTrauma.setvalue(200)
	endif
EndFunction

Function CalcDraugrTraumaExpGain(Float Mult)
	BaboSexlabStatDraugrTrauma.setvalue(BaboSexlabStatDraugrTrauma.getvalue() + Mult)
	if BaboSexlabStatDraugrTrauma.getvalue() > 200
		BaboSexlabStatDraugrTrauma.setvalue(200)
	endif
EndFunction

Function CalcCanineTraumaExpGain(Float Mult)
	BaboSexlabStatCanineTrauma.setvalue(BaboSexlabStatCanineTrauma.getvalue() + Mult)
	if BaboSexlabStatCanineTrauma.getvalue() > 200
		BaboSexlabStatCanineTrauma.setvalue(200)
	endif
EndFunction

Function CalcRieklingTraumaExpGain(Float Mult)
	BaboSexlabStatRieklingTrauma.setvalue(BaboSexlabStatRieklingTrauma.getvalue() + Mult)
	if BaboSexlabStatRieklingTrauma.getvalue() > 200
		BaboSexlabStatRieklingTrauma.setvalue(200)
	endif
EndFunction

Function CalcBeastTraumaExpGain(Float Mult)
	BaboSexlabStatBeastTrauma.setvalue(BaboSexlabStatBeastTrauma.getvalue() + Mult)
	if BaboSexlabStatBeastTrauma.getvalue() > 200
		BaboSexlabStatBeastTrauma.setvalue(200)
	endif
EndFunction

Function CalcFalmerTraumaExpGain(Float Mult)
	BaboSexlabStatFalmerTrauma.setvalue(BaboSexlabStatFalmerTrauma.getvalue() + Mult)
	if BaboSexlabStatFalmerTrauma.getvalue() > 200
		BaboSexlabStatFalmerTrauma.setvalue(200)
	endif
EndFunction

Function CalcTrollTraumaExpGain(Float Mult)
	BaboSexlabStatTrollTrauma.setvalue(BaboSexlabStatTrollTrauma.getvalue() + Mult)
	if BaboSexlabStatTrollTrauma.getvalue() > 200
		BaboSexlabStatTrollTrauma.setvalue(200)
	endif
EndFunction

Function CalcHorseTraumaExpGain(Float Mult)
	BaboSexlabStatHorseTrauma.setvalue(BaboSexlabStatHorseTrauma.getvalue() + Mult)
	if BaboSexlabStatHorseTrauma.getvalue() > 200
		BaboSexlabStatHorseTrauma.setvalue(200)
	endif
EndFunction

Function CalcChaurusTraumaExpGain(Float Mult)
	BaboSexlabStatChaurusTrauma.setvalue(BaboSexlabStatChaurusTrauma.getvalue() + Mult)
	if BaboSexlabStatChaurusTrauma.getvalue() > 200
		BaboSexlabStatChaurusTrauma.setvalue(200)
	endif
EndFunction

Function CalcSpiderTraumaExpGain(Float Mult)
	BaboSexlabStatSpiderTrauma.setvalue(BaboSexlabStatSpiderTrauma.getvalue() + Mult)
	if BaboSexlabStatSpiderTrauma.getvalue() > 200
		BaboSexlabStatSpiderTrauma.setvalue(200)
	endif
EndFunction

Function CalcSprigganTraumaExpGain(Float Mult)
	BaboSexlabStatSprigganTrauma.setvalue(BaboSexlabStatSprigganTrauma.getvalue() + Mult)
	if BaboSexlabStatSprigganTrauma.getvalue() > 200
		BaboSexlabStatSprigganTrauma.setvalue(200)
	endif
EndFunction

Function CalcDwarvenTraumaExpGain(Float Mult)
	BaboSexlabStatDwarvenTrauma.setvalue(BaboSexlabStatDwarvenTrauma.getvalue() + Mult)
	if BaboSexlabStatDwarvenTrauma.getvalue() > 200
		BaboSexlabStatDwarvenTrauma.setvalue(200)
	endif
EndFunction

Function CalcGargoyleTraumaExpGain(Float Mult)
	BaboSexlabStatGargoyleTrauma.setvalue(BaboSexlabStatGargoyleTrauma.getvalue() + Mult)
	if BaboSexlabStatGargoyleTrauma.getvalue() > 200
		BaboSexlabStatGargoyleTrauma.setvalue(200)
	endif
EndFunction

Function CalcFrostAtronachTraumaExpGain(Float Mult)
	BaboSexlabStatFrostAtronachTrauma.setvalue(BaboSexlabStatFrostAtronachTrauma.getvalue() + Mult)
	if BaboSexlabStatFrostAtronachTrauma.getvalue() > 200
		BaboSexlabStatFrostAtronachTrauma.setvalue(200)
	endif
EndFunction

Function CalcStormAtronachTraumaExpGain(Float Mult)
	BaboSexlabStatStormAtronachTrauma.setvalue(BaboSexlabStatStormAtronachTrauma.getvalue() + Mult)
	if BaboSexlabStatStormAtronachTrauma.getvalue() > 200
		BaboSexlabStatStormAtronachTrauma.setvalue(200)
	endif
EndFunction

Function CalcHorkerTraumaExpGain(Float Mult)
	BaboSexlabStatHorkerTrauma.setvalue(BaboSexlabStatHorkerTrauma.getvalue() + Mult)
	if BaboSexlabStatHorkerTrauma.getvalue() > 200
		BaboSexlabStatHorkerTrauma.setvalue(200)
	endif
EndFunction


Function WillFinalCheck()
float Stat = BaboSexlabStatTrauma.getvalue()
float wStat = BaboSexlabStatConfidenceWill.getvalue()

if stat == 0
	if wStat <= 10
		PlayerRef.setfactionrank(SLAX_WillfulFaction, 0)
		PlayerRef.setfactionrank(BaboFactionStatWill, 4)
	elseif wStat <= 20
		PlayerRef.setfactionrank(SLAX_WillfulFaction, 1)
		PlayerRef.setfactionrank(BaboFactionStatWill, 3)
	elseif wStat <= 35
		PlayerRef.setfactionrank(SLAX_WillfulFaction, 2)
		PlayerRef.setfactionrank(BaboFactionStatWill, 2)
	elseif wStat <= 65
		PlayerRef.setfactionrank(SLAX_WillfulFaction, 3)
		PlayerRef.setfactionrank(BaboFactionStatWill, 1)
	elseif wStat <= 80
		PlayerRef.setfactionrank(SLAX_WillfulFaction, 4)
		PlayerRef.setfactionrank(BaboFactionStatWill, 0)
	elseif wStat <= 100
		PlayerRef.setfactionrank(SLAX_WillfulFaction, 5)
		PlayerRef.setfactionrank(BaboFactionStatWill, 0)

	endif

elseif Stat <= 10
	PlayerRef.setfactionrank(SLAX_WillBrokenFaction, 0)
	PlayerRef.setfactionrank(BaboFactionStatWill, 5)
elseif Stat <= 20
	PlayerRef.setfactionrank(SLAX_WillBrokenFaction, 1)
	PlayerRef.setfactionrank(BaboFactionStatWill, 6)
elseif Stat <= 35
	PlayerRef.setfactionrank(SLAX_WillBrokenFaction, 2)
	PlayerRef.setfactionrank(BaboFactionStatWill, 7)
elseif Stat <= 55
	PlayerRef.setfactionrank(SLAX_WillBrokenFaction, 3)
	PlayerRef.setfactionrank(BaboFactionStatWill, 8)
elseif Stat <= 75
	PlayerRef.setfactionrank(SLAX_WillBrokenFaction, 4)
	PlayerRef.setfactionrank(BaboFactionStatWill, 9)
elseif Stat <= 200
	PlayerRef.setfactionrank(SLAX_WillBrokenFaction, 5)
	PlayerRef.setfactionrank(BaboFactionStatWill, 10)
endif

EndFunction

Function CalcLewdnessExpGain(Float Mult)
	Float ArousalState = PlayerRef.getfactionrank(sla_Arousal)
	
	if Mult > 0
		if ArousalState >= 10
			BaboSexlabStatLewdness.setvalue(BaboSexlabStatLewdness.getvalue() + (BaboSexlabStatLewdnessSpeed.getvalue() * Mult * ArousalState/10))
		else
			BaboSexlabStatLewdness.setvalue(BaboSexlabStatLewdness.getvalue() + (BaboSexlabStatLewdnessSpeed.getvalue() * Mult))
		endif
	else
		if ArousalState >= 10
			BaboSexlabStatLewdness.setvalue(BaboSexlabStatLewdness.getvalue() - (BaboSexlabStatLewdnessSpeed.getvalue() + (Mult / ArousalState/10)))
		else
			BaboSexlabStatLewdness.setvalue(BaboSexlabStatLewdness.getvalue() - (BaboSexlabStatLewdnessSpeed.getvalue() - Mult))
		endif
	endif
	
	int SexAddict = (BaboSexlabStatLewdness.getvalue() as int) / 10
	
	if SexAddict > 100
		SexAddict = 100
	elseif SexAddict < 0
		SexAddict = 0
	endif
	
LewdnessFinalCheck(SexAddict)
EndFunction

Function CalcLewdnessExpLoss(Float Mult)
	Float ArousalState = PlayerRef.getfactionrank(sla_Arousal)
	if ArousalState >= 10
		BaboSexlabStatLewdness.setvalue(BaboSexlabStatLewdness.getvalue() - (BaboSexlabStatLewdnessSpeed.getvalue() + (Mult / ArousalState/10)))
	else
		BaboSexlabStatLewdness.setvalue(BaboSexlabStatLewdness.getvalue() - (BaboSexlabStatLewdnessSpeed.getvalue() - Mult))
	endif
	
	int SexAddict = (BaboSexlabStatLewdness.getvalue() as int) / 10
	
	if SexAddict > 100
		SexAddict = 100
	elseif SexAddict < 0
		SexAddict = 0
	endif
	
LewdnessFinalCheck(SexAddict)
EndFunction

Function LewdnessFinalCheck(int SexAddict)

if SexAddict <= 10
	PlayerRef.setfactionrank(SLAX_SexAddictFaction, 0)
	PlayerRef.setfactionrank(BaboFactionStatLewdness, 0)
elseif SexAddict <= 20
	PlayerRef.setfactionrank(SLAX_SexAddictFaction, 1)
	PlayerRef.setfactionrank(BaboFactionStatLewdness, 1)
elseif SexAddict <= 35
	PlayerRef.setfactionrank(SLAX_SexAddictFaction, 2)
	PlayerRef.setfactionrank(BaboFactionStatLewdness, 2)
elseif SexAddict <= 55
	PlayerRef.setfactionrank(SLAX_SexAddictFaction, 3)
	PlayerRef.setfactionrank(BaboFactionStatLewdness, 3)
elseif SexAddict <= 75
	PlayerRef.setfactionrank(SLAX_SexAddictFaction, 4)
	PlayerRef.setfactionrank(BaboFactionStatLewdness, 4)
elseif SexAddict <= 100
	PlayerRef.setfactionrank(SLAX_SexAddictFaction, 5)
	PlayerRef.setfactionrank(BaboFactionStatLewdness, 5)
endif

EndFunction

Function CalcExpLoss()
	ExhibitionistExp -= ((GameDaysPassed.GetValue() - LastUpdate) * 24.0) * BaboSexlabStatExhibitionistSpeed.getvalue()
	BikExp -= ((GameDaysPassed.GetValue() - LastUpdate) * 24.0) * BaboSexlabStatSkimpyDecrease.getvalue()
	CalcLewdnessExpLoss(10.0)
	BRMQuest.DecreaseReputationBitch(2)
	If ExhibitionistExp < 0.0
		ExhibitionistExp = 0.0
	EndIf

	If LewdnessExp < 0.0
		LewdnessExp = 0.0
	EndIf

	If BikExp < 0.0
		BikExp = 0.0
	EndIf
	;Debug.Messagebox("ExpLoss")
EndFunction

Function CalcLevel()
	Int OldLevel = BaboSexlabStatSkimpyExpLevel.GetValue() as Int
	If BikExp > ExpPerLevel * 5.5
		BaboSexlabStatSkimpyExpLevel.SetValue(4)
	ElseIf BikExp > ExpPerLevel * 3.5
		BaboSexlabStatSkimpyExpLevel.SetValue(3)
	ElseIf BikExp > ExpPerLevel * 2.0
		BaboSexlabStatSkimpyExpLevel.SetValue(2)
	ElseIf BikExp > ExpPerLevel
		BaboSexlabStatSkimpyExpLevel.SetValue(1)
	Else
		BaboSexlabStatSkimpyExpLevel.SetValue(0)
	EndIf

	If ExhibitionistExp > ExpPerLevel * 30.0
		PlayerRef.setfactionrank(SLAX_NudismAddictFaction, 5)
		PlayerRef.setfactionrank(BaboFactionStatExhibitionist, 5)
		BaboSexlabStatExhibitionist.SetValue(5)
	ElseIf ExhibitionistExp > ExpPerLevel * 15.0
		PlayerRef.setfactionrank(SLAX_NudismAddictFaction, 4)
		PlayerRef.setfactionrank(BaboFactionStatExhibitionist, 4)
		BaboSexlabStatExhibitionist.SetValue(4)
	ElseIf ExhibitionistExp > ExpPerLevel * 10.0
		PlayerRef.setfactionrank(SLAX_NudismAddictFaction, 3)
		PlayerRef.setfactionrank(BaboFactionStatExhibitionist, 3)
		BaboSexlabStatExhibitionist.SetValue(3)
	ElseIf ExhibitionistExp > ExpPerLevel * 7.5
		PlayerRef.setfactionrank(SLAX_NudismAddictFaction, 2)
		PlayerRef.setfactionrank(BaboFactionStatExhibitionist, 2)
		BaboSexlabStatExhibitionist.SetValue(2)
	ElseIf ExhibitionistExp > ExpPerLevel * 5.0
		PlayerRef.setfactionrank(SLAX_NudismAddictFaction, 1)
		PlayerRef.setfactionrank(BaboFactionStatExhibitionist, 1)
		BaboSexlabStatExhibitionist.SetValue(1)
	Else
		PlayerRef.setfactionrank(SLAX_NudismAddictFaction, 0)
		PlayerRef.setfactionrank(BaboFactionStatExhibitionist, 0)
		BaboSexlabStatExhibitionist.SetValue(0)
	EndIf

	Int NewLevel = BaboSexlabStatSkimpyExpLevel.GetValue() as Int
	If NewLevel > OldLevel
		Debug.Messagebox("You've gained more experience wearing bikini armors\nBikini Experience Rank: " + GetBikRankString())
		
	ElseIf NewLevel < OldLevel
		Debug.Messagebox("You've lost bikini armor experience\nBikini Experience Rank: " + GetBikRankString())
	EndIf
	
	BaboDetectSpectatorQuest.stop()
EndFunction

String Function GetBikRankString()
	Int i = BaboSexlabStatSkimpyExpLevel.GetValue() as Int
	If i == 0
		Return "Untrained "
	ElseIf i == 1
		Return "Apprentice "
	ElseIf i == 2
		Return "Adept "
	ElseIf i == 3
		Return "Expert "
	ElseIf i == 4
		Return "Master "
	EndIf	
EndFunction

;======================================
;===============Animation================
;======================================
Function PlayAnim(Actor Victim, Actor Aggressor, Bool Animate = True, String VictimAnim, String AggressorAnim, Scene AfterScene = none)
	If Animate
		(BaboSexController as BaboSexControllerManager).PrecisionCheck(Aggressor, true)
		(BaboSexController as BaboSexControllerManager).PrecisionCheck(Victim, true)
		If (Aggressor != PlayerRef)
			ActorUtil.AddPackageOverride(Aggressor, DoNothing, 100, 1)
			Aggressor.EvaluatePackage()
			Aggressor.SetRestrained()
			Aggressor.SetDontMove(True)
			Game.DisablePlayerControls( true, true, false, false, false, false, false, false )
			Game.SetPlayerAIDriven( true )
		Else
			Game.SetPlayerAiDriven()
		Endif
		MiscReferences.MoveTo(Aggressor) ; PosRef
		Float AngleZ = Victim.GetAngleZ()
		Aggressor.MoveTo(Victim, 0.0 * Math.Sin(AngleZ), 0.0 * Math.Cos(AngleZ))
		Victim.SetVehicle(MiscReferences) ; PosRef
		Aggressor.SetVehicle(MiscReferences) ; PosRef
		If isplaying == false
			Debug.SendAnimationEvent(Aggressor, "IdleForceDefaultState")
			Debug.SendAnimationEvent(Victim, "IdleForceDefaultState")
		Endif
		Utility.wait(1.0)
		Aggressor.MoveTo(Victim, 0.0 * Math.Sin(AngleZ), 0.0 * Math.Cos(AngleZ))
		Debug.SendAnimationEvent(Victim, VictimAnim as string)
		Debug.SendAnimationEvent(Aggressor, AggressorAnim as string)
		AfterScene.Forcestart()
		isplaying = True
	Else
		Victim.SetVehicle(None)
		Aggressor.SetVehicle(None)
		If (Aggressor != PlayerRef)
			Game.EnablePlayerControls()
			Game.SetPlayerAIDriven(false)
			Victim.SetRestrained(False)
			Victim.SetDontMove(False)
			Aggressor.SetRestrained(False)
			Aggressor.SetDontMove(False)
			ActorUtil.RemovePackageOverride(Aggressor, DoNothing)
		Else
			Game.SetPlayerAiDriven(False)
		Endif
		Debug.SendAnimationEvent(Aggressor, "IdleForceDefaultState")
		Debug.SendAnimationEvent(Victim, "IdleForceDefaultState")
		AfterScene.Stop()
		(BaboSexController as BaboSexControllerManager).PrecisionCheck(Aggressor, false)
		(BaboSexController as BaboSexControllerManager).PrecisionCheck(Victim, false)
		isplaying = false
	Endif
EndFunction

Function StruggleAnim(Actor Victim, Actor Aggressor, Bool Animate = True, String VictimAnim, String AggressorAnim)
	If Animate
		(BaboSexController as BaboSexControllerManager).PrecisionCheck(Aggressor, true)
		(BaboSexController as BaboSexControllerManager).PrecisionCheck(Victim, true)
		If (Aggressor != PlayerRef)
			ActorUtil.AddPackageOverride(Aggressor, DoNothing, 100, 1)
			Aggressor.EvaluatePackage()
			Aggressor.SetRestrained()
			Aggressor.SetDontMove(True)
			;Victim.SetDontMove(True)
			Game.DisablePlayerControls( true, true, false, false, true, true, false, false )
			Game.SetPlayerAIDriven( true )
			if Game.GetCameraState() == 0
				Game.ForceThirdPerson()
			endIf
		Else
			Game.SetPlayerAiDriven()
		Endif
		MiscReferences.MoveTo(Aggressor) ; PosRef
		Float AngleZ = Victim.GetAngleZ()
		Aggressor.MoveTo(Victim, 0.0 * Math.Sin(AngleZ), 0.0 * Math.Cos(AngleZ))
		Victim.SetVehicle(MiscReferences) ; PosRef
		Aggressor.SetVehicle(MiscReferences) ; PosRef
		If isplaying == false
			Debug.SendAnimationEvent(Aggressor, "IdleForceDefaultState")
			Debug.SendAnimationEvent(Victim, "IdleForceDefaultState")
		Endif
		Utility.wait(1.0)
		Aggressor.MoveTo(Victim, 0.0 * Math.Sin(AngleZ), 0.0 * Math.Cos(AngleZ))
		Debug.SendAnimationEvent(Victim, VictimAnim as string)
		Debug.SendAnimationEvent(Aggressor, AggressorAnim as string)
		isplaying = True
	Else
		Victim.SetVehicle(None)
		Aggressor.SetVehicle(None)
		If (Aggressor != PlayerRef)
			Game.EnablePlayerControls()
			Game.SetPlayerAIDriven(false)
			Victim.SetRestrained(False)
			Victim.SetDontMove(False)
			Aggressor.SetRestrained(False)
			Aggressor.SetDontMove(False)
			ActorUtil.RemovePackageOverride(Aggressor, DoNothing)
		Else
			Game.SetPlayerAiDriven(False)
		Endif
		Debug.SendAnimationEvent(Aggressor, "IdleForceDefaultState")
		Debug.SendAnimationEvent(Victim, "IdleForceDefaultState")
		(BaboSexController as BaboSexControllerManager).PrecisionCheck(Aggressor, false)
		(BaboSexController as BaboSexControllerManager).PrecisionCheck(Victim, false)
		isplaying = false
	Endif
EndFunction

Function PairedAnim(Actor Victim, Actor Aggressor, Idle PairedMotion, Bool Paired, Idle VictimAnim, Idle AggressorAnim)
	If Paired
		if Aggressor.PlayIdleWithTarget(PairedMotion, Victim)
			Debug.Trace("Aggressor does somthing to Victim")
		else
			Debug.Trace("Something went wrong")
		endIf
	Else
		(BaboSexController as BaboSexControllerManager).PrecisionCheck(Aggressor, true)
		(BaboSexController as BaboSexControllerManager).PrecisionCheck(Victim, true)
		If (Aggressor != PlayerRef)
			ActorUtil.AddPackageOverride(Aggressor, DoNothing, 100, 1)
			Aggressor.EvaluatePackage()
			Aggressor.SetRestrained()
			Aggressor.SetDontMove(True)
			Game.DisablePlayerControls( true, true, false, false, true, false, false, false )
			Game.SetPlayerAIDriven( true )
		Else
			Game.SetPlayerAiDriven()
		Endif
		MiscReferences.MoveTo(Aggressor) ; PosRef
		Float AngleZ = Victim.GetAngleZ()
		Aggressor.MoveTo(Victim, 0.0 * Math.Sin(AngleZ), 0.0 * Math.Cos(AngleZ))
		Victim.SetVehicle(MiscReferences) ; PosRef
		Aggressor.SetVehicle(MiscReferences) ; PosRef
		Victim.PlayIdle(VictimAnim)
		Aggressor.PlayIdle(AggressorAnim)
	EndIf
EndFunction

Function FurnitureDisplay(Actor Victim, Furniture DisplayTool)
	Dummy = Victim.PlaceAtMe(DisplayTool, 1, false, true)
	Float CharacterAngle = Victim.GetAngleZ()
	Dummy.MoveTo(Victim,DistanceInFront*Math.Sin(CharacterAngle),DistanceInFront*Math.Cos(CharacterAngle),DistanceZ)
	Dummy.SetAngle(0,0,CharacterAngle)
	Dummy.Enable()
EndFunction

Function FurnitureActivate(Actor Victim)
	If Victim == PlayerRef
		Game.DisablePlayerControls( true, true, true, false, true, false, true, false )
		Game.SetPlayerAIDriven( true )
	endif

	Victim.moveto(Dummy)
	utility.wait(2.0)
	Dummy.Activate(Victim)
EndFunction

Function FurnitureDespawn(Actor Victim)
	Victim.evaluatepackage()
;	Victim.pushactoraway(Victim, 1.0)
	Utility.wait(2.0)
;	Dummy.pushactoraway(Victim, 1.0)
	Dummy.Disable()
EndFunction

Function SLHHActivate(Actor pTarget, Actor pTargetFriend = None)
	If BaboHorribleHarassment.getvalue() == 1
		BaboMonitorScriptCreaturePackageActive.setvalue(2)
		Game.DisablePlayerControls( true, true, false, false, true, true, false, false )
		Game.SetPlayerAIDriven( true )
		(BaboSexController as BaboSexControllerManager).MonitorMessagebox(2)
		Utility.wait(5.0);wait for the script reading

		Keyword SLHHScriptEventKeyword = Game.GetFormFromFile(0x00C510, "SexLabHorribleHarassment.esp") as Keyword
		SLHHScriptEventKeyword.SendStoryEvent(None, pTarget, pTargetFriend)
	EndIf
	;SLHH is on.
	CreatureReferences[0].clear()
	CreatureReferences[1].clear()
	CreatureReferences[2].clear()
endFunction

Function SLHHBCActivate(Actor pTarget, Actor pTargetFriend = None, int Sex)
	If BaboHorribleHarassment.getvalue() == 1
		Game.DisablePlayerControls( true, true, false, false, true, true, false, false )
		Game.SetPlayerAIDriven( true )
		(BaboSexController as BaboSexControllerManager).MonitorMessagebox(3)
		Utility.wait(5.0);wait for the script reading

		Keyword SLHHScriptEventBCKeyword = Game.GetFormFromFile(0x0233C6, "SexLabHorribleHarassment.esp") as Keyword
		SLHHScriptEventBCKeyword.SendStoryEvent(None, pTarget, pTargetFriend, Sex, 0)
	EndIf
	;SLHH is on.
endFunction

Function SLHHDrunkActivate(Actor pTarget, Actor pTargetFriend = None, int Sex);0 = Sex 1 = NoSex
	If BaboHorribleHarassment.getvalue() == 1
		Game.DisablePlayerControls( true, true, false, false, true, true, false, false )
		Game.SetPlayerAIDriven( true )
		(BaboSexController as BaboSexControllerManager).MonitorMessagebox(4)
		Utility.wait(5.0);wait for the script reading

		Keyword SLHHScriptEventBCKeyword = Game.GetFormFromFile(0x02495B, "SexLabHorribleHarassment.esp") as Keyword
		SLHHScriptEventBCKeyword.SendStoryEvent(None, pTarget, pTargetFriend, Sex, 0)
	EndIf
	;SLHH is on.
endFunction

;Inflater - An actor that will get pregnant / Inflation - True(Inflate), False(Deflate) / poolmask - 1(Vaginal), 2(Anal) / amount - the cum amount you want to add or remove / time - literally required time for deflating. / callback - Just type "" It will ignore additional event call

Function SendFHUInflationEvent(form inflater, form injector, Bool Inflation, int poolmask, float amount, float time, string callback)
	Int handle = ModEvent.Create("SR_InflateInjectorEvent")
	ModEvent.PushForm(handle, inflater)
	ModEvent.PushForm(handle, injector)
	ModEvent.PushBool(handle, Inflation)
	ModEvent.PushInt(handle, poolmask)
	ModEvent.PushFloat(handle, amount)
	ModEvent.PushFloat(handle, time)
	ModEvent.PushString(handle, callback)
	ModEvent.Send(handle)
EndFunction

armor Function ForceEquipDDIDevice(actor akActor, int DDIdevice, bool force = false)
armor deviceinvetory

if DDIdevice == 1
	deviceinvetory = (zadquest as zadLibs).GetDeviceByTags(zad_DeviousBelt, "belt,metal,padded,full", true, "", true)
elseif DDIdevice == 2
	deviceinvetory = (zadquest as zadLibs).GetDeviceByTags(zad_DeviousCollar, "collar,metal,posture,padded", true, "", true)
elseif DDIdevice == 3
	deviceinvetory = (zadquest as zadLibs).GetDeviceByTags(zad_DeviousBra, "bra,metal,padded", true, "", true)
elseif DDIdevice == 4
	deviceinvetory = (zadquest as zadLibs).GetDeviceByTags(zad_DeviousArmbinder, "armbinder,leather,black", true, "", true)
elseif DDIdevice == 5
	deviceinvetory = (zadquest as zadLibs).GetDeviceByTags(zad_DeviousBlindfold, "blindfold", true, "", true)
elseif DDIdevice == 6
	;deviceinvetory = zad_DeviousHarness
elseif DDIdevice == 7
	deviceinvetory = (zadquest as zadLibs).GetDeviceByTags(zad_DeviousYoke, "yoke", true, "", true)
elseif DDIdevice == 8
	deviceinvetory = (zadquest as zadLibs).GetDeviceByTags(zad_DeviousGag, "gag,ring", true, "", true)
elseif DDIdevice == 9
	;deviceinvetory = zad_DeviousCorset
elseif DDIdevice == 10
	;deviceinvetory = zad_DeviousSuit
elseif DDIdevice == 11
	;deviceinvetory = zad_DeviousHood
elseif DDIdevice == 12
	;deviceinvetory = zad_DeviousBoots
elseif DDIdevice == 13
	deviceinvetory = (zadquest as zadLibs).GetDeviceByTags(zad_DeviousPiercingsNipple, "piercing,nipple", true, "", true)
elseif DDIdevice == 14
	deviceinvetory = (zadquest as zadLibs).GetDeviceByTags(zad_DeviousPiercingsVaginal, "piercing,vaginal", true, "", true)
elseif DDIdevice == 15
	deviceinvetory = (zadquest as zadLibs).GetDeviceByTags(zad_DeviousPlugVaginal, "plug,pump,vaginal,inflatable", true, "", true)
elseif DDIdevice == 16
	deviceinvetory = (zadquest as zadLibs).GetDeviceByTags(zad_DeviousPlugAnal, "plug,pump,anal,inflatable", true, "", true)
elseif DDIdevice == 17
	;deviceinvetory = zad_dev_armcuffs as form
endif


if (zadquest as zadLibs).LockDevice(akActor, deviceinvetory, force)
	return deviceinvetory
else
	return None
endif
EndFunction

Bool Function ForceUnequipDDIDevice(actor akActor, int DDIdevice, bool destroyDevice = false)
Keyword zad_DeviousDevice

if DDIdevice == 1
	zad_DeviousDevice = zad_DeviousBelt
elseif DDIdevice == 2
	zad_DeviousDevice = zad_DeviousCollar
elseif DDIdevice == 3
	zad_DeviousDevice = zad_DeviousBra
elseif DDIdevice == 4
	zad_DeviousDevice = zad_DeviousArmbinder
elseif DDIdevice == 5
	zad_DeviousDevice = zad_DeviousBlindfold
elseif DDIdevice == 6
	zad_DeviousDevice = zad_DeviousHarness
elseif DDIdevice == 7
	zad_DeviousDevice = zad_DeviousYoke
elseif DDIdevice == 8
	zad_DeviousDevice = zad_DeviousGag
elseif DDIdevice == 9
	zad_DeviousDevice = zad_DeviousCorset
elseif DDIdevice == 10
	zad_DeviousDevice = zad_DeviousSuit
elseif DDIdevice == 11
	zad_DeviousDevice = zad_DeviousHood
elseif DDIdevice == 12
	zad_DeviousDevice = zad_DeviousBoots
elseif DDIdevice == 13
	zad_DeviousDevice = zad_DeviousPiercingsNipple
elseif DDIdevice == 14
	zad_DeviousDevice = zad_DeviousPiercingsVaginal
elseif DDIdevice == 15
	zad_DeviousDevice = zad_DeviousPlugVaginal
elseif DDIdevice == 16
	zad_DeviousDevice = zad_DeviousPlugAnal
elseif DDIdevice == 17
	zad_DeviousDevice = zad_DeviousArmCuffs
endif
;(zadquest as zadLibs).UnlockDevice(akActor, armor deviceInventory, armor deviceRendered = none, keyword zad_DeviousDevice = none, bool destroyDevice = false, bool genericonly = false)
Return (zadquest as zadLibs).UnlockDeviceByKeyword(akActor, zad_DeviousDevice, destroyDevice)
EndFunction

int Function GetequippedDDIDevice(actor akActor, int DDIdevice)
Keyword zad_DeviousDevice

if DDIdevice == 1
	zad_DeviousDevice = zad_DeviousBelt
elseif DDIdevice == 2
	zad_DeviousDevice = zad_DeviousCollar
elseif DDIdevice == 3
	zad_DeviousDevice = zad_DeviousBra
elseif DDIdevice == 4
	zad_DeviousDevice = zad_DeviousArmbinder
elseif DDIdevice == 5
	zad_DeviousDevice = zad_DeviousBlindfold
elseif DDIdevice == 6
	zad_DeviousDevice = zad_DeviousHarness
elseif DDIdevice == 7
	zad_DeviousDevice = zad_DeviousYoke
elseif DDIdevice == 8
	zad_DeviousDevice = zad_DeviousGag
elseif DDIdevice == 9
	zad_DeviousDevice = zad_DeviousCorset
elseif DDIdevice == 10
	zad_DeviousDevice = zad_DeviousSuit
elseif DDIdevice == 11
	zad_DeviousDevice = zad_DeviousHood
elseif DDIdevice == 12
	zad_DeviousDevice = zad_DeviousBoots
elseif DDIdevice == 13
	zad_DeviousDevice = zad_DeviousPiercingsNipple
elseif DDIdevice == 14
	zad_DeviousDevice = zad_DeviousPiercingsVaginal
elseif DDIdevice == 15
	zad_DeviousDevice = zad_DeviousPlugVaginal
elseif DDIdevice == 16
	zad_DeviousDevice = zad_DeviousPlugAnal
elseif DDIdevice == 17
	zad_DeviousDevice = zad_DeviousArmCuffs
endif

	return (zadquest as zadLibs).IsWearingDevice(akActor, none, zad_DeviousDevice)
endfunction

;####################################################
;################ JSON Export #######################
;####################################################

Function ExportStatus()
	String File = "../BaboDialogue/BaboDialoguePlayerStatus.json"
	
	int AlmostEatenTitle
	int StallionSkewerTitleRank
	int WhiterunOrcFuckToyTitleRank
	int RieklingThirskFuckToyTitleRank
	int NightgateInnVictoryTitleRank
	int NightgateInnFuckedTitleRank
	int InvestigationMarkarthTitleRank
	int DeviousNobleSonFuckToyTitleRank
	int ChallengerFucktoyTitleRank
	int ArgonianDisplayedFuckToyTitleRank
	int ArgonianDefeatedTitleRank
	int LoanSharkSlaveTitleRank
	int PitifulHeroineTitleRank
	int WarMaidenTitleRank
	int BoozethatleadstoRank

		
		If playerref.isinfaction(BaboFactionAlmostEatenTitle)
			AlmostEatenTitle = playerref.getfactionrank(BaboFactionAlmostEatenTitle) as int
			JsonUtil.SetintValue(File, "AlmostEatenTitle", AlmostEatenTitle)
		Else
			JsonUtil.SetintValue(File, "AlmostEatenTitle", -1)
		EndIf
		
		If playerref.isinfaction(BaboFactionStallionSkewerTitle)
			StallionSkewerTitleRank = playerref.getfactionrank(BaboFactionStallionSkewerTitle) as int
			JsonUtil.SetintValue(File, "StallionSkewerTitleRank", StallionSkewerTitleRank)
		Else
			JsonUtil.SetintValue(File, "StallionSkewerTitleRank", -1)
		EndIf
		
		If playerref.isinfaction(BaboFactionWhiterunOrcFuckToyTitle)
			WhiterunOrcFuckToyTitleRank = playerref.getfactionrank(BaboFactionWhiterunOrcFuckToyTitle) as int
			JsonUtil.SetintValue(File, "WhiterunOrcFuckToyTitleRank", WhiterunOrcFuckToyTitleRank)
		Else
			JsonUtil.SetintValue(File, "WhiterunOrcFuckToyTitleRank", -1)
		EndIf

		If playerref.isinfaction(BaboFactionRieklingThirskFuckToyTitle)
			RieklingThirskFuckToyTitleRank = playerref.getfactionrank(BaboFactionRieklingThirskFuckToyTitle) as int
			JsonUtil.SetintValue(File, "RieklingThirskFuckToyTitleRank", RieklingThirskFuckToyTitleRank)
		Else
			JsonUtil.SetintValue(File, "RieklingThirskFuckToyTitleRank", -1)
		EndIf

		If playerref.isinfaction(BaboFactionNightgateInnVictoryTitle)
			NightgateInnVictoryTitleRank = playerref.getfactionrank(BaboFactionNightgateInnVictoryTitle) as int
			JsonUtil.SetintValue(File, "NightgateInnVictoryTitleRank", NightgateInnVictoryTitleRank)
		Else
			JsonUtil.SetintValue(File, "NightgateInnVictoryTitleRank", -1)
		EndIf
		
		If playerref.isinfaction(BaboFactionNightgateInnFuckedTitle)
			NightgateInnFuckedTitleRank = playerref.getfactionrank(BaboFactionNightgateInnFuckedTitle) as int
			JsonUtil.SetintValue(File, "NightgateInnFuckedTitleRank", NightgateInnFuckedTitleRank)
		Else
			JsonUtil.SetintValue(File, "NightgateInnFuckedTitleRank", -1)
		EndIf

		If playerref.isinfaction(BaboFactionInvestigationMarkarthTitle)
			InvestigationMarkarthTitleRank = playerref.getfactionrank(BaboFactionInvestigationMarkarthTitle) as int
			JsonUtil.SetintValue(File, "InvestigationMarkarthTitleRank", InvestigationMarkarthTitleRank)
		Else
			JsonUtil.SetintValue(File, "InvestigationMarkarthTitleRank", -1)
		EndIf

		If playerref.isinfaction(BaboFactionDeviousNobleSonFuckToyTitle)
			DeviousNobleSonFuckToyTitleRank = playerref.getfactionrank(BaboFactionDeviousNobleSonFuckToyTitle) as int
			JsonUtil.SetintValue(File, "DeviousNobleSonFuckToyTitleRank", DeviousNobleSonFuckToyTitleRank)
		Else
			JsonUtil.SetintValue(File, "DeviousNobleSonFuckToyTitleRank", -1)
		EndIf

		If playerref.isinfaction(BaboFactionChallengerFucktoyTitle)
			ChallengerFucktoyTitleRank = playerref.getfactionrank(BaboFactionChallengerFucktoyTitle) as int
			JsonUtil.SetintValue(File, "ChallengerFucktoyTitleRank", ChallengerFucktoyTitleRank)
		Else
			JsonUtil.SetintValue(File, "ChallengerFucktoyTitleRank", -1)
		EndIf

		If playerref.isinfaction(BaboFactionArgonianDisplayedFuckToyTitle)
			ArgonianDisplayedFuckToyTitleRank = playerref.getfactionrank(BaboFactionArgonianDisplayedFuckToyTitle) as int
			JsonUtil.SetintValue(File, "ArgonianDisplayedFuckToyTitleRank", ArgonianDisplayedFuckToyTitleRank)
		Else
			JsonUtil.SetintValue(File, "ArgonianDisplayedFuckToyTitleRank", -1)
		EndIf

		If playerref.isinfaction(BaboFactionArgonianDefeatedTitle)
			ArgonianDefeatedTitleRank = playerref.getfactionrank(BaboFactionArgonianDefeatedTitle) as int
			JsonUtil.SetintValue(File, "ArgonianDefeatedTitleRank", ArgonianDefeatedTitleRank)
		Else
			JsonUtil.SetintValue(File, "ArgonianDefeatedTitleRank", -1)
		EndIf

		If playerref.isinfaction(BaboFactionWarMaidenTitle)
			WarMaidenTitleRank = playerref.getfactionrank(BaboFactionWarMaidenTitle) as int
			JsonUtil.SetintValue(File, "WarMaidenTitleRank", WarMaidenTitleRank)
		Else
			JsonUtil.SetintValue(File, "WarMaidenTitleRank", -1)
		EndIf

		If playerref.isinfaction(BaboFactionPitifulHeroineTitle)
			PitifulHeroineTitleRank = playerref.getfactionrank(BaboFactionPitifulHeroineTitle) as int
			JsonUtil.SetintValue(File, "PitifulHeroineTitleRank", PitifulHeroineTitleRank)
		Else
			JsonUtil.SetintValue(File, "PitifulHeroineTitleRank", -1)
		EndIf

		If playerref.isinfaction(BaboFactionLoanSharkSlaveTitle)
			LoanSharkSlaveTitleRank = playerref.getfactionrank(BaboFactionLoanSharkSlaveTitle) as int
			JsonUtil.SetintValue(File, "LoanSharkSlaveTitleRank", LoanSharkSlaveTitleRank)
		Else
			JsonUtil.SetintValue(File, "LoanSharkSlaveTitleRank", -1)
		EndIf

		If playerref.isinfaction(BaboFactionBoozethatleadstoTitle)
			BoozethatleadstoRank = playerref.getfactionrank(BaboFactionBoozethatleadstoTitle) as int
			JsonUtil.SetintValue(File, "BoozethatleadstoTitleRank", BoozethatleadstoRank)
		Else
			JsonUtil.SetintValue(File, "BoozethatleadstoTitleRank", -1)
		EndIf

		JsonUtil.SetintValue(File, "BaboReputation", BaboReputation.getvalue() as int);Game.GetFormFromFile(0x00772769, "BaboInteractiveDia.esp") as GlobalVariable
		JsonUtil.SetintValue(File, "BaboReputationBitch", BaboReputationBitch.getvalue() as int);Game.GetFormFromFile(0x003CD6F1, "BaboInteractiveDia.esp") as GlobalVariable
		JsonUtil.SetintValue(File, "BaboWillpower", playerref.getfactionrank(BaboFactionStatWill) as int);Game.GetFormFromFile(0x0048E9AC, "BaboInteractiveDia.esp") as Faction
		
		JsonUtil.SetintValue(File, "BaboSexlabStatusFHU", BaboSexlabStatusFHU.getvalue() as int)
		
		JsonUtil.SetintValue(File, "BaboCuminsideCreatures", BaboSexlabStatCreaturesCum.getvalue() as int)
		JsonUtil.SetintValue(File, "BaboCuminsideCreaturesBeast", BaboSexlabStatCreaturesBeast.getvalue() as int)
		JsonUtil.SetintValue(File, "BaboCuminsideCreaturesCanine", BaboSexlabStatCreaturesCanine.getvalue() as int)
		JsonUtil.SetintValue(File, "BaboCuminsideCreaturesChaurus", BaboSexlabStatCreaturesChaurus.getvalue() as int)
		JsonUtil.SetintValue(File, "BaboCuminsideCreaturesChaurus", BaboSexlabStatCreaturesChaurus.getvalue() as int)
		JsonUtil.SetintValue(File, "BaboCuminsideCreaturesDraugr", BaboSexlabStatCreaturesDraugr.getvalue() as int)
		JsonUtil.SetintValue(File, "BaboCuminsideCreaturesDwarven", BaboSexlabStatCreaturesDwarven.getvalue() as int)
		JsonUtil.SetintValue(File, "BaboCuminsideCreaturesFalmer", BaboSexlabStatCreaturesFalmer.getvalue() as int)
		JsonUtil.SetintValue(File, "BaboCuminsideCreaturesGargoyle", BaboSexlabStatCreaturesGargoyle.getvalue() as int)
		JsonUtil.SetintValue(File, "BaboCuminsideCreaturesGiant", BaboSexlabStatCreaturesGiant.getvalue() as int)
		JsonUtil.SetintValue(File, "BaboCuminsideCreaturesHorse", BaboSexlabStatCreaturesHorse.getvalue() as int)
		JsonUtil.SetintValue(File, "BaboCuminsideCreaturesRiekling", BaboSexlabStatCreaturesRiekling.getvalue() as int)
		JsonUtil.SetintValue(File, "BaboCuminsideCreaturesSpider", BaboSexlabStatCreaturesSpider.getvalue() as int)
		JsonUtil.SetintValue(File, "BaboCuminsideCreaturesTroll", BaboSexlabStatCreaturesTroll.getvalue() as int)
	JsonUtil.Save(File, False)
EndFunction


Function ImportStatus()
	ImportStatusApproach()
EndFunction


Function ImportStatusApproach()

if BaboSexlabApproach.getvalue() == 1
	String ApproachFile = "../BakaFactory/SLAPPStats.json"
	
	int ApproachBackHuggedTimes
	int ApproachbackHugMolestedTimes
	int approachforcedkisstimes
	int approachforsextimes
	int approachhellotimes
	int approachmolesttimes
	
	int approachnormalsextimes
	int approachprostitutiontimes
	int approachrapedtimes
	int approachreceivedgifttimes
	int approachspankedtimes
	int approachsweetkisstimes
	int approachverbalinsulttimes

	ApproachBackHuggedTimes = JsonUtil.GetintValue(ApproachFile, "approachbackhuggedtimes")
	ApproachbackHugMolestedTimes = JsonUtil.GetintValue(ApproachFile, "approachbackhugmolestedtimes")
	approachforcedkisstimes = JsonUtil.GetintValue(ApproachFile, "approachforcedkisstimes")
	approachforsextimes = JsonUtil.GetintValue(ApproachFile, "approachforsextimes")
	approachhellotimes = JsonUtil.GetintValue(ApproachFile, "approachhellotimes")
	approachmolesttimes = JsonUtil.GetintValue(ApproachFile, "approachmolesttimes")
	approachnormalsextimes = JsonUtil.GetintValue(ApproachFile, "approachnormalsextimes")
	approachprostitutiontimes = JsonUtil.GetintValue(ApproachFile, "approachprostitutiontimes")
	approachrapedtimes = JsonUtil.GetintValue(ApproachFile, "approachrapedtimes")
	approachreceivedgifttimes = JsonUtil.GetintValue(ApproachFile, "approachreceivedgifttimes")
	approachspankedtimes = JsonUtil.GetintValue(ApproachFile, "approachspankedtimes")
	approachsweetkisstimes = JsonUtil.GetintValue(ApproachFile, "approachsweetkisstimes")
	approachverbalinsulttimes = JsonUtil.GetintValue(ApproachFile, "approachverbalinsulttimes")
	
	BaboSexlabApproachBackHugged.setvalue(ApproachBackHuggedTimes)
	BaboSexlabApproachBackHugMolested.setvalue(ApproachbackHugMolestedTimes)
	BaboSexlabApproachForcedKiss.setvalue(approachforcedkisstimes)
	BaboSexlabApproachForSex.setvalue(approachforsextimes)
	BaboSexlabApproachForHello.setvalue(approachhellotimes)
	BaboSexlabApproachForSpank.setvalue(approachspankedtimes)
	
endif

EndFunction

;======================================
;===============Compatibility================
;======================================

Function CD_FHU()
	if BaboFHU.getvalue() == 1
		SR_InflateFaction = Game.GetFormFromFile(0xA991, "sr_FillHerUp.esp") as Faction
	endif
EndFunction

Function CD_BF()
	if BaboBeeingFemale.getvalue() == 1
		_BF_ParentFaction = Game.GetFormFromFile(0x008448, "BeeingFemale.esm") as Faction
		_BFPlayerState = Game.GetFormFromFile(0x060CC3, "BeeingFemale.esm") as GlobalVariable
	endif
EndFunction

Function CD_SLS()
	if BaboSexlabSurvivalGlobal.getvalue() == 1
		_SLS_BikiniArmor = Game.GetFormFromFile(0x049867, "SL Survival.esp") as Keyword
		_SLS_LicenceMagic = Game.GetFormFromFile(0x041B54, "SL Survival.esp") as Book
		_SLS_LicenceArmor = Game.GetFormFromFile(0x043BAE, "SL Survival.esp") as Book
		_SLS_LicenceWeapon = Game.GetFormFromFile(0x043BAF, "SL Survival.esp") as Book
		_SLS_LicenceBikini = Game.GetFormFromFile(0x0492C7, "SL Survival.esp") as Book
		_SLS_LicenceClothes = Game.GetFormFromFile(0x0492CB, "SL Survival.esp") as Book
	endif
EndFunction

Function CD_DDI()
	if BaboDDI.getvalue() == 1
		zad_DeviousBelt = Game.GetFormFromFile(0x003330, "Devious Devices - Assets.esm") as Keyword
		zad_DeviousPlug = Game.GetFormFromFile(0x003331, "Devious Devices - Assets.esm") as Keyword
		zad_Lockable = Game.GetFormFromFile(0x003894, "Devious Devices - Assets.esm") as Keyword
		zad_DeviousCollar = Game.GetFormFromFile(0x003DF7, "Devious Devices - Assets.esm") as Keyword
		zad_DeviousBra = Game.GetFormFromFile(0x003DFA, "Devious Devices - Assets.esm") as Keyword
		zad_DeviousPiercingsNipple = Game.GetFormFromFile(0x00CA39, "Devious Devices - Assets.esm") as Keyword
		zad_DeviousArmbinder = Game.GetFormFromFile(0x00CA3A, "Devious Devices - Assets.esm") as Keyword
		zad_DeviousBlindfold = Game.GetFormFromFile(0x011B1A, "Devious Devices - Assets.esm") as Keyword
		zad_DeviousHarness = Game.GetFormFromFile(0x017C43, "Devious Devices - Assets.esm") as Keyword
		zad_DeviousPlugVaginal = Game.GetFormFromFile(0x01DD7C, "Devious Devices - Assets.esm") as Keyword
		zad_DeviousPlugAnal = Game.GetFormFromFile(0x01DD7D, "Devious Devices - Assets.esm") as Keyword
		zad_DeviousPiercingsVaginal = Game.GetFormFromFile(0x023E70, "Devious Devices - Assets.esm") as Keyword
		zad_DeviousBoots = Game.GetFormFromFile(0x027F29, "Devious Devices - Assets.esm") as Keyword
		zad_DeviousHood = Game.GetFormFromFile(0x02AFA2, "Devious Devices - Assets.esm") as Keyword
		zad_DeviousSuit = Game.GetFormFromFile(0x02AFA3, "Devious Devices - Assets.esm") as Keyword
		zad_DeviousYoke = Game.GetFormFromFile(0x02C531, "Devious Devices - Assets.esm") as Keyword
		zad_DeviousGag = Game.GetFormFromFile(0x007EB8, "Devious Devices - Assets.esm") as Keyword
		zad_DeviousCorset = Game.GetFormFromFile(0x027F28, "Devious Devices - Assets.esm") as Keyword
		zad_DeviousArmCuffs = Game.GetFormFromFile(0x003DF9, "Devious Devices - Assets.esm") as Keyword
		
		;zad_dev_armbinders = Game.GetFormFromFile(0x0540F1, "Devious Devices - Expansion.esm") as LeveledItem
		;zad_dev_yokes = Game.GetFormFromFile(0x0540FA, "Devious Devices - Expansion.esm") as LeveledItem
		;zad_dev_collars_metal = Game.GetFormFromFile(0x054695, "Devious Devices - Expansion.esm") as LeveledItem
		;zad_dev_gags_ring = Game.GetFormFromFile(0x054100, "Devious Devices - Expansion.esm") as LeveledItem
		;zad_dev_blindfolds_leather = Game.GetFormFromFile(0x054698, "Devious Devices - Expansion.esm") as LeveledItem
		;zad_dev_plugs_anal = Game.GetFormFromFile(0x0546AA, "Devious Devices - Expansion.esm") as LeveledItem
		;zad_dev_plugs_vaginal = Game.GetFormFromFile(0x0546AB, "Devious Devices - Expansion.esm") as LeveledItem
		;zad_dev_piercings_nipple = Game.GetFormFromFile(0x0546AD, "Devious Devices - Expansion.esm") as LeveledItem
		;zad_dev_piercings_vaginal = Game.GetFormFromFile(0x0546AE, "Devious Devices - Expansion.esm") as LeveledItem
		;zad_dev_chastitybelts_closed = Game.GetFormFromFile(0x054681, "Devious Devices - Expansion.esm") as LeveledItem
		;zad_dev_armcuffs = Game.GetFormFromFile(0x05469B, "Devious Devices - Expansion.esm") as LeveledItem
			
		zad_ChastityKey = Game.GetFormFromFile(0x008A4F, "Devious Devices - Integration.esm") as Key
		zad_PiercingsRemovalTool = Game.GetFormFromFile(0x0409A4, "Devious Devices - Integration.esm") as Key
		zad_RestraintsKey = Game.GetFormFromFile(0x01775F, "Devious Devices - Integration.esm") as Key
			
		zadquest = Game.GetFormFromFile(0x00F624, "Devious Devices - Integration.esm") as Quest
	endif
EndFunction

Function CD_Fertility()
	if BaboFertility.getvalue() == 1
		Quest HandlerQuest = Game.GetFormFromFile(0x000D62, "Fertility Mode.esm") as Quest
		_JSW_BB_PotionFertility = Game.GetFormFromFile(0x0058D2, "Fertility Mode.esm") as Potion
		FertilityLastBirth = (HandlerQuest as _JSW_BB_Storage).LastBirth as float[]
	endif
EndFunction

Function CD_EstrusChaurus()
	if BaboEstrusChaurus.getvalue() == 1
		zzEstrusChaurusBreederFaction = Game.GetFormFromFile(0x0160A9, "EstrusChaurus.esp") as Faction
	endif
EndFunction

;======================================
;===============Expression================
;======================================
Function Backtoinitial(Actor act)
	act.ClearExpressionOverride()
EndFunction

Function RandomAheMenu(Actor act)
	int Random = Utility.Randomint(1, 6)
	AheMenu(act, random)
EndFunction

Function RandomPainMenu(Actor act)
	int Random = Utility.Randomint(1, 8)
	PainMenu(act, random)
EndFunction

Function GagPhoneme(Actor akactor, int index)
	if index > 0
		MfgConsoleFunc.SetPhoneme(akActor, 1, 100)
		MfgConsoleFunc.SetPhoneme(akActor, 11, 70)
	else
		MfgConsoleFunc.ResetPhonemeModifier(akActor)
	endif
EndFunction

Function PainMenu(Actor act, Int index)
	if index == 1
		act.SetExpressionOverride(3, 50)
		mfgconsolefunc.SetModifier(act, 2, 10)
		mfgconsolefunc.SetModifier(act, 3, 10)
		mfgconsolefunc.SetModifier(act, 6, 50)
		mfgconsolefunc.SetModifier(act, 7, 50)
		mfgconsolefunc.SetModifier(act, 11, 30)
		mfgconsolefunc.SetModifier(act, 12, 30)
		mfgconsolefunc.SetModifier(act, 13, 30)
		mfgconsolefunc.SetPhoneme(act, 0, 20)
	elseIf index == 2
		act.SetExpressionOverride(8, 50)
		mfgconsolefunc.SetModifier(act, 0, 100)
		mfgconsolefunc.SetModifier(act, 1, 100)
		mfgconsolefunc.SetModifier(act, 2, 100)
		mfgconsolefunc.SetModifier(act, 3, 100)
		mfgconsolefunc.SetModifier(act, 4, 100)
		mfgconsolefunc.SetModifier(act, 5, 100)
		mfgconsolefunc.SetPhoneme(act, 2, 100)
		mfgconsolefunc.SetPhoneme(act, 5, 100)
		mfgconsolefunc.SetPhoneme(act, 11, 40)
	elseIf index == 3
		act.SetExpressionOverride(9, 50)
		mfgconsolefunc.SetModifier(act, 2, 100)
		mfgconsolefunc.SetModifier(act, 3, 100)
		mfgconsolefunc.SetModifier(act, 4, 100)
		mfgconsolefunc.SetModifier(act, 5, 100)
		mfgconsolefunc.SetModifier(act, 11, 90)
		mfgconsolefunc.SetPhoneme(act, 0, 100)
		mfgconsolefunc.SetPhoneme(act, 2, 100)
		mfgconsolefunc.SetPhoneme(act, 11, 40)
	elseIf index == 4
		act.SetExpressionOverride(8, 50)
		mfgconsolefunc.SetModifier(act, 0, 100)
		mfgconsolefunc.SetModifier(act, 1, 100)
		mfgconsolefunc.SetModifier(act, 2, 100)
		mfgconsolefunc.SetModifier(act, 3, 100)
		mfgconsolefunc.SetModifier(act, 4, 100)
		mfgconsolefunc.SetModifier(act, 5, 100)
		mfgconsolefunc.SetPhoneme(act, 2, 100)
		mfgconsolefunc.SetPhoneme(act, 5, 40)
	elseIf index == 5
		act.SetExpressionOverride(9, 50)
		mfgconsolefunc.SetModifier(act, 2, 100)
		mfgconsolefunc.SetModifier(act, 3, 100)
		mfgconsolefunc.SetModifier(act, 4, 100)
		mfgconsolefunc.SetModifier(act, 5, 100)
		mfgconsolefunc.SetModifier(act, 11, 90)
		mfgconsolefunc.SetPhoneme(act, 0, 30)
		mfgconsolefunc.SetPhoneme(act, 2, 30)
	elseIf index == 6
		act.SetExpressionOverride(3, 50)
		mfgconsolefunc.SetModifier(act, 11, 50)
		mfgconsolefunc.SetModifier(act, 13, 14)
		mfgconsolefunc.SetPhoneme(act, 2, 50)
		mfgconsolefunc.SetPhoneme(act, 13, 20)
		mfgconsolefunc.SetPhoneme(act, 15, 40)
	elseIf index == 7
		act.SetExpressionOverride(1, 50)
		mfgconsolefunc.SetModifier(act, 0, 30)
		mfgconsolefunc.SetModifier(act, 1, 20)
		mfgconsolefunc.SetModifier(act, 12, 90)
		mfgconsolefunc.SetModifier(act, 13, 90)
		mfgconsolefunc.SetPhoneme(act, 2, 100)
		mfgconsolefunc.SetPhoneme(act, 5, 80)
	elseIf index == 8
		act.SetExpressionOverride(3, 50)
		mfgconsolefunc.SetModifier(act, 0, 30)
		mfgconsolefunc.SetModifier(act, 1, 30)
		mfgconsolefunc.SetModifier(act, 4, 80)
		mfgconsolefunc.SetModifier(act, 5, 80)
		mfgconsolefunc.SetPhoneme(act, 2, 100)
		mfgconsolefunc.SetPhoneme(act, 4, 50)
		mfgconsolefunc.SetPhoneme(act, 5, 100)
	elseIf index == 9;Faint
		act.SetExpressionOverride(3, 50)
		mfgconsolefunc.SetModifier(act, 0, 80)
		mfgconsolefunc.SetModifier(act, 1, 80)
		mfgconsolefunc.SetPhoneme(act, 1, 30)
	endIf
endFunction

Function AheMenu(Actor act, Int index)
	if index == 1
		act.SetExpressionOverride(4, 50)
		mfgconsolefunc.SetModifier(act, 0, 30)
		mfgconsolefunc.SetModifier(act, 1, 30)
		mfgconsolefunc.SetModifier(act, 4, 30)
		mfgconsolefunc.SetModifier(act, 5, 30)
		mfgconsolefunc.SetModifier(act, 6, 10)
		mfgconsolefunc.SetModifier(act, 7, 10)
		mfgconsolefunc.SetModifier(act, 11, 80)
		mfgconsolefunc.SetModifier(act, 12, 70)
		mfgconsolefunc.SetModifier(act, 13, 80)
		mfgconsolefunc.SetPhoneme(act, 3, 50)
		mfgconsolefunc.SetPhoneme(act, 11, 50)
		mfgconsolefunc.SetPhoneme(act, 15, 50)
	elseIf index == 2
		act.SetExpressionOverride(4, 50)
		mfgconsolefunc.SetModifier(act, 0, 50)
		mfgconsolefunc.SetModifier(act, 1, 30)
		mfgconsolefunc.SetModifier(act, 2, 100)
		mfgconsolefunc.SetModifier(act, 4, 30)
		mfgconsolefunc.SetModifier(act, 5, 30)
		mfgconsolefunc.SetModifier(act, 7, 10)
		mfgconsolefunc.SetModifier(act, 11, 90)
		mfgconsolefunc.SetModifier(act, 12, 30)
		mfgconsolefunc.SetPhoneme(act, 3, 50)
		mfgconsolefunc.SetPhoneme(act, 8, 50)
		mfgconsolefunc.SetPhoneme(act, 14, 50)
	elseIf index == 3
		act.SetExpressionOverride(2, 60)
		mfgconsolefunc.SetPhoneme(act, 0, 43)
		mfgconsolefunc.SetPhoneme(act, 4, 7)
		mfgconsolefunc.SetPhoneme(act, 14, 90)
		mfgconsolefunc.SetModifier(act, 11, 180)
		mfgconsolefunc.SetModifier(act, 9, 43)
	elseIf index == 4
		act.SetExpressionOverride(2, 60)
		mfgconsolefunc.SetPhoneme(act, 0, 20)
		mfgconsolefunc.SetPhoneme(act, 1, 100)
		mfgconsolefunc.SetPhoneme(act, 14, 3)
		mfgconsolefunc.SetModifier(act, 7, 77)
		mfgconsolefunc.SetModifier(act, 11, 180)
		mfgconsolefunc.SetModifier(act, 11, 60)
	elseIf index == 5
		act.SetExpressionOverride(2, 70)
		mfgconsolefunc.SetPhoneme(act, 1, 7)
		mfgconsolefunc.SetPhoneme(act, 5, 100)
		mfgconsolefunc.SetPhoneme(act, 11, 33)
		mfgconsolefunc.SetPhoneme(act, 12, 3)
		mfgconsolefunc.SetPhoneme(act, 15, 16)
		mfgconsolefunc.SetModifier(act, 4, 100)
		mfgconsolefunc.SetModifier(act, 5, 100)
		mfgconsolefunc.SetModifier(act, 6, 100)
		mfgconsolefunc.SetModifier(act, 7, 100)
		mfgconsolefunc.SetModifier(act, 10, 100)
		mfgconsolefunc.SetModifier(act, 11, 100)
	elseIf index == 6
		act.SetExpressionOverride(4, 70)
		mfgconsolefunc.SetPhoneme(act, 1, 20)
		mfgconsolefunc.SetPhoneme(act, 8, 70)
		mfgconsolefunc.SetPhoneme(act, 13, 30)
		mfgconsolefunc.SetPhoneme(act, 15, 4)
		mfgconsolefunc.SetModifier(act, 3, 70)
		mfgconsolefunc.SetModifier(act, 11, 100)
		mfgconsolefunc.SetModifier(act, 13, 50)
	endIf
endFunction
