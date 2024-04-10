Scriptname BaboDialogueWhiterunScript extends Quest  


Int Function DeathCount()
	DeathCountNum = DeathCountNum + 1
	Debug.Trace(DeathCountNum + " + 1")
		If DeathCountNum >= DeathCountGoalNum
			BaboDialogueWhiterun.setstage(52)
		EndIf
	Return DeathCountNum
EndFunction

Int Function FaintCount()
	FaintCountNum = FaintCountNum + 1
	Debug.Trace(FaintCountNum + " + 1")
		If FaintCountNum >= FaintCountGoalNum
			BaboDialogueWhiterun.setstage(52)
		EndIf
	Return FaintCountNum
EndFunction

Function VCSetFactionRank(int fnumber)
	(ViceCaptainRef.getreference() as actor).setfactionrank(BaboViceGuardCaptainFaction, fnumber)
EndFunction

Function ViceCaptainRefresh()
	(BaboBoyFriendVariableSetting as BaboBoyFriendVariableScript).ViceCaptainRefreshPackage()
EndFunction

Function VCSex()
	actor akactor = ViceCaptainRef.getreference() as actor
	PlayerRef.moveto(BaboEventWhiterunViceCaptainXmarkerPC)
	akactor.moveto(BaboEventWhiterunViceCaptainXmarkerPC)
	Utility.wait(5.0)
	(BaboSexController as BaboSexControllerManager).SexCustomActor(PlayerRef, akactor, None, None, None, "MF", "Aggressive", "rape", True, "WVAS01", "WhiterunViceCaptainAfterSex01", true)
	(BaboBoyFriendVariableSetting as BaboBoyFriendVariableScript).BoyFriendVariableChange(akactor, 1, 6, false)
	(BaboBoyFriendVariableSetting as BaboBoyFriendVariableScript).BoyFriendTriggerEnd(akactor, 1)
EndFunction

Function PreParethesceneA01()
	Debug.Sendanimationevent(PlayerRef, "BaboFaintF")
	(BaboSexController as BaboSexControllerManager).CustomMFGPain(PlayerRef, 9);faint
	(ViceCaptainRef.getreference() as actor).moveto(BaboEvent01XmarkerF)
	BaboDialogueWhiterunScene02.forcestart()
EndFunction

Function PreparethesceneA02()
	(OrcVisitorRef01.getreference() as actor).moveto(BaboEvent01XmarkerA)
	(OrcVisitorRef02.getreference() as actor).moveto(BaboEvent01XmarkerB)
	(OrcVisitorRef03.getreference() as actor).moveto(BaboEvent01XmarkerC)
EndFunction

Function PreparethesceneB(int Stage)
	if Stage == 1
		(BaboSexController as BaboSexControllerManager).EventPairMotion(ViceCaptainRef.getreference() as actor, 0, 0, 0, 4, false)
	elseif Stage == 2
		(BaboSexController as BaboSexControllerManager).EventPairMotion(ViceCaptainRef.getreference() as actor, 0, 0, 0, 5, false)
	elseif Stage == 3
		(BaboSexController as BaboSexControllerManager).FadeinMove(ViceCaptainRef, PlayerMovePointBreezehome, 0, 0)
		BacktoBreezehome()
	else
		(BaboSexController as BaboSexControllerManager).FadeinMove(ViceCaptainRef, PlayerMovePointBreezehome, 10, 1)
		BacktoBreezehome()
	endif
EndFunction

Function AllotDuelMarker(int Stage)
	if Stage == 1
		DuelMarkerPlayer.forcerefto(BaboEventWhiterunVCDuel02Ref)
		DuelMarkerFoe.forcerefto(BaboEventWhiterunVCDuel03Ref)
		DuelMarkerJudge.forcerefto(BaboEventWhiterunVCDuel01Ref)
	endif
EndFunction

Function PrepareDuelActors()
	ViceCaptainActor = ViceCaptainRef.getreference() as actor
	CaptainActor = CaptainRef.getreference() as actor
	ViceCaptainRef.clear()
	ViceCaptainDuelRef.forcerefto(ViceCaptainActor)
EndFunction

Function BacktoNormalDuelActors()
	ViceCaptainDuelRef.clear()
	ViceCaptainRef.forcerefto(ViceCaptainActor)
EndFunction

Function OrcsAreDead()
Actor OrcA = OrcVisitorRef01.getreference() as actor
Actor OrcB = OrcVisitorRef02.getreference() as actor
Actor OrcC = OrcVisitorRef03.getreference() as actor

if OrcA.isdead() && OrcB.isdead() && OrcC.isdead()
	BaboDialogueWhiterun.setstage(22)
endif
EndFunction

Function StartDuel()
	(BaboSexController as BaboSexControllerManager).RecoverControl(true)
	ViceCaptainActor.RemoveFromFaction(CrimeFactionWhiterun)
	(BaboSexController as BaboSexControllerManager).ChallengeStart(ViceCaptainDuelRef)
EndFunction

Function StopDuel()
	(BaboSexController as BaboSexControllerManager).pacifyAlias(ViceCaptainDuelRef)
	Utility.wait(3.0)
	If ViceCaptainActor.isdead()
		BaboDialogueWhiterunSceneVC07c.forcestart()
	else
		ViceCaptainActor.addtofaction(CrimeFactionWhiterun)
		BaboDialogueWhiterunSceneVC07b.forcestart()
	endif
EndFunction

