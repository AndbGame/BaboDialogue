Scriptname BaboReputationMasterScript extends Quest Conditional

;\\\\\\\\\\\\\\\\
;\\\Property Zone\\\\\\\
;\\\\\\\\\\\\\\\\

BaboDiaMonitorScript Property BDMScript Auto

Referencealias Property RefPlayerRef Auto
Actor Property PlayerRef Auto
Referencealias Property BaboChangeLocationEvent05Visitor Auto

Quest Property BaboEncounter01 Auto
Quest Property BaboEncounter02 Auto
Quest Property BaboChangeLocationEvent02 Auto
Quest Property BaboChangeLocationEvent02ForestSnow Auto
Quest Property BaboChangeLocationEvent02Forest Auto
Quest Property BaboChangeLocationEvent02Coast Auto
Quest Property BaboChangeLocationEvent02Marsh Auto
Quest Property BaboChangeLocationEvent02Mountain Auto
Quest Property BaboChangeLocationEvent02MountainSnow Auto
Quest Property BaboChangeLocationEvent02Plain Auto
Quest Property BaboChangeLocationEvent02PlainSnow Auto
Quest Property BaboChangeLocationEvent05 Auto
Quest Property BaboChangeLocationEvent06 Auto
Quest Property BaboChangeLocationEvent08 Auto
Quest Property BaboDialogueWhiterun Auto
Quest Property BaboDialogueHirelings Auto
BaboBoyFriendVariableScript Property BoyFriendVariableScript Auto
Referencealias Property ViceCaptainRef Auto

GlobalVariable Property BaboMonitorScriptCreaturePackageActive auto
GlobalVariable Property SexCountGangBang auto
GlobalVariable Property SexCount auto
GlobalVariable Property BaboSpendableFavor auto
GlobalVariable Property BaboReputation auto
GlobalVariable Property BaboReputationCreatureSex auto
GlobalVariable Property BaboReputationBitch auto
GlobalVariable Property BaboPlayerFondofSexyArmorCycleValue Auto

Faction Property RankAdventurer Auto Conditional ;0x0246D9
Faction property RankBadPrisioner Auto Conditional;0x02E8E4
Faction property RankBeggar Auto Conditional ;0x0246D6
Faction property RankBodyGuard Auto Conditional;0x0297DD
Faction property RankBountyHunter Auto Conditional;0x0297DE
Faction property RankHunter Auto Conditional;0x0246DA
Faction property RankKnight Auto Conditional;0x0297E1
Faction property RankLowCitizen Auto Conditional;0x0246D5
Faction property RankMercenary Auto Conditional;0x0297DF
Faction property RankMerchant Auto Conditional;0x0297E0
Faction property RankMiddleCitizen Auto Conditional;0x0246D7
Faction property RankNoble Auto Conditional;0x0246D8
Faction property RankRefugee Auto Conditional;0x0125E9
Faction property RankPilgrim Auto Conditional;0x0246DB

Faction property BaboCurrentHireling Auto
Faction property BaboCurrentAnimalHireling Auto
Faction property BaboCreatureArousedFaction Auto
Faction property BaboCreatureMatePartnerFaction Auto

Faction property BaboChangeLocationEvent06Faction Auto
Faction property BaboEncounter01Faction Auto
Faction property BaboEncounter02Faction Auto
Faction property BaboChangeLocationEvent08Faction Auto
Faction Property SLAX_NudismAddictFaction Auto


