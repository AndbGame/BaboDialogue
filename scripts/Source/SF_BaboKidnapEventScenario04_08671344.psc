;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 16
Scriptname SF_BaboKidnapEventScenario04_08671344 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
if BaboKidnapHelperRescue.getvalue() == 1
	(Getowningquest() as BaboKidnapEvenScript).StartUptheEvent(BaboKidnapScenarioe.getvalue() as int)
elseif BaboKidnapHelperRescue.getvalue() == 2
	(Getowningquest() as BaboKidnapEvenScript).KidnapGotostate("BaboKidnapCabinGuard")
else
	if BaboKidnapEscapeAttempts.getvalue() < 5
		(Kidnapper01.Getreference() as actor).SetRestrained(False)
		(Kidnapper01.Getreference() as actor).SetDontMove(False)
		Debug.sendanimationevent(Kidnapper01.getreference() as actor, "IdleForceDefaultState")
		(Getowningquest() as BaboKidnapEvenScript).YouGotSpotted(1)
	elseif BaboKidnapEscapeAttempts.getvalue() >= 5 && BaboKidnapEscapeAttempts.getvalue() < 9
		(Getowningquest() as BaboKidnapEvenScript).YouGotSpotted(3)
	elseif BaboKidnapEscapeAttempts.getvalue() >= 9
		(Kidnapper01.Getreference() as actor).SetRestrained(False)
		(Kidnapper01.Getreference() as actor).SetDontMove(False)
		Debug.sendanimationevent(Kidnapper01.getreference() as actor, "IdleForceDefaultState")
		(Getowningquest() as BaboKidnapEvenScript).YouGotSpotted(4)
	endif
(Getowningquest() as BaboKidnapEvenScript).StartUptheEvent(BaboKidnapScenarioe.getvalue() as int)	
endif
(Getowningquest() as BaboKidnapEvenScript).SetvehicleRef(None, None)
(Getowningquest() as BaboKidnapEvenScript).EscapeAttemptsCount(1)
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
(getowningquest() as BaboKidnapEvenScript).PlayerTalkXmarkerReturn()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
(Helper01.getreference() as actor).moveto(KidnapperMarker03.getreference())
(Helper02.getreference() as actor).moveto(KidnapperMarker04.getreference())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).MiscSound(KidnapperMarker04.getreference(), 3)
Utility.wait(1.0)
;(Getowningquest() as BaboKidnapEvenScript).YouGotSpotted(3)
(BaboSexController as BaboSexControllerManager).EventPairMotion(Kidnapper01.getreference() as actor, 0, 0, 0, 2, false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN CODE
(getowningquest() as BaboKidnapEvenScript).Nocollision(None)
(getowningquest() as BaboKidnapEvenScript).SetvehicleRef(None, CenterMarkerPlayer)
(BaboSexController as BaboSexControllerManager).EventPairMotion(Kidnapper01.getreference() as actor, 0, 0, 0, 3, false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN CODE
;if BaboPlayerGagged.getvalue() == 0
;(Getowningquest() as BaboKidnapEvenScript).EquipGag(PlayerRef, true)
;endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
(getowningquest() as BaboKidnapEvenScript).PlayerTalkXmarkerStart()
if BaboKidnapHelperRescue.getvalue() == 1
else
(Getowningquest() as BaboKidnapEvenScript).StartUptheEvent(0)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
(Helper01.getreference() as actor).moveto(KidnapperMarker05.getreference())
(Helper02.getreference() as actor).moveto(KidnapperMarker05.getreference())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN CODE
(getowningquest() as BaboKidnapEvenScript).PlayerTalkXmarkerStart()
BaboKidnapHelperRescue.setvalue(2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN CODE
(getowningquest() as BaboKidnapEvenScript).PlayerTalkXmarkerReturn()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property BaboKidnapEscapeAttempts Auto

GlobalVariable Property BaboKidnapHelperRescue  Auto  

GlobalVariable Property BaboKidnapScenarioe  Auto  

Quest Property BaboSexController  Auto  

ReferenceAlias Property KidnapperMarker04  Auto  

ReferenceAlias Property KidnapperMarker03  Auto  

ReferenceAlias Property Helper01  Auto  

ReferenceAlias Property Helper02  Auto  

ReferenceAlias Property KidnapperMarker05  Auto  

GlobalVariable Property BaboPlayerGagged  Auto  

Actor Property PlayerRef  Auto  

ReferenceAlias Property Kidnapper01  Auto  

ReferenceAlias Property CenterMarkerPlayer  Auto  
