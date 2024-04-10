Scriptname BaboAliasHiringScript extends ReferenceAlias  

Event OnUpdateGameTime()

	;kill the update if the follower isn't waiting anymore
	If Self.GetActorRef().GetAv("WaitingforPlayer") == 0
		UnRegisterForUpdateGameTime()
	Else
; 		debug.trace(self + "follower will go after player because he is waiting and 3 days have passed.")
;		(GetOwningQuest() as BaboDialogueHirelingsQuest).ChasingPlayer()
;		(GetOwningQuest() as BaboDialogueHirelingsQuest).DismissFollower(1)
		UnRegisterForUpdateGameTime()
	EndIf	
	
EndEvent

Event OnUnload()

	;if follower unloads while waiting for the player, wait three days then dismiss him.
	If Self.GetActorRef().GetAv("WaitingforPlayer") == 1
		(GetOwningQuest() as BaboDialogueHirelingsQuest).FollowerWait()
	EndIf

EndEvent

Event OnCombatStateChanged(Actor akTarget, int aeCombatState)
	If (akTarget == PlayerRef)
; 		debug.trace(self + "Dismissing follower because he is now attacking the player")
		GetOwningQuest().setstage(100)
		(GetOwningQuest() as BaboDialogueHirelingsQuest).DismissFollower(0)
	EndIf
EndEvent

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack,  bool abBashAttack, bool abHitBlocked)
if akAggressor == PlayerRef
	(GetOwningQuest() as BaboDialogueHirelingsQuest).BleedoutCounts()
endif
Endevent

Event OnEnterBleedout()
	(GetOwningQuest() as BaboDialogueHirelingsQuest).BleedoutCounts()
EndEvent

Event OnDeath(Actor akKiller)
; 	debug.trace(self + "Clearing the follower because the player killed him.")
	PlayerFollowerCount.SetValue(0)
	(GetOwningQuest() as BaboDialogueHirelingsQuest).DismissFollower(0)

	Self.Clear()
	(BaboReputationScript as BaboReputationMasterScript).DecreaseReputation(-25, 0)
	(BaboSexController as BaboSexControllerManager).HirelingMessagebox(1)
EndEvent

GlobalVariable Property PlayerFollowerCount  Auto  
Faction Property CurrentHirelingFaction Auto
Quest Property BaboReputationScript Auto
Quest Property BaboSexController Auto
Actor Property PlayerRef Auto