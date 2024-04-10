;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 34
Scriptname QF__083E288C Extends Quest Hidden

;BEGIN ALIAS PROPERTY myHoldLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldSons
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldSons Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldContested
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldContested Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldImperial
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldImperial Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CenterMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CenterMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Scene_Marker1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Scene_Marker1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TRIGGER
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TRIGGER Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HiredThug03
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HiredThug03 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HiredThug01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HiredThug01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HiredThug02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HiredThug02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PlayerRef
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PlayerRef Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Scene_Marker2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Scene_Marker2 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_31
Function Fragment_31()
;BEGIN CODE
BaboEncounter06Scene01.forcestart()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_33
Function Fragment_33()
;BEGIN CODE
Alias_PlayerRef.getactorreference().removeitem(gold001, 2000, Alias_HiredThug01.getactorreference())
(BaboSexController as BaboSexControllerManager).EncounterEvent06Messagebox(1)
setstage(200)
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
kmyQuest.ChallengeStart(Alias_HiredThug01)
kmyQuest.ChallengeStart(Alias_HiredThug02)
kmyQuest.ChallengeStart(Alias_HiredThug03)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_25
Function Fragment_25()
;BEGIN CODE
;Bring Player to Loanshark Organization
BaboLoanSharks.setstage(10)
setstage(255)
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
BDQuest.DisableEssential()

Alias_HiredThug01.GetReference().DeleteWhenAble()
Alias_HiredThug02.GetReference().DeleteWhenAble()
Alias_HiredThug03.GetReference().DeleteWhenAble()

; debug.trace(self + "stage 255, calling ReArmTrigger() on trigger" + Alias_Trigger.GetReference())
(Alias_Trigger.GetReference() as WETriggerScript).ReArmTrigger()
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
;Left alone
kmyQuest.FadeinMove(Alias_PlayerRef, None, 62, true)
Alias_PlayerRef.getactorreference().PlayIdle(BaboExhaustedFront03)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_32
Function Fragment_32()
;BEGIN CODE
;Bad Ending
BaboBadendKeyword.SendStoryEvent(None, Alias_CenterMarker.getreference())
Utility.wait(1.0)
BaboBadEnd.setstage(2)
Utility.wait(2.0)
BaboBadEnd.setstage(3)
Utility.wait(4.0)
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
;Lost
(Alias_HiredThug01.getRef() as Actor).SetUnconscious(false)
(Alias_HiredThug02.getRef() as Actor).SetUnconscious(false)
(Alias_HiredThug03.getRef() as Actor).SetUnconscious(false)

(Alias_HiredThug01.getRef() as Actor).GetActorBase().SetEssential(false)
(Alias_HiredThug02.getRef() as Actor).GetActorBase().SetEssential(false)
(Alias_HiredThug03.getRef() as Actor).GetActorBase().SetEssential(false)

kmyQuest.pacifyAlias(Alias_HiredThug01)
kmyQuest.pacifyAlias(Alias_HiredThug02)
kmyQuest.pacifyAlias(Alias_HiredThug03)

BaboEncounter06Scene03.forcestart()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_21
Function Fragment_21()
;BEGIN CODE
if BaboDebugging.getvalue() == 1
;Debug.notification("Babo Encounter 06")
endif
(Alias_HiredThug01.getRef() as Actor).EvaluatePackage()
(Alias_HiredThug02.getRef() as Actor).EvaluatePackage()
(Alias_HiredThug03.getRef() as Actor).EvaluatePackage()
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
kmyQuest.RapeCustom(Alias_PlayerRef, Alias_HiredThug01, Alias_HiredThug02, Alias_HiredThug03, None, "MF", "Aggressive", "Vagina", True, "AfterSexS", "AfterSexScene", true)
kmyQuest.TraumaExp(3.0)
kmyQuest.CorruptionExp(4.0)
kmyQuest.LewdnessExp(3.0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_29
Function Fragment_29()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).EncounterEvent06Messagebox(2)
setstage(255)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_26
Function Fragment_26()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).EncounterEvent06Messagebox(4)
BRMQuest.DecreaseReputation(30, 0)
Utility.wait(15.0)
Alias_HiredThug01.GetReference().Delete()
Alias_HiredThug02.GetReference().Delete()
Alias_HiredThug03.GetReference().Delete()
setstage(75)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_30
Function Fragment_30()
;BEGIN CODE
Alias_HiredThug01.GetReference().Delete()
Alias_HiredThug02.GetReference().Delete()
Alias_HiredThug03.GetReference().Delete()

(BaboSexController as BaboSexControllerManager).EncounterEvent06Messagebox(3)
setstage(255)
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
;Victory

(Alias_HiredThug01.getRef() as Actor).SetUnconscious(false)
(Alias_HiredThug02.getRef() as Actor).SetUnconscious(false)
(Alias_HiredThug03.getRef() as Actor).SetUnconscious(false)

(Alias_HiredThug01.getRef() as Actor).GetActorBase().SetEssential(false)
(Alias_HiredThug02.getRef() as Actor).GetActorBase().SetEssential(false)
(Alias_HiredThug03.getRef() as Actor).GetActorBase().SetEssential(false)

kmyQuest.pacifyAlias(Alias_HiredThug01)
kmyQuest.pacifyAlias(Alias_HiredThug02)
kmyQuest.pacifyAlias(Alias_HiredThug03)

BaboEncounter06Scene02.forcestart()
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
