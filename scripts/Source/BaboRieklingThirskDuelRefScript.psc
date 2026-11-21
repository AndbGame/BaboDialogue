Scriptname BaboRieklingThirskDuelRefScript extends ReferenceAlias  


Idle property Knockout auto
Idle property Knockout02 auto
Int Property CombatStage = 35 auto hidden
Int Property CombatStage02 = 45 auto hidden
Int Property DefeatStage = 50 auto hidden
Int Property LastStage auto

Function ResetThirdPersonCamera() Native Global

Bool Property EssentialAtStart = true Auto
Bool Property NexStage01Switch Auto

Bool Property FoeSwitch = false Auto
Bool Property BacktoNormal = false Auto

Bool Property Yeskeyword = false Auto
Bool Property InitialEssential = true Auto
{This toggle needs to be set if you want to designate a certain enemy type with keywords.}

Referencealias property RieklingChallengerChief Auto
Referencealias property RieklingChallengerMinionA Auto
Referencealias property RieklingChallengerMinionB Auto
Referencealias property RieklingChallengerMinionC Auto
Referencealias property RieklingChallengerMinionD Auto
Referencealias property RieklingChallengerMinionE Auto
Referencealias property RieklingChallengerMinionF Auto
Referencealias property PlayerRefrence Auto

GlobalVariable Property BaboCombatWoundPercentMaximum Auto
GlobalVariable Property BaboCombatWoundPercentMinimum Auto

GlobalVariable Property BaboCombatEssentialSwitch Auto

Quest Property BaboEventRieklingThirskStartQuest Auto
Quest Property BaboSetEssentialScript Auto
Referencealias Property PlayerEssential Auto

Keyword Property BaboStripper  Auto  

Idle Property staggerStart  Auto  

Float MaximumCriterion
Float MinimumCriterion
Float CurrentHealth
Float BaseHealth
Float playersHealth

Actor LastAggressor

Message Property BaboBrawlingDefeatedMsg Auto
Message Property BaboBrawlingDefeatedStandUpMsg Auto

Event oninit()
	if InitialEssential
		CheckEssential();Temporary
	endif

EndEvent

Event OnHitEx(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)

EndEvent

Function CheckEssential()

MaximumCriterion = BaboCombatWoundPercentMaximum.getvalue()
MinimumCriterion = BaboCombatWoundPercentMinimum.getvalue()

	If BaboCombatEssentialSwitch.getvalue() == 1
		if EssentialAtStart
			PlayerEssential.forcerefto((Self.getreference() as actor))
		endif
		gotostate("YesEssential")
	else
		gotostate("NoEssential")
	endif
EndFunction

Function ClearEssential()
	PlayerEssential.clear()
EndFunction

Function RegisterOnHitExExtra(bool bonlyboss)
	
	PO3_Events_Alias.RegisterForHitEventEx(self, RieklingChallengerChief.getreference(), None, None, -1, -1, -1, -1, true)
	if bonlyboss
		return
	endif
	PO3_Events_Alias.RegisterForHitEventEx(self, RieklingChallengerMinionA.getreference(), None, None, -1, -1, -1, -1, true)
	PO3_Events_Alias.RegisterForHitEventEx(self, RieklingChallengerMinionB.getreference(), None, None, -1, -1, -1, -1, true)
	PO3_Events_Alias.RegisterForHitEventEx(self, RieklingChallengerMinionC.getreference(), None, None, -1, -1, -1, -1, true)
	PO3_Events_Alias.RegisterForHitEventEx(self, RieklingChallengerMinionD.getreference(), None, None, -1, -1, -1, -1, true)
	PO3_Events_Alias.RegisterForHitEventEx(self, RieklingChallengerMinionE.getreference(), None, None, -1, -1, -1, -1, true)
	PO3_Events_Alias.RegisterForHitEventEx(self, RieklingChallengerMinionF.getreference(), None, None, -1, -1, -1, -1, true)
	;'PO3_Events_Alias.RegisterForHitEventEx(self, akfilter, None, None, -1, -1, -1, -1, true)
EndFunction

Function Defeated()
	;BaboBrawlingDefeatedMsg.show()
	Game.ForceThirdPerson()
	(Self.getreference() as actor).RestoreActorValue("health", 100)
	Game.DisablePlayerControls(abmenu =true)
		If NexStage01Switch == True
			BaboEventRieklingThirskStartQuest.SetStage(DefeatStage)
		EndIf

		If BacktoNormal
			Utility.Wait(5.0)
			Game.EnablePlayerControls(abmenu =true)
		endif
	PO3_Events_Alias.UnregisterForAllHitEventsEx(self);SE
EndFunction

Function DamageCalculation(ObjectReference akAggressor)

	If BaboEventRieklingThirskStartQuest.GetStage() == CombatStage || BaboEventRieklingThirskStartQuest.GetStage() == CombatStage02
		If akAggressor.haskeyword(BaboStripper) || Yeskeyword == False
			If	FoeSwitch == False || (RieklingChallengerChief.getreference() as actor).isdead() == False
				Defeated()
			Else
				;Now you can die
				BaboBrawlingDefeatedStandUpMsg.show()
				Game.ForceThirdPerson()
				(Self.getreference() as actor).RestoreActorValue("health", 10)
				Game.DisablePlayerControls(abmenu =true)
				Utility.Wait(0.5)
				(Self.getreference() as actor).PlayIdle(Knockout02)
				Utility.Wait(5.0)
				(Self.getreference() as actor).RestoreActorValue("health", 5)
				Game.EnablePlayerControls(abmenu =true)
				(Self.getreference() as actor).PlayIdle(StaggerStart)
			EndIf
		EndIf
	EndIf

EndFunction

state NoEssential

Event Onbeginstate()

EndEvent


Function CheckEssential()

EndFunction

;###############LE#################
;Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
;###############LE#################

;###############SE#################
Event OnHitEx(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
;###############SE#################

CurrentHealth = (Self.getreference() as actor).GetActorValue("health")
BaseHealth = (Self.getreference() as actor).GetBaseActorValue("health")
playersHealth = (CurrentHealth / BaseHealth) * 100

If PlayersHealth < 0
PlayersHealth = 0
EndIf

	If ((playersHealth <= MaximumCriterion) && (playersHealth >= MinimumCriterion))
		;if akAggressor;LE
			DamageCalculation(akAggressor)
		;endif
	Elseif playersHealth <= 0
		;if akAggressor;LE
			DamageCalculation(akAggressor)
		;endif	

	EndIf
EndEvent

Event OnEnterBleedOut()

EndEvent

endstate

State YesEssential

Event Onbeginstate()
	;LastAggressor = RieklingChallengerChief.getreference() as actor
EndEvent

;###############LE#################
;Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
;###############LE#################

;###############SE#################
Event OnHitEx(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
;###############SE#################

;if akAggressor ; LE
	LastAggressor = akAggressor as actor
;endif

EndEvent

Event OnEnterBleedOut()
	DamageCalculation(LastAggressor)
EndEvent

Endstate