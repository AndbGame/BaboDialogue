;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 4
Scriptname SF_BaboKidnapEventScenario20_08B6230B Extends Scene Hidden

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
(CageDoorA.getreference()).lock(false)
(CageDoorA.getreference()).setopen(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
(CageDoorA.getreference()).setopen(false)
Utility.wait(1.0)
(CageDoorA.getreference()).lock(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
(CageDoorA as BaboKidnapCageDoorActivateScript).GotoNullState(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
(Getowningquest() as BaboKidnapEvenScript).SlaveTrust(7)
(Getowningquest() as BaboKidnapEvenScript).AfterKidnapEvent(0)
(CageDoorA as BaboKidnapCageDoorActivateScript).GotoNullState(false)
stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property CageDoorA  Auto
