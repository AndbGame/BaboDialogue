Scriptname BaboAliasOnLoad extends ReferenceAlias  

Quest Property MyQuest Auto
int Property MyQuestStage Auto
Quest Property BaboSexController Auto
bool Property NoticeOnGainLOSToPlayer = false Auto
bool Property PlayerEssential = false Auto
bool Property LOSAuto = false auto
bool Property HitState = false auto
int Property HitStateNextStage Auto
int Property HitStateStage Auto
int Property SceneNum Auto
{1-3}
String Property EventName Auto
ReferenceAlias Property PlayerAlias Auto
Actor Property PlayerRef Auto

Event OnGainLOS(Actor akViewer, ObjectReference akTarget)
if MyQuest.getstage() == MyQuestStage || LOSAuto
	(BaboSexController as BaboSexControllerManager).BCLEventScenePlay(SceneNum, EventName)
	if PlayerEssential
		(PlayerAlias as BaboBrawlingPlayerREF).CheckEssential()
	endif
endif
EndEvent

Event OnLoad()
	if NoticeOnGainLOSToPlayer
		RegisterForSingleLOSGain(Game.GetPlayer() as Actor, GetActorReference())
	EndIf
	
	if HitState
		GotoState("OnHitStage")
	endif
EndEvent

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack,  bool abBashAttack, bool abHitBlocked)

EndEvent

Event OnHitEx(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)

EndEvent

State OnHitStage

Event Onbeginstate()
	PO3_Events_Alias.RegisterForHitEventEx(self, PlayerRef, None, None, -1, -1, -1, -1, true)
EndEvent

;Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack,  bool abBashAttack, bool abHitBlocked)
Event OnHitEx(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	;if akAggressor as actor == PlayerRef && MyQuest.getstage() <= HitStateStage;LE
	if MyQuest.getstage() <= HitStateStage
		GotoState("")
		MyQuest.setstage(HitStateNextStage)
		PO3_Events_Alias.UnregisterForAllHitEventsEx(self)
	endif
EndEvent
EndState