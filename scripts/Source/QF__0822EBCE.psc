;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 9
Scriptname QF__0822EBCE Extends Quest Hidden

;BEGIN ALIAS PROPERTY Bandit1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bandit1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PostEncounterSandboxRef
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PostEncounterSandboxRef Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldContested
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldContested Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SceneMarker3
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SceneMarker3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldImperial
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldImperial Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bandit2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bandit2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldSons
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldSons Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SceneMarker2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SceneMarker2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bandit3
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bandit3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bandit4
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bandit4 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SceneMarker1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SceneMarker1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BanditBoss
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BanditBoss Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SceneCenterMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SceneCenterMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TRIGGER
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TRIGGER Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
;debug.notification("Encounter 3 Started")
(Alias_BanditBoss.getRef() as Actor).EvaluatePackage()
(Alias_bandit1.getRef() as Actor).EvaluatePackage()
(Alias_bandit2.getRef() as Actor).EvaluatePackage()
(Alias_bandit3.getRef() as Actor).EvaluatePackage()
(Alias_bandit4.getRef() as Actor).EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
(Alias_Bandit1.getRef() as Actor).SetUnconscious(false)
(Alias_Bandit2.getRef() as Actor).SetUnconscious(false)
(Alias_Bandit3.getRef() as Actor).SetUnconscious(false)
(Alias_Bandit4.getRef() as Actor).SetUnconscious(false)
(Alias_Bandit1.getRef() as Actor).GetActorBase().SetEssential(false)
(Alias_Bandit2.getRef() as Actor).GetActorBase().SetEssential(false)
(Alias_Bandit3.getRef() as Actor).GetActorBase().SetEssential(false)
(Alias_Bandit4.getRef() as Actor).GetActorBase().SetEssential(false)
(Alias_Bandit1.getRef() as Actor).PushActorAway((Alias_Bandit1.getRef() as Actor), 1)
(Alias_Bandit2.getRef() as Actor).PushActorAway((Alias_Bandit2.getRef() as Actor), 1)
(Alias_Bandit3.getRef() as Actor).PushActorAway((Alias_Bandit3.getRef() as Actor), 1)
(Alias_Bandit4.getRef() as Actor).PushActorAway((Alias_Bandit4.getRef() as Actor), 1)

(BaboSexController as BaboSexControllerManager).pacifyAlias(Alias_BanditBoss)
(BaboSexController as BaboSexControllerManager).pacifyAlias(Alias_Bandit1)
(BaboSexController as BaboSexControllerManager).pacifyAlias(Alias_Bandit2)
(BaboSexController as BaboSexControllerManager).pacifyAlias(Alias_Bandit3)
(BaboSexController as BaboSexControllerManager).pacifyAlias(Alias_Bandit4)

Utility.Wait(3.0)

