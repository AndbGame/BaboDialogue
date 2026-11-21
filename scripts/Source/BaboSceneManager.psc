Scriptname BaboSceneManager extends Quest  

Scene Property SelectedScene Auto Hidden
Scene Property SelectedEventScene Auto Hidden



Scene Property BaboChangeLocationEvent02Scene01 Auto
Scene Property BaboChangeLocationEvent02Scene02 Auto

Scene Property BaboChangeLocationEvent02ForestScene01 Auto
Scene Property BaboChangeLocationEvent02ForestSnowScene01 Auto
Scene Property BaboChangeLocationEvent02MarshScene01 Auto
Scene Property BaboChangeLocationEvent02MountainScene01 Auto
Scene Property BaboChangeLocationEvent02MountainSnowScene01 Auto
Scene Property BaboChangeLocationEvent02PlainScene01 Auto
Scene Property BaboChangeLocationEvent02PlainSnowScene01 Auto

Bool Function ConfirmSelectedScene()
	if SelectedScene.IsPlaying()
		return true
	else
		return false
	endif
EndFunction

Function RePlaySelectedScene()
	SelectedScene.forcestart()
EndFunction

Function RePlaySelectedEventScene()
	SelectedEventScene.forcestart()
EndFunction


Bool Function BCLEventScenePlay(int i, String EventName)
	if EventName == "BaboEncounter05"
		if Encounter05ScenePlay(i, true)
			return true
		endif
	elseif EventName == "BaboEncounter06"
		if Encounter06ScenePlay(i, true)
			return true
		endif	
	elseif EventName == "BaboEncounter09"
		if Encounter09ScenePlay(i, true)
			return true
		endif
	elseif EventName == "BaboChangeLocationEvent02"
		if i == 1
			BaboChangeLocationEvent02Scene01.forcestart()
		elseif i == 2
			BaboChangeLocationEvent02Scene02.forcestart()
		endif
	elseif EventName == "BaboChangeLocationEvent02Forest"
		BaboChangeLocationEvent02ForestScene01.forcestart()
	elseif EventName == "BaboChangeLocationEvent02ForestSnow"
		BaboChangeLocationEvent02ForestSnowScene01.forcestart()
	elseif EventName == "BaboChangeLocationEvent02Marsh"
		BaboChangeLocationEvent02MarshScene01.forcestart()
	elseif EventName == "BaboChangeLocationEvent02Mountain"
		BaboChangeLocationEvent02MountainScene01.forcestart()
	elseif EventName == "BaboChangeLocationEvent02MountainSnow"
		BaboChangeLocationEvent02MountainSnowScene01.forcestart()
	elseif EventName == "BaboChangeLocationEvent02Plain"
		BaboChangeLocationEvent02PlainScene01.forcestart()
	elseif EventName == "BaboChangeLocationEvent02PlainSnow"
		BaboChangeLocationEvent02PlainSnowScene01.forcestart()
	endif
return false
EndFunction

Scene Property BaboEventWhiterunOrcVisitiorsScene01 Auto
Scene Property BaboEventWhiterunOrcVisitiorsScene02 Auto
Scene Property BaboEventWhiterunOrcVisitiorsScene03 Auto
Scene Property BaboEventWhiterunOrcVisitiorsSceneExtra Auto
Scene Property BaboEventWhiterunOrcVisitiorsSceneBG01 Auto
Scene Property BaboEventWhiterunOrcVisitiorsSceneBG02 Auto
Scene Property BaboEventWhiterunOrcVisitiorsSceneIntro Auto

Bool Function EventWOVScenePlay(int i, bool bplay)
	if bplay
		if i == 1
			SelectedEventScene = BaboEventWhiterunOrcVisitiorsScene01;State 54 Or 55
		elseif i == 2
			SelectedEventScene = BaboEventWhiterunOrcVisitiorsScene02;Stage 65
		elseif i == 3
			SelectedEventScene = BaboEventWhiterunOrcVisitiorsScene03;Stage 37
		elseif i == 4
			SelectedEventScene = BaboEventWhiterunOrcVisitiorsSceneBG01;Stage 40
		elseif i == 5
			SelectedEventScene = BaboEventWhiterunOrcVisitiorsSceneBG02;Stage 80
		elseif i == 6
			SelectedEventScene = BaboEventWhiterunOrcVisitiorsSceneExtra;Stage 45 or 69
		elseif i == 7
			SelectedEventScene = BaboEventWhiterunOrcVisitiorsSceneIntro
		else
			return false
		endif
		SelectedEventScene.forcestart()
		Utility.wait(1.0)
		if SelectedEventScene.IsPlaying()
			return true
		else
			return false
		endif
	else
		SelectedEventScene.stop();Stage 70 90 91 100
	endif
	return false
