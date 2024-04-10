Scriptname BaboEventBossDeath extends ReferenceAlias  
{ReferenceAlias}

;float Property StageValue01 = 0.0 Auto
int property StageValue01 auto
int property StageValue02 auto
int property StageValue03 auto
int property StageCompleteValue01 auto
int property StageCompleteValue02 auto
int property StageCompleteValue03 auto


Event OnDeath(Actor akKiller)
	If GetOwningQuest().GetStage() <= StageValue01
		Self.GetOwningQuest().SetStage(StageCompleteValue01)
	Elseif GetOwningQuest().GetStage() == StageValue02
		Self.GetOwningQuest().SetStage(StageCompleteValue02)
	Elseif GetOwningQuest().GetStage() >= StageValue03
		Self.GetOwningQuest().SetStage(StageCompleteValue03)
	EndIf
EndEvent
