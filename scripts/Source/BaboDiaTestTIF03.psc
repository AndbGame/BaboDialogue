;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname BaboDiaTestTIF03 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
BDMQuest.StruggleAnim(BDMQuest.PlayerRef, akspeaker, True, BaboEmbarrassment01F, BaboEmbarrassment01M)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

BaboDiaMonitorScript Property BDMQuest Auto
String Property BaboEmbarrassment01M Auto
String Property BaboEmbarrassment01F Auto
