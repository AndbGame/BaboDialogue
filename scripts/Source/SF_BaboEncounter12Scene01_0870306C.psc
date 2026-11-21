;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname SF_BaboEncounter12Scene01_0870306C Extends Scene Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
if BaboPlayerAppearanceTotalValue.getvalue() >= 80
GetOwningQuest().setstage(28)
else
GetOwningQuest().setstage(30)
endif
stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property BaboPlayerAppearanceTotalValue  Auto  