Bool Function RegisterFactionPopulatedSkyrim()
	If Game.GetModByName("Populated Skyrim Legendary.esp") != 255
		RankAdventurer		= Game.GetFormFromFile(0x000246D9, "Populated Skyrim Legendary.esp") as Faction
		RankBadPrisioner		= Game.GetFormFromFile(0x0002E8E4, "Populated Skyrim Legendary.esp") as Faction
		RankBeggar		= Game.GetFormFromFile(0x000246D6, "Populated Skyrim Legendary.esp") as Faction
		RankBodyGuard		= Game.GetFormFromFile(0x000297DD, "Populated Skyrim Legendary.esp") as Faction
		RankBountyHunter		= Game.GetFormFromFile(0x000297DE, "Populated Skyrim Legendary.esp") as Faction
		RankHunter		= Game.GetFormFromFile(0x000246DA, "Populated Skyrim Legendary.esp") as Faction
		RankKnight		= Game.GetFormFromFile(0x000297E1, "Populated Skyrim Legendary.esp") as Faction
		RankLowCitizen		= Game.GetFormFromFile(0x000246D5, "Populated Skyrim Legendary.esp") as Faction
		RankMercenary		= Game.GetFormFromFile(0x000297DF, "Populated Skyrim Legendary.esp") as Faction
		RankMerchant		= Game.GetFormFromFile(0x000297E0, "Populated Skyrim Legendary.esp") as Faction
		RankMiddleCitizen		= Game.GetFormFromFile(0x000246D7, "Populated Skyrim Legendary.esp") as Faction
		RankNoble		= Game.GetFormFromFile(0x000246D8, "Populated Skyrim Legendary.esp") as Faction
		RankRefugee		= Game.GetFormFromFile(0x000125E9, "Populated Skyrim Legendary.esp") as Faction
		RankPilgrim		= Game.GetFormFromFile(0x000246DB, "Populated Skyrim Legendary.esp") as Faction
		Return True
	Else
		Return False
	EndIf
EndFunction
;\\\\\\\\\\\\\\\\
;\\\Event Zone\\\\\\\
;\\\\\\\\\\\\\\\\

Event PutSexCountEvent()
	SexCount(1)
	Debug.Trace("SexCount + 1")
EndEvent

Event PutSexGangBangCountEvent()
	SexCountgangbang(1)
	Debug.Trace("SexGangBangCount + 1")
EndEvent

Event CorruptionGainEvent()
	BDMScript.CalcCorruptionExpGain(1.0)
EndEvent

Event CorruptionLossEvent()
	BDMScript.CalcCorruptionExpLoss(1.0)
EndEvent

Event RStatChangeEvent(float fstat, float ffavor)
	BaboReputation.setvalue(BaboReputation.getvalue() + fstat)
	BaboSpendableFavor.setvalue(BaboSpendableFavor.getvalue() + ffavor)
EndEvent

Function RBStatChangeEvent(Float fstat)
	BaboReputationBitch.setvalue(BaboReputationBitch.getvalue() + fstat)
EndFunction

;\\\\\\\\\\\\\\\\
;\\\Function Zone\\\\\\\
;\\\\\\\\\\\\\\\\


Function RegisterEvent()
	RegisterForModEvent("OnCorruptionLossEvent", "CorruptionLossEvent")
	RegisterForModEvent("OnCorruptionGainEvent", "CorruptionGainEvent")
	RegisterForModEvent("OnRStatChangeEvent", "RStatChangeEvent");reputation
	RegisterForModEvent("OnRBStatChangeEvent", "RBStatChangeEvent");bitch reputation
	RegisterForModEvent("OnPutSexCountEvent", "PutSexCountEvent")
	RegisterForModEvent("OnPutSexGangBangCountEvent", "PutSexGangBangCountEvent")
	RegisterExternalModEvent()
;	RegisterFactionPopulatedSkyrim()
	Debug.trace("BaboReputation Script Registering External Triggers")
EndFunction

Function CreatureSexReputation(Int BaboRepuetationNum)
	BaboReputationCreatureSex.setvalue((BaboReputationCreatureSex.getvalue() as Int) + BaboRepuetationNum);WIP Maybe later I make a diary to give Player traits.
EndFunction

Function DecreaseReputation(Int BaboRepuetationNum, Int BaboFavorNum)
	BaboReputation.setvalue((BaboReputation.getvalue() as Int) - BaboRepuetationNum)
	If BaboSpendableFavor.getvalue() > 0
		BaboSpendableFavor.setvalue((BaboSpendableFavor.getvalue() as Int) - BaboFavorNum)
	Else
		BaboSpendableFavor.setvalue(0)
	EndIf
EndFunction

Function DecreaseReputationBitch(Float BaboRepuetationNum)
	BaboReputationBitch.setvalue((BaboReputationBitch.getvalue()) - BaboRepuetationNum)
	if BaboReputationBitch.getvalue() < 0
		BaboReputationBitch.setvalue(0)
	endif
EndFunction

Function IncreaseReputation(Int BaboRepuetationNum, Int BaboFavorNum)
	BaboReputation.setvalue((BaboReputation.getvalue() as Int) + BaboRepuetationNum)
	BaboSpendableFavor.setvalue((BaboSpendableFavor.getvalue() as Int) + BaboFavorNum)
