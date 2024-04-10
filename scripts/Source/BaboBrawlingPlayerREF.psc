Scriptname BaboBrawlingPlayerREF extends ReferenceAlias  

Idle property Knockout auto
Idle property Knockout02 auto
Int Property StartStage auto
Int Property StartStage02 auto
Int Property NextStage01 auto
Int Property LastStage auto
bool Property RotatedAnimationFixEnabled = false Auto Hidden
Function ResetThirdPersonCamera() Native Global

Scene Property NextScene01 Auto
Scene Property NextScene02 Auto

Bool Property EssentialAtStart = true Auto
Bool Property NexStage01Switch Auto
Bool Property NextScene01Switch Auto

Bool Property BleedOutMechanism = False Auto
Bool Property HitMechanism = False Auto

Bool Property FoeSwitch = false Auto
Bool Property BacktoNormal = false Auto

Bool Property Yeskeyword = false Auto
Bool Property InitialEssential = true Auto

Bool Property InitialEssential = true Auto
{This toggle needs to be set if you want to designate a certain enemy type with keywords.}

Referencealias property Foe01 Auto
Referencealias property PlayerRefrence Auto

GlobalVariable Property BaboCombatWoundPercentMaximum Auto
GlobalVariable Property BaboCombatWoundPercentMinimum Auto

GlobalVariable Property BaboCombatEssentialSwitch Auto

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
	
	;###############SE#################
	PO3_Events_Alias.RegisterForHitEventEx(self, Foe01.getreference(), None, None, -1, -1, -1, -1, true)
	;###############SE#################
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

Function RegisterOnHitExExtra(form akfilter)
	PO3_Events_Alias.RegisterForHitEventEx(self, akfilter, None, None, -1, -1, -1, -1, true)
EndFunction

Function Defeated()
	BaboBrawlingDefeatedMsg.show()
	Game.ForceThirdPerson()
	(Self.getreference() as actor).RestoreActorValue("health", 100)
	Game.DisablePlayerControls(abmenu =true)
	Utility.Wait(0.5)
	(Self.getreference() as actor).PlayIdle(Knockout)

		If NexStage01Switch == True
			Self.GetOwningQuest().SetStage(NextStage01)
		EndIf

		If  NextScene01Switch == True
			NextScene01.Start()
		EndIf

		If BacktoNormal
			Utility.Wait(5.0)
			Game.EnablePlayerControls(abmenu =true)
		endif
	PO3_Events_Alias.UnregisterForAllHitEventsEx(self);SE
EndFunction

Function DamageCalculation(ObjectReference akAggressor)

	If GetOwningQuest().GetStage() == StartStage || GetOwningQuest().GetStage() == StartStage02
		If akAggressor.haskeyword(BaboStripper) || Yeskeyword == False
			If	FoeSwitch == False || (Foe01.getref() as actor).isdead() == False
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
	LastAggressor = Foe01.getreference() as actor
EndEvent

Function CheckEssential()

EndFunction

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