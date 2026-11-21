Scriptname BaboEventNPCDeath_RieklingDuel extends ReferenceAlias  

Bool Property HitState = true Auto
Actor Property PlayerRef Auto
int Property HitStateStage = 10 Auto Hidden
int Property HitStateNextStage = 80 Auto Hidden
int Property SoloFightStage = 45 Auto Hidden

Event OnLoad()
	if HitState
		GotoState("OnHitStage")
	endif
EndEvent

;LE
;Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack,  bool abBashAttack, bool abHitBlocked)
;EndEvent

;SE
Event OnHitEx(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
EndEvent

Event Ondeath(Actor akKiller)
	if Getowningquest().getstage() == SoloFightStage
		(Getowningquest() as BaboEventRieklingDuelScript).CountDeath()
	endif
EndEvent

State OnHitStage

Event Onbeginstate()
	PO3_Events_Alias.RegisterForHitEventEx(self, PlayerRef, None, None, -1, -1, -1, -1, true)
EndEvent

;Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack,  bool abBashAttack, bool abHitBlocked)
Event OnHitEx(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	;if akAggressor as actor == PlayerRef && Getowningquest().getstage() <= HitStateStage;LE
	if Getowningquest().getstage() <= HitStateStage
		GotoState("")
		Getowningquest().setstage(HitStateNextStage)
		PO3_Events_Alias.UnregisterForAllHitEventsEx(self)
	endif
EndEvent
EndState