(Alias_bandit1.getRef() as Actor).EvaluatePackage()
(Alias_bandit2.getRef() as Actor).EvaluatePackage()
(Alias_bandit3.getRef() as Actor).EvaluatePackage()
(Alias_bandit4.getRef() as Actor).EvaluatePackage()
(BaboSexController as BaboSexControllerManager).EncounterEvent03Messagebox(3)
(BaboSexController as BaboSexControllerManager).CorruptionExpLoss(5.0)
(BaboSexController as BaboSexControllerManager).TraumaExpLoss(3.0)
setstage(255)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).SexCustomTag(Alias_Player, Alias_BanditBoss, Alias_Bandit2, Alias_Bandit4, None, "Aggressive", "Femdom, Bigguy", true, "Event03Sex02", "Encounter03Sex02", true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
; debug.trace(making bandits aggressive and attack player")
(BaboSexController as BaboSexControllerManager).ChallengeStart(Alias_BanditBoss)
(BaboSexController as BaboSexControllerManager).ChallengeStart(Alias_Bandit1)
(BaboSexController as BaboSexControllerManager).ChallengeStart(Alias_Bandit2)
(BaboSexController as BaboSexControllerManager).ChallengeStart(Alias_Bandit3)
(BaboSexController as BaboSexControllerManager).ChallengeStart(Alias_Bandit4)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).EncounterEvent03Messagebox(2)
(BaboSexController as BaboSexControllerManager).SexCustomTag(Alias_Player, Alias_BanditBoss, Alias_Bandit2, Alias_Bandit3, None, "Aggressive", "Femdom, Bigguy", true, "Event03Sex03", "Encounter03Sex03", true)
(BaboSexController as BaboSexControllerManager).AddGroupSexCount(3)
(BaboSexController as BaboSexControllerManager).CorruptionExp(3.0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).EncounterEvent03Messagebox(1)
(BaboSexController as BaboSexControllerManager).SexCustomTag(Alias_Player, Alias_BanditBoss, Alias_Bandit2, Alias_Bandit3, None, "Aggressive", "Femdom, Bigguy", true, "Event03Sex01", "Encounter03Sex01", true)
(BaboSexController as BaboSexControllerManager).AddGroupSexCount(4)
(BaboSexController as BaboSexControllerManager).CorruptionExp(3.0)
(BaboSexController as BaboSexControllerManager).ReputationBitchIncrease(2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
; debug.trace(self + "stage 255, calling ReArmTrigger() on trigger" + Alias_Trigger.GetReference())
(Alias_Trigger.GetReference() as WETriggerScript).ReArmTrigger()
(BaboSexController as BaboSexControllerManager).DisableEssential()

alias_BanditBoss.GetReference().DeleteWhenAble()
alias_Bandit1.GetReference().DeleteWhenAble()
alias_Bandit2.GetReference().DeleteWhenAble()
alias_Bandit3.GetReference().DeleteWhenAble()
alias_Bandit4.GetReference().DeleteWhenAble()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
(Alias_Bandit1.getRef() as Actor).SetUnconscious(false)
(Alias_Bandit2.getRef() as Actor).SetUnconscious(false)
(Alias_Bandit3.getRef() as Actor).SetUnconscious(false)
(Alias_Bandit4.getRef() as Actor).SetUnconscious(false)
(Alias_Bandit1.getRef() as Actor).GetActorBase().SetEssential(false)
(Alias_Bandit2.getRef() as Actor).GetActorBase().SetEssential(false)
(Alias_Bandit3.getRef() as Actor).GetActorBase().SetEssential(false)
(Alias_Bandit4.getRef() as Actor).GetActorBase().SetEssential(false)

(BaboSexController as BaboSexControllerManager).pacifyAlias(Alias_BanditBoss)
(BaboSexController as BaboSexControllerManager).pacifyAlias(Alias_Bandit1)
(BaboSexController as BaboSexControllerManager).pacifyAlias(Alias_Bandit2)
(BaboSexController as BaboSexControllerManager).pacifyAlias(Alias_Bandit3)
(BaboSexController as BaboSexControllerManager).pacifyAlias(Alias_Bandit4)

Utility.wait(3.0)

(BaboSexController as BaboSexControllerManager).BCLEventScenePlay(3, "BaboEncounter03")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
(Alias_BanditBoss.getRef() as Actor).EvaluatePackage()
(Alias_bandit1.getRef() as Actor).EvaluatePackage()
(Alias_bandit2.getRef() as Actor).EvaluatePackage()
(Alias_bandit3.getRef() as Actor).EvaluatePackage()
(Alias_bandit4.getRef() as Actor).EvaluatePackage()

BaboAllureQuest.AllureReturntoBasicValue()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property SceneIntro Auto
Faction Property AggressiveFaction Auto
GlobalVariable Property AllurePoints Auto
GlobalVariable Property AllureTrigger01 Auto
BaboAllureGlobalTrigger Property BaboAllureQuest  Auto  

BaboDiaQuest Property BDQuest  Auto  

BaboReputationMasterScript Property BRMQuest  Auto 

Quest Property BaboSexController Auto
