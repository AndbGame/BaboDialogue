Scriptname BaboBrawlingNewgnisisREF extends ReferenceAlias  

Event oninit()
	PO3_Events_Alias.RegisterForHitEventEx(self, OpponentAlias.getreference(), None, None, -1, -1, -1, -1, true)
EndEvent

;###############LE#################
;Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
;###############LE#################

;###############SE#################
Event OnHitEx(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
;###############SE#################
	if Self.GetOwningQuest().GetStage() < Requiredstage
		Self.GetOwningQuest().SetStage(NextStage)
	endif
EndEvent

Event OnDeath(Actor akKiller)
	If DeathSwitch
		EventQuest.DeathCount()
		BSCM.CorruptionExpLoss(1.0)
		BSCM.TraumaExpLoss(1.0)
	EndIf
EndEvent

Function RegisterOnHitExExtra(form akfilter)
	PO3_Events_Alias.RegisterForHitEventEx(self, akfilter, None, None, -1, -1, -1, -1, true)
EndFunction

Function UnRegisterOnHitExExtra()
	PO3_Events_Alias.UnregisterForAllHitEventsEx(self)
EndFunction

Bool Property DeathSwitch  = false Auto
BaboSexControllerManager Property BSCM Auto
BaboEventNewgnisisMasterScript Property EventQuest Auto
ReferenceAlias Property OpponentAlias Auto
int Property Requiredstage = 40 Auto
int Property Nextstage = 40 Auto