Function BaboActorValue06Set(actor akactor, int VariableNum)
	(BaboBoyFriendVariableSetting as BaboBoyFriendVariableScript).BoyFriendVariableChange(akactor, 1, VariableNum, false)
EndFunction

Function PreparethesceneVC07()
	PrepareDuelActors()
	AllotDuelMarker(1)
	BaboEventWhiterunViceCaptainDuelXmakerRef.enable()
	(BaboSexController as BaboSexControllerManager).LosingControl()
;PrepDuelwithBF(1, Alias_ViceCaptainDuelRef.getactorreference(), CaptainActor, none, SelfQuest, 47)
	PlayerRef.moveto(DuelMarkerPlayer.getreference())
	ViceCaptainActor.moveto(DuelMarkerFoe.getreference())
	CaptainActor.moveto(DuelMarkerJudge.getreference())
	Utility.wait(5.0)
	BaboDialogueWhiterunSceneVC07.forcestart()
EndFunction

Function BacktoBreezehome()
	PlayerRef.moveto(BaboEventWhiterunViceCaptainXmarkerPC)
	(BaboSexController as BaboSexControllerManager).RecoverControl(true)
	(BaboSexController as BaboSexControllerManager).UnEquipCumItem(PlayerRef)
	(BaboSexController as BaboSexControllerManager).QTEAnimation(PlayerRef, ViceCaptainRef.getreference() as actor, false, "IdleForceDefaultState", "IdleForceDefaultState", true)
	(BaboEventWhiterunOrcVisitiors as BaboEventWhiterunOrcVisitorsScript).DoorSwitch(false)
	(ViceCaptainRef.getreference() as actor).setactorvalue("Variable06", 5)
	(ViceCaptainRef.getreference() as actor).EvaluatePackage()
EndFunction

Function PlayerRecoverControl();It is used in a specific moment. Use RecoverControl instead.
	Game.EnablePlayerControls()
	Game.SetPlayerAIDriven(false)
	PlayerRef.SetRestrained(false)
	PlayerRef.SetDontMove(false)
EndFunction

Function WVAS01()
	BaboDialogueWhiterunSceneVC01.forcestart()
EndFunction

Function WVAS03()
	BaboDialogueWhiterunSceneVC03.forcestart()
EndFunction

Function WVAS04()
	BaboDialogueWhiterunSceneVC04.forcestart()
EndFunction

Function Message(int num)
	(BaboSexController as BaboSexControllerManager).WhiterunViceCaptainMessagebox(num)
EndFunction

Function RapeStart(Referencealias Alias01, Referencealias Alias02)
	(BaboSexController as BaboSexControllerManager).SexCustom(Alias01, Alias02, None, None, None, "MF", "Aggressive", "rape", True, "WVAS01", "WhiterunViceCaptainAfterSex01", true)
EndFunction

Function WhenRapeFailed()
	
EndFunction

Actor ViceCaptainActor
Actor CaptainActor

Faction Property CrimeFactionWhiterun Auto
Faction Property BaboPlayerFaction Auto
Faction Property BaboPlayerHateFaction Auto

Actor Property PlayerRef Auto
Quest Property BaboSexController Auto
Quest Property BaboDialogueWhiterun Auto
Quest Property BaboEventWhiterunOrcVisitiors Auto
Quest Property BaboBoyFriendVariableSetting Auto

Int property DeathCountNum = 0 auto hidden conditional
Int Property DeathCountGoalNum Auto

Int property FaintCountNum = 0 auto hidden conditional
Int Property FaintCountGoalNum Auto
Scene Property BaboDialogueWhiterunSceneVC01 Auto
Scene Property BaboDialogueWhiterunSceneVC03 Auto
Scene Property BaboDialogueWhiterunSceneVC04 Auto
Scene Property BaboDialogueWhiterunSceneVC07 Auto
Scene Property BaboDialogueWhiterunSceneVC07b Auto
Scene Property BaboDialogueWhiterunSceneVC07c Auto
Scene Property BaboDialogueWhiterunScene02 Auto

ObjectReference Property BaboDialogueWhiterunXmarker06 Auto

ObjectReference Property BaboEvent01XmarkerA Auto
ObjectReference Property BaboEvent01XmarkerB Auto
ObjectReference Property BaboEvent01XmarkerC Auto
ObjectReference Property BaboEvent01XmarkerF Auto
ObjectReference Property BaboEventWhiterunViceCaptainXmarkerPC Auto
ObjectReference Property BaboEventWhiterunViceCaptainDuelXmakerRef Auto


ObjectReference Property BaboEventWhiterunVCDuel01Ref Auto
ObjectReference Property BaboEventWhiterunVCDuel02Ref Auto
ObjectReference Property BaboEventWhiterunVCDuel03Ref Auto

ReferenceAlias Property DuelMarkerPlayer Auto
ReferenceAlias Property DuelMarkerFoe Auto
ReferenceAlias Property DuelMarkerJudge Auto

ReferenceAlias Property CaptainRef Auto
ReferenceAlias Property ViceCaptainRef Auto
ReferenceAlias Property ViceCaptainDuelRef Auto
ReferenceAlias Property PlayerMovePointBreezehome Auto
ReferenceAlias Property OrcVisitorRef01 Auto
ReferenceAlias Property OrcVisitorRef02 Auto
ReferenceAlias Property OrcVisitorRef03 Auto

Faction Property BaboViceGuardCaptainFaction Auto