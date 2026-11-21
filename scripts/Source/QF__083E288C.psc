;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 42
Scriptname QF__083E288C Extends Quest Hidden

;BEGIN ALIAS PROPERTY Scene_Marker2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Scene_Marker2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldImperial
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldImperial Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldSons
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldSons Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Scene_Marker1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Scene_Marker1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PlayerAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PlayerAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TRIGGER
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TRIGGER Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HiredThug01Marker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HiredThug01Marker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PlayerDialogueMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PlayerDialogueMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldContested
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldContested Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HiredThug02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HiredThug02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HiredThug03
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HiredThug03 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PlayerAliasMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PlayerAliasMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HiredThug01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HiredThug01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LookOutMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LookOutMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CenterMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CenterMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PostGoalMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PostGoalMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BountyNote
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BountyNote Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HiredThug03Marker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HiredThug03Marker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HiredThug02Marker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HiredThug02Marker Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN AUTOCAST TYPE WEScript
Quest __temp = self as Quest
WEScript kmyQuest = __temp as WEScript
;END AUTOCAST
;BEGIN CODE
; debug.trace(self + "stage 255, calling DeleteWhenAble() on created aliases")
BDQuest.DisableEssential()
BaboEventLoanSharkCollectInterestReady.setvalue(0)
(BaboSexController as BaboSexControllerManager).RecoverRingMarkers()
Actor[] actors = New Actor[3]
actors[0] = (Alias_HiredThug01.GetReference() as actor)
actors[1] = (Alias_HiredThug02.GetReference() as actor)
actors[2] = (Alias_HiredThug03.GetReference() as actor)
(BaboSexController as BaboSexControllerManager).DeleteWhenAbleWithTimeout(actors, 60)
; debug.trace(self + "stage 255, calling ReArmTrigger() on trigger" + Alias_Trigger.GetReference())
(Alias_Trigger.GetReference() as WETriggerScript).ReArmTrigger()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_33
Function Fragment_33()
;BEGIN AUTOCAST TYPE BaboEncounter06Script
Quest __temp = self as Quest
BaboEncounter06Script kmyQuest = __temp as BaboEncounter06Script
;END AUTOCAST
;BEGIN CODE
(Alias_HiredThug01.GetReference() as actor).evaluatepackage()
if Alias_HiredThug02
(Alias_HiredThug02.GetReference() as actor).evaluatepackage()
endif
if Alias_HiredThug03
(Alias_HiredThug03.GetReference() as actor).evaluatepackage()
endif
kmyQuest.PrepareBribeCosts()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_25
Function Fragment_25()
;BEGIN CODE
;Bring Player to Loanshark Organization
(BaboLoanSharks as BaboLoanSharkScript).FailRepay()
setstage(255)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_38
Function Fragment_38()
;BEGIN AUTOCAST TYPE BaboEncounter06Script
Quest __temp = self as Quest
BaboEncounter06Script kmyQuest = __temp as BaboEncounter06Script
;END AUTOCAST
;BEGIN CODE
(Alias_HiredThug01.GetReference() as actor).evaluatepackage()
if Alias_HiredThug02
(Alias_HiredThug02.GetReference() as actor).evaluatepackage()
endif
if Alias_HiredThug03
(Alias_HiredThug03.GetReference() as actor).evaluatepackage()
endif
kmyQuest.StartSexHereCapture()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_41
Function Fragment_41()
;BEGIN AUTOCAST TYPE BaboEncounter06Script
Quest __temp = self as Quest
BaboEncounter06Script kmyQuest = __temp as BaboEncounter06Script
;END AUTOCAST
;BEGIN CODE
kmyQuest.ThugsKilled()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_28
Function Fragment_28()
;BEGIN AUTOCAST TYPE BaboEncounter06Script
Quest __temp = self as Quest
BaboEncounter06Script kmyQuest = __temp as BaboEncounter06Script
;END AUTOCAST
;BEGIN CODE
kmyQuest.ShowSubmitChoice()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_27
Function Fragment_27()
;BEGIN AUTOCAST TYPE BaboEncounter06Script
Quest __temp = self as Quest
BaboEncounter06Script kmyQuest = __temp as BaboEncounter06Script
;END AUTOCAST
;BEGIN CODE
kmyQuest.BeginWalkAwayLeave()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_23
Function Fragment_23()
;BEGIN AUTOCAST TYPE BaboEncounter06Script
Quest __temp = self as Quest
BaboEncounter06Script kmyQuest = __temp as BaboEncounter06Script
;END AUTOCAST
;BEGIN CODE
kmyQuest.BeginWalkAwayLeave()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_37
Function Fragment_37()
;BEGIN AUTOCAST TYPE BaboEncounter06Script
Quest __temp = self as Quest
BaboEncounter06Script kmyQuest = __temp as BaboEncounter06Script
;END AUTOCAST
;BEGIN CODE
kmyQuest.BeginSurrender()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_34
Function Fragment_34()
;BEGIN AUTOCAST TYPE BaboEncounter06Script
Quest __temp = self as Quest
BaboEncounter06Script kmyQuest = __temp as BaboEncounter06Script
;END AUTOCAST
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).ConfidenceExp(3.0)
(BaboSexController as BaboSexControllerManager).CorruptionExp(-3.0)
kmyQuest.BeginWalkAwayLeave()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_39
Function Fragment_39()
;BEGIN AUTOCAST TYPE BaboEncounter06Script
Quest __temp = self as Quest
BaboEncounter06Script kmyQuest = __temp as BaboEncounter06Script
;END AUTOCAST
;BEGIN CODE
kmyQuest.RelocateThenStartSeduceSex()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_40
Function Fragment_40()
;BEGIN AUTOCAST TYPE BaboEncounter06Script
Quest __temp = self as Quest
BaboEncounter06Script kmyQuest = __temp as BaboEncounter06Script
;END AUTOCAST
;BEGIN CODE
kmyQuest.LeaveUnderBlack()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_26
Function Fragment_26()
;BEGIN AUTOCAST TYPE BaboEncounter06Script
Quest __temp = self as Quest
BaboEncounter06Script kmyQuest = __temp as BaboEncounter06Script
;END AUTOCAST
;BEGIN CODE
kmyQuest.StartEncounterCombat()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_21
Function Fragment_21()
;BEGIN AUTOCAST TYPE BaboEncounter06Script
Quest __temp = self as Quest
BaboEncounter06Script kmyQuest = __temp as BaboEncounter06Script
;END AUTOCAST
;BEGIN CODE
if BaboDebugging.getvalue() == 1
;Debug.notification("Babo Encounter 06")
endif
kmyQuest.SetupEncounter()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_32
Function Fragment_32()
;BEGIN AUTOCAST TYPE BaboEncounter06Script
Quest __temp = self as Quest
BaboEncounter06Script kmyQuest = __temp as BaboEncounter06Script
;END AUTOCAST
;BEGIN CODE
kmyQuest.BeginCombatDefeat()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_36
Function Fragment_36()
;BEGIN AUTOCAST TYPE BaboEncounter06Script
Quest __temp = self as Quest
BaboEncounter06Script kmyQuest = __temp as BaboEncounter06Script
;END AUTOCAST
;BEGIN CODE
kmyQuest.BeginSubmitKneel()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_35
Function Fragment_35()
;BEGIN AUTOCAST TYPE BaboEncounter06Script
Quest __temp = self as Quest
BaboEncounter06Script kmyQuest = __temp as BaboEncounter06Script
;END AUTOCAST
;BEGIN CODE
kmyQuest.EndEncounterCombat()
kmyQuest.ShowVictoryChoice()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property BaboLoanSharks  Auto  

GlobalVariable Property BaboPunishGlobal  Auto  

Scene Property BaboEncounter06Scene02  Auto  

Idle Property BaboExhaustedFront03  Auto  

BaboDiaQuest Property BDQuest Auto

Scene Property BaboEncounter06Scene03  Auto  

Scene Property BaboEncounter06Scene01  Auto  

BaboReputationMasterScript Property BRMQuest  Auto  

Quest Property BaboBadEnd  Auto  

MiscObject Property Gold001  Auto  

Keyword Property BaboBadendKeyword  Auto  

GlobalVariable Property BaboDebugging  Auto  

Quest Property BaboSexController  Auto  

BaboMsgManager Property MsgCtrl  Auto  

BaboSceneManager Property SceneManager  Auto  
ReferenceAlias[] Property HiredThugs  Auto  

BaboBadEndQuest Property BadEndQuest  Auto  

GlobalVariable Property BaboEventLoanSharkCollectInterestReady  Auto  
