;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 3
Scriptname SF_BaboDialogueWhiterunScene_09EBACC2 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).RecoverControl()
(BaboSexController as BaboSexControllerManager).SexCustom(PlayerRef, ViceCaptainRef, None, None, None, MF, Aggressive, rape, True, "WVAS01", "WhiterunViceCaptainAfterSex01", true)
BaboBoyFriendVariable.BoyFriendVariableChange(ViceCaptainRef.getactorreference(), 1, 6, false)
BaboBoyFriendVariable.BoyFriendTriggerEnd(ViceCaptainRef.getactorreference(), 1)
Utility.wait(1.0)
GetOwningQuest().SetStage(58)
stop()
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
BaboDiaQuest Property BDQ Auto

Quest Property BaboSexController  Auto  