EndFunction

Scene Property BaboLoanSharksScene01 Auto
Scene Property BaboLoanSharksScene02 Auto
Scene Property BaboLoanSharksScene03 Auto
Scene Property BaboLoanSharksScene04 Auto
Scene Property BaboLoanSharksBrothelIntroductionScene Auto
Scene Property BaboLoanSharksProstitute01Scene Auto
Scene Property BaboLoanSharksProstitute02Scene Auto

Bool Function EventLoanSharkScenePlay(int i, bool bplay)
	if bplay
		if i == 1
			SelectedEventScene = BaboLoanSharksScene01
		elseif i == 2
			SelectedEventScene = BaboLoanSharksScene02
		elseif i == 3
			SelectedEventScene = BaboLoanSharksScene03
		elseif i == 4
			SelectedEventScene = BaboLoanSharksScene04
		elseif i == 5
			SelectedEventScene = BaboLoanSharksBrothelIntroductionScene
		elseif i == 6
			SelectedEventScene = BaboLoanSharksProstitute01Scene
		elseif i == 7
			SelectedEventScene = BaboLoanSharksProstitute02Scene
		else
			return false
		endif
		SelectedEventScene.forcestart()
		Utility.wait(1.0)
		if SelectedEventScene.IsPlaying()
			return true
		else
			return false
		endif
	else
		SelectedEventScene.stop()
	endif
	return false
EndFunction


Scene Property BaboEventAnimalCareSceneHorse01 Auto

Bool Function EventAnimalCareWhiterunScenePlay(int i, bool bplay)
	if bplay
		if i == 1
			SelectedScene = BaboEventAnimalCareSceneHorse01
		else
			return false
		endif
		SelectedScene.forcestart()
		Utility.wait(1.0)
		if SelectedScene.IsPlaying()
			return true
		else
			return false
		endif
	else
		SelectedScene.stop()
	endif
	return false
EndFunction

Scene Property BaboEventAnimalCareMarkarthSceneStart Auto
Scene Property BaboEventAnimalCareMarkarthScene01 Auto
Scene Property BaboEventAnimalCareMarkarthScene02 Auto
Scene Property BaboEventAnimalCareMarkarthScene03 Auto
Scene Property BaboEventAnimalCareMarkarthScene04 Auto
Scene Property BaboEventAnimalCareMarkarthScene05 Auto
Scene Property BaboEventAnimalCareMarkarthScene06 Auto
Scene Property BaboEventAnimalCareMarkarthScene07 Auto

Bool Function EventAnimalCareMarkarthScenePlay(int i, bool bplay)
	if bplay
		if i == 1
			SelectedScene = BaboEventAnimalCareMarkarthScene01
		elseif i == 2
			SelectedScene = BaboEventAnimalCareMarkarthScene02
		elseif i == 3
			SelectedScene = BaboEventAnimalCareMarkarthScene03
		elseif i == 4
			SelectedScene = BaboEventAnimalCareMarkarthScene04
		elseif i == 5
			SelectedScene = BaboEventAnimalCareMarkarthScene05
		elseif i == 6
			SelectedScene = BaboEventAnimalCareMarkarthScene06
		elseif i == 7
			SelectedScene = BaboEventAnimalCareMarkarthScene07
		elseif i == 8
			SelectedScene = BaboEventAnimalCareMarkarthSceneStart
		else
			return false
		endif
		SelectedScene.forcestart()
		Utility.wait(1.0)
		if SelectedScene.IsPlaying()
			return true
		else
			return false
		endif
	else
		SelectedScene.stop()
	endif
	return false
EndFunction

Scene property BaboEventWindhelmNewgnisisScene01 auto
Scene property BaboEventWindhelmNewgnisisScene02 auto
Scene property BaboEventWindhelmNewgnisisScene03 auto
Scene property BaboEventWindhelmNewgnisisScene04 auto
Scene property BaboEventWindhelmNewgnisisScene05 auto
Scene property BaboEventWindhelmNewgnisisScene06 auto
Scene property BaboEventWindhelmNewgnisisScene07 auto
Scene property BaboEventWindhelmNewgnisisScene08 auto
Scene property BaboEventWindhelmNewgnisisScene09 auto
Scene property BaboEventWindhelmNewgnisisSceneDrink auto
Scene property BaboEventWindhelmNewgnisisSceneExtra auto


