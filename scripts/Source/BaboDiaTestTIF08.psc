;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname BaboDiaTestTIF08 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
BDMScript.StruggleAnim(Game.getplayer(), akspeaker, True, BaboForcedKiss01_A1_S01, BaboForcedKiss01_A2_S01)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

BaboDiaMonitorScript Property BDMScript Auto
Idle Property ForcingKiss Auto

String Property BaboForcedKiss01_A1_S01  Auto  

String Property BaboForcedKiss01_A2_S01  Auto  
