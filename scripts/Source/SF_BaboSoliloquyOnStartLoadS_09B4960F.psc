;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 3
Scriptname SF_BaboSoliloquyOnStartLoadS_09B4960F Extends Scene Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
Xmarker.getreference().moveto(game.getplayer())
;debug.notification("OnStartLoadScene Play")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
Xmarker.getreference().moveto(BaboXmarkerHomeRef)
BaboXmarkerMoverScript.EvaluateTalkingStatus(False)
stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Xmarker  Auto  

ObjectReference Property BaboXmarkerHomeRef  Auto  

BaboXmarkerMover Property BaboXmarkerMoverScript Auto
