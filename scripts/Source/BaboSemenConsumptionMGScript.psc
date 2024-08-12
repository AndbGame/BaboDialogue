Scriptname BaboSemenConsumptionMGScript extends ActiveMagicEffect  

Quest Property BaboSexController Auto
int Property iCumType Auto
{1 Vaginal 2 Anal 4 Oral}
Event OnEffectStart(Actor akTarget, Actor akCaster)
float Magnitude = self.GetMagnitude()
	(BaboSexController as BaboSexControllerManager).FHUInflationEvent(akTarget as form, None, true, iCumType, Magnitude, 1.0, "")
EndEvent
