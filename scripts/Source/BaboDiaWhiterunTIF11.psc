;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname BaboDiaWhiterunTIF11 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
BaboDialogueWhiterunSceneVariable00.stop()
BDMScript.StruggleAnim(Game.getplayer(), akspeaker, false, None, None)
Utility.wait(1.0)
(Getowningquest() as BaboDialogueWhiterunScript).RapeStart(PlayerRef, ViceCaptainRef)
BaboBoyFriendVariable.BoyFriendVariableChange(akspeaker, 1, 6, false)
BaboBoyFriendVariable.BoyFriendTriggerEnd(akspeaker, 1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property ViceCaptainRef  Auto  

ReferenceAlias Property PlayerRef  Auto  

String Property Aggressive  Auto  

String Property MF  Auto  

String Property rape  Auto  

BaboBoyFriendVariableScript Property BaboBoyFriendVariable Auto
String Property AfterSexS  Auto  

String Property AfterSexScene  Auto  
BaboDiaMonitorScript Property BDMScript Auto
Scene Property BaboDialogueWhiterunSceneVariable00 Auto
