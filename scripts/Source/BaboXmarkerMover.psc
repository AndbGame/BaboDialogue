Scriptname BaboXmarkerMover extends ReferenceAlias  
{This script will move a xmarker to the player regularly.}

Actor Property PlayerRef  Auto  

Quest Property BaboKidnapEvent Auto
ReferenceAlias Property SoliloquyXmarker  Auto 
ReferenceAlias Property SoliloquyXmarkerAlt  Auto 
ReferenceAlias Property SoliloquyXmarkerAlt03  Auto 
BOOL playerCanSpeak = TRUE 
BOOL playerCanSpeakChangeLocation = TRUE 
Bool IsTalking
Bool IsFreeTalking

Scene Property BaboSoliloquyOnStartCommentScene  Auto  ;Self Comment
Scene Property BaboSoliloquyOnStartCommentScene02  Auto  ;Self Comment02
Scene Property BaboSoliloquyOnStartOnLocationChange  Auto  ;Self Comment when the location has changed
Scene Property BaboSoliloquyOnStartLoadScene  Auto  
Scene Property BaboSoliloquyOnStartMystatus  Auto  

GlobalVariable Property BaboSoliloquyUpdateIntervalMax Auto  ; These variables will set the random update interval
GlobalVariable Property BaboSoliloquyUpdateInterval  Auto  ; This is the interval for random soliloquy along the gameplay.
GlobalVariable Property BaboSoliloquyUpdateGameTimeInterval  Auto  ; This is the least interval for comment scenes.
GlobalVariable Property BaboSoliloquyOnStartGlobal  Auto 
GlobalVariable Property BaboSoliloquySelfCommentGlobal  Auto 
GlobalVariable Property BaboSoliloquyOnLocationChange  Auto 
GlobalVariable Property BaboSoliloquyOnStartKeyPress Auto 
GlobalVariable Property BaboSexlabStatusFHU Auto 
GlobalVariable Property BaboSoliloquyOnEndofBargain Auto 
GlobalVariable Property BaboSoliloquySelfFreeCommentGlobal Auto 

Function StopAllScenes()
	BaboSoliloquyOnStartCommentScene.stop()
	BaboSoliloquyOnStartCommentScene02.stop()
	BaboSoliloquyOnStartOnLocationChange.stop()
	BaboSoliloquyOnStartLoadScene.stop()
	BaboSoliloquyOnStartMystatus.stop()
EndFunction


EVENT onInit()
	RegisterForSingleUpdate(BaboSoliloquyUpdateInterval.getvalue())
	RegisterForUpdateGameTime(BaboSoliloquyUpdateGameTimeInterval.getvalue())
EndEvent

Event OnPlayerLoadGame()
	StopAllScenes()
	utility.wait(5)
	RegisterForSingleUpdate(BaboSoliloquyUpdateInterval.getvalue())
	RegisterForUpdateGameTime(BaboSoliloquyUpdateGameTimeInterval.getvalue())
	if BaboSoliloquyOnStartGlobal.getvalue() == 1
		SoliloquyXmarker.GetReference().MoveTo(PlayerRef)
		BaboSoliloquyOnStartLoadScene.forcestart()
	endif
endEvent

Event OnUpdateGameTime()
	playerCanSpeak = TRUE;Now I can speak!
	playerCanSpeakChangeLocation = True
	RegisterForSingleUpdateGameTime(BaboSoliloquyUpdateGameTimeInterval.getvalue())
endEvent

Event OnUpdate()
	if  (BaboSoliloquySelfCommentGlobal.getvalue() == 1) && (playerCanSpeak == True) && (IsTalking == false)
		SoliloquyXmarkerAlt.GetReference().MoveTo(PlayerRef)
		BaboSoliloquyOnStartCommentScene.forceStart()
		playerCanSpeak = FALSE
		IsTalking = true
	endif
	RegisterForSingleUpdate(utility.RandomFloat(BaboSoliloquyUpdateInterval.getvalue(), BaboSoliloquyUpdateIntervalMax.GetValue()))
endEvent

Function OnCellLoad()
	if (BaboSoliloquyOnLocationChange.getvalue() == 1) && (playerCanSpeakChangeLocation == True) && (IsTalking == false) && BaboKidnapEvent.isrunning() == false
		SoliloquyXmarkerAlt03.GetReference().MoveTo(PlayerRef)
		BaboSoliloquyOnStartOnLocationChange.forcestart()
		;playerCanSpeakChangeLocation = FALSE
		IsTalking = true
	endif
endfunction

Function playerCanSpeakChangeLocationSwitch()
	playerCanSpeakChangeLocation = FALSE
EndFunction

Function KeyPressSelfCommentary(int i)
if i == 0
	if BaboSexlabStatusFHU.getvalue() >= 1
		i = Utility.randomint(1,4)
	else
		i = Utility.randomint(2,4)
	endif
	
	BaboSoliloquyOnStartKeyPress.setvalue(i)
elseif i == 6
	int ir = Utility.randomint(0, 2)
	if BaboSexlabStatusFHU.getvalue() >= 1 && ir == 1
		i = 1
	elseif ir == 2
		i = 2
	endif
	BaboSoliloquyOnStartKeyPress.setvalue(i)
else
	BaboSoliloquyOnStartKeyPress.setvalue(i); 1FillHerUp / 2Corruption / 3Pervyact / 4Lewdness / 5Outfit
endif
	If (BaboSoliloquySelfFreeCommentGlobal.getvalue() == 1) && (IsFreeTalking== false)
		
		SoliloquyXmarker.GetReference().MoveTo(PlayerRef)
		BaboSoliloquyOnStartMystatus.forceStart()
		
		IsFreeTalking = true
	Endif
EndFunction

Function SelfCommentaryEndofEvents(int i)
BaboSoliloquyOnEndofBargain.setvalue(i)
;If (i == 1) && (IsTalking == false)
SoliloquyXmarkerAlt.GetReference().MoveTo(PlayerRef)
BaboSoliloquyOnStartCommentScene02.forceStart()
EndFunction

Function PlayerCanSpeakStatus(Bool i)
	playerCanSpeak = i
EndFunction

;Event OnCellLoad() ; Save it for another day.
;endEvent

Function EvaluateFreeTalkingStatus(Bool TalkingStatus)
	IsFreeTalking = TalkingStatus
EndFunction

Function EvaluateTalkingStatus(Bool TalkingStatus)
	IsTalking = TalkingStatus
EndFunction