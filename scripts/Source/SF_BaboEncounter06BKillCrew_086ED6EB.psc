;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 6
Scriptname SF_BaboEncounter06BKillCrew_086ED6EB Extends Scene Hidden

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
PlayerDialogueMarker.getreference().moveto(BaboSoliloquyXmarkerStandByRef)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
PlayerDialogueMarker.getreference().moveto(PlayerRef)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).FadeinScene(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
(Getowningquest() as BaboEncounter06BScript).ConfirmKill()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
(Getowningquest() as BaboEncounter06BScript).BaboEncounter06BKillCrewSceneEnd()
stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property BaboSoliloquyXmarkerStandByRef  Auto  

ReferenceAlias Property PlayerDialogueMarker  Auto  

Quest Property BaboSexController  Auto  

Actor Property PlayerRef  Auto  
