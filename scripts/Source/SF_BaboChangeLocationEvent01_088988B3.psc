;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname SF_BaboChangeLocationEvent01_088988B3 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
If baboreputation.getvalue() < 50
GetowningQuest().Setstage(44)
ElseIF baboreputation.getvalue() >= 50
GetowningQuest().Setstage(42)
EndIF
stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

globalvariable Property BaboReputation Auto
