;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname BaboKidnapEventTIF30 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
(getowningquest() as BaboKidnapEvenScript).Nocollision(None)
(getowningquest() as BaboKidnapEvenScript).SetvehicleRef(None, CenterMarkerPlayer)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).EventPairMotion(akspeaker, 0, 0, 0, 2, false)
(Getowningquest() as BaboKidnapEvenScript).SlaveTrust(-5.0)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property BaboSexController Auto
Referencealias Property CenterMarkerPlayer Auto
