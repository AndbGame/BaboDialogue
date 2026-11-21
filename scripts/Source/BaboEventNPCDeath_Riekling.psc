Scriptname BaboEventNPCDeath_Riekling extends ReferenceAlias  

BaboEventRiekling property BaboQuest Auto
Bool Property DeathSwitch = true Auto

Event OnDeath(Actor akKiller)
	If DeathSwitch
		BaboQuest.DeathCount()
	EndIf
EndEvent
