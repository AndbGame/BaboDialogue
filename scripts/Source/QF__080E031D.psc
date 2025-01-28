;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 36
Scriptname QF__080E031D Extends Quest Hidden

;BEGIN ALIAS PROPERTY CenterMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CenterMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TRIGGER
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TRIGGER Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PlayerRef
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PlayerRef Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldContested
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldContested Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Adventurer
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Adventurer Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldImperial
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldImperial Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldSons
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldSons Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_17
Function Fragment_17()
;BEGIN CODE
;Necro Rape Start
(BaboSexController as BaboSexControllerManager).EncounterEvent01Messagebox(2)
(BaboSexController as BaboSexControllerManager).BCLEventScenePlay(0, "BaboEncounter01")
(BaboSexController as BaboSexControllerManager).SexCustomTag(Alias_PlayerRef, Alias_Adventurer, None, None, None, "Necro", "Femdom, Bigguy", true, "Event01Sex02", "Encounter01Sex02", true)
(BaboSexController as BaboSexControllerManager).AddSexCount(1)
(BaboSexController as BaboSexControllerManager).CorruptionExp(1.0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_31
Function Fragment_31()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).BCLEventScenePlay(5, "BaboEncounter01")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN AUTOCAST TYPE WEScript
Quest __temp = self as Quest
WEScript kmyQuest = __temp as WEScript
;END AUTOCAST
;BEGIN CODE
;player pays "fine"
Game.GetPlayer().RemoveItem(kmyquest.WEParentS.Gold001, kmyquest.Num1 as int)
Alias_Adventurer.GetReference().AddItem(kmyquest.WEParentS.Gold001, kmyquest.Num1 as int)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_22
Function Fragment_22()
;BEGIN AUTOCAST TYPE BaboDiaQuest
Quest __temp = self as Quest
BaboDiaQuest kmyQuest = __temp as BaboDiaQuest
;END AUTOCAST
;BEGIN CODE
(Alias_Adventurer.getRef() as Actor).EvaluatePackage()
kmyQuest.fRegisterForSingleUpdateGameTime(1.0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_30
Function Fragment_30()
;BEGIN AUTOCAST TYPE BaboDiaQuest
Quest __temp = self as Quest
BaboDiaQuest kmyQuest = __temp as BaboDiaQuest
;END AUTOCAST
;BEGIN CODE
kmyQuest.fRegisterForSingleUpdateGameTime(0.4)
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
if BaboDebugging.getvalue() == 1
Debug.notification("BaboDialogue: Road Event 01 fired")
endif

(BaboSexController as BaboSexControllerManager).AppearanceCalc()
(BaboSexController as BaboSexControllerManager).SetRandomCharacterRank(Alias_Adventurer.getreference() as actor)
kmyQuest.gotostate("RoadEncounterEvent01A")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_35
Function Fragment_35()
;BEGIN AUTOCAST TYPE BaboDiaQuest
Quest __temp = self as Quest
BaboDiaQuest kmyQuest = __temp as BaboDiaQuest
;END AUTOCAST
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).SLHHActivate(Alias_Adventurer.getreference() as actor, none)
kmyQuest.fRegisterForSingleUpdateGameTime(0.5)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_26
Function Fragment_26()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).EncounterEvent01Messagebox(5)
(BaboSexController as BaboSexControllerManager).TraumaExp(-3.0)
setstage(255)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN CODE
;Rape Start
(BaboSexController as BaboSexControllerManager).EncounterEvent01Messagebox(1)
(BaboSexController as BaboSexControllerManager).SexCustomTag(Alias_PlayerRef, Alias_Adventurer, None, None, None, "Aggressive", "Femdom, Bigguy", true, "Event01Sex01", "Encounter01Sex01", true)
(BaboSexController as BaboSexControllerManager).AddSexCount(1)
(BaboSexController as BaboSexControllerManager).CorruptionExp(1.0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_34
Function Fragment_34()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).BCLEventScenePlay(4, "BaboEncounter01")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_29
Function Fragment_29()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).SLHHChokeActivate(Alias_Adventurer.getreference() as actor)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_32
Function Fragment_32()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).BCLEventScenePlay(3, "BaboEncounter01")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN AUTOCAST TYPE WEScript
Quest __temp = self as Quest
WEScript kmyQuest = __temp as WEScript
;END AUTOCAST
;BEGIN CODE
; debug.trace(self + "stage 255, calling DeleteWhenAble() on created aliases")
Actor[] actors = New Actor[1]
actors[0] = (Alias_Adventurer.GetReference() as actor)
(BaboSexController as BaboSexControllerManager).DeleteWhenAbleWithTimeout(actors, 60)

