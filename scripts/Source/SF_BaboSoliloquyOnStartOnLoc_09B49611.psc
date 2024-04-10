;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 13
Scriptname SF_BaboSoliloquyOnStartOnLoc_09B49611 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
Xmarker.getreference().moveto(BaboXmarkerHomeRef)
BaboXmarkerMoverScript.EvaluateTalkingStatus(False)
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
BaboXmarkerMoverScript.playerCanSpeakChangeLocationSwitch()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
BaboXmarkerMoverScript.playerCanSpeakChangeLocationSwitch()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN CODE
BaboXmarkerMoverScript.playerCanSpeakChangeLocationSwitch()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
BaboXmarkerMoverScript.playerCanSpeakChangeLocationSwitch()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
BaboXmarkerMoverScript.playerCanSpeakChangeLocationSwitch()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
Xmarker.getreference().moveto(game.getplayer())
;debug.notification("OnChangeLocation Play")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN CODE
BaboXmarkerMoverScript.playerCanSpeakChangeLocationSwitch()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
BaboXmarkerMoverScript.playerCanSpeakChangeLocationSwitch()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
BaboXmarkerMoverScript.playerCanSpeakChangeLocationSwitch()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
BaboXmarkerMoverScript.playerCanSpeakChangeLocationSwitch()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Xmarker  Auto  

BaboXmarkerMover Property BaboXmarkerMoverScript Auto
ObjectReference Property BaboXmarkerHomeRef  Auto  
