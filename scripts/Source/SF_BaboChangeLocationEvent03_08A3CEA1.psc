;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname SF_BaboChangeLocationEvent03_08A3CEA1 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
if babosimpleslavery.getvalue() == 1
Getowningquest().setstage(45)
else 
Getowningquest().setstage(90)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property BaboSimpleSlavery  Auto  
