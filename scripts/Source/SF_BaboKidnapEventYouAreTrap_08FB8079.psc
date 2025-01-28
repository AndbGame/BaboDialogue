;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname SF_BaboKidnapEventYouAreTrap_08FB8079 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
(Getowningquest() as BaboKidnapEvenScript).YouGotSpotted(6)
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
actor akactor = (Kidnapper01combat.getreference() as actor)
(Getowningquest() as BaboKidnapEvenScript).StartUptheEvent(0)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Kidnapper01Combat  Auto  
Actor Property PlayerRef  Auto  