Bool Function EventWindhelmNewgnisisScenePlay(int i, bool bplay)
	if bplay
		if i == 1
			SelectedScene = BaboEventWindhelmNewgnisisScene01;20
		elseif i == 2
			SelectedScene = BaboEventWindhelmNewgnisisScene02;50
		elseif i == 3
			SelectedScene = BaboEventWindhelmNewgnisisScene03;60 or 85
		elseif i == 4
			SelectedScene = BaboEventWindhelmNewgnisisScene04
		elseif i == 5
			SelectedScene = BaboEventWindhelmNewgnisisScene05
		elseif i == 6
			SelectedScene = BaboEventWindhelmNewgnisisScene06
		elseif i == 7
			SelectedScene = BaboEventWindhelmNewgnisisScene07
		elseif i == 8
			SelectedScene = BaboEventWindhelmNewgnisisScene08
		elseif i == 9
			SelectedScene = BaboEventWindhelmNewgnisisScene09;92
		elseif i == 10
			SelectedScene = BaboEventWindhelmNewgnisisSceneDrink;41 - 50 - 105
		elseif i == 11
			SelectedScene = BaboEventWindhelmNewgnisisSceneExtra;92
		else
			return false
		endif
		SelectedScene.forcestart()
		Utility.wait(1.0)
		if SelectedScene.IsPlaying()
			return true
		else
			return false
		endif
	else
		SelectedScene.stop()
	endif
	return false
EndFunction


Scene Property BaboEventRieklingThirskSceneGateKeeper Auto
Scene Property BaboEventRieklingThirskMinionSceneA Auto
Scene Property BaboEventRieklingEscapeFailScene Auto
Scene Property BaboEventRieklingThirskSceneSex Auto
Scene property BaboEventRieklingKneelBeforeScene auto
Scene property BaboEventRieklingThirskSpottedScene auto
Scene Property BaboEventRieklingThirskEndScene Auto
Scene Property BaboEventRieklingThirskEndRescueScene Auto
Scene Property BaboEventRieklingRRGuardSCene Auto

Scene property BaboEventRieklingThirskScene01 auto
Scene property BaboEventRieklingThirskScene02 auto
Scene property BaboEventRieklingThirskScene03 auto
Scene Property BaboEventRieklingThirskStartQuestScene Auto
Scene Property BaboEventRieklingThirskDuelScene Auto
Scene Property BaboEventRieklingThirskSoloScene Auto
Scene Property BaboEventRieklingThirskSurrenderScene Auto

;(BaboSceneController as BaboSceneManager).
Bool Function EventRieklingThirskScenePlay(int i, bool bplay)
	if bplay
		if i == 1
			SelectedScene = BaboEventRieklingThirskScene01
		elseif i == 2
			SelectedScene = BaboEventRieklingThirskScene02
		elseif i == 3
			SelectedScene = BaboEventRieklingThirskScene03
		elseif i == 4
			SelectedScene = BaboEventRieklingKneelBeforeScene
		elseif i == 5
			SelectedScene = BaboEventRieklingThirskSpottedScene
		elseif i == 6
			SelectedScene = BaboEventRieklingThirskSceneGateKeeper
		elseif i == 7
			SelectedScene = BaboEventRieklingThirskMinionSceneA
		elseif i == 8
			SelectedScene = BaboEventRieklingEscapeFailScene
		elseif i == 9
			SelectedScene = BaboEventRieklingThirskSceneSex
		elseif i == 10
			SelectedScene = BaboEventRieklingThirskEndScene
		elseif i == 11
			SelectedScene = BaboEventRieklingThirskEndRescueScene
		elseif i == 12
			SelectedScene = BaboEventRieklingRRGuardSCene
		else
			SelectedScene = BaboEventRieklingThirskStartQuestScene
		endif
		SelectedScene.forcestart()
		Utility.wait(1.0)
		if SelectedScene.IsPlaying()
			return true
		else
			return false
		endif
	else
		SelectedScene.stop()
	endif
	return false
EndFunction

;/ Function ScenePlay(int inum) /;
	;/ if inum == 1 /;
		;/ BaboEventRieklingThirskDuelScene.forcestart() /;
	;/ elseif inum == 2 /;
		;/ BaboEventRieklingThirskSoloScene.forcestart() /;
	;/ elseif inum == 3 /;
		;/ BaboEventRieklingThirskSurrenderScene.forcestart() /;
	;/ else /;
		;/ BaboEventRieklingThirskStartQuestScene.forcestart() /;
	;/ endif /;
;/ EndFunction /;

Bool Function EventRieklingThirskDulScenePlay(int i, bool bplay)
	if bplay
		if i == 1
			SelectedScene = BaboEventRieklingThirskStartQuestScene
		elseif i == 2
			SelectedScene = BaboEventRieklingThirskDuelScene
		elseif i == 3
			SelectedScene = BaboEventRieklingThirskSoloScene
		elseif i == 4
			SelectedScene = BaboEventRieklingThirskSurrenderScene			
		endif
		SelectedScene.forcestart()
		Utility.wait(1.0)
		if SelectedScene.IsPlaying()
			return true
		else
			return false
		endif
	else
		SelectedScene.stop()
	endif
	return false
