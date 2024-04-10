Scriptname BaboEvent01OrcRefScript extends ReferenceAlias  

;Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked);LE
Event OnHitEx(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
if  MakeAggressiveAndAttackPlayerIfAttacked
	If GetOwningQuest().GetStage() < 40
		Self.GetOwningQuest().SetStage(45)
	EndIf
	PO3_Events_Alias.UnregisterForAllHitEventsEx(self)
;(GetOwningQuest() as BaboEventWhiterunOrcVisitorsScript).AttackPeople(Self)
EndIf
EndEvent

Event OnDeath(Actor akKiller)
(BaboSexController as BaboSexControllerManager).CorruptionExpLoss(2.0)
(BaboSexController as BaboSexControllerManager).TraumaExpLoss(1.0)
If (OrcRaper01.getref() as Actor).isdead() && (OrcRaper02.getref() as Actor).isdead() && (OrcRaper03.getref() as Actor).isdead()
	Self.GetOwningQuest().SetStage(70)
EndIF
EndEvent

Function PO3HitEventRegister()
	PO3_Events_Alias.RegisterForHitEventEx(self, PlayerRef, None, None, -1, -1, -1, -1, true)
EndFunction

bool Property MakeAggressiveAndAttackPlayerIfAttacked = False Auto
Referencealias Property OrcRaper01 Auto
Referencealias Property OrcRaper02 Auto
Referencealias Property OrcRaper03 Auto

Quest Property BaboSexController Auto
Actor Property PlayerRef Auto