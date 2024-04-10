;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 5
Scriptname SF_BaboKidnapEventYouAreSpot_086857C7 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
if BaboKidnapEscapeAttempts.getvalue() <= 8
(Getowningquest() as BaboKidnapEvenScript).YouGotSpotted(1)
else
(Getowningquest() as BaboKidnapEvenScript).YouGotSpotted(0);Kill Player
endif
(Getowningquest() as BaboKidnapEvenScript).EscapeAttemptsCount(1)
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
(Getowningquest() as BaboKidnapEvenScript).YouGotSpotted(2);Player gets beaten
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
(Getowningquest() as BaboKidnapEvenScript).StartUptheEvent(5)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
(Getowningquest() as BaboKidnapEvenScript).StartUptheEvent(0)
actor akactor = (Kidnapper01.getreference() as actor)
int arousal = akactor.getfactionrank(sla_arousal) as int
(BaboSexController as BaboSexControllerManager).SetSLAArousal(akactor, arousal + 15)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property BaboSexController Auto
ReferenceAlias Property Kidnapper01  Auto  

GlobalVariable Property BaboKidnapEscapeAttempts  Auto  

Faction Property sla_Arousal  Auto  