EndFunction

Function IncreaseReputationBitch(Float BaboRepuetationNum)
	BaboReputationBitch.setvalue((BaboReputationBitch.getvalue()) + BaboRepuetationNum)
EndFunction

Function IncreaseReputationBitchbyExposure(Float BaboRepuetationNum)
	BaboPlayerFondofSexyArmorCycleValue.setvalue(BaboPlayerFondofSexyArmorCycleValue.getvalue() + BaboRepuetationNum)
	
	if BaboReputationBitch.getvalue() < 100.0
		BaboReputationBitch.setvalue((BaboReputationBitch.getvalue()) + BaboRepuetationNum)
	endif
	
	if BaboPlayerFondofSexyArmorCycleValue.getvalue() >= 100.0
		if PlayerRef.isinfaction(SLAX_NudismAddictFaction)
			PlayerRef.setfactionrank(SLAX_NudismAddictFaction, PlayerRef.getfactionrank(SLAX_NudismAddictFaction) + 1)
		else
			PlayerRef.addtofaction(SLAX_NudismAddictFaction)
		endif
		BaboPlayerFondofSexyArmorCycleValue.setvalue(0)
	endif
EndFunction

Function SpendFavor(Int BaboFavorNum)
	If BaboSpendableFavor.getvalue() > 0
		BaboSpendableFavor.setvalue((BaboSpendableFavor.getvalue() as Int) - BaboFavorNum)
	Else
		BaboSpendableFavor.setvalue(0)
	EndIf
EndFunction

Function SexCount(Int Count)
	SexCount.setvalue((SexCount.getvalue() as Int) + Count)
	BDMScript.CalcTraumaExpGain(Count)
EndFunction

Function SexCountgangbang(Int Count)
	SexCountGangBang.setvalue((SexCountGangBang.getvalue() as Int) + Count)
	BDMScript.CalcTraumaExpGain(Count)
EndFunction

Function AddingTitletoPlayerRef(faction FTitle)
	if PlayerRef.isinfaction(FTitle)
		PlayerRef.setfactionrank(FTitle, PlayerRef.getfactionrank(FTitle) + 1)
	else
		PlayerRef.Addtofaction(FTitle)
	endif
EndFunction

Function RemovingTitletoPlayerRef(faction FTitle)
	PlayerRef.Removefromfaction(FTitle)
EndFunction

Function SetTitleGlobal(Globalvariable FGlobal, Int Num)
	FGlobal.setvalue(FGlobal.getvalue() + Num)
Endfunction

;---------------------------SLAPP Related-----------------------------------

Function SLAPPAcquaintanceTrigger(Actor akSpeaker, Bool HadSex = false)
	int handle = ModEvent.Create("SLAPP_AcquaintanceEvent")
	form akspeakerform = akspeaker as form
	if (handle)
		ModEvent.PushForm(handle, akspeakerform)
		ModEvent.PushBool(handle, Hadsex)
		ModEvent.PushString(handle, "BaboDialogue activated SLAPPAcquaintanceEventEvent")
		ModEvent.Send(handle)
	endIf
EndFunction

Function SLAPPHateTrigger(Actor akSpeaker, Bool HadSex = false)
	int handle = ModEvent.Create("SLAPP_HateEvent")
	form akspeakerform = akspeaker as form
	if (handle)
		ModEvent.PushForm(handle, akspeakerform)
		ModEvent.PushBool(handle, Hadsex)
		ModEvent.PushString(handle, "BaboDialogue activated SLAPPHateEvent")
		ModEvent.Send(handle)
	endIf
EndFunction

Event BaboDialogueSLAPPConsequenceEvent(Actor Rapist, Bool RapeTry, string results)
	;Debug.notification(results)
	Debug.trace("BaboDialogueSLAPPConsequenceEvent Started")
	ExternalTriggerSLAPP(Rapist, RapeTry)
EndEvent

Function ExternalTriggerSLAPP(Actor Rapist, Bool RapeTry)
if RapeTry == false
	if (ViceCaptainRef.getactorref() == Rapist) && (BaboDialogueWhiterun.getstage() >= 30) && (BaboDialogueWhiterun.getstage() < 60)
		Rapist.Setactorvalue("Variable06", Utility.randomint(4, 6))
		(BaboDialogueWhiterun as BaboDialogueWhiterunScript).WVAS04()
	elseif (ViceCaptainRef.getactorref() == Rapist) && (BaboDialogueWhiterun.getstage() >= 60) && (BaboDialogueWhiterun.getstage() < 65)
		Rapist.Setactorvalue("Variable06", 6)
		(BaboDialogueWhiterun as BaboDialogueWhiterunScript).WVAS04(); For now below 60 and above 60 are the same.
	EndIf
