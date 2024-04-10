;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname QF_BaboFollowerCLQ08_08310CEF Extends Quest Hidden

;BEGIN ALIAS PROPERTY BaboFollowerRef01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BaboFollowerRef01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FoeRef05
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FoeRef05 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY NewLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_NewLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BaboHireling02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BaboHireling02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FoeRef04
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FoeRef04 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FoeRef02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FoeRef02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BaboHireling01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BaboHireling01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BaboHireling03
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BaboHireling03 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FoeRef01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FoeRef01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FoeRef03
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FoeRef03 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
(BaboFollowerFramework as BaboFollowerFrameworkScript).QuestStart(8)
(BaboFollowerFramework as BaboFollowerFrameworkScript).SpawnFollower(8, true, Alias_BaboFollowerRef01, None, None)
(BaboFollowerFramework as BaboFollowerFrameworkScript).SpawnFollower(8, false, Alias_FoeRef01,  Alias_FoeRef02,  Alias_FoeRef03)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
(BaboFollowerFramework as BaboFollowerFrameworkScript).SpawnUniqueFoe(Alias_FoeRef01, Alias_FoeRef02, Alias_FoeRef03, Alias_FoeRef04, Alias_FoeRef05)
(BaboFollowerFramework as BaboFollowerFrameworkScript).SwitchXmarker(BaboFollowerCLQ08Marker02, BaboFollowerCLQ08Marker01)
(BaboFollowerFramework as BaboFollowerFrameworkScript).Getnaked(Alias_BaboFollowerRef01, Alias_BaboHireling01, Alias_BaboHireling02)
SetObjectiveDisplayed(5)
(BaboFollowerFramework as BaboFollowerFrameworkScript).DSlaveFaction(Alias_BaboFollowerRef01.getreference() as actor)
(BaboFollowerFramework as BaboFollowerFrameworkScript).DSlaveFaction(Alias_BaboHireling01.getreference() as actor)
(BaboFollowerFramework as BaboFollowerFrameworkScript).DSlaveFaction(Alias_BaboHireling02.getreference() as actor)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property BaboFollowerFramework  Auto  

ObjectReference Property BaboFollowerCLQ08Marker01  Auto  

ObjectReference Property BaboFollowerCLQ08Marker02  Auto  