; debug.trace(self + "stage 255, calling ReArmTrigger() on trigger" + Alias_Trigger.GetReference())
(Alias_Trigger.GetReference() as WETriggerScript).ReArmTrigger()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_16
Function Fragment_16()
;BEGIN CODE
;FIght starts
(BaboSexController as BaboSexControllerManager).BCLEventScenePlay(0, "BaboEncounter01")
(Alias_Adventurer.getreference() as actor).addperk(BaboReduceIncomingDamageTrauma)
(BaboSexController as BaboSexControllerManager).ChallengeStart(alias_Adventurer)
(BaboSexController as BaboSexControllerManager).EncounterEvent01Messagebox(6)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_25
Function Fragment_25()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).EncounterEvent01Messagebox(4)
(BaboSexController as BaboSexControllerManager).ConfidenceExp(1.0)
(BaboSexController as BaboSexControllerManager).TraumaExp(-1.5)
(BaboSexController as BaboSexControllerManager).CorruptionExp(-2.0)
setstage(255)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_24
Function Fragment_24()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).EncounterEvent01Messagebox(3)
(BaboSexController as BaboSexControllerManager).ConfidenceExp(3.0)
(BaboSexController as BaboSexControllerManager).TraumaExp(-0.5)
setstage(255)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_23
Function Fragment_23()
;BEGIN CODE
;Go to Kidnap Event
(BaboSexController as BaboSexControllerManager).BCLEventScenePlay(0, "BaboEncounter01")
Actor Kidnapper = Alias_Adventurer.Getreference() as actor
Alias_Adventurer.clear()
if (BaboSexController as BaboSexControllerManager).KidnapQuestStart(Kidnapper, none, Utility.randomint(4, 6), None)
(BaboKidnapEvent as BaboKidnapEvenScript).StartUptheEvent(4)
endif
setstage(255)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_19
Function Fragment_19()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).BCLEventScenePlay(2, "BaboEncounter01")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_28
Function Fragment_28()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).BCLEventScenePlay(0, "BaboEncounter01")
(BaboSexController as BaboSexControllerManager).NPCTurntoBandit(alias_Adventurer)
;To death fight
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_27
Function Fragment_27()
;BEGIN CODE
;You are defeated, the scene starts
(BaboSexController as BaboSexControllerManager).pacifyAlias(alias_Adventurer)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_33
Function Fragment_33()
;BEGIN AUTOCAST TYPE BaboDiaQuest
Quest __temp = self as Quest
BaboDiaQuest kmyQuest = __temp as BaboDiaQuest
;END AUTOCAST
;BEGIN CODE
kmyQuest.fRegisterForSingleUpdateGameTime(0.5)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment


SexLabFramework Property SexLab  Auto 
Faction Property Banditfaction Auto
Quest Property WERaperQ Auto
BaboReputationMasterScript Property BRMQuest  Auto 

Quest Property BaboSexController  Auto  

Quest Property BaboKidnapEvent  Auto  

Perk Property BaboReduceIncomingDamageTrauma  Auto  

GlobalVariable Property BaboDebugging  Auto  