endif

if RapeTry == true
	if (ViceCaptainRef.getactorref() == Rapist) && (BaboDialogueWhiterun.getstage() >= 30) && (BaboDialogueWhiterun.getstage() < 60)
		Rapist.Setactorvalue("Variable06", 6)
		(BaboDialogueWhiterun as BaboDialogueWhiterunScript).WVAS01();
	elseif (ViceCaptainRef.getactorref() == Rapist) && (BaboDialogueWhiterun.getstage() >= 60) && (BaboDialogueWhiterun.getstage() < 65)
		Rapist.Setactorvalue("Variable06", 3)
		(BaboDialogueWhiterun as BaboDialogueWhiterunScript).WVAS01()
	EndIf
CorruptionGainEvent()
SexCount(1)
endif
EndFunction

;---------------------------SLHH Related-----------------------------------

Function RegisterExternalModEvent()
	Debug.trace("Registering External Mod Events...")
	RegisterForModEvent("BaboDialogue_ConsequenceEvent", "BaboDialogueConsequenceEvent")
	RegisterForModEvent("BaboDialogue_SLAPPConsequenceEvent", "BaboDialogueSLAPPConsequenceEvent")
EndFunction


Event BaboDialogueConsequenceEvent(Form Rapist, Bool Worse, string results)
	BaboMonitorScriptCreaturePackageActive.setvalue(0)
	Debug.trace(results)
	Actor RapistActor = Rapist as actor
	ExternalTrigger(RapistActor, worse)
EndEvent

Function ExternalTrigger(Actor Raper, Bool Raped)
if Raped == false

endif

if Raped == true
	if (ViceCaptainRef.getactorref() == Raper) && (BaboDialogueWhiterun.getstage() >= 30) && (BaboDialogueWhiterun.getstage() < 60)
		Raper.Setactorvalue("Variable06", 6)
		(BaboDialogueWhiterun as BaboDialogueWhiterunScript).WVAS01()
	elseif (Raper.isinfaction(BaboChangeLocationEvent06Faction))
		if BaboChangeLocationEvent06.getstage() == 10
			BaboChangeLocationEvent06.setstage(11)
		elseif BaboChangeLocationEvent06.getstage() == 20
			BaboChangeLocationEvent06.setstage(21)
		endif
	elseif (Raper.isinfaction(BaboEncounter01Faction))
		if BaboEncounter01.getstage() == 30
			BaboEncounter01.setstage(37)
		endif
	elseif (Raper.isinfaction(BaboEncounter02Faction))
		if BaboEncounter02.getstage() == 7
			BaboEncounter02.setstage(9)
		endif
	elseif (ViceCaptainRef.getactorref() == Raper) && (BaboDialogueWhiterun.getstage() >= 60) && (BaboDialogueWhiterun.getstage() < 65)
		Raper.Setactorvalue("Variable06", 3)
		(BaboDialogueWhiterun as BaboDialogueWhiterunScript).WVAS01()
	elseif Raper.isinfaction(BaboCurrentHireling) || Raper.isinfaction(BaboCurrentAnimalHireling)
		(BaboDialogueHirelings as BaboDialogueHirelingsQuest).AfterRapeSceneStart()
	EndIf

	if (Raper.isinfaction(BaboChangeLocationEvent08Faction))
		if BaboChangeLocationEvent08.getstage() == 25
			BaboChangeLocationEvent08.setstage(28)
		elseif BaboChangeLocationEvent08.getstage() == 45
			BaboChangeLocationEvent08.setstage(47)
		endif
	endif

	if BaboChangeLocationEvent02.getstage() == 20
		Utility.wait(3.0)
		BaboChangeLocationEvent02.setstage(30)
	endif

	if BaboChangeLocationEvent02Forest.getstage() == 20
		Utility.wait(3.0)
		BaboChangeLocationEvent02Forest.setstage(30)
	endif

	if BaboChangeLocationEvent02ForestSnow.getstage() == 20
		Utility.wait(3.0)
		BaboChangeLocationEvent02ForestSnow.setstage(30)
	endif

	if BaboChangeLocationEvent02Coast.getstage() == 20
		Utility.wait(3.0)
		BaboChangeLocationEvent02Coast.setstage(30)
	endif

	if BaboChangeLocationEvent02Marsh.getstage() == 20
		Utility.wait(3.0)
		BaboChangeLocationEvent02Marsh.setstage(30)
	endif
	
	if BaboChangeLocationEvent02Mountain.getstage() == 20
		Utility.wait(3.0)
		BaboChangeLocationEvent02Mountain.setstage(30)
	endif
	
	if BaboChangeLocationEvent02MountainSnow.getstage() == 20
		Utility.wait(3.0)
		BaboChangeLocationEvent02MountainSnow.setstage(30)
	endif
	
	if BaboChangeLocationEvent02Plain.getstage() == 20
		Utility.wait(3.0)
		BaboChangeLocationEvent02Plain.setstage(30)
	endif
	
	if BaboChangeLocationEvent02PlainSnow.getstage() == 20
		Utility.wait(3.0)
		BaboChangeLocationEvent02PlainSnow.setstage(30)
	endif

