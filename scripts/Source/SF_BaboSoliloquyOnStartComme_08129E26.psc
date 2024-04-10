;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname SF_BaboSoliloquyOnStartComme_08129E26 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
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

GlobalVariable Property BaboSoliloquyOnStartKeyPress  Auto  
