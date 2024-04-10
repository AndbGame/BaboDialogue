;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname SF_BaboEventWhiterunOrcVisit_08289E9F Extends Scene Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
If BaboGlobalWhiterunOrcFuckToyTitle.getvalue() == 0
GetowningQuest().setstage(30)
Else
GetowningQuest().setstage(20)
EndIf
stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property BaboGlobalWhiterunOrcFuckToyTitle Auto
