;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 5
Scriptname SF_BaboEventMarkarthGuardSce_09C0F25B Extends Scene Hidden

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
GetOwningQuest().setStage(12)
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).FadeinMove(PlayerRef, BaboEventMarkarthGuardXmarker01, 0, 0)
(DStrictGuard.getreference() as actor).moveto(BaboEventMarkarthGuardXmarker02.getreference())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
armor CurrentGloves = (DStrictGuard.getref() as actor).GetWornForm(0x00000008) as armor
armor CurrentHead = (DStrictGuard.getref() as actor).GetWornForm(0x00000001) as armor
(DStrictGuard.getref() as actor).unequipitem(CurrentGloves)
(DStrictGuard.getref() as actor).unequipitem(CurrentHead)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property PlayerRef  Auto  

ReferenceAlias Property BaboEventMarkarthGuardXmarker01  Auto  

ReferenceAlias Property DStrictGuard  Auto  

ReferenceAlias Property BaboEventMarkarthGuardXmarker02  Auto  

Quest Property BaboSexController  Auto  
