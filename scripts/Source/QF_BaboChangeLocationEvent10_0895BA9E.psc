;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname QF_BaboChangeLocationEvent10_0895BA9E Extends Quest Hidden

;BEGIN ALIAS PROPERTY NewLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_NewLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SpawnMarkerB
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SpawnMarkerB Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ThugA
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ThugA Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CenterMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CenterMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ThugB
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ThugB Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ThugE
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ThugE Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SpawnMarkerD
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SpawnMarkerD Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ThugC
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ThugC Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PlayerContainer
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PlayerContainer Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY OldLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_OldLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SpawnMarkerA
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SpawnMarkerA Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SpawnMarkerE
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SpawnMarkerE Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SpawnMarkerC
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SpawnMarkerC Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Hostage
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Hostage Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ThugD
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ThugD Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HouseBed
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HouseBed Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Companion
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Companion Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
if BaboDebugging.getvalue() == 1
Debug.notification("BaboDialogue: Change Location Event 10 fired")
endif
(BaboSexController as BaboSexControllerManager).StopAlltheEncounters()

if BaboChangeLocationEvent10Scene01.isplaying() == false
if SceneManager.BCLEvent10ScenePlay(1, true)
;null
else
setstage(5)
endif
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ActorBase Property BaboEncounter10BanditBoss  Auto  

ActorBase Property BaboEncounter10Bandit  Auto  

GlobalVariable Property BaboDebugging  Auto  

Quest Property BaboSexController  Auto  

Scene Property BaboChangeLocationEvent10Scene01  Auto  

BaboSceneManager Property SceneManager  Auto  
