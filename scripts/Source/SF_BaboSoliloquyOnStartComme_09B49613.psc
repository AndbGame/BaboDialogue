;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 4
Scriptname SF_BaboSoliloquyOnStartComme_09B49613 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
Xmarker.getreference().moveto(BaboXmarkerHomeRef)
BaboXmarkerMoverScript.EvaluateTalkingStatus(False)
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
Xmarker.getreference().moveto(game.getplayer())
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Xmarker  Auto  

BaboXmarkerMover Property BaboXmarkerMoverScript Auto

ObjectReference Property BaboXmarkerHomeRef  Auto  