SexCount(1)

else

	if (BaboChangeLocationEvent05.getstage() == 20) && (BaboChangeLocationEvent05Visitor.getactorref() == Raper)
		BaboChangeLocationEvent05.setstage(30);BaboDiaQuest script handles the escapefail situation. Don't have to add elseif.

	elseif (ViceCaptainRef.getactorref() == Raper) && (BaboDialogueWhiterun.getstage() >= 30) && (BaboDialogueWhiterun.getstage() < 60)
		Raper.Setactorvalue("Variable06", 4)
		(BaboDialogueWhiterun as BaboDialogueWhiterunScript).WVAS03()
	elseif Raper.isinfaction(BaboCurrentHireling) || Raper.isinfaction(BaboCurrentAnimalHireling)
		(BaboDialogueHirelings as BaboDialogueHirelingsQuest).DismissFollower(3)
	EndIf

	if (Raper.isinfaction(BaboEncounter01Faction))
		if BaboEncounter01.getstage() == 30
			BaboEncounter01.setstage(35)
		endif
	endif
	if (Raper.isinfaction(BaboEncounter02Faction))
		if BaboEncounter02.getstage() == 7
			BaboEncounter02.setstage(8)
		endif
	endif
	
	if (Raper.isinfaction(BaboChangeLocationEvent08Faction))
		if BaboChangeLocationEvent08.getstage() == 25
			BaboChangeLocationEvent08.setstage(27)
		elseif BaboChangeLocationEvent08.getstage() == 45
			BaboChangeLocationEvent08.setstage(46)
		endif
	endif
	
	if BaboChangeLocationEvent02.getstage() == 20
		BaboChangeLocationEvent02.setstage(70)
	endif

	if BaboChangeLocationEvent02Forest.getstage() == 20
		BaboChangeLocationEvent02Forest.setstage(70)
	endif

	if BaboChangeLocationEvent02ForestSnow.getstage() == 20
		BaboChangeLocationEvent02ForestSnow.setstage(70)
	endif
	
	if BaboChangeLocationEvent02Coast.getstage() == 20
		BaboChangeLocationEvent02Coast.setstage(70)
	endif
	
	if BaboChangeLocationEvent02Marsh.getstage() == 20
		BaboChangeLocationEvent02Marsh.setstage(70)
	endif
	
	if BaboChangeLocationEvent02Mountain.getstage() == 20
		BaboChangeLocationEvent02Mountain.setstage(70)
	endif
	
	if BaboChangeLocationEvent02MountainSnow.getstage() == 20
		BaboChangeLocationEvent02MountainSnow.setstage(70)
	endif
	
	if BaboChangeLocationEvent02Plain.getstage() == 20
		BaboChangeLocationEvent02Plain.setstage(70)
	endif
	
	if BaboChangeLocationEvent02PlainSnow.getstage() == 20
		BaboChangeLocationEvent02PlainSnow.setstage(70)
	endif

endif

if raper.isinfaction(BaboCreatureArousedFaction)
	raper.removefromfaction(BaboCreatureArousedFaction)
	raper.addtofaction(BaboCreatureMatePartnerFaction)
endif
EndFunction