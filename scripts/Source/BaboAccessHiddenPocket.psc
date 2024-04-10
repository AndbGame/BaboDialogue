Scriptname BaboAccessHiddenPocket extends activemagiceffect  

ObjectReference Property BaboHiddenPocketFrontRef  Auto  
Quest Property BaboHiddenPocketDetectQuest Auto
Event OnEffectStart(Actor akTarget, Actor akCaster)
	BaboHiddenPocketDetectQuest.start()
	;BaboHiddenPocketFrontRef.Activate(akCaster)
EndEvent