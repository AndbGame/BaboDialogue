;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname BaboDiaTestTIF02 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
BDMQuest.StruggleAnim(BDMQuest.PlayerRef, akspeaker, True, BaboEmbarrassment01F, BaboEmbarrassment01MChest)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

BaboDiaMonitorScript Property BDMQuest Auto
String Property BaboEmbarrassment01MChest Auto
String Property BaboEmbarrassment01F Auto
