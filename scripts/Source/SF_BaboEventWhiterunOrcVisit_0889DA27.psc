;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname SF_BaboEventWhiterunOrcVisit_0889DA27 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
If BaboGlobalWhiterunOrcFuckToyTitle.getvalue() == 1
GetowningQuest().setstage(69)
ElseIf BaboGlobalWhiterunOrcFuckToyTitle.getvalue() > 1
GetowningQuest().setstage(45)
EndIf
stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
GlobalVariable Property BaboGlobalWhiterunOrcFuckToyTitle Auto
