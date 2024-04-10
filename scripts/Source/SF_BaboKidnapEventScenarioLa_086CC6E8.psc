;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 3
Scriptname SF_BaboKidnapEventScenarioLa_086CC6E8 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
actor akactor = Kidnapper01.Getreference() as actor
(Getowningquest() as BaboKidnapEvenScript).StartUptheEvent(BaboKidnapScenarioe.getvalue() as int)
Utility.wait(1.0)
if akactor.isinfaction(BaboWEAggressiveRapistFaction)
(Getowningquest() as BaboKidnapEvenScript).YouGotSpotted(1)
else
(Getowningquest() as BaboKidnapEvenScript).YouGotSpotted(0)
endif
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
(getowningquest() as BaboKidnapEvenScript).PlayerTalkXmarkerReturn()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
(getowningquest() as BaboKidnapEvenScript).PlayerTalkXmarkerStart()
actor akactor = Kidnapper01.Getreference() as actor
akactor.removefromfaction(BaboWEAggressiveRapistFaction)
int DimishChance = BaboKidnapEscapeAttempts.Getvalue() as int
if akactor.isinfaction(BaboEncounter05Faction)
DimishChance *= 5
else
DimishChance *= 2
endif
(BaboSexController as BaboSexControllerManager).RollRapeChance(akactor, DimishChance)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property BaboKidnapScenarioe  Auto  

Faction Property BaboWEAggressiveRapistFaction  Auto  

Quest Property BaboSexController  Auto  

ReferenceAlias Property Kidnapper01  Auto  

GlobalVariable Property BaboKidnapEscapeAttempts  Auto  

Faction Property BaboEncounter05Faction  Auto  
