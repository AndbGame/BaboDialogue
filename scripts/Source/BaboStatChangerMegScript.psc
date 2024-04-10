Scriptname BaboStatChangerMegScript extends ActiveMagicEffect  

Quest Property BaboSexController Auto
Actor Property PlayerRef Auto

Bool property bcorruptionExp = false auto
;float property icorruptionExp = 1.0 auto

Bool property btraumaExp = false auto
;float property itraumaExp = 1.0 auto

Bool property blewdnessExp = false auto
;float property ilewdnessExp = 1.0 auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
float Magnitude = self.GetMagnitude()
if akTarget == PlayerRef
if bcorruptionExp
	(BaboSexController as BaboSexControllerManager).CorruptionExp(Magnitude)
endif

if btraumaExp
	(BaboSexController as BaboSexControllerManager).TraumaExp(Magnitude)
endif

if blewdnessExp
	(BaboSexController as BaboSexControllerManager).LewdnessExp(Magnitude)
endif
endif
EndEvent