EndFunction

Scene Property BaboEncounter01Scene01 Auto
Scene Property BaboEncounter01Scene02 Auto
Scene Property BaboEncounter01Scene03 Auto
Scene Property BaboEncounter01Scene04 Auto
Scene Property BaboEncounter01Scene05 Auto

Bool Function Encounter01ScenePlay(int i, bool bplay)
	if bplay
		if i == 1
			SelectedScene = BaboEncounter01Scene01;Null
		elseif i == 2
			SelectedScene = BaboEncounter01Scene02;Stage 65
		elseif i == 3
			SelectedScene = BaboEncounter01Scene03;Stage 37
		elseif i == 4
			SelectedScene = BaboEncounter01Scene04;Stage 40
		elseif i == 5
			SelectedScene = BaboEncounter01Scene05;Stage 80
		else
			return false
		endif
		SelectedScene.forcestart()
		Utility.wait(1.0)
		if SelectedScene.IsPlaying()
			return true
		else
			return false
		endif
	else
		SelectedScene.stop();Stage 70 90 91 100
	endif
	return false
EndFunction


Scene Property BaboEncounter02Scene01 Auto
Scene Property BaboEncounter02Scene02 Auto
Scene Property BaboEncounter02SceneSLHH Auto
Scene Property BaboEncounter02SceneSLHHEnd Auto

Bool Function Encounter02ScenePlay(int i, bool bplay)
	if bplay
		if i == 1
			SelectedScene = BaboEncounter02Scene01;Stage 10 11
		elseif i == 2
			SelectedScene = BaboEncounter02Scene02;Stage 21
		elseif i == 3
			SelectedScene = BaboEncounter02SceneSLHH;Stage 7
		elseif i == 4
			SelectedScene = BaboEncounter02SceneSLHHEnd;Stage 8
		else
			return false
		endif
		SelectedScene.forcestart()
		Utility.wait(1.0)
		if SelectedScene.IsPlaying()
			return true
		else
			return false
		endif
	else
		SelectedScene.stop();Stage 
	endif
	return false
EndFunction

Scene Property BaboEncounter03Scene01 Auto
Scene Property BaboEncounter03Scene02 Auto
Scene Property BaboEncounter03Scene03 Auto

Bool Function Encounter03ScenePlay(int i, bool bplay)
	if bplay
		if i == 1
			SelectedScene = BaboEncounter03Scene01
		elseif i == 2
			SelectedScene = BaboEncounter03Scene02;Goes to 20
		elseif i == 3
			SelectedScene = BaboEncounter03Scene03;Stage 15
		else
			return false
		endif
		SelectedScene.forcestart()
		Utility.wait(1.0)
		if SelectedScene.IsPlaying()
			return true
		else
			return false
		endif
	else
		SelectedScene.stop();Stage 
	endif
	return false
EndFunction

Scene Property BaboEncounter04Scene01 Auto
Scene Property BaboEncounter04Scene02 Auto
Scene Property BaboEncounter04Scene03 Auto

Bool Function Encounter04ScenePlay(int i, bool bplay)
	if bplay
		if i == 1
			SelectedScene = BaboEncounter04Scene01
		elseif i == 2
			SelectedScene = BaboEncounter04Scene02
		elseif i == 3
			SelectedScene = BaboEncounter04Scene03
		else
			return false
		endif
		SelectedScene.forcestart()
		Utility.wait(1.0)
		if SelectedScene.IsPlaying()
			return true
		else
			return false
		endif
	else
		SelectedScene.stop();Stage 
	endif
	return false
EndFunction

Scene Property BaboEncounter05Scene01 Auto
Scene Property BaboEncounter05Scene02 Auto

Bool Function Encounter05ScenePlay(int i, bool bplay)
	if bplay
		if i == 1
			SelectedScene = BaboEncounter05Scene01
		elseif i == 2
			SelectedScene = BaboEncounter05Scene01
		else
			return false
		endif
		SelectedScene.forcestart()
		Utility.wait(1.0)
		if SelectedScene.IsPlaying()
			return true
		else
			return false
		endif
	else
		SelectedScene.stop();Stage 
	endif
	return false
EndFunction

