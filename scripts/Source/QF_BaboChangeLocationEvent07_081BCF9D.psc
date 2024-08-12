;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 26
Scriptname QF_BaboChangeLocationEvent07_081BCF9D Extends Quest Hidden

;BEGIN ALIAS PROPERTY DrinkMarker01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DrinkMarker01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY OldLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_OldLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY RentRoomMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_RentRoomMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY RecoverMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_RecoverMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY GuestRef01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_GuestRef01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FollowerRef01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FollowerRef01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PlayerRef
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PlayerRef Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FollowerMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FollowerMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SpawnMarker01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SpawnMarker01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DrinkMarker03
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DrinkMarker03 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY NewLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_NewLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY GuestRef02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_GuestRef02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY RentRoomBed
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_RentRoomBed Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DrinkMarker02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DrinkMarker02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SpawnMarker02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SpawnMarker02 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).ChangeLocationEvent07Messagebox(3)
setstage(255)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).ChangeLocationEvent07Messagebox(2)
(BaboSexController as BaboSexControllerManager).ChangeLocationEvent07StateBegin(Alias_GuestRef02)
;Begin QTE
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
;Abduction
Actor A1 = Alias_GuestRef01.getreference() as actor
Actor A2 = Alias_GuestRef02.getreference() as actor
BaboKidnapKeyword.SendStoryEvent(BaboEventMorthalLocation, A1, A2)
Utility.wait(7.0)
(BaboKidnapEvent as BaboKidnapEvenScript).StartUptheEvent(1)
Setstage(250)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_23
Function Fragment_23()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).ReputationBitchIncrease(2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_24
Function Fragment_24()
;BEGIN CODE
Actor A1 = Alias_GuestRef01.getreference() as actor
Actor A2 = Alias_GuestRef02.getreference() as actor
BaboKidnapKeyword.SendStoryEvent(BaboEventDragonsBridgeLocation, A1, A2)
Utility.wait(7.0)
(BaboKidnapEvent as BaboKidnapEvenScript).StartUptheNormalEvent(3)
Setstage(250)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_19
Function Fragment_19()
;BEGIN CODE
;QTE Resist Success Rapists run away
(Alias_GuestRef01.getreference() as actor).evaluatepackage()
(Alias_GuestRef02.getreference() as actor).evaluatepackage()
(BaboSexController as BaboSexControllerManager).ChangeLocationEvent07Messagebox(5)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;Aliases will not be deleted
;(BaboKidnapEvent as BaboKidnapEvenScript).StartUptheEvent(1)
(BaboSexController as BaboSexControllerManager).ReputationBitchIncrease(2)
setstage(255)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_16
Function Fragment_16()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).RecoverControl(true)
BakaWellRestedBlessing.Cast(Game.GetPlayer(), Game.GetPlayer())
(BaboSexController as BaboSexControllerManager).ChangeLocationEvent07Messagebox(4)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
;Drunk Normal End. Stop BaboKidnapEvent
(BaboKidnapEvent as BaboKidnapEvenScript).KidnapQuestStopCheck()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_25
Function Fragment_25()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).ChangeLocationEvent07Messagebox(7)
(BaboSexController as BaboSexControllerManager).ChangeLocationEvent07StateBegin(Alias_GuestRef02)
;Begin QTE
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_18
Function Fragment_18()
;BEGIN CODE
;QTE Escape
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_20
Function Fragment_20()
;BEGIN CODE
;Abduction
Actor A1 = Alias_GuestRef01.getreference() as actor
Actor A2 = Alias_GuestRef02.getreference() as actor
BaboKidnapKeyword.SendStoryEvent(BaboEventRoriksteadLocation, A1, A2)
Utility.wait(7.0)
(BaboKidnapEvent as BaboKidnapEvenScript).StartUptheEvent(2)
Setstage(102)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).BCLEvent07ScenePlay(4)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN AUTOCAST TYPE BaboDiaQuest
Quest __temp = self as Quest
BaboDiaQuest kmyQuest = __temp as BaboDiaQuest
;END AUTOCAST
;BEGIN CODE
;Nothing happened
Alias_RentRoomBed.forcerefto(BaboEventMorthalRoomBedSafeRef01)
Alias_RentRoomMarker.forcerefto(BaboEventMorthalRoomXmarkerB01)
kmyQuest.FadeinMove(Alias_PlayerRef, Alias_RentRoomMarker, 100, true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
if BaboSpectatorScript.isrunning()
BaboSpectatorScript.setstage(250)
endif
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_22
Function Fragment_22()
;BEGIN CODE
Actor A1 = Alias_GuestRef01.getreference() as actor
Actor A2 = Alias_GuestRef02.getreference() as actor
BaboKidnapKeyword.SendStoryEvent(BaboEventRoriksteadLocation, A1, A2)
Utility.wait(7.0)
(BaboKidnapEvent as BaboKidnapEvenScript).StartUptheNormalEvent(2)
Setstage(250)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN AUTOCAST TYPE BaboDiaQuest
Quest __temp = self as Quest
BaboDiaQuest kmyQuest = __temp as BaboDiaQuest
;END AUTOCAST
;BEGIN CODE
kmyQuest.FadeinMove(Alias_PlayerRef, Alias_RecoverMarker, 67, true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_21
Function Fragment_21()
;BEGIN CODE
;Abduction
Actor A1 = Alias_GuestRef01.getreference() as actor
Actor A2 = Alias_GuestRef02.getreference() as actor
BaboKidnapKeyword.SendStoryEvent(BaboEventDragonsBridgeLocation, A1, A2)
Utility.wait(7.0)
(BaboKidnapEvent as BaboKidnapEvenScript).StartUptheEvent(3)
Setstage(102)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_17
Function Fragment_17()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).FadeOutScene(false)
(BaboSexController as BaboSexControllerManager).PastTime(8)
setstage(110)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
;BaboChangeLocationEvent07Scene04.forcestart()
;(BaboSexController as BaboSexControllerManager).BCLEvent07ScenePlay(2)
(BaboSexController as BaboSexControllerManager).BCLEventScenePlay(2, "BaboChangeLocationEvent07")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN AUTOCAST TYPE BaboDiaQuest
Quest __temp = self as Quest
BaboDiaQuest kmyQuest = __temp as BaboDiaQuest
;END AUTOCAST
;BEGIN CODE
(Alias_FollowerRef01.getreference() as actor).moveto(Alias_FollowerMarker.getreference())
(BaboSexController as BaboSexControllerManager).PastTime(6)
kmyQuest.RecoverControl()
(Alias_GuestRef01.getref() as actor).Delete()
(Alias_GuestRef02.getref() as actor).Delete()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
(Alias_GuestRef01.getref() as actor).Deletewhenable()
(Alias_GuestRef02.getref() as actor).Deletewhenable()
setstage(255)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
;BaboChangeLocationEvent07Scene03.forcestart()
;(BaboSexController as BaboSexControllerManager).BCLEvent07ScenePlay(3)
(BaboSexController as BaboSexControllerManager).BCLEventScenePlay(3, "BaboChangeLocationEvent07")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).ChangeLocationEvent07ScenarioStart()
Actor GuestActorRef = Alias_GuestRef01.getreference() as actor
Actor GuestActorRef02 = Alias_GuestRef02.getreference() as actor
(BaboSexController as BaboSexControllerManager).SetRandomCharacterRank(GuestActorRef)
(BaboSexController as BaboSexControllerManager).SetRandomCharacterRank(GuestActorRef02)
if (BaboSexController as BaboSexControllerManager).IsactorRapist(GuestActorRef, 50, false)
GuestActorRef02.addtofaction(SLAX_RapistFaction)
GuestActorRef.additem(BaboSkoomaLVL, 3)
GuestActorRef02.additem(BaboSkoomaLVL, 2)
endif

