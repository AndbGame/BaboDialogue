Scriptname BaboMCMRestart extends Quest  
{This will restart all of the quests}
Event OnInit()
	Debug.notification("BaboMCMReset System Rebooting...")
EndEvent

Function Updatetofive()
	;(BaboDialogueMCM as BaboDialogueConfigMenu).PageReset()
	BaboDialogueMCM.stop()
	BaboDialogueMCM.start()
EndFunction

Function UpdateWhiterunOrcQuest()
int currentstage = BaboEventWhiterunOrcVisitiors.getstage()
	
	BaboEventWhiterunOrcVisitiors.reset()
	Utility.wait(1.0)
	If (currentstage == 67)  || (currentstage == 69)
		BaboEventWhiterunOrcVisitiors.setstage(5)
	Elseif (currentstage == 70)
		BaboEventWhiterunOrcVisitiors.setstage(4)
	Elseif (currentstage == 80) && (BaboDialogueWhiterun.getstage() >= 100)
		BaboEventWhiterunOrcVisitiors.setstage(4)
	EndIf
	Debug.notification("Whiterun Orc Visitor Event Recurring to an initial stage...")
EndFunction

Function ResetWhiterunOrcQuest()
int currentstage = BaboEventWhiterunOrcVisitiors.getstage()
	If WhterunOrcVisitScript.ResetQuest()
		Utility.wait(3.0)
		BaboEventWhiterunOrcVisitiors.reset()
		Utility.wait(1.0)
		BaboEventWhiterunOrcVisitiors.stop()
		Utility.wait(1.0)
		BaboEventWhiterunOrcVisitiors.start()
		(BaboEventWhiterunOrcVisitiors as BaboEventWhiterunOrcVisitorsScript).BaboEventWhiterunOrcVisitorsTriggerEventValue(0)

		Debug.notification("Whiterun Orc Visitor Event Resetting...")
	Else
		Debug.messagebox("Whiterun vice captain event has not terminated yet.")
	Endif
EndFunction

Function ResetWhiterunViceCaptainQuest()
BaboDialogueWhiterun.setstage(1)
Utility.wait(1.0)
BaboDialogueWhiterun.reset()
Debug.messagebox("Whiterun vice captain event Resetting...")
EndFunction

Function UpdateWhiterunViceCaptainQuest()

int Currentstage = BaboDialogueWhiterun.getstage() as int

if Currentstage >= 30
BaboDialogueWhiterun.setstage(1)
Utility.wait(1.0)
BaboDialogueWhiterun.reset()
Utility.wait(1.0)
BaboDialogueWhiterun.stop()
Utility.wait(1.0)
BaboDialogueWhiterun.start()

Debug.messagebox("Whiterun vice captain event needs updates... Updating")
BabodialoguewhiterunUpdating = true
BaboDialogueWhiterun.setstage(4)
BabodialoguewhiterunUpdating = false
(BaboBoyFriendVariableSetting as BaboBoyFriendVariableScript).VariableReset()
(BaboBoyFriendVariableSetting as BaboBoyFriendVariableScript).WhiterunViceCaptainRef.getactorref().moveto(Game.getplayer())
elseif Currentstage >= 5 &&  Currentstage < 30
ResetWhiterunOrcQuest()
Debug.messagebox("Whiterun vice captain needs to revert to its initial stage. Resetting.")
else
;no need to reset the quest
endif

EndFunction

Function UpdateNewgnisisQuest()
int currentstage = BaboEventWindhelmNewgnisis.getstage()
	BaboEventWindhelmNewgnisis.reset()
	Utility.wait(1.0)
	If (currentstage == 150)  || (currentstage == 245) || (currentstage == 250)
		BaboEventWindhelmNewgnisis.setstage(5)
	Elseif (currentstage == 255)
		BaboEventWindhelmNewgnisis.setstage(3)
	EndIf
	Debug.notification("Windhelm Newgnisis Event Recurring to an initial stage...")
EndFunction

Function RestartNewgnisisQuest()
int currentstage = BaboEventWindhelmNewgnisis.getstage()
	NewgnisisScript.ClearQuest()
	Utility.wait(3.0)
	BaboEventWindhelmNewgnisis.reset()
	Utility.wait(1.0)
	BaboEventWindhelmNewgnisis.stop()
	Utility.wait(1.0)
	BaboEventWindhelmNewgnisis.start()
	Utility.wait(1.0)
	If currentstage < 5
	BaboEventWindhelmNewgnisis.setstage(currentstage)
	EndIf
	Debug.notification("Newgnisis Event Reset Complete")
EndFunction

Function RestartLoanShark()
(BaboLoanSharks as BaboLoanSharkScript).reset()
BaboLoanSharks.setstage(255)
BaboLoanSharks.stop()
Utility.wait(3.0)
BaboLoanSharks.start()
EndFunction

