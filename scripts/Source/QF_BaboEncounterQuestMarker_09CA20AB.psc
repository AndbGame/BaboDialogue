;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 4
Scriptname QF_BaboEncounterQuestMarker_09CA20AB Extends Quest Hidden

;BEGIN ALIAS PROPERTY BaboEncounter11PlayerChest
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BaboEncounter11PlayerChest Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
setstage(5)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;11 objective completed
Setobjectivecompleted(11)
Alias_BaboEncounter11PlayerChest.clear()
setstage(900)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;Reset all
Reset()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
Alias_BaboEncounter11PlayerChest.forcerefto(BaboEncounter11PlayerChestAlias.getreference() as objectreference)
Setobjectivedisplayed(11, 1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property BaboEncounter11PlayerChestAlias  Auto  
