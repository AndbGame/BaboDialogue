Scriptname BaboBoyFriendVariableScript extends Quest  
{Quest}

;---------------------------------------------------------------------------------------------------
;STANDARD VARIABLES
;----------------------------------------------------------------------------------------------------
;Relationship makes extensive use of Actor Values Variable06-07 for package conditionals and state-tracking. Values are:
;
;******************************
; Variable06 - BoyFriend State: Primarily used for package conditionals to override the BoyFriend's standard schedule.
;   - -2 - Just staying in the house
;   - -1 - Try to borrow some money.
;   -  0 - Want to see PC's naked body. Ask for her permission
;   -  1 - Want to fuck PC. If Sexlab Approach triggers the dialogue.
;   -  2 - Say something nice about PC's appearance.
;   -  3 - Override Orders: BoyFriend ordered inside (Outside, any time)
;   -  4 - Override Orders: BoyFriend ordered to do chores (Anywhere, 6am-9pm)
;   -  5 - Override Orders: BoyFriend ordered to bed (Anywhere, 6pm-8am)
;   -  6 - Override Behavior: BoyFriend will "Never Speak to You Again" due to a hostile action. This lasts for 24h.
; Variable06 - Vice Captain) State
;   - -2 - Just staying in the house.
;   - -1 - If aggressive, start to rummage the chest for money.
;   -  0 - Want to see PC's naked body. Make her strip.
;   -  1 - Want to fuck PC. If Sexlab Approach triggers the dialogue. If aggressive it leads to SLHH. Only at night.
;   -  2 - Sexually harrass PC. A simple motions with it.
;   -  3 - Being spotted by the captain
;   -  4 - SLHH Failed
;   -  5 - Siesta - Standing by
;   -  6 - Patrol - after event he goes to the inn
;   -  7 - Duel
;******************************
; BoyFriendNum - Which actor?
; 1 - ViceCaptain in Whiterun Event.
;
;******************************

Quest Property BaboDialogueWhiterun Auto
Quest Property BaboSexController Auto

Int Property ViceCaptainVariable = 0 Auto
Objectreference Property BaboEventWhiterunViceCaptainXmarkerPC Auto
Objectreference Property WhiterunPlayerChest Auto
miscobject Property Gold001 Auto
GlobalVariable Property BaboWhiterunBreezehomeVCTrigger Auto
GlobalVariable Property BaboWhiterunBreezehomeVCEventCounts Auto

ObjectReference Property BaboEventWhiterunViceCaptainDuelXmakerRef  Auto  
ObjectReference Property BaboEventWhiterunVCDuel01Ref Auto  
ObjectReference Property BaboEventWhiterunVCDuel02Ref Auto  
ObjectReference Property BaboEventWhiterunVCDuel03Ref Auto  
ObjectReference Property BaboDialogueWhiterunXmarker05 Auto  
ObjectReference Property BaboDialogueWhiterunXmarker06 Auto


Actor Property PlayerRef Auto

Faction Property BaboPlayerFaction Auto
Faction Property BaboPlayerHateFaction Auto
Faction Property CrimeFactionWhiterun Auto

;Boyfriend List
ReferenceAlias Property WhiterunViceCaptainRef Auto
ReferenceAlias Property ViceCaptainDeadRef Auto
ReferenceAlias Property AliasPlayerRef Auto


Function Variable06DiceRoll(Actor BoyFriend, int BoyFriendNum)
	Float RandomVariable = Utility.randomint(-2, 1)
	BoyFriend.Setactorvalue("Variable06", RandomVariable) 
	ViceCaptainVariable = RandomVariable as int
	BoyFriend.evaluatepackage()
	If BoyFriendNum == 1;Whiterun Vice Captain
	BaboWhiterunBreezehomeVCTrigger.setvalue(1)
		if RandomVariable == -1
			BoyFriend.moveto(BaboEventWhiterunViceCaptainXmarkerPC)
			CheckHouseGold(BoyFriend, WhiterunPlayerChest)
		endif
	Endif
EndFunction

Function VariableReset()
	if WhiterunViceCaptainRef.getactorref().getactorvalue("Variable06") == 1
		WhiterunViceCaptainRef.getactorref().Setactorvalue("Variable06", 5)
		BaboWhiterunBreezehomeVCTrigger.setvalue(0)
		WhiterunViceCaptainRef.getactorref().evaluatepackage()
		Debug.notification("Vice captain's variable returns to 5. Fixed his current status")
	endif
EndFunction 

Function CheckHouseGold(Actor Taker, Objectreference PlayerChest)
	if PlayerChest.getitemcount(Gold001) > 1000 
		PlayerChest.removeitem(Gold001, 5000, True, Taker)
	endif
EndFunction

Function BoyFriendVariableChange(Actor BoyFriend, int BoyFriendNum, int VariableNum, bool NextUpdate = false)
If BoyFriendNum == 1
	BoyFriend.Setactorvalue("Variable06", VariableNum)
	ViceCaptainVariable = VariableNum
	
