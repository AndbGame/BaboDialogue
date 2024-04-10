;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname BaboDiaWhiterunTIF15 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
(Getowningquest() as BaboDialogueWhiterunScript).RapeStart(PlayerRef, ViceCaptainRef)
BaboBoyFriendVariable.BoyFriendVariableChange(akspeaker, 1, 6, false)
BaboBoyFriendVariable.BoyFriendTriggerEnd(akspeaker, 1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property ViceCaptainRef  Auto  

ReferenceAlias Property PlayerRef  Auto  

String Property Cowgirl  Auto  

String Property MF  Auto  

String Property Missionary Auto  

BaboBoyFriendVariableScript Property BaboBoyFriendVariable Auto
String Property AfterSexS  Auto  

String Property AfterSexScene  Auto  
BaboDiaMonitorScript Property BDMScript Auto
BaboDiaQuest Property BDQ Auto
