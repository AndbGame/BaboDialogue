;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname BaboDiaWhiterunTIF07 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
SexLabUtil.GetAPI().StripActor(Game.getplayer(), DoAnimate = true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
BDMScript.PlayAnim(Game.getplayer(), akspeaker, true, Paired_BaboStripMotionS05Loop_A01, Paired_BaboStripMotionS01Loop_A02, BaboDialogueWhiterunSceneVariableM02)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment


BaboDiaMonitorScript Property BDMScript Auto
String Property Paired_BaboStripMotionS01Loop_A02 Auto
String Property Paired_BaboStripMotionS05Loop_A01 Auto

Scene Property BaboDialogueWhiterunSceneVariableM02  Auto  
