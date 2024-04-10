;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname BaboDiaTestTIF11 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
BDMScript.StruggleAnim(Game.getplayer(), akspeaker, true, Paired_BaboStripMotionS01Loop_A01, Paired_BaboStripMotionS01Loop_A02)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment


BaboDiaMonitorScript Property BDMScript Auto
Idle Property Paired_BaboStripMotion01  Auto

String Property Paired_BaboStripMotionS01Loop_A02 Auto
String Property Paired_BaboStripMotionS01Loop_A01 Auto
