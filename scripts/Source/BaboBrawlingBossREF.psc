Scriptname BaboBrawlingBossREF extends ReferenceAlias  

Event OnDeath(Actor akKiller)
	If GetOwningQuest().GetStage() == StartStage || AutoSwitch == True
		Self.GetOwningQuest().SetStage(EndStage)
	EndIf
EndEvent
Int Property StartStage auto
Int Property EndStage auto
Bool Property AutoSwitch = False auto