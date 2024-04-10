;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 5
Scriptname SF_BaboEncounter07Scene02_08960BED Extends Scene Hidden

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).EquipRestraints(PlayerRef, false)
(BaboSexController as BaboSexControllerManager).QTEAnimation(PlayerRef, Thug02.getreference() as actor, True, "Babo_Captured_A1", "Babo_Captured_A2", false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).LosingControl()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
BaboEncounter07Scenarioe.setvalue(1);Release the girl
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
if BaboEncounter07Scenarioe.getvalue() != 1
BaboEncounter07Scenarioe.setvalue(2)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property BaboSexController  Auto  

Actor Property PlayerRef  Auto  

GlobalVariable Property BaboEncounter07Scenarioe  Auto  

ReferenceAlias Property Thug02  Auto  
