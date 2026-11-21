Scriptname BaboEventBossDeath_RieklingDuel extends ReferenceAlias  

int property InitialStage = 10 auto Hidden
int property RetreatBegin = 110 auto Hidden
int property ArenaFightBegin = 35 auto Hidden
int property ArenaFightSoloBegin = 45 auto Hidden
int property ArenaFightEnd = 130 auto Hidden

int property GroupFightBegin = 80 auto Hidden
int property GroupFightEnd = 150 auto Hidden


Event OnDeath(Actor akKiller)
	If GetOwningQuest().GetStage() <= InitialStage 
		Self.GetOwningQuest().SetStage(GroupFightEnd)
	;ElseIf GetOwningQuest().GetStage() == RetreatBegin
	;	Self.GetOwningQuest().SetStage(GroupFightEnd)
	Elseif GetOwningQuest().GetStage() == ArenaFightBegin || GetOwningQuest().GetStage() == ArenaFightSoloBegin
		(Getowningquest() as BaboEventRieklingDuelScript).CountDeath()
	Elseif GetOwningQuest().GetStage() >= GroupFightBegin && GetOwningQuest().GetStage() < GroupFightEnd
		Self.GetOwningQuest().SetStage(GroupFightEnd)
	EndIf
EndEvent