Function RestartQuests()
	Debug.notification("BaboDialogue Quests Resetting...")
	BaboDialogueMCM.Stop()
	BaboStealingScript.Stop()
	BaboReputationScript.Stop()
	BaboMonitorScript.Stop()
	BaboRescuingSlavesScript.Stop()
	BaboDialogueGeneralGuards.stop()
	BaboBoyFriendVariableSetting.stop()
	BaboPotionDealer.setstage(255)
	BaboPotionDealer.stop()
	BaboSoliloquyOnStart.stop()
	BaboBadEnd.stop()
	babosexcontroller.stop()

	BaboEventDibellaTemplePerk.Stop()
	BaboEventMarkarthGuard.Stop()
	BaboEventMogrul.Stop()
	BaboEventRieklingThirsk.Stop()
	;BaboEventOrcVillage01.Stop()
	;BaboEventRiftenBlackBriarstrap.Stop()
	;BaboEventWhiterunOrcVisitiors.Stop()
	;BaboEventWindhelmNewgnisis.Stop()

	DialogueMerchantResponse.Stop()
	;BaboStrictGuardDialogue.Stop()
	BaboDialogueDragon.Stop()
	BaboDialogueHirelings.Stop()
	;BaboDialogueRiverwood.setstage(1); Clear all aliases
	;BaboDialogueWhiterun.setstage(1); Clear all aliases
	;BaboDialogueWindhelm.setstage(1); Clear all aliases
	BaboDialogueWindhelm.stop()
	Utility.wait(5.0)
	
	BaboDialogueMCM.Start()
	BaboStealingScript.Start()
	BaboReputationScript.Start()
	BaboMonitorScript.Start()
	BaboRescuingSlavesScript.Start()
	BaboDialogueGeneralGuards.Start()
	BaboBoyFriendVariableSetting.Start()
	BaboPotionDealer.start()
	BaboSoliloquyOnStart.start()
	
	babosexcontroller.Start()
	BaboEventDibellaTemplePerk.Start()
	BaboEventMarkarthGuard.Start()
	BaboEventMogrul.Start()
	BaboEventRieklingThirsk.Start()
	;BaboEventOrcVillage01.Start()
	;BaboEventRiftenBlackBriarstrap.Start()
	;BaboEventWhiterunOrcVisitiors.Start()
	;BaboEventWindhelmNewgnisis.Start()

	DialogueMerchantResponse.Start()
	;BaboStrictGuardDialogue.Start()
	BaboDialogueDragon.Start()
	BaboDialogueHirelings.Start()
	;BaboDialogueRiverwood.Setstage(0)
	;BaboDialogueWhiterun.Setstage(0)
	;BaboDialogueWindhelm.Setstage(0)
	BaboDialogueWindhelm.Start()
	Debug.notification("BaboDialogue Quests Reset Complete.")
EndFunction


Quest Property babosexcontroller Auto
Quest Property BaboBadEnd Auto
Quest Property BaboDialogueMCM Auto
Quest Property BaboStealingScript Auto
Quest Property BaboReputationScript Auto
Quest Property BaboMonitorScript Auto
Quest Property BaboRescuingSlavesScript Auto ; These quests should be added to this script
Quest Property BaboPotionDealer Auto

Quest Property BaboBoyFriendVariableSetting Auto
Quest Property BaboEventDibellaTemplePerk Auto
Quest Property BaboEventMarkarthGuard Auto
Quest Property BaboEventMogrul Auto
Quest Property BaboEventRieklingThirsk Auto
Quest Property BaboEventOrcVillage01 Auto
Quest Property BaboEventRiftenBlackBriarstrap Auto
Quest Property BaboEventWhiterunOrcVisitiors Auto
Quest Property BaboEventWindhelmNewgnisis Auto

Quest Property DialogueMerchantResponse Auto
Quest Property BaboStrictGuardDialogue Auto
Quest Property BaboDialogueDragon Auto
Quest Property BaboDialogueHirelings Auto
Quest Property BaboDialogueRiverwood  Auto  


Quest Property BaboDialogueGeneralGuards  Auto  

Quest Property BaboDialogueWhiterun  Auto  

Quest Property BaboDialogueNightgateInn  Auto  

Quest Property BaboDialogueWindhelm  Auto  

Quest Property BaboSoliloquyOnStart  Auto  
Quest Property BaboLoanSharks  Auto  

Quest Property BaboEncounter11 Auto

globalvariable property BaboEventWhiterunOrcVisitorsTriggerEvent auto

BaboEventNewgnisisMasterScript property NewgnisisScript auto
BaboEventWhiterunOrcVisitorsScript Property WhterunOrcVisitScript Auto

Bool Property BabodialoguewhiterunUpdating= false auto conditional