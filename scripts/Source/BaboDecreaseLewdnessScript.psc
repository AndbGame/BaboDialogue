Scriptname BaboDecreaseLewdnessScript extends ActiveMagicEffect  

GlobalVariable Property BaboSexlabStatLewdness Auto
Faction Property sla_Arousal Auto
Float Property ControlValue Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	BaboSexlabStatLewdness.setvalue(BaboSexlabStatLewdness.getvalue() + ControlValue)
EndEvent