Scene Property BaboEncounter06Scene01 Auto ; Unused
Scene Property BaboEncounter06Scene02 Auto
Scene Property BaboEncounter06Scene03 Auto
Scene Property BaboEncounter06LOSScene Auto
Scene Property BaboEncounter06SubmitKneelScene Auto
Scene Property BaboEncounter06SubmitScene Auto
Scene Property BaboEncounter06SexInterludeScene Auto
Scene Property BaboEncounter06SexInterlude02Scene Auto
Scene Property BaboEncounter06SexInterlude03Scene Auto
Scene Property BaboEncounter06SexInterlude03BScene Auto
Scene Property BaboEncounter06SexAfterScene Auto
Scene Property BaboEncounter06SexAfterResistScene Auto
Scene Property BaboEncounter06SexAfterFaintScene Auto
Scene Property BaboEncounter06DefeatedScene Auto
Scene Property BaboEncounter06VictoryScene Auto
Scene Property BaboEncounter06KillScene Auto

Bool Function Encounter06ScenePlay(int i, bool bplay)
	if bplay
		if i == 1
			SelectedScene = BaboEncounter06LOSScene
		elseif i == 2
			SelectedScene = BaboEncounter06Scene02
		elseif i == 3
			SelectedScene = BaboEncounter06Scene03
		elseif i == 4
			SelectedScene = BaboEncounter06SubmitKneelScene
		elseif i == 5
			SelectedScene = BaboEncounter06SubmitScene
		elseif i == 6
			SelectedScene = BaboEncounter06SexInterludeScene
		elseif i == 7
			SelectedScene = BaboEncounter06SexInterlude02Scene
		elseif i == 8
			SelectedScene = BaboEncounter06SexInterlude03Scene
		elseif i == 9
			SelectedScene = BaboEncounter06SexInterlude03BScene
		elseif i == 10
			SelectedScene = BaboEncounter06SexAfterScene
		elseif i == 11
			SelectedScene = BaboEncounter06SexAfterResistScene
		elseif i == 12
			SelectedScene = BaboEncounter06SexAfterFaintScene
		elseif i == 13
			SelectedScene = BaboEncounter06DefeatedScene
		elseif i == 14
			SelectedScene = BaboEncounter06VictoryScene
		elseif i == 15
			SelectedScene = BaboEncounter06KillScene
		else
			return false
		endif
		SelectedScene.forcestart()
		Utility.wait(1.0)
		if SelectedScene.IsPlaying()
			return true
		else
			return false
		endif
	else
		SelectedScene.stop();Stage 
	endif
	return false
EndFunction

Scene Property BaboEncounter06BFirstMeetWarningScene Auto
Scene Property BaboEncounter06BNoCoinScene Auto
Scene Property BaboEncounter06BConfiscateScene Auto
Scene Property BaboEncounter06BSLHHEscape Auto
Scene Property BaboEncounter06BSLHHEscapeFail Auto
Scene Property BaboEncounter06BSLHHFailAfterStrip Auto
Scene Property BaboEncounter06BCombatDefeated Auto
Scene Property BaboEncounter06BCombatDefeatedNormal Auto
Scene Property BaboEncounter06BCombatSurrender Auto
Scene Property BaboEncounter06BSettleResultScene Auto
Scene Property BaboEncounter06BDogejaScene Auto
Scene Property BaboEncounter06BAfterSexBadEndScene Auto
Scene Property BaboEncounter06BCombatVictory Auto
Scene Property BaboEncounter06BKillCrew Auto

Bool Function Encounter06BScenePlay(int i, bool bplay)
	if bplay
		if i == 1
			SelectedScene = BaboEncounter06BFirstMeetWarningScene
		elseif i == 2
			SelectedScene = BaboEncounter06BNoCoinScene
		elseif i == 3
			SelectedScene = BaboEncounter06BConfiscateScene
		elseif i == 4
			SelectedScene = BaboEncounter06BSLHHEscape
		elseif i == 5
			SelectedScene = BaboEncounter06BSLHHEscapeFail
		elseif i == 6
			SelectedScene = BaboEncounter06BSLHHFailAfterStrip
		elseif i == 7
			SelectedScene = BaboEncounter06BCombatDefeated
		elseif i == 8
			SelectedScene = BaboEncounter06BCombatDefeatedNormal
		elseif i == 9
			SelectedScene = BaboEncounter06BCombatSurrender
		elseif i == 10
			SelectedScene = BaboEncounter06BSettleResultScene
		elseif i == 11
			SelectedScene = BaboEncounter06BDogejaScene
		elseif i == 12
			SelectedScene = BaboEncounter06BAfterSexBadEndScene
		elseif i == 13
			SelectedScene = BaboEncounter06BCombatVictory
		elseif i == 14
			SelectedScene = BaboEncounter06BKillCrew
		else
			return false
		endif
		SelectedScene.forcestart()
		Utility.wait(1.0)
		if SelectedScene.IsPlaying()
			return true
		else
			return false
		endif
	else
		SelectedScene.stop();Stage 
	endif
	return false
EndFunction



Scene Property BaboEncounter07Scene01 Auto
Scene Property BaboEncounter07Scene02 Auto
Scene Property BaboEncounter07Scene03 Auto
Scene Property BaboEncounter07Scene04 Auto
Scene Property BaboEncounter07Scene05 Auto

Bool Function Encounter07ScenePlay(int i, bool bplay)
	if bplay
		if i == 1
			SelectedScene = BaboEncounter07Scene01
		elseif i == 2
			SelectedScene = BaboEncounter07Scene02
		elseif i == 3
			SelectedScene = BaboEncounter07Scene03
		elseif i == 4
			SelectedScene = BaboEncounter07Scene04
		elseif i == 5
			SelectedScene = BaboEncounter07Scene05
		else
			return false
		endif
		SelectedScene.forcestart()
		Utility.wait(1.0)
		if SelectedScene.IsPlaying()
			return true
		else
			return false
		endif
	else
		SelectedScene.stop();Stage 
	endif
	return false
EndFunction

Scene Property BaboEncounter08Scene01 Auto
Scene Property BaboEncounter08Scene02 Auto

Bool Function Encounter08ScenePlay(int i, bool bplay)
	if bplay
		if i == 1
			SelectedScene = BaboEncounter08Scene01;It goes to 30
		elseif i == 2
			SelectedScene = BaboEncounter08Scene02
		else
			return false
		endif
		SelectedScene.forcestart()
		Utility.wait(1.0)
		if SelectedScene.IsPlaying()
			return true
		else
			return false
		endif
	else
		SelectedScene.stop();Stage 
	endif
	return false
EndFunction

Scene Property BaboEncounter09Scene01 Auto
Scene Property BaboEncounter09Scene02 Auto

Bool Function Encounter09ScenePlay(int i, bool bplay)
	if bplay
		if i == 1
			SelectedScene = BaboEncounter09Scene01
		elseif i == 2
			SelectedScene = BaboEncounter09Scene02
		else
			return false
		endif
		SelectedScene.forcestart()
		Utility.wait(1.0)
		if SelectedScene.IsPlaying()
			return true
		else
			return false
		endif
	else
		SelectedScene.stop();Stage 
	endif
	return false
EndFunction

Scene Property BaboEncounter10Scene01 Auto
Scene Property BaboEncounter10Scene02 Auto

Bool Function Encounter10ScenePlay(int i, bool bplay)
	if bplay
		if i == 1
			SelectedScene = BaboEncounter10Scene01
		elseif i == 2
			SelectedScene = BaboEncounter10Scene02
		else
			return false
		endif
		SelectedScene.forcestart()
		Utility.wait(1.0)
		if SelectedScene.IsPlaying()
			return true
		else
			return false
		endif
	else
		SelectedScene.stop();Stage 
	endif
	return false
EndFunction

Scene Property BaboEncounter11Scene01 Auto
Scene Property BaboEncounter11Scene02 Auto
Scene Property BaboEncounter11Scene03 Auto
Scene Property BaboEncounter11Scene04 Auto

Bool Function Encounter11ScenePlay(int i, bool bplay)
	if bplay
		if i == 1
			SelectedScene = BaboEncounter11Scene01
		elseif i == 2
			SelectedScene = BaboEncounter11Scene02
		elseif i == 3
			SelectedScene = BaboEncounter11Scene03
		elseif i == 4
			SelectedScene = BaboEncounter11Scene04
		else
			return false
		endif
		SelectedScene.forcestart()
		Utility.wait(1.0)
		if SelectedScene.IsPlaying()
			return true
		else
			return false
		endif
	else
		SelectedScene.stop();Stage 
	endif
	return false
EndFunction

Scene Property BaboEncounter12Scene01 Auto
Scene Property BaboEncounter12Scene02 Auto
Scene Property BaboEncounter12Scene03 Auto

Bool Function Encounter12ScenePlay(int i, bool bplay)
	if bplay
		if i == 1
			SelectedScene = BaboEncounter12Scene01
		elseif i == 2
			SelectedScene = BaboEncounter12Scene02
		elseif i == 3
			SelectedScene = BaboEncounter12Scene03
		else
			return false
		endif
		SelectedScene.forcestart()
		Utility.wait(1.0)
		if SelectedScene.IsPlaying()
			return true
		else
			return false
		endif
	else
		SelectedScene.stop();Stage 
	endif
	return false
EndFunction

