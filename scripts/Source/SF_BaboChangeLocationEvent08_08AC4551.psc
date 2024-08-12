;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname SF_BaboChangeLocationEvent08_08AC4551 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).QTESoloAnimation(PlayerRef, false, "", true)
if BaboChangeLocation08Fraud.getvalue() == 1
Getowningquest().setstage(75)
else
Getowningquest().setstage(35)
endif
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).QTESoloAnimation(PlayerRef, true, "BaboAutograph", false)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property BaboSexController  Auto  

Actor Property PlayerRef  Auto  

GlobalVariable Property BaboChangeLocation08Fraud  Auto  
