;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 4
Scriptname SF_BaboEncounter06SexInterlu_08691A14 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
BaboSceneStandBy.setvalue(0)
PlayerDialogueMarker.getreference().moveto(PlayerRef)
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

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
PlayerDialogueMarker.getreference().moveto(BaboSoliloquyXmarkerStandByRef)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
(Getowningquest() as BaboEncounter06Script).NextSexRound()
BaboSceneStandBy.setvalue(0)
stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property PlayerDialogueMarker  Auto  

Actor Property PlayerRef  Auto  

ObjectReference Property BaboSoliloquyXmarkerStandByRef  Auto  

GlobalVariable Property BaboSceneStandBy  Auto  
