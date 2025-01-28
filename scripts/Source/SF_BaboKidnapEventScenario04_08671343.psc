;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 4
Scriptname SF_BaboKidnapEventScenario04_08671343 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
(Getowningquest() as BaboKidnapEvenScript).StartUptheEvent(BaboKidnapScenarioe.getvalue() as int)
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
(getowningquest() as BaboKidnapEvenScript).PlayerTalkXmarkerReturn()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
(getowningquest() as BaboKidnapEvenScript).PlayerTalkXmarkerStart()
(Getowningquest() as BaboKidnapEvenScript).StartUptheEvent(0)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property BaboKidnapScenarioe  Auto  
