;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname BaboEventRieklingThirskKidnap_TIF03 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
(Getowningquest() as BaboEventRiekling).ModConfidence(-5.0)
(Getowningquest() as BaboEventRiekling).ModTrauma(3.0)
(Getowningquest() as BaboEventRiekling).SlaveTrust(15.0)
Getowningquest().setstage(10);
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
