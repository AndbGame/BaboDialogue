;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname SF_BaboEncounter06Scene01_084101EE Extends Scene Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
if BaboPunishGlobal.getvalue() < 2
Getowningquest().setstage(60)
elseif BaboPunishGlobal.getvalue() == 2
Getowningquest().setstage(70)
else
Getowningquest().setstage(100)
endif
BaboPunishGlobal.setvalue(BaboPunishGlobal.getvalue() + 1)
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property BaboPunishGlobal  Auto  