Endif
if NextUpdate
	RegisterUpdate(8)
Endif
EndFunction

Function BoyFriendTriggerEnd(Actor BoyFriend, int BoyFriendNum)
	If BoyFriendNum == 1
		BaboWhiterunBreezehomeVCTrigger.setvalue(0)
		BaboWhiterunBreezehomeVCEventCounts.setvalue(BaboWhiterunBreezehomeVCEventCounts.getvalue() + 1)
		RegisterUpdate(2)
	Endif
	BoyFriend.evaluatepackage()
EndFunction

Event OnUpdateGameTime()
	OnUpdateGT()
EndEvent

Function OnUpdateGT()
	if (BaboDialogueWhiterun.getstage() >= 30) && (BaboDialogueWhiterun.getstage() <= 60)
		if (ViceCaptainVariable == 6) || (ViceCaptainVariable == 4)
			ViceCaptainRefreshPackage()
		endif
	elseif BaboDialogueWhiterun.getstage() == 116
		BaboDialogueWhiterun.setstage(130)
	elseif BaboDialogueWhiterun.getstage() == 120
		BaboDialogueWhiterun.setstage(130)
	endif
EndFunction

Function ViceCaptainRefreshPackage()
	WhiterunViceCaptainRef.getactorref().Setactorvalue("Variable06", 5);standing by package
	ViceCaptainVariable = 5
	(BaboDialogueWhiterun as BaboDialogueWhiterunScript).VCSetFactionRank(0)
	BaboWhiterunBreezehomeVCTrigger.setvalue(0)
	WhiterunViceCaptainRef.getactorref().evaluatepackage()	
EndFunction

Function RegisterUpdate(Int TimeLimit)
	UnregisterForUpdateGameTime()
	RegisterForSingleUpdateGameTime(TimeLimit); this is Customizable
EndFunction

Function BFMove(Actor BF01, int BoyFriendNum)
	If BoyFriendNum == 1
		Scene BaboDialogueWhiterunSceneVC06 = Game.GetFormFromFile(0x00ED92F6, "BabointeractiveDia.esp") as Scene
		Game.getplayer().moveto(BaboDialogueWhiterunXmarker05)
		BF01.moveto(BaboDialogueWhiterunXmarker06)
		Utility.wait(1.0)
		BaboDialogueWhiterunSceneVC06.forcestart()
	Endif
EndFunction

Function PrepDuelwithBF(int BFNum, Actor BF01, Actor BF02 = none, Actor BF03 = none,Quest OwnQuest = none, int Nextstage = 0, Bool Reverse = false)

if !Reverse
	Game.DisablePlayerControls( true, true, false, false, false, false, false, false )
	Game.SetPlayerAIDriven( true )

	BF01.evaluatepackage()
	
	if BF02
		BF02.evaluatepackage()
	endif
	
	if BF03
		BF03.evaluatepackage()
	endif
endif

if NextStage
	OwnQuest.setstage(Nextstage)
Endif

EndFunction

Function StartDuelwithBF(int BFNum, Actor BF01, Actor BF02 = none, Actor BF03 = none)

	Game.enablePlayerControls()
	Game.SetPlayerAIDriven(false)

	PlayerRef.addtoFaction(BaboPlayerFaction)
	BF01.addtoFaction(BaboPlayerHateFaction)
	
	if BF01.GetActorValue("Confidence") < 4
		BF01.SetActorValue("Confidence", 4) 
		BF01.startCombat(PlayerRef)
	EndIf
	if BF02
		BF02.addtoFaction(BaboPlayerHateFaction)
		if BF02.GetActorValue("Confidence") < 4
			BF02.SetActorValue("Confidence", 4) 
		BF02.startCombat(PlayerRef)
		EndIf
	endif
	if BF03
		BF03.addtoFaction(BaboPlayerHateFaction)
		if BF03.GetActorValue("Confidence") < 4
			BF03.SetActorValue("Confidence", 4) 
			BF03.startCombat(PlayerRef)
		EndIf
	endif
EndFunction


Function StopDuelwithBF(int BFNum, Actor BF01, Actor BF02 = none, Actor BF03 = none)

	BF01.RemoveFromFaction(BaboPlayerHateFaction)
	PlayerRef.RemoveFromFaction(BaboPlayerFaction)
	if BFNum == 1
		BF01.addtoFaction(CrimeFactionWhiterun)
	endif
	BF01.SetActorValue("Confidence", 2) 
	BF01.StopCombat()
	
	if BF02
		BF02.RemoveFromFaction(BaboPlayerHateFaction)
		BF02.SetActorValue("Confidence", 2) 
		BF02.StopCombat()
	endif

	if BF03
		BF03.RemoveFromFaction(BaboPlayerHateFaction)
		BF03.SetActorValue("Confidence", 2)
		BF03.StopCombat()
	endif
EndFunction