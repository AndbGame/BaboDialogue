Scriptname BaboArousalCalmScript extends ActiveMagicEffect  

Faction Property sla_Exposure Auto
int Property ControlValue = -30 Auto
Actor Property PlayerRef Auto
Quest Property sla_Framework Auto


Event OnEffectStart(Actor akTarget, Actor akCaster)
	int slaexposure = (sla_Framework as slaFrameworkScr).GetActorExposure(akTarget)
	(sla_Framework as slaFrameworkScr).SetActorExposure(akTarget, slaexposure + ControlValue)
EndEvent