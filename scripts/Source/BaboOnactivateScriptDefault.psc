Scriptname BaboOnactivateScriptDefault extends referencealias


Event OnActivate(ObjectReference Victim)
	If Victim == Game.getplayer()
		If MQuest.getstage() == CurrentStage || MQuest.getstage() == CurrentStage02 || IgnoreStage == true
			Debug.Notification("Player retrieved her belongings")
			MQuest.setstage(NextStage)
			GotoState("FinishState")
		EndIf
	EndIf
EndEvent

State FinishState
	Event OnActivate(ObjectReference Victim)
	;Nothing
	EndEvent
EndState

Quest Property MQuest Auto
Int Property CurrentStage Auto
Int Property CurrentStage02 Auto
Int Property NextStage Auto
Bool Property IgnoreStage = false Auto