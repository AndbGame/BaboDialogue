Scriptname BaboBrawlingWhiterunRef extends ReferenceAlias  


Event Onint()
; --- andb: ported from crajjjj stability patch 6.1.1.3 (BaboBrawlingWhiterunRef) guard alias before setup
if SetEssentialNPC
	Actor selfActorRef = GetActorReference()
	if selfActorRef != None
		selfActorRef.GetActorBase().SetEssential(true)
	endif
endif
EndEvent

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack,  bool abBashAttack, bool abHitBlocked)
If OnHitSwitch
	If GetOwningQuest().GetStage() < FirstStage
		GetOwningQuest().SetStage(FirstStage)
	EndIf
EndIf
EndEvent

Event OnEnterBleedout()
; --- andb: ported from crajjjj stability patch 6.1.1.3 (BaboBrawlingWhiterunRef) guard quest / alias before bleedout handling
	if BaboQuest == None
		return
	endif
Deathcount = BaboQuest.DeathCountNum
DeathcountGoal = BaboQuest.DeathCountGoalNum
Faintcount = BaboQuest.FaintCountNum
FaintcountGoal = BaboQuest.FaintCountGoalNum

	If BleedOutSwitch
		If GetOwningQuest().GetStage() == FirstStage
			; this actor just lost
			;GetActorReference().GetActorBase().SetEssential(true)
			Utility.wait(0.5)
			Actor selfActorRef = GetActorReference()
			if selfActorRef == None
				return
			endif
			selfActorRef.SetUnconscious(true)
			selfActorRef.PushActorAway(selfActorRef, 1)
			If FaintSwitch
				BaboQuest.FaintCount()
				;Debug.notification(BaboQuest.FaintCount() + "added")
			EndIF
		ElseIf GetOwningQuest().GetStage() != FirstStage || Deathcount == DeathCountGoal
			; this actor not just lost but die
			Actor selfActorRef = GetActorReference()
			if selfActorRef == None
				return
			endif
			selfActorRef.SetUnconscious(false)
			selfActorRef.GetActorBase().SetEssential(false)
		EndIf
	EndIf
EndEvent

Event OnDeath(Actor akKiller)
; --- andb: ported from crajjjj stability patch 6.1.1.3 (BaboBrawlingWhiterunRef) guard quest / BSCM before death handling
	if BaboQuest == None || BSCM == None
		return
	endif
	If DeathSwitch
		BaboQuest.DeathCount()
		BSCM.CorruptionExpLoss(1.0)
		BSCM.TraumaExpLoss(1.0)
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
BaboDialogueWhiterunScript Property BaboQuest  Auto
BaboSexControllerManager Property BSCM Auto