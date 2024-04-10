;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 5
Scriptname SF_BaboEventMarkarthGuardSce_0884780D Extends Scene Hidden

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).QTEAnimation(PlayerAlias.getreference() as actor, DStrictGuard.getreference() as actor, true, "Babo_Investigation_S02_A01", "Babo_Investigation_S02_A02", true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
int Randomi = Utility.Randomint(1, 8)
(BaboSexController as BaboSexControllerManager).CustomMFGPain(PlayerAlias.getreference() as actor, Randomi)
Debug.Sendanimationevent(PlayerAlias.getreference() as actor, "Babo_Investigation_S01_A01")
Debug.Sendanimationevent(DStrictGuard.getreference() as actor, "Babo_Investigation_S01_A02")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).QTEAnimation(PlayerAlias.getreference() as actor, DStrictGuard.getreference() as actor, true, "Babo_Investigation_S03_A01", "Babo_Investigation_S03_A02", false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
getowningquest().setstage(20)
stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property BaboSexController  Auto  

ReferenceAlias Property PlayerAlias  Auto  

ReferenceAlias Property DStrictGuard  Auto  
