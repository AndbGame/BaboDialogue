;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 8
Scriptname SF_BaboBadEndFarmerAfterSexS_084BC4FC Extends Scene Hidden

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
if PlayerRef.getfactionrank(BaboFactionStatWill) <= 3
BaboBadEndScenario.setvalue(2)
else
BaboBadEndScenario.setvalue(1)
endif
getowningquest().setstage(56)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).EquipGag(Game.getplayer(), false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
BaboBadEndScenario.setvalue(1)
getowningquest().setstage(56)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
BaboBadEndScenario.setvalue(1)
getowningquest().setstage(56)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
If getowningquest().getstage() == 56
getowningquest().setstage(60)
elseif getowningquest().getstage() == 57
getowningquest().setstage(199)
endif
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
Xmarkermover.PlayerVoiceMovein()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
if PlayerRef.getfactionrank(BaboFactionStatWill) <= 3
BaboBadEndScenario.setvalue(2)
getowningquest().setstage(56)
else
BaboBadEndScenario.setvalue(1);Goslavery
getowningquest().setstage(57)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property BaboSexController  Auto  

GlobalVariable Property BaboBadEndScenario  Auto  

Faction Property BaboFactionStatWill  Auto  

Actor Property PlayerRef  Auto  

BaboXMarkerMoverGeneric Property XmarkerMover Auto