Scene Property BaboEncounter13SceneAfterSex Auto
Scene Property BaboEncounter13SceneStart Auto
Scene Property BaboEncounter13SceneBeforeFight Auto
Scene Property BaboEncounter13SceneIgnore Auto
Scene Property BaboEncounter13SceneNoFight Auto
Scene Property BaboEncounter13PayDebt Auto
Scene Property BaboEncounter13SceneDefeated Auto

Bool Function Encounter13ScenePlay(int i, bool bplay)
	if bplay
		if i == 1
			SelectedScene = BaboEncounter13SceneStart
		elseif i == 2
			SelectedScene = BaboEncounter13SceneBeforeFight
		elseif i == 3
			SelectedScene = BaboEncounter13SceneIgnore
		elseif i == 4
			SelectedScene = BaboEncounter13SceneNoFight
		elseif i == 5
			SelectedScene = BaboEncounter13PayDebt
		elseif i == 6
			SelectedScene = BaboEncounter13SceneDefeated
		elseif i == 7
			SelectedScene = BaboEncounter13SceneAfterSex;155
		else
			return false
		endif
		SelectedScene.forcestart()
		Utility.wait(1.0)
		if SelectedScene.IsPlaying()
			return true
		else
			return false
		endif
	else
		SelectedScene.stop();Stage 
	endif
	return false
EndFunction

Scene Property BaboChangeLocationEvent01Scene01 Auto
Scene Property BaboChangeLocationEvent01Scene02 Auto
Scene Property BaboChangeLocationEvent01Scene03 Auto
Scene Property BaboChangeLocationEvent01Scene04 Auto
Scene Property BaboChangeLocationEvent01Scene05 Auto
Scene Property BaboChangeLocationEvent01Scene06 Auto

Bool Function BCLEvent01ScenePlay(int i, bool bplay)
	if bplay
		if i == 1
			SelectedScene = BaboChangeLocationEvent01Scene01
		elseif i == 2
			SelectedScene = BaboChangeLocationEvent01Scene02
		elseif i == 3
			SelectedScene = BaboChangeLocationEvent01Scene03
		elseif i == 4
			SelectedScene = BaboChangeLocationEvent01Scene04
		elseif i == 5
			SelectedScene = BaboChangeLocationEvent01Scene05
		elseif i == 6
			SelectedScene = BaboChangeLocationEvent01Scene06
		else
			return false
		endif
		SelectedScene.forcestart()
		Utility.wait(1.0)
		if SelectedScene.IsPlaying()
			return true
		else
			return false
		endif
	else
		SelectedScene.stop();Stage 
	endif
	return false
EndFunction

Scene Property BaboChangeLocationEvent03Scene01 Auto
Scene Property BaboChangeLocationEvent03Scene02 Auto
Scene Property BaboChangeLocationEvent03Scene03 Auto
Scene Property BaboChangeLocationEvent03Scene04 Auto
Scene Property BaboChangeLocationEvent03Scene04s Auto
Scene Property BaboChangeLocationEvent03Scene05 Auto


Bool Function BCLEvent03ScenePlay(int i, bool bplay)
	if bplay
		if i == 1
			SelectedScene = BaboChangeLocationEvent03Scene01
		elseif i == 2
			SelectedScene = BaboChangeLocationEvent03Scene02
		elseif i == 3
			SelectedScene = BaboChangeLocationEvent03Scene03
		elseif i == 4
			SelectedScene = BaboChangeLocationEvent03Scene04
		elseif i == 5
			SelectedScene = BaboChangeLocationEvent03Scene05
		elseif i == 6
			SelectedScene = BaboChangeLocationEvent03Scene04s
		else
			return false
		endif
		SelectedScene.forcestart()
		Utility.wait(1.0)
		if SelectedScene.IsPlaying()
			return true
		else
			return false
		endif
	else
		SelectedScene.stop();Stage 
	endif
	return false
EndFunction

Scene Property BaboChangeLocationEvent05Scene02 Auto
Scene Property BaboChangeLocationEvent05Scene03 Auto
Scene Property BaboChangeLocationEvent05Scene04 Auto

Bool Function BCLEvent05ScenePlay(int i, bool bplay)
	if bplay
		if i == 2
			SelectedScene = BaboChangeLocationEvent05Scene02
		elseif i == 3
			SelectedScene = BaboChangeLocationEvent05Scene03
		elseif i == 4
			SelectedScene = BaboChangeLocationEvent05Scene04
		else
			return false
		endif
		SelectedScene.forcestart()
		Utility.wait(1.0)
		if SelectedScene.IsPlaying()
			return true
		else
			return false
		endif
	else
		SelectedScene.stop();Stage 
	endif
	return false
EndFunction

