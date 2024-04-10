;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 33
Scriptname QF__08624233 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Scene_Marker2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Scene_Marker2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PlayerRef
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PlayerRef Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldImperial
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldImperial Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bandit04
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bandit04 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BanditBoss
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BanditBoss Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TRIGGER
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TRIGGER Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldSons
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldSons Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Scene_Marker1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Scene_Marker1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bandit02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bandit02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CenterMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CenterMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY InnCenterMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_InnCenterMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PostCenterMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PostCenterMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldContested
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldContested Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bandit01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bandit01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bandit03
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bandit03 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN AUTOCAST TYPE BaboDiaQuest
Quest __temp = self as Quest
BaboDiaQuest kmyQuest = __temp as BaboDiaQuest
;END AUTOCAST
;BEGIN CODE
SceneAS01.Stop()
(Alias_Bandit01.getRef() as Actor).EvaluatePackage()
kmyQuest.RapeCustom(Alias_PlayerRef, Alias_Bandit01, Alias_Bandit02, None, None, Aggressive, Vaginal, MMF, True, AfterSexS3, AfterSexScene3, true)
BRMQuest.SexCountgangbang(2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_28
Function Fragment_28()
;BEGIN AUTOCAST TYPE BaboDiaQuest
Quest __temp = self as Quest
BaboDiaQuest kmyQuest = __temp as BaboDiaQuest
;END AUTOCAST
;BEGIN CODE
SceneAS03.Start()
Utility.wait(2)
kmyQuest.LosingControl()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_25
Function Fragment_25()
;BEGIN AUTOCAST TYPE BaboDiaQuest
Quest __temp = self as Quest
BaboDiaQuest kmyQuest = __temp as BaboDiaQuest
;END AUTOCAST
;BEGIN CODE
SceneAS02.Stop()
kmyQuest.RapeCustom(Alias_PlayerRef, Alias_Bandit03, Alias_Bandit04, None, None, Aggressive, Vaginal, MMF, True, AfterSexS3, AfterSexScene3, true)
BRMQuest.SexCount(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_21
Function Fragment_21()
;BEGIN CODE
;debug.notification("Encounter 12 Started")
(Alias_BanditBoss.getRef() as Actor).EvaluatePackage()
(Alias_Bandit01.getRef() as Actor).EvaluatePackage()
(Alias_Bandit02.getRef() as Actor).EvaluatePackage()
(Alias_Bandit03.getRef() as Actor).EvaluatePackage()
(Alias_Bandit04.getRef() as Actor).EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_32
Function Fragment_32()
;BEGIN AUTOCAST TYPE BaboDiaQuest
Quest __temp = self as Quest
BaboDiaQuest kmyQuest = __temp as BaboDiaQuest
;END AUTOCAST
;BEGIN CODE
(Alias_PlayerRef.getRef() as Actor).moveto(Alias_InnCenterMarker.getRef() as ObjectReference)
kmyQuest.LosingControl()
Utility.wait(20)
kmyQuest.RecoverControl()
(BaboSexController as BaboSexControllerManager).EncounterEvent12Messagebox(6)
Setstage(255)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_26
Function Fragment_26()
;BEGIN AUTOCAST TYPE BaboDiaQuest
Quest __temp = self as Quest
BaboDiaQuest kmyQuest = __temp as BaboDiaQuest
;END AUTOCAST
;BEGIN CODE
SceneAS02.Start()
Utility.wait(2)
kmyQuest.LosingControl()
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
kmyQuest.ChallengeStart(Alias_Bandit01)
kmyQuest.ChallengeStart(Alias_Bandit02)
kmyQuest.ChallengeStart(Alias_Bandit03)
kmyQuest.ChallengeStart(Alias_Bandit04)
(BaboSexController as BaboSexControllerManager).EncounterEvent12Messagebox(5)
Utility.wait(10.0)
Setstage(255)
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
Alias_Bandit01.GetReference().DeleteWhenAble()
Alias_Bandit02.GetReference().DeleteWhenAble()
Alias_Bandit03.GetReference().DeleteWhenAble()
Alias_Bandit04.GetReference().DeleteWhenAble()
Alias_BanditBoss.GetReference().DeleteWhenAble()

; debug.trace(self + "stage 255, calling ReArmTrigger() on trigger" + Alias_Trigger.GetReference())
(Alias_Trigger.GetReference() as WETriggerScript).ReArmTrigger()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_29
Function Fragment_29()
;BEGIN AUTOCAST TYPE BaboDiaQuest
Quest __temp = self as Quest
BaboDiaQuest kmyQuest = __temp as BaboDiaQuest
;END AUTOCAST
;BEGIN CODE
SceneAS03.Stop()
kmyQuest.RecoverControl()
(Alias_Bandit01.getRef() as Actor).EvaluatePackage()
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
SceneAS01.Start()
Utility.wait(2)
kmyQuest.LosingControl()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN AUTOCAST TYPE BaboDiaQuest
Quest __temp = self as Quest
BaboDiaQuest kmyQuest = __temp as BaboDiaQuest
;END AUTOCAST
;BEGIN CODE
kmyQuest.RapeCustom(Alias_PlayerRef, Alias_BanditBoss, None, None, None, Aggressive, Vaginal, Faint, True, AfterSexS, AfterSexScene, true)
BRMQuest.SexCount(1)
(BaboSexController as BaboSexControllerManager).EncounterEvent12Messagebox(2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_27
Function Fragment_27()
;BEGIN AUTOCAST TYPE BaboDiaQuest
Quest __temp = self as Quest
BaboDiaQuest kmyQuest = __temp as BaboDiaQuest
;END AUTOCAST
;BEGIN CODE
SceneAS01.Stop()
kmyQuest.LosingControl()
(Alias_PlayerRef.getRef() as Actor).EvaluatePackage()
(Alias_BanditBoss.getRef() as Actor).EvaluatePackage()
(BaboSexController as BaboSexControllerManager).EncounterEvent12Messagebox(3)
Utility.wait(40)
kmyQuest.RecoverControl()
kmyQuest.DraggingtoSexMarket()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_31
Function Fragment_31()
;BEGIN AUTOCAST TYPE BaboDiaQuest
Quest __temp = self as Quest
BaboDiaQuest kmyQuest = __temp as BaboDiaQuest
;END AUTOCAST
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).EncounterEvent12Messagebox(4)
Utility.wait(5)
kmyQuest.DraggingtoSexMarket()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_23
Function Fragment_23()
;BEGIN AUTOCAST TYPE BaboDiaQuest
Quest __temp = self as Quest
BaboDiaQuest kmyQuest = __temp as BaboDiaQuest
;END AUTOCAST
;BEGIN CODE
kmyQuest.ChallengeStart(Alias_BanditBoss)
kmyQuest.ChallengeStart(Alias_Bandit01)
kmyQuest.ChallengeStart(Alias_Bandit02)
kmyQuest.ChallengeStart(Alias_Bandit03)
kmyQuest.ChallengeStart(Alias_Bandit04)
(BaboSexController as BaboSexControllerManager).EncounterEvent12Messagebox(1)
Utility.wait(10.0)
Setstage(255)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment


SexLabFramework Property SexLab  Auto 
Faction Property Banditfaction Auto
Quest Property WERaperQ Auto

String Property Aggressive  Auto  

String Property Faint  Auto  

String Property Vaginal  Auto  

Scene Property SceneAS01  Auto  

String Property MMF  Auto  

Scene Property SceneAS02  Auto  

Scene Property SceneAS03  Auto  

String Property AfterSexS  Auto  

String Property AfterSexScene  Auto  

String Property AfterSexS3  Auto  

String Property AfterSexScene3  Auto  

BaboReputationMasterScript Property BRMQuest  Auto 

Quest Property BaboSexController  Auto  
