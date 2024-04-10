Scriptname BaboMonitorMGScript extends activemagiceffect  

Event OnEffectStart(Actor akTarget, Actor akCaster)
	If AddPerkSwitch
		akTarget.AddPerk(AddPerk)
	EndIf
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	If AddPerkSwitch
		akTarget.RemovePerk(AddPerk)
	EndIf
EndEvent

Bool Property AddPerkSwitch = False Auto
Perk Property AddPerk Auto