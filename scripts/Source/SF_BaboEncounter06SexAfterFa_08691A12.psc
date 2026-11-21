;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 3
Scriptname SF_BaboEncounter06SexAfterFa_08691A12 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).SimpleAnmSequence(playerref, hiredthug01.getactorreference(), "BaboFaintF_S", "BaboCrouchM_S")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).SimpleAnmSequence(playerref, hiredthug01.getactorreference(), "BaboFaintF_S", "BaboCrouchM_S")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;GetOwningQuest().SetStage(100)
(GetOwningQuest() as BaboEncounter06Script).AfterFaintSceneToCapture()
stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property BaboSexController  Auto  

Actor Property PlayerRef  Auto  

ReferenceAlias Property HiredThug01  Auto  
