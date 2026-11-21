;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 4
Scriptname SF_BaboEncounter06SexInterlu_08682515 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
(Getowningquest() as BaboEncounter06Script).NextSexRound()
BaboSceneStandBy.setvalue(0)
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
BaboSceneStandBy.setvalue(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
(Getowningquest() as BaboEncounter06Script).AskSexSecondRound()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Faction Property BaboRapistFaction  Auto  

ReferenceAlias Property HiredThug01  Auto  

GlobalVariable Property BaboSceneStandBy  Auto  
