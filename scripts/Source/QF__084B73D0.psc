;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 37
Scriptname QF__084B73D0 Extends Quest Hidden

;BEGIN ALIAS PROPERTY myHoldImperial
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldImperial Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Scene_Marker2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Scene_Marker2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TRIGGER
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TRIGGER Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Scene_Marker1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Scene_Marker1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldSons
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldSons Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldContested
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldContested Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HeroineDestroyer
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HeroineDestroyer Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bypasser01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bypasser01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CenterMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CenterMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PlayerAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PlayerAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bypasser02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bypasser02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TorturePoleRef
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TorturePoleRef Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldLocation Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_25
Function Fragment_25()
;BEGIN CODE
if BaboDebugging.getvalue() == 1
Debug.notification("Babo Encounter 08")
endif
setstage(5)
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
; debug.trace(self + "stage 255, calling DeleteWhenAble() on created aliases")
Alias_HeroineDestroyer.GetReference().DeleteWhenAble()


; debug.trace(self + "stage 255, calling ReArmTrigger() on trigger" + Alias_Trigger.GetReference())
(Alias_Trigger.GetReference() as WETriggerScript).ReArmTrigger()
kmyQuest.CompatiblityCheck(False)
(BaboSexController as BaboSexControllerManager).DisableEssential()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_29
Function Fragment_29()
;BEGIN CODE
BaboEncounter08Variable.setvalue(0)
Alias_HeroineDestroyer.forcerefto(Alias_Centermarker.getreference().placeatme(BaboEncounter08Challenger))
Alias_HeroineDestroyer.getactorreference().evaluatepackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_31
Function Fragment_31()
;BEGIN CODE
BaboEncounter08Variable.setvalue(2)
Alias_HeroineDestroyer.forcerefto(Alias_Centermarker.getreference().placeatme(BaboEncounter08HeroineKiller))
Alias_HeroineDestroyer.getactorreference().evaluatepackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_32
Function Fragment_32()
;BEGIN CODE
BaboEncounter08Variable.setvalue(3)
Alias_HeroineDestroyer.forcerefto(Alias_Centermarker.getreference().placeatme(BaboEncounter08Thug))
Alias_HeroineDestroyer.getactorreference().evaluatepackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_35
Function Fragment_35()
;BEGIN CODE
;win
(BaboSexController as BaboSexControllerManager).DisableEssential()
BRMQuest.IncreaseReputation(10, 0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_28
Function Fragment_28()
;BEGIN CODE
MsgCtrl.EncounterEvent08Messagebox(2)
BRMQuest.DecreaseReputation(30, 0)
Utility.wait(5.0)
Alias_HeroineDestroyer.GetReference().Delete()
setstage(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_36
Function Fragment_36()
;BEGIN CODE
BaboBadEndManualStart.SetValue(1)
BaboBadendKeyword.SendStoryEvent(None, Alias_CenterMarker.getreference())
Utility.wait(1.0)
(BaboBadEnd as BaboBadEndQuest).Fadein()

setstage(45)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_30
Function Fragment_30()
;BEGIN CODE
BaboEncounter08Variable.setvalue(1)
Alias_HeroineDestroyer.forcerefto(Alias_Centermarker.getreference().placeatme(BaboEncounter08HeroineKiller))
Alias_HeroineDestroyer.getactorreference().evaluatepackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_26
Function Fragment_26()
;BEGIN CODE
;He left me
BaboBadEnd.setstage(5)
setstage(255)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_24
Function Fragment_24()
;BEGIN AUTOCAST TYPE BaboDiaQuest
Quest __temp = self as Quest
BaboDiaQuest kmyQuest = __temp as BaboDiaQuest
;END AUTOCAST
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).pacifyAlias(Alias_HeroineDestroyer)
Utility.Wait(3.0)
SceneManager.Encounter08ScenePlay(1, true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_21
Function Fragment_21()
;BEGIN AUTOCAST TYPE BaboDiaQuest
Quest __temp = self as Quest
BaboDiaQuest kmyQuest = __temp as BaboDiaQuest
;END AUTOCAST
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).ChallengeStart(Alias_HeroineDestroyer)
kmyQuest.gotostate("RoadEncounterEvent08")
MsgCtrl.EncounterEvent08Messagebox(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_23
Function Fragment_23()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).DisableEssential()
(BaboSexController as BaboSexControllerManager).SexCustom(Alias_PlayerAlias, Alias_HeroineDestroyer, None, None, None, "MF", "Vaginal", "Doggy", True, "Event08Sex01", "Encounter08Sex01", true)
BRMQuest.SexCount(1)
(BaboSexController as BaboSexControllerManager).CorruptionExp(1.0)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Faction Property AggressiveFaction Auto

BaboDiaQuest Property BDQuest  Auto 

BaboReputationMasterScript Property BRMQuest  Auto  

String Property rape  Auto  

String Property doggy  Auto  

String Property vaginal  Auto  


String Property AfterSexScene  Auto  

String Property AfterSexS  Auto  

Furniture Property zbfTorturePoleCustom03StdWood  Auto  

Scene Property BaboEncounter08Scene01  Auto  

GlobalVariable Property GameHour  Auto  

GlobalVariable Property BaboEncounter08Variable  Auto  

ActorBase Property BaboEncounter08Challenger  Auto  

ActorBase Property BaboEncounter08HeroineKiller  Auto  

Keyword Property BaboBadendKeyword  Auto  

Quest Property BaboBadEnd  Auto  

GlobalVariable Property BaboCombatEssentialSwitch  Auto  

ReferenceAlias Property PlayerEssential  Auto  

ActorBase Property BaboEncounter08Thug  Auto  

GlobalVariable Property BaboDebugging  Auto  

Quest Property BaboSexController  Auto  

BaboMsgManager Property MsgCtrl  Auto  

BaboSceneManager Property SceneManager  Auto  

GlobalVariable Property BaboBadEndManualStart  Auto
