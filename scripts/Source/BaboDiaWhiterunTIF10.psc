;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname BaboDiaWhiterunTIF10 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
BDMScript.StruggleAnim(Game.getplayer(), akspeaker, true, Paired_BaboStripMotionS04_A01, Paired_BaboStripMotionS04_A02)
Utility.wait(4.0)
SexLabUtil.GetAPI().StripActor(Game.getplayer(), DoAnimate = false)
Utility.wait(6.0)
BDMScript.StruggleAnim(Game.getplayer(), akspeaker, false, Paired_BaboStripMotionS04_A01, Paired_BaboStripMotionS04_A02)
Utility.wait(1.0)
(Getowningquest() as BaboDiaQuest).SLHHActivate(akspeaker, none)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

BaboDiaMonitorScript Property BDMScript Auto
String Property Paired_BaboStripMotionS04_A01 Auto
String Property Paired_BaboStripMotionS04_A02 Auto
