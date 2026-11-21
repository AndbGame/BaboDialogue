;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname SF_BaboEncounter06BCombatDef_08626565 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).LosingControl()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).RecoverControl(false)
if BaboEncounter06BEndVariable.getvalue() == 0
(Getowningquest() as BaboEncounter06BScript).CombatDefeatedSlavery()
else
;(Getowningquest() as BaboEncounter06BScript).RelocateForGroupSex()
Getowningquest().Setstage(90)
endif
stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property BaboEncounter06BEndVariable  Auto  

Quest Property BaboSexController  Auto  
