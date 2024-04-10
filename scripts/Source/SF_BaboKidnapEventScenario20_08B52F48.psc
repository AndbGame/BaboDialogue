;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 14
Scriptname SF_BaboKidnapEventScenario20_08B52F48 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
(Kidnapper01.getreference() as actor).moveto(KidnapperMarker01.getreference())
(CageDoorA.getreference()).setopen(false)
Utility.wait(1.0)
(CageDoorA.getreference()).lock(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
(Getowningquest() as BaboKidnapEvenScript).ProvidePlacefood(False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
(Getowningquest() as BaboKidnapEvenScript).AfterKidnapEvent(0)
(CageDoorA as BaboKidnapCageDoorActivateScript).GotoNullState(false)
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN CODE
(Getowningquest() as BaboKidnapEvenScript).ShackleRestraint(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
(CageDoorA.getreference()).lock(false)
(CageDoorA.getreference()).setopen(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN CODE
(CageDoorA as BaboKidnapCageDoorActivateScript).GotoNullState(true)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property CageDoorA  Auto  

ReferenceAlias Property KidnapperMarker01  Auto  

ReferenceAlias Property Kidnapper01  Auto  
