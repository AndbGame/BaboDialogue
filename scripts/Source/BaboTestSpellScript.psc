Scriptname BaboTestSpellScript extends ActiveMagicEffect  

Event OnEffectStart(Actor akTarget, Actor akCaster)
;	FadeToBlackImod.ApplyCrossFade(1.0)
;	Utility.Wait(2.0)
;	FadeToBlackHoldImod.Apply()
;	FadeToBlackImod.ApplyCrossFade(0.01)
;	ImageSpaceModifier.RemoveCrossFade(0.01)

(BaboSexController as BaboSexControllerManager).FHUInflationEvent(PlayerRef, None, true, 1, 1.0, 1, "")
Debug.notification("FHU Test")
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
;	FadeToBlackBackImod.ApplyCrossFade(0.01)
;	FadeToBlackBackImod.Apply()
;	FadeToBlackHoldImod.ApplyCrossFade(1.0)
;	Utility.Wait(2.0)
;	FadeToBlackHoldImod.Remove()
;	ImageSpaceModifier.RemoveCrossFade(0.01)
EndEvent

ImageSpaceModifier Property FadeToBlackImod  Auto  
ImageSpaceModifier Property FadeToBlackHoldImod  Auto  
ImageSpaceModifier Property FadeToBlackBackImod  Auto

Quest Property BaboSexController Auto
Actor Property PlayerRef Auto