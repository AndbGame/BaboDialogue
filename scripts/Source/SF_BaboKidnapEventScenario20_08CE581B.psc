;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname SF_BaboKidnapEventScenario20_08CE581B Extends Scene Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
if PlayerRef.getfactionrank(BaboFactionStatCorruption) >= 5
;Nothing Happens
(Getowningquest() as BaboKidnapEvenScript).StartUptheEvent(BaboKidnapScenarioe.getvalue() as int)
else
if BaboKidnapEscapeAttempts.getvalue() < 5
	(Getowningquest() as BaboKidnapEvenScript).StartUptheEvent(BaboKidnapScenarioe.getvalue() as int)
elseif BaboKidnapEscapeAttempts.getvalue() >= 5 && BaboKidnapEscapeAttempts.getvalue() < 9;slap face
	(Getowningquest() as BaboKidnapEvenScript).StartUptheEvent(BaboKidnapScenarioe.getvalue() as int)
elseif BaboKidnapEscapeAttempts.getvalue() >= 9;whipping
	(Getowningquest() as BaboKidnapEvenScript).StartUptheEvent(BaboKidnapScenarioe.getvalue() as int)
endif
endif
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
(getowningquest() as BaboKidnapEvenScript).PlayerTalkXmarkerStart()
(Getowningquest() as BaboKidnapEvenScript).StartUptheEvent(0)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property BaboKidnapScenarioe  Auto  

GlobalVariable Property BaboKidnapEscapeAttempts  Auto  

Faction Property BaboFactionStatCorruption  Auto  

Actor Property PlayerRef  Auto  
