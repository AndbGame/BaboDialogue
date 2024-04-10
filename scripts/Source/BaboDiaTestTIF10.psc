;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname BaboDiaTestTIF10 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
BDMScript.StruggleAnim(Game.getplayer(), akspeaker, True, BaboFaintOrgasm01_A1_S02, BaboFaintOrgasm01_A2_S02)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

BaboDiaMonitorScript Property BDMScript Auto
String Property BaboFaintOrgasm01_A1_S02  Auto  
String Property BaboFaintOrgasm01_A2_S02  Auto  
