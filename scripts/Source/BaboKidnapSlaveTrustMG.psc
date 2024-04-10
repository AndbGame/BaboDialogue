Scriptname BaboKidnapSlaveTrustMG extends ActiveMagicEffect  

Quest Property BaboKidnapEvent Auto
Actor Property PlayerRef Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
float Magnitude = self.GetMagnitude()
if akTarget == PlayerRef
	(BaboKidnapEvent as BaboKidnapEvenScript).SlaveTrust(Magnitude)
endif
EndEvent