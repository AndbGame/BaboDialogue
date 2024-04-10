;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 4
Scriptname SF_BaboEventMarkarthGuardSce_09C0F260 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
GetOwningQuest().SetStage(13)
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
armor CurrentGloves = (DStrictGuard.getref() as actor).GetWornForm(0x00000008) as armor
armor CurrentHead = (DStrictGuard.getref() as actor).GetWornForm(0x00000001) as armor
(DStrictGuard.getref() as actor).unequipitem(CurrentGloves)
(DStrictGuard.getref() as actor).unequipitem(CurrentHead)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).FadeinMove(PlayerRef, BaboEventMarkarthGuardXmarker03, 0, 0)
(DStrictGuard.getreference() as actor).moveto(BaboEventMarkarthGuardXmarker04.getreference())
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property PlayerRef  Auto  

ReferenceAlias Property BaboEventMarkarthGuardXmarker03  Auto  

ReferenceAlias Property DStrictGuard  Auto  

ReferenceAlias Property BaboEventMarkarthGuardXmarker04  Auto  

Quest Property BaboSexController  Auto  
