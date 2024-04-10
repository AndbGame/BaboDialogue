;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname SF_BaboKidnapEventScenario04_08B15C08 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
actor akactor = Kidnapper01.Getreference() as actor
(Getowningquest() as BaboKidnapEvenScript).StartUptheEvent(BaboKidnapScenarioe.getvalue() as int)
Utility.wait(1.0)
(Getowningquest() as BaboKidnapEvenScript).YouGotSpotted(1)
stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Referencealias property Kidnapper01 auto
Globalvariable property BaboKidnapScenarioe auto
