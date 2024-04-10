;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 6
Scriptname SF_BaboBadEndFarmerScene_084B2200 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
if (FarmerM.getreference() as actor).getfactionrank(SLAX_AggressiveFaction) < 2
BaboBadEndScenario.setvalue(1)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
Xmarkermover.PlayerVoiceMovein()
if (FarmerM.getreference() as actor).getfactionrank(SLAX_AggressiveFaction) >= 3
BaboBadEndScenario.setvalue(2)
else
BaboBadEndScenario.setvalue(Utility.randomint(0, 3))
endif
;0 - Run 1 - Help 2 - Rape 3 - Call guards
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
if BaboSexlabStatusFHU.getvalue() > 2 && (FarmerM.getreference() as actor).getfactionrank(SLAX_AggressiveFaction) < 2
BaboBadEndScenario.setvalue(0)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
getowningquest().setstage(20)
Xmarkermover.PlayerVoiceMoveout()
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
(Getowningquest() as BaboBadEndQuest).UnregisterUpdate()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

BaboXMarkerMoverGeneric Property XmarkerMover Auto

GlobalVariable Property BaboBadEndScenario  Auto  

GlobalVariable Property BaboSexlabStatusFHU  Auto  

Faction Property SLAX_AggressiveFaction  Auto  

ReferenceAlias Property FarmerM  Auto  
