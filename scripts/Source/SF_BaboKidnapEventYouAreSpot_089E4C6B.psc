;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 4
Scriptname SF_BaboKidnapEventYouAreSpot_089E4C6B Extends Scene Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
actor akactor = (Kidnapper04.getreference() as actor)
(BaboSexController as BaboSexControllerManager).EventPairMotion(akactor, 0, 0, 0, 0, false)

if BaboKidnapScenarioe.getvalue() < 20
if BaboKidnapEscapeAttempts.getvalue() <= 9
	if akactor.getfactionrank(sla_arousal) >= 60
	(Getowningquest() as BaboKidnapEvenScript).YouGotSpottedOG(akactor, 1)
	else
	(Getowningquest() as BaboKidnapEvenScript).YouGotSpotted(1)
	endif
else
(Getowningquest() as BaboKidnapEvenScript).YouGotSpottedOG(akactor, 0);Kill Player
endif
elseif (BaboKidnapScenarioe.getvalue() >= 20) && (BaboKidnapScenarioe.getvalue() < 30)
	(Getowningquest() as BaboKidnapEvenScript).YouGotSpotted(1)
endif
(Getowningquest() as BaboKidnapEvenScript).EscapeAttemptsCount(1)
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).EventPairMotion(Kidnapper04.getreference() as actor, 0, 0, 0, 1, false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
(Getowningquest() as BaboKidnapEvenScript).StartUptheEvent(0)
actor akactor = (Kidnapper04.getreference() as actor)
int arousal = akactor.getfactionrank(sla_arousal) as int
(BaboSexController as BaboSexControllerManager).SetSLAArousal(akactor, arousal + 15)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).EventPairMotion(Kidnapper04.getreference() as actor, 0, 0, 0, 6, false)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Kidnapper04  Auto  
Quest Property BaboSexController Auto
GlobalVariable Property BaboKidnapEscapeAttempts  Auto  
Faction Property sla_Arousal  Auto  

GlobalVariable Property BaboKidnapScenarioe  Auto  
