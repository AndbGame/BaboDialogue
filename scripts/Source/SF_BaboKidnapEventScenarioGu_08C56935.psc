;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 4
Scriptname SF_BaboKidnapEventScenarioGu_08C56935 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
(Getowningquest() as BaboKidnapEvenScript).GotoStateString("BaboSlaverDied")

(Getowningquest() as BaboKidnapEvenScript).OptionKill(Kidnapper01.getreference() as actor, Kidnapper02.getreference() as actor)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
(BaboSexController  as BaboSexControllerManager).LosingControl()
(CageDoorA as BaboKidnapCageDoorActivateScript).GotoNullState(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
(CageDoorA.getreference()).lock(false)
(CageDoorA.getreference()).setopen(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
int icharacter = (Kidnapper02.getreference() as actor).getfactionrank(SLAX_AggressiveFaction) as int
(BaboSexController  as BaboSexControllerManager).RecoverControl()
(Getowningquest() as BaboKidnapEvenScript).AfterKidnapEvent(icharacter)
stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Kidnapper01  Auto  

ReferenceAlias Property Kidnapper02  Auto  

ReferenceAlias Property CageDoorA  Auto  

Quest Property BaboSexController  Auto  

Faction Property SLAX_AggressiveFaction  Auto  
