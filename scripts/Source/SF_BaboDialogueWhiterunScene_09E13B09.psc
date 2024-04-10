;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 13
Scriptname SF_BaboDialogueWhiterunScene_09E13B09 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN CODE
(BaboSexController  as BaboSexControllerManager).RecoverControl()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
getOwningQuest().setStage(59)
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
CaptainRef.getactorref().moveto(BaboDialogueWhiterunXmarker03)
Getowningquest().setstage(65)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN CODE
(BaboSexController  as BaboSexControllerManager).LosingControl()
(BaboSexController  as BaboSexControllerManager).RandomExhaustionIdle(PlayerRef)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
GetOwningQuest().SetStage(70)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property BaboDialogueWhiterunXmarker03  Auto  

ReferenceAlias Property CaptainRef  Auto

Quest Property BaboSexController Auto

Actor Property PlayerRef  Auto  
