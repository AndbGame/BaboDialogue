Scriptname BaboSlaveRescueScript extends Quest  

Event OnInit()
	RegisterEvent()
EndEvent

Function RegisterEvent()
	RegisterForModEvent("OnPlusRescueCount", "PlusRescueCountEvent")
	RegisterForModEvent("OnMinusRescueCountEvent", "MinusRescueCountEvent")
	Debug.Trace("RescueCount Event Registered")
EndFunction

Event PlusRescueCountEvent()
	PlusRescueCount(1)
EndEvent

Event MinusRescueCountEvent()
	MinusRescueCount(1)
EndEvent

Function MinusRescueCount(int num)
	BRMQuest.DecreaseReputation(num*10 as int, num*5 as int)
EndFunction

Function PlusRescueCount(int num)
BRMQuest.IncreaseReputation(num*5 as int, num*3 as int)
RescueCount.SetValue(RescueCount.GetValue() + num as int)
		;Debug.notification(RescueCount.GetValue() + num as int + "Current Rescue Number")
RescueCountStore.SetValue(RescueCountStore.GetValue() + num as int)
	If RescueCount.GetValue() == RescueNum && BaboSlaveScript.getstage() == CurrentStage
		Setstage(NextStage)
		RescueCount.SetValue(RescueCount.GetValue() - Rescuenum)
	EndIf
	;Debug.notification("RescueCount Function")
EndFunction

Function RandomQuestSetting()
	int random = Utility.RandomInt(0, 99)
	If Random < 33
		Setstage(20)
	ElseIf Random >= 33 && Random < 66
		Setstage(30)
	Else
		Setstage(40)
	EndIf
EndFunction

GlobalVariable Property RescueCount Auto
GlobalVariable Property RescueCountStore Auto
Int Property RescueNum Auto
Int Property CurrentStage Auto
Int Property NextStage Auto
Quest Property BaboSlaveScript Auto
BaboReputationMasterScript Property BRMQuest Auto