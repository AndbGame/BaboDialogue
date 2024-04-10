;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname BaboDiaTestTIF09 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
BDMScript.PairedAnim(Game.getplayer(), akspeaker, None, False, BaboFaintOrgasm01_A1_S01, BaboFaintOrgasm01_A2_S01)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

BaboDiaMonitorScript Property BDMScript Auto
Idle Property BaboFaintOrgasm01_A1_S01  Auto  
Idle Property BaboFaintOrgasm01_A2_S01  Auto  
