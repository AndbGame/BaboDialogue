;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 7
Scriptname SF_BaboKidnapEventScenario20_08B95027 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
(CageDoorA.getreference()).setopen(false)
Utility.wait(1.0)
(CageDoorA.getreference()).lock(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
(CageDoorA as BaboKidnapCageDoorActivateScript).GotoNullState(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).EventPairMotion(Kidnapper01.getreference() as actor, 0, 0, 0, 5, false)
(Getowningquest() as BaboKidnapEvenScript).Drinkit(0, 2, true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).EventPairMotion(Kidnapper01.getreference() as actor, 0, 0, 0, 4, false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).EventPairMotion(Kidnapper01.getreference() as actor, 0, 0, 0, 1, true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
(CageDoorA.getreference()).lock(false)
(CageDoorA.getreference()).setopen(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
(Getowningquest() as BaboKidnapEvenScript).AfterKidnapEvent(1)
(CageDoorA as BaboKidnapCageDoorActivateScript).GotoNullState(false)
stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property BaboSexController  Auto  

ReferenceAlias Property Kidnapper01  Auto  

ReferenceAlias Property CageDoorA  Auto  
