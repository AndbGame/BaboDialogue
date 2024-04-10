;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 30
Scriptname QF__0850D950 Extends Quest Hidden

;BEGIN ALIAS PROPERTY PostEncounterSandboxRef
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PostEncounterSandboxRef Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldSons
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldSons Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TRIGGER
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TRIGGER Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Scene_Marker2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Scene_Marker2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldImperial
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldImperial Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bandit03
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bandit03 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Victim
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Victim Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bandit01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bandit01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldContested
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldContested Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Scene_Marker1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Scene_Marker1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CenterMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CenterMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bandit02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bandit02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PlayerRef
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PlayerRef Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_24
Function Fragment_24()
;BEGIN AUTOCAST TYPE BaboDiaQuest
Quest __temp = self as Quest
BaboDiaQuest kmyQuest = __temp as BaboDiaQuest
;END AUTOCAST
;BEGIN CODE
kmyQuest.ChallengeStart(Alias_Bandit01)
kmyQuest.ChallengeStart(Alias_Bandit02)
kmyQuest.ChallengeStart(Alias_Bandit03)
(BaboSexController as BaboSexControllerManager).EncounterEvent10Messagebox(1)
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
kmyQuest.RapeCustom(Alias_PlayerRef, Alias_Bandit01, Alias_Bandit02, Alias_Bandit03, None, "Aggressive", "Rape", "MMMF", True, "AfterSexS", "AfterSexScene", true)
BRMQuest.SexCount(3)
kmyquest.CorruptionExp(2.0)
BRMQuest.decreaseReputation(50, 0)
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
Alias_Victim.GetReference().DeleteWhenAble()
BDQuest.DisableEssential()

; debug.trace(self + "stage 255, calling ReArmTrigger() on trigger" + Alias_Trigger.GetReference())
(Alias_Trigger.GetReference() as WETriggerScript).ReArmTrigger()
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
Alias_Bandit01.GetActorReference().GetActorBase().SetEssential(false)
Alias_Bandit02.GetActorReference().GetActorBase().SetEssential(false)
Alias_Bandit03.GetActorReference().GetActorBase().SetEssential(false)
Alias_Bandit01.GetActorReference().kill()
Alias_Bandit02.GetActorReference().kill()
Alias_Bandit03.GetActorReference().kill()
kmyQuest.DisableEssential()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_21
Function Fragment_21()
;BEGIN CODE
Utility.Wait(10.0)
Debug.SendAnimationEvent(Alias_Victim.getactorreference(), "IdleForceDefaultState")
;RescueCount.SetValue(RescueCount.GetValue() + 1)
(BaboSexController as BaboSexControllerManager).PlusRescueCount(1)
BRMQuest.IncreaseReputation(30, 0)
Setstage(255)
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
kmyQuest.RapeCustom(Alias_Victim, Alias_Bandit01, None, None, None, "Aggressive", "Rape", "MF", false, None, None, true)
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
kmyQuest.StopAllSexlabAnimations()
Utility.wait(5.0)
setstage(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_28
Function Fragment_28()
;BEGIN CODE
BaboBadendKeyword.SendStoryEvent(None, Alias_CenterMarker.getreference())
Utility.wait(1.0)
BaboBadEnd.setstage(2)
Utility.wait(2.0)
BaboBadEnd.setstage(3)
Utility.wait(4.0)
Alias_Bandit01.GetReference().Delete()
Alias_Bandit02.GetReference().Delete()
Alias_Bandit03.GetReference().Delete()
Alias_Victim.GetReference().Delete()
BaboBadEnd.setstage(5)
(BaboSexController as BaboSexControllerManager).EncounterEvent10Messagebox(2)
Utility.wait(1.0)
Setstage(255)
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
kmyQuest.pacifyAlias(Alias_Bandit01)
kmyQuest.pacifyAlias(Alias_Bandit02)
kmyQuest.pacifyAlias(Alias_Bandit03)

Alias_Bandit01.GetActorReference().RestoreActorValue("health", 100)
Alias_Bandit01.GetActorReference().SetUnconscious(false)
Alias_Bandit02.GetActorReference().RestoreActorValue("health", 100)
Alias_Bandit02.GetActorReference().SetUnconscious(false)
Alias_Bandit03.GetActorReference().RestoreActorValue("health", 100)
Alias_Bandit03.GetActorReference().SetUnconscious(false)

BDQuest.DisableEssential()
BaboEncounter10Scene02.forcestart()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_22
Function Fragment_22()
;BEGIN CODE
if BaboDebugging.getvalue() == 1
Debug.notification("Babo Encounter 10")
endif
(Alias_Bandit01.getRef() as Actor).EvaluatePackage()
(Alias_Bandit02.getRef() as Actor).EvaluatePackage()
(Alias_Bandit03.getRef() as Actor).EvaluatePackage()
(Alias_Victim.getRef() as Actor).EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment


GlobalVariable Property RescueCount Auto

BaboReputationMasterScript Property BRMQuest  Auto
BaboDiaQuest Property BDQuest Auto
Quest Property BaboBadEnd  Auto  

Keyword Property BaboBadendKeyword  Auto  

Scene Property BaboEncounter10Scene02  Auto  

GlobalVariable Property BaboDebugging  Auto  

Quest Property BaboSexController  Auto  
