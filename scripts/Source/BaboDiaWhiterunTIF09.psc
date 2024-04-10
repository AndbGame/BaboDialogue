;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname BaboDiaWhiterunTIF09 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
BaboDialogueWhiterunSceneVariable00.stop()
BDMScript.StruggleAnim(Game.getplayer(), akspeaker, false, None, None)
Utility.wait(1.0)
(BaboSexController as BaboSexControllerManager).SLHHActivate(akspeaker, none)
BaboBoyFriendVariable.BoyFriendTriggerEnd(akspeaker, 1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

BaboBoyFriendVariableScript Property BaboBoyFriendVariable Auto
BaboDiaMonitorScript Property BDMScript Auto
Scene Property BaboDialogueWhiterunSceneVariable00 Auto
BaboReputationMasterScript Property BRMScript Auto

Quest Property BaboSexController  Auto  
