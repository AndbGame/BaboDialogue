;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 4
Scriptname SF_BaboEncounter07Scene04_0897A25F Extends Scene Hidden

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
BaboEncounter07Scenarioe.setvalue(2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).RecoverControl()
if BaboEncounter07Scenarioe.getvalue() == 2
Getowningquest().setstage(21)
else
Getowningquest().setstage(55)
endif
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).LosingControl()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).PairedMotionNPC(VictimWoman.getreference() as actor, Thug04.getreference() as actor, 0, false)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property BaboSexController  Auto  

ReferenceAlias Property VictimWoman  Auto  

ReferenceAlias Property Thug04  Auto  

GlobalVariable Property BaboEncounter07Scenarioe  Auto  