Scene Property BaboChangeLocationEvent06Scene01 Auto
Scene Property BaboChangeLocationEvent06Scene02 Auto
Scene Property BaboChangeLocationEvent06Scene03 Auto
Scene Property BaboChangeLocationEvent06Scene04 Auto
Scene Property BaboChangeLocationEvent06Scene05 Auto
Scene Property BaboChangeLocationEvent06Scene06 Auto

Bool Function BCLEvent06ScenePlay(int i, bool bplay)
	if bplay
		if i == 1
			SelectedScene = BaboChangeLocationEvent06Scene01
		elseif i == 2
			SelectedScene = BaboChangeLocationEvent06Scene02
		elseif i == 3
			SelectedScene = BaboChangeLocationEvent06Scene03
		elseif i == 4
			SelectedScene = BaboChangeLocationEvent06Scene04
		elseif i == 4
			SelectedScene = BaboChangeLocationEvent06Scene05
		elseif i == 4
			SelectedScene = BaboChangeLocationEvent06Scene06
		else
			return false
		endif
		SelectedScene.forcestart()
		Utility.wait(1.0)
		if SelectedScene.IsPlaying()
			return true
		else
			return false
		endif
	else
		SelectedScene.stop();Stage 
	endif
	return false
EndFunction

Scene Property BaboChangeLocationEvent07Scene00 Auto
Scene Property BaboChangeLocationEvent07SceneWellRested Auto
Scene Property BaboChangeLocationEvent07Scene02 Auto
Scene Property BaboChangeLocationEvent07Scene03 Auto
Scene Property BaboChangeLocationEvent07Scene04 Auto
Scene Property BaboChangeLocationEvent07Scene05 Auto
Scene Property BaboChangeLocationEvent07Scene06 Auto

Bool Function BCLEvent07ScenePlay(int i, bool bplay)
	if bplay
		if i == 1
			SelectedScene = BaboChangeLocationEvent07Scene00
		elseif i == 2
			SelectedScene = BaboChangeLocationEvent07Scene02
		elseif i == 3
			SelectedScene = BaboChangeLocationEvent07Scene03
		elseif i == 4
			SelectedScene = BaboChangeLocationEvent07Scene04
		elseif i == 5
			SelectedScene = BaboChangeLocationEvent07Scene05
		elseif i == 6
			SelectedScene = BaboChangeLocationEvent07Scene06
		elseif i == 7
			SelectedScene = BaboChangeLocationEvent07SceneWellRested
		else
			return false
		endif
		SelectedScene.forcestart()
		Utility.wait(1.0)
		if SelectedScene.IsPlaying()
			return true
		else
			return false
		endif
	else
		SelectedScene.stop();Stage 
	endif
	return false
EndFunction

Scene Property BaboChangeLocationEvent08AutographScene01 Auto
Scene Property BaboChangeLocationEvent08AutographScene02 Auto
Scene Property BaboChangeLocationEvent08AutographScene03 Auto
Scene Property BaboChangeLocationEvent08AutographScene04 Auto
Scene Property BaboChangeLocationEvent08AutographScene05 Auto
Scene Property BaboChangeLocationEvent08AutographScene06 Auto
Scene Property BaboChangeLocationEvent08AutographScene07 Auto


Bool Function BCLEvent08ScenePlay(int i, bool bplay)
	if bplay
		if i == 1
			SelectedScene = BaboChangeLocationEvent08AutographScene01
		elseif i == 2
			SelectedScene = BaboChangeLocationEvent08AutographScene02
		elseif i == 3
			SelectedScene = BaboChangeLocationEvent08AutographScene03
		elseif i == 4
			SelectedScene = BaboChangeLocationEvent08AutographScene04
		elseif i == 5
			SelectedScene = BaboChangeLocationEvent08AutographScene05
		elseif i == 6
			SelectedScene = BaboChangeLocationEvent08AutographScene06
		elseif i == 7
			SelectedScene = BaboChangeLocationEvent08AutographScene07
		else
			return false
		endif
		SelectedScene.forcestart()
		Utility.wait(1.0)
		if SelectedScene.IsPlaying()
			return true
		else
			return false
		endif
	else
		SelectedScene.stop();Stage 
	endif
	return false
EndFunction

Scene Property BaboChangeLocationEvent10Scene01 Auto
Scene Property BaboChangeLocationEvent10Scene02 Auto

Bool Function BCLEvent10ScenePlay(int i, bool bplay)
	if bplay
		if i == 1
			SelectedScene = BaboChangeLocationEvent10Scene01
		elseif i == 2
			SelectedScene = BaboChangeLocationEvent10Scene02
		else
			return false
		endif
		SelectedScene.forcestart()
		Utility.wait(1.0)
		if SelectedScene.IsPlaying()
			return true
		else
			return false
		endif
	else
		SelectedScene.stop() 
	endif
	return false
EndFunction