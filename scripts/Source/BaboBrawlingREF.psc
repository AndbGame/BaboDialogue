Scriptname BaboBrawlingREF extends ReferenceAlias  

Event Onint()
if SetEssentialNPC
	GetActorReference().GetActorBase().SetEssential(true)
endif

	;###############SE#################
	If OnHitSwitch
		PO3_Events_Alias.RegisterForHitEventEx(self, Game.getplayer(), None, None, -1, -1, -1, -1, true)
	endif
	;###############SE#################
EndEvent

;Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack,  bool abBashAttack, bool abHitBlocked);LE
Event OnHitEx(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
;If OnHitSwitch
	If GetOwningQuest().GetStage() < FirstStage
		GetOwningQuest().SetStage(FirstStage)
		PO3_Events_Alias.UnregisterForAllHitEventsEx(self)
	EndIf
;EndIf
EndEvent

Event OnEnterBleedout()
Deathcount = BaboQuest.DeathCountNum
DeathcountGoal = BaboQuest.DeathCountGoalNum
Faintcount = BaboQuest.FaintCountNum 
FaintcountGoal = BaboQuest.FaintCountGoalNum

	If BleedOutSwitch
		If GetOwningQuest().GetStage() == FirstStage
			; this actor just lost
			;GetActorReference().GetActorBase().SetEssential(true)
			Utility.wait(0.5)
			GetActorReference().SetUnconscious(true)
			GetActorReference().PushActorAway(GetActorReference(), 1)
			If FaintSwitch
				BaboQuest.FaintCount()
				;Debug.notification(BaboQuest.FaintCount() + "added")
			EndIF
		ElseIf GetOwningQuest().GetStage() != FirstStage || Deathcount == DeathCountGoal
			; this actor not just lost but die
			GetActorReference().SetUnconscious(false)
			GetActorReference().GetActorBase().SetEssential(false)
		EndIf
	EndIf
EndEvent

Event OnDeath(Actor akKiller)
	If DeathSwitch
		BaboQuest.DeathCount()
		BaboQuest.CorruptionExp(-0.8)
		BaboQuest.TraumaExp(-0.2)
	EndIf
EndEvent

Bool Property SetEssentialNPC  = false Auto
Bool Property OnHitSwitch  = false Auto
Bool Property DeathSwitch  = false Auto
Bool Property FaintSwitch  = false Auto
Bool Property BleedOutSwitch  = false Auto
Int DeathCount
Int FaintCount
Int Property FirstStage Auto
Int DeathCountGoal
Int FaintCountGoal
BaboDiaQuest Property BaboQuest  Auto