(BaboSexController as BaboSexControllerManager).ChangeLocationEvent07Messagebox(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN AUTOCAST TYPE BaboDiaQuest
Quest __temp = self as Quest
BaboDiaQuest kmyQuest = __temp as BaboDiaQuest
;END AUTOCAST
;BEGIN CODE
;Offer accepted
;kmyQuest.SceneForceStart(1)
(BaboSexController as BaboSexControllerManager).BCLEvent07ScenePlay(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).LosingControl()
;(BaboSexController as BaboSexControllerManager).BCLEvent07ScenePlay(1)
(BaboSexController as BaboSexControllerManager).BCLEventScenePlay(1, "BaboChangeLocationEvent07")
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property BaboKidnapEvent  Auto  

Quest Property BaboSexController  Auto  

ObjectReference Property BaboEventMorthalRoomXmarker01  Auto  

ObjectReference Property BaboEventMorthalRoomXmarker02  Auto  

ObjectReference Property BaboEventMorthalRoomXmarker03  Auto  

ObjectReference Property BaboEventMorthalRoomLeanMarker01  Auto  

Scene Property BaboChangeLocationEvent07Scene03  Auto  

Scene Property BaboChangeLocationEvent07Scene04  Auto  

Scene Property BaboChangeLocationEvent07Scene00  Auto  

Faction Property BaboWEAggressiveRapistFaction  Auto  

Faction Property SLAX_RapistFaction  Auto  

LeveledItem Property BaboSkoomaLVL  Auto  

ObjectReference Property BaboMorthalRecoverMarkerRef  Auto  

ObjectReference Property BaboMorthalFollowerRecoverMarkerRef  Auto  

Quest Property BaboSpectatorScript  Auto  

ObjectReference Property BaboEventMorthalRoomBedRef01  Auto  

Quest Property BaboReputationScript  Auto  

SPELL Property BakaWellRestedBlessing  Auto  

ObjectReference Property BaboEventMorthalRoomXmarkerB01  Auto  

ObjectReference Property BaboEventMorthalRoomBedSafeRef01  Auto  

Scene Property BaboChangeLocationEvent07SceneWellRested  Auto  

Keyword Property BaboKidnapKeyword  Auto  

Location Property BaboEventMorthalLocation  Auto  

Quest Property BaboMonitorScript  Auto  

Location Property BaboEventRoriksteadLocation  Auto  

Location Property BaboEventDragonsBridgeLocation  Auto  
