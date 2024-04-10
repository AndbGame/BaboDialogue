;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname QF_BaboRescuePoint_084BC4E9 Extends Quest Hidden

;BEGIN ALIAS PROPERTY GuardHouse
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_GuardHouse Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY RescueMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_RescueMarker Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
Game.getplayer().moveto(Alias_RescueMarker.getreference())
setstage(255)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
