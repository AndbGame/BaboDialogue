Scriptname BaboGiveSpellMGScript extends activemagiceffect  
{This Script will give the target a detect spell}

Spell Property MonitorAbility Auto
 
Event OnEffectStart(Actor akTarget, Actor akCaster)
	akTarget.AddSpell(MonitorAbility)
EndEvent