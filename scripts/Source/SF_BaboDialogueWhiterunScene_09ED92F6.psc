;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname SF_BaboDialogueWhiterunScene_09ED92F6 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).SexCustom(PlayerRef, ViceCaptainRef, None, None, None, MF, Cowgirl, Missionary, false, none, none, true)
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
Actor Player = Game.getplayer()
SexLabUtil.GetAPI().StripActor(Player, DoAnimate = True)
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

BaboDiaMonitorScript Property BDMScript Auto

Quest Property BaboSexController  Auto  
