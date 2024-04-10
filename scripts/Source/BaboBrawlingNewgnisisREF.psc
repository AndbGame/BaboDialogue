Scriptname BaboBrawlingNewgnisisREF extends ReferenceAlias  

Event OnDeath(Actor akKiller)
	If DeathSwitch
;		BaboQuest.DeathCount()
		BSCM.CorruptionExpLoss(1.0)
		BSCM.TraumaExpLoss(1.0)
	EndIf
EndEvent

Bool Property DeathSwitch  = false Auto
BaboSexControllerManager Property BSCM Auto