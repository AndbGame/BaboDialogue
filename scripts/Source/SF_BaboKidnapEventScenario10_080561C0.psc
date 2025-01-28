;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname SF_BaboKidnapEventScenario10_080561C0 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).RecoverControl(false)
(Getowningquest() as BaboKidnapEvenScript).CallSex()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
(Getowningquest() as BaboKidnapEvenScript).StartUptheEvent(2)
(BaboSexController as BaboSexControllerManager).LosingControl()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Kidnapper01  Auto
ReferenceAlias Property Kidnapper02  Auto
ReferenceAlias Property Kidnapper03  Auto
ReferenceAlias Property Kidnapper04  Auto

Quest Property BaboSexController  Auto  
