;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname BaboDiaTestTIF15 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
(BaboMonitorScript as BaboDiaMonitorScript).StruggleAnim(PlayerRef, akspeaker, True, "Babo_FlirtBreast_A01", "Babo_FlirtBreast_A02")
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

idle property BaboKnockOut01Start Auto

Quest Property BaboMonitorScript  Auto  

Actor Property PlayerRef  Auto  
