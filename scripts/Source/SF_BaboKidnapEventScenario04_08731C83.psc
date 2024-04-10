;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 7
Scriptname SF_BaboKidnapEventScenario04_08731C83 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
(Helper01.getreference() as actor).moveto(KidnapperMarker03.getreference())
(Helper02.getreference() as actor).moveto(KidnapperMarker04.getreference())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
(getowningquest() as BaboKidnapEvenScript).PlayerTalkXmarkerReturn()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).MiscSound(KidnapperMarker04.getreference(), 3)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
(getowningquest() as BaboKidnapEvenScript).PlayerTalkXmarkerStart()
if BaboKidnapHelperRescue.getvalue() == 1
(Getowningquest() as BaboKidnapEvenScript).KidnapGotostate("BaboKidnapCabinGuard")
else
(Getowningquest() as BaboKidnapEvenScript).StartUptheEvent(0)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
(getowningquest() as BaboKidnapEvenScript).PlayerTalkXmarkerReturn()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
if BaboKidnapHelperRescue.getvalue() == 1
(Getowningquest() as BaboKidnapEvenScript).YouAreRescued()
else
(Getowningquest() as BaboKidnapEvenScript).YouGotSpotted(5)
endif
stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property BaboKidnapHelperRescue  Auto  

GlobalVariable Property BaboKidnapScenarioe  Auto  

Quest Property BaboSexController  Auto  

ReferenceAlias Property KidnapperMarker03  Auto  

ReferenceAlias Property KidnapperMarker04  Auto  

ReferenceAlias Property Helper01  Auto  

ReferenceAlias Property Helper02  Auto  
