;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 9
Scriptname SF_BaboChangeLocationEvent07_084293AC Extends Scene Hidden

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
(PlayerRef.getreference() as actor).moveto(DrinkMarker01.getreference())
(GuestRef01.getreference() as actor).moveto(DrinkMarker02.getreference())
(GuestRef02.getreference() as actor).moveto(DrinkMarker03.getreference())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
Actor GuestActorRef = GuestRef01.getreference() as actor
if GuestActorRef.isinfaction(BaboWEAggressiveRapistFaction) || GuestActorRef.isinfaction(SLAX_RapistFaction)
GetOwningQuest().setstage(60)
else
GetOwningQuest().setstage(55)
endif
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).FadeOutScene(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
Debug.SendAnimationEvent((PlayerRef.getreference() as actor), "BaboDrinkCheers")
Debug.SendAnimationEvent((GuestRef01.getreference() as actor), "BaboDrinkCheers")
Debug.SendAnimationEvent((GuestRef02.getreference() as actor), "BaboDrinkCheers")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
Debug.SendAnimationEvent((PlayerRef.getreference() as actor), "BaboDrinkCheers")
Debug.SendAnimationEvent((GuestRef01.getreference() as actor), "BaboDrinkCheers")
Debug.SendAnimationEvent((GuestRef02.getreference() as actor), "BaboDrinkCheers")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).LosingControl()
(BaboSexController as BaboSexControllerManager).FadeinScene(false)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property DrinkMarker01  Auto  

ReferenceAlias Property DrinkMarker02  Auto  

ReferenceAlias Property DrinkMarker03  Auto  

ReferenceAlias Property GuestRef01  Auto  

ReferenceAlias Property GuestRef02  Auto  

ReferenceAlias Property PlayerRef  Auto  

Faction Property BaboWEAggressiveRapistFaction  Auto  

Faction Property SLAX_RapistFaction  Auto  

Quest Property BaboSexController  Auto  
