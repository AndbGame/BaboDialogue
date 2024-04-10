;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname BaboEventMarkarthStrictGuardTrigger01 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
BaboMarkarthStrictGuardTriggerGlobal.setvalue(BaboMarkarthStrictGuardTriggerGlobal.getvalue() + 1)
BaboEventMarkarthGuard.setstage(5)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable property BaboMarkarthStrictGuardTriggerGlobal Auto
Quest Property BaboEventMarkarthGuard Auto
