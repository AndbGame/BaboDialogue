;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 3
Scriptname SF_BaboKidnapEventScenario04_08671341 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
BaboKidnapEscapeResponse.setvalue(Utility.randomint(0,2))
(Getowningquest() as BaboKidnapEvenScript).StartUptheEvent(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
(getowningquest() as BaboKidnapEvenScript).Nocollision(None)
(getowningquest() as BaboKidnapEvenScript).SetvehicleRef(None, CenterMarkerPlayer)
(Getowningquest() as BaboKidnapEvenScript).YouGotSpotted(3)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
if BaboKidnapEscapeResponse.getvalue() == 0
	(Getowningquest() as BaboKidnapEvenScript).KidnapEventStringOut(11)
elseif BaboKidnapEscapeResponse.getvalue() >= 1
	(Getowningquest() as BaboKidnapEvenScript).EscapeAttemptsCount(1)
	if BaboKidnapEscapeAttempts.getvalue() >= 9
		(Getowningquest() as BaboKidnapEvenScript).YouGotSpotted(4)
	endif
endif
(Getowningquest() as BaboKidnapEvenScript).SetvehicleRef(None, None)
(Getowningquest() as BaboKidnapEvenScript).StartUptheEvent(BaboKidnapScenarioe.getvalue() as int)
stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property BaboKidnapEscapeResponse  Auto  

GlobalVariable Property BaboKidnapScenarioe  Auto  

GlobalVariable Property BaboKidnapEscapeAttempts  Auto  

ReferenceAlias Property CenterMarkerPlayer  Auto  
