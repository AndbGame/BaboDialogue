;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname SF_BaboEncounter06Scene03_081FED36 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
if (BaboPlayerAppearanceValue.getvalue() >= 60) || (BaboPunishGlobal.getvalue() >= 2)
Getowningquest().setstage(50)
else
Getowningquest().setstage(60)
endif
stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property BaboPlayerAppearanceValue  Auto  

GlobalVariable Property BaboPunishGlobal  Auto  
