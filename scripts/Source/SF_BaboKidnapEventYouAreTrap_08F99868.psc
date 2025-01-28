;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 3
Scriptname SF_BaboKidnapEventYouAreTrap_08F99868 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
(getowningquest() as BaboKidnapEvenScript).ConfiscateAllItems()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
(Getowningquest() as BaboKidnapEvenScript).YouGotSpotted(1)
(Getowningquest() as BaboKidnapEvenScript).EscapeAttemptsCount(1)
(Getowningquest() as BaboKidnapEvenScript).TrappedCount(1)
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
actor akactor = (Kidnapper01.getreference() as actor)
(Getowningquest() as BaboKidnapEvenScript).StartUptheEvent(0)
(Getowningquest() as BaboKidnapEvenScript).SetAlignActor(playerref, akactor)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Globalvariable property BaboKidnapEscapeAttempts Auto
ReferenceAlias Property Kidnapper01  Auto  

Actor Property PlayerRef  Auto  
