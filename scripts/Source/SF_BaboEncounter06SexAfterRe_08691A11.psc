;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 3
Scriptname SF_BaboEncounter06SexAfterRe_08691A11 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
PlayerDialogueMarker.getreference().moveto(BaboSoliloquyXmarkerStandByRef)
(BaboSexController as BaboSexControllerManager).SimpleAnmSequence(playerref, hiredthug01.getactorreference(), "Babo_CollapsedBreakAway_A1", "Babo_CollapsedBreakAway_A2")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
(Getowningquest() as BaboEncounter06Script).SexResistLeaveFlow()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
PlayerDialogueMarker.getreference().moveto(PlayerRef)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Actor Property PlayerRef  Auto  

ReferenceAlias Property PlayerDialogueMarker  Auto  

ObjectReference Property BaboSoliloquyXmarkerStandByRef  Auto  

ReferenceAlias Property HiredThug01  Auto  

Quest Property BaboSexController  Auto  
