;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname SF_BaboEncounter06BCombatSur_08626566 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
(Getowningquest() as BaboEncounter06BScript).CombatDefeated(BaboEncounter06Variable.getvalue() as int)
(BaboSexController as BaboSexControllerManager).RecoverControl(false)
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).LosingControl()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property BaboSexController  Auto  

GlobalVariable Property BaboEncounter06Variable  Auto  
