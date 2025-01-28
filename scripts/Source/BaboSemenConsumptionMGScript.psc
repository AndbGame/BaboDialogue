Scriptname BaboSemenConsumptionMGScript extends ActiveMagicEffect  

float Magnitude
Quest Property BaboSexController Auto
int Property iCumType Auto
{1 Vaginal 2 Anal 4 Oral}

Event OnInit()
	Magnitude = self.GetMagnitude()
EndEvent

Event OnEffectStart(Actor akTarget, Actor akCaster)
	;Debug.notification(Magnitude)
	if Magnitude == 0
		Magnitude = 0.5
	endif
	(BaboSexController as BaboSexControllerManager).FHUInflationEvent(akTarget as form, None, true, iCumType, Magnitude, 1.0, "")
EndEvent
