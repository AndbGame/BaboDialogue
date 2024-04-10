;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname BaboEventAnimalCareTIF09 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
playerref.additem(gold001, 2000)
BaboAnimalCareOwnerOfferedGlobal.setvalue(1)
Getowningquest().setstage(41)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property BaboAnimalCareOwnerOfferedGlobal  Auto  

Actor Property PlayerRef  Auto  

MiscObject Property Gold001  Auto  
