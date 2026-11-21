;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname BaboEventMarkarthAnimalCareTriggerTIF Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
BaboAnimalCareMarkarthKeyword.sendstoryevent()
;BaboEventAnimalCareMarkarth.start()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property BaboEventAnimalCareMarkarth  Auto  

Keyword Property BaboAnimalCareMarkarthKeyword  Auto  
