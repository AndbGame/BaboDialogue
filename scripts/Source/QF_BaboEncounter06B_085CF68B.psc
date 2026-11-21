;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 37
Scriptname QF_BaboEncounter06B_085CF68B Extends Quest Hidden

;BEGIN ALIAS PROPERTY MarkerInCurrentHold
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MarkerInCurrentHold Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SyndicateBrawn03
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SyndicateBrawn03 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY InnCenterMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_InnCenterMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DebtCollector
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DebtCollector Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SyndicateBrawn01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SyndicateBrawn01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SyndicateBrawn04Marker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SyndicateBrawn04Marker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PlayerAliasMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PlayerAliasMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SyndicateBrawn01Marker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SyndicateBrawn01Marker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TRIGGER
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TRIGGER Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PlayerAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PlayerAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SpawnMarkerCenter
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SpawnMarkerCenter Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SyndicateBrawn04
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SyndicateBrawn04 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PlayerDialogueMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PlayerDialogueMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DebtCollectorMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DebtCollectorMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SyndicateBrawn03Marker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SyndicateBrawn03Marker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SyndicateBrawn02Marker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SyndicateBrawn02Marker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SyndicateBrawn02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SyndicateBrawn02 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_23
Function Fragment_23()
;BEGIN AUTOCAST TYPE BaboEncounter06BScript
Quest __temp = self as Quest
BaboEncounter06BScript kmyQuest = __temp as BaboEncounter06BScript
;END AUTOCAST
;BEGIN CODE
(Alias_PlayerAlias as BaboBrawlingPlayerREF).CheckEssential()
(Alias_PlayerAlias as BaboBrawlingPlayerREF).RegisterOnHitExExtra(Alias_SyndicateBrawn01.getreference() as actor)
(Alias_PlayerAlias as BaboBrawlingPlayerREF).RegisterOnHitExExtra(Alias_SyndicateBrawn02.getreference() as actor)
(Alias_PlayerAlias as BaboBrawlingPlayerREF).RegisterOnHitExExtra(Alias_SyndicateBrawn03.getreference() as actor)
(Alias_PlayerAlias as BaboBrawlingPlayerREF).RegisterOnHitExExtra(Alias_SyndicateBrawn04.getreference() as actor)
kmyQuest.RegisterSurrenderEvent()
(BaboSexController as BaboSexControllerManager).ChallengeStartArray(Crews)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_24
Function Fragment_24()
;BEGIN AUTOCAST TYPE BaboEncounter06BScript
Quest __temp = self as Quest
BaboEncounter06BScript kmyQuest = __temp as BaboEncounter06BScript
;END AUTOCAST
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).ReadySurrender(false)
kmyQuest.RecoverCrewAfterCombat()

(Alias_DebtCollector.getreference() as Actor).GetActorBase().SetEssential(false)
(Alias_SyndicateBrawn01.getreference() as Actor).GetActorBase().SetEssential(false)
(Alias_SyndicateBrawn02.getreference() as Actor).GetActorBase().SetEssential(false)
(Alias_SyndicateBrawn03.getreference() as Actor).GetActorBase().SetEssential(false)
(Alias_SyndicateBrawn04.getreference() as Actor).GetActorBase().SetEssential(false)

(BaboSexController as BaboSexControllerManager).pacifyAliasArray(Crews)
(Alias_PlayerAlias as BaboBrawlingPlayerREF).ClearEssential()
kmyQuest.PlaceCrewRing()
SceneManager.Encounter06BScenePlay(8, true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN AUTOCAST TYPE BaboEncounter06BScript
Quest __temp = self as Quest
BaboEncounter06BScript kmyQuest = __temp as BaboEncounter06BScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.SettleMetQuota()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_18
Function Fragment_18()
;BEGIN AUTOCAST TYPE BaboEncounter06BScript
Quest __temp = self as Quest
BaboEncounter06BScript kmyQuest = __temp as BaboEncounter06BScript
;END AUTOCAST
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).ReadySurrender(false)
(BaboSexController as BaboSexControllerManager).pacifyAliasArray(Crews)
(Alias_PlayerAlias as BaboBrawlingPlayerREF).ClearEssential()
kmyQuest.ResolveVictory()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN AUTOCAST TYPE BaboEncounter06BScript
Quest __temp = self as Quest
BaboEncounter06BScript kmyQuest = __temp as BaboEncounter06BScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.CollectPlayerGoldAndSettle()
kmyQuest.ConfiscateValuableMisc()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN AUTOCAST TYPE BaboEncounter06BScript
Quest __temp = self as Quest
BaboEncounter06BScript kmyQuest = __temp as BaboEncounter06BScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.ResetVisitVariables()
kmyQuest.MoveAlreadySpawnedCrew()
BaboEncounter06Variable.setvalue(4)
(Alias_DebtCollector.getreference() as actor).evaluatepackage()
(Alias_SyndicateBrawn01.getreference() as actor).evaluatepackage()
(Alias_SyndicateBrawn02.getreference() as actor).evaluatepackage()
(Alias_SyndicateBrawn03.getreference() as actor).evaluatepackage()
(Alias_SyndicateBrawn04.getreference() as actor).evaluatepackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_21
Function Fragment_21()
;BEGIN AUTOCAST TYPE BaboEncounter06BScript
Quest __temp = self as Quest
BaboEncounter06BScript kmyQuest = __temp as BaboEncounter06BScript
;END AUTOCAST
;BEGIN CODE
;kmyQuest.ConfiscateValuableMisc()
;SetStage(250)
kmyQuest.PlaySettleResultScene()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_26
Function Fragment_26()
;BEGIN AUTOCAST TYPE BaboEncounter06BScript
Quest __temp = self as Quest
BaboEncounter06BScript kmyQuest = __temp as BaboEncounter06BScript
;END AUTOCAST
;BEGIN CODE
(Alias_DebtCollector.getreference() as actor).evaluatepackage()
(Alias_SyndicateBrawn01.getreference() as actor).evaluatepackage()
(Alias_SyndicateBrawn02.getreference() as actor).evaluatepackage()
(Alias_SyndicateBrawn03.getreference() as actor).evaluatepackage()
(Alias_SyndicateBrawn04.getreference() as actor).evaluatepackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN AUTOCAST TYPE BaboEncounter06BScript
Quest __temp = self as Quest
BaboEncounter06BScript kmyQuest = __temp as BaboEncounter06BScript
;END AUTOCAST
;BEGIN CODE
MsgCtrl.EncounterEvent06BMessagebox(2)
(Alias_PlayerAlias as BaboBrawlingPlayerREF).CheckEssential()
(Alias_PlayerAlias as BaboBrawlingPlayerREF).RegisterOnHitExExtra(Alias_SyndicateBrawn01.getreference() as actor)
(Alias_PlayerAlias as BaboBrawlingPlayerREF).RegisterOnHitExExtra(Alias_SyndicateBrawn02.getreference() as actor)
(Alias_PlayerAlias as BaboBrawlingPlayerREF).RegisterOnHitExExtra(Alias_SyndicateBrawn03.getreference() as actor)
(Alias_PlayerAlias as BaboBrawlingPlayerREF).RegisterOnHitExExtra(Alias_SyndicateBrawn04.getreference() as actor)
kmyQuest.RegisterSurrenderEvent()
(BaboSexController as BaboSexControllerManager).ChallengeStartArray(Crews)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_31
Function Fragment_31()
;BEGIN AUTOCAST TYPE BaboEncounter06BScript
Quest __temp = self as Quest
BaboEncounter06BScript kmyQuest = __temp as BaboEncounter06BScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.PromiseGuildVisit()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN AUTOCAST TYPE BaboEncounter06BScript
Quest __temp = self as Quest
BaboEncounter06BScript kmyQuest = __temp as BaboEncounter06BScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.FirstMeetNoCoin()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN AUTOCAST TYPE BaboEncounter06BScript
Quest __temp = self as Quest
BaboEncounter06BScript kmyQuest = __temp as BaboEncounter06BScript
;END AUTOCAST
;BEGIN CODE
(Alias_PlayerAlias as BaboBrawlingPlayerREF).CheckEssential()
(Alias_PlayerAlias as BaboBrawlingPlayerREF).RegisterOnHitExExtra(Alias_SyndicateBrawn01.getreference() as actor)
(Alias_PlayerAlias as BaboBrawlingPlayerREF).RegisterOnHitExExtra(Alias_SyndicateBrawn02.getreference() as actor)
(Alias_PlayerAlias as BaboBrawlingPlayerREF).RegisterOnHitExExtra(Alias_SyndicateBrawn03.getreference() as actor)
(Alias_PlayerAlias as BaboBrawlingPlayerREF).RegisterOnHitExExtra(Alias_SyndicateBrawn04.getreference() as actor)
kmyQuest.ClearCrewDamageHandicap()
kmyQuest.RegisterSurrenderEvent()
(BaboSexController as BaboSexControllerManager).ChallengeStartArray(Crews)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN AUTOCAST TYPE BaboEncounter06BScript
Quest __temp = self as Quest
BaboEncounter06BScript kmyQuest = __temp as BaboEncounter06BScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.ReturnVisitNotEnough()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN AUTOCAST TYPE BaboEncounter06BScript
Quest __temp = self as Quest
BaboEncounter06BScript kmyQuest = __temp as BaboEncounter06BScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.CollectPlayerGoldAndSettle()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_27
Function Fragment_27()
;BEGIN AUTOCAST TYPE BaboEncounter06BScript
Quest __temp = self as Quest
BaboEncounter06BScript kmyQuest = __temp as BaboEncounter06BScript
;END AUTOCAST
;BEGIN CODE
(Alias_DebtCollector.getreference() as actor).evaluatepackage()
(Alias_SyndicateBrawn01.getreference() as actor).evaluatepackage()
(Alias_SyndicateBrawn02.getreference() as actor).evaluatepackage()
(Alias_SyndicateBrawn03.getreference() as actor).evaluatepackage()
(Alias_SyndicateBrawn04.getreference() as actor).evaluatepackage()

kmyQuest.KnockOutPlayer("BaboDogejaLoop", 11)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN AUTOCAST TYPE BaboEncounter06BScript
Quest __temp = self as Quest
BaboEncounter06BScript kmyQuest = __temp as BaboEncounter06BScript
;END AUTOCAST
;BEGIN CODE
MsgCtrl.EncounterEvent06BMessagebox(1)
(Alias_PlayerAlias as BaboBrawlingPlayerREF).CheckEssential()
(Alias_PlayerAlias as BaboBrawlingPlayerREF).RegisterOnHitExExtra(Alias_SyndicateBrawn01.getreference() as actor)
(Alias_PlayerAlias as BaboBrawlingPlayerREF).RegisterOnHitExExtra(Alias_SyndicateBrawn02.getreference() as actor)
(Alias_PlayerAlias as BaboBrawlingPlayerREF).RegisterOnHitExExtra(Alias_SyndicateBrawn03.getreference() as actor)
(Alias_PlayerAlias as BaboBrawlingPlayerREF).RegisterOnHitExExtra(Alias_SyndicateBrawn04.getreference() as actor)
kmyQuest.RegisterSurrenderEvent()
(BaboSexController as BaboSexControllerManager).ChallengeStartArray(Crews)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN AUTOCAST TYPE BaboEncounter06BScript
Quest __temp = self as Quest
BaboEncounter06BScript kmyQuest = __temp as BaboEncounter06BScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.SettleMetQuota()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_34
Function Fragment_34()
;BEGIN AUTOCAST TYPE BaboEncounter06BScript
Quest __temp = self as Quest
BaboEncounter06BScript kmyQuest = __temp as BaboEncounter06BScript
;END AUTOCAST
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).ReadySurrender(false)
(Alias_PlayerAlias as BaboBrawlingPlayerREF).ClearEssential()
kmyQuest.ResolveVictoryStalker()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_25
Function Fragment_25()
;BEGIN AUTOCAST TYPE BaboEncounter06BScript
Quest __temp = self as Quest
BaboEncounter06BScript kmyQuest = __temp as BaboEncounter06BScript
;END AUTOCAST
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).pacifyAliasArray(Crews)
(BaboSexController as BaboSexControllerManager).ReadySurrender(false)
(Alias_PlayerAlias as BaboBrawlingPlayerREF).ClearEssential()
kmyQuest.CombatDefeated(3)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_33
Function Fragment_33()
;BEGIN AUTOCAST TYPE BaboEncounter06BScript
Quest __temp = self as Quest
BaboEncounter06BScript kmyQuest = __temp as BaboEncounter06BScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.SpawnStalker()
BaboEncounter06Variable.setvalue(4)
(Alias_DebtCollector.getreference() as actor).evaluatepackage()
(Alias_SyndicateBrawn01.getreference() as actor).evaluatepackage()
(Alias_SyndicateBrawn02.getreference() as actor).evaluatepackage()
(Alias_SyndicateBrawn03.getreference() as actor).evaluatepackage()
(Alias_SyndicateBrawn04.getreference() as actor).evaluatepackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE BaboEncounter06BScript
Quest __temp = self as Quest
BaboEncounter06BScript kmyQuest = __temp as BaboEncounter06BScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.SpawnCrewIfFirstEncounter()
BaboEncounter06Variable.setvalue(4)
(Alias_DebtCollector.getreference() as actor).evaluatepackage()
(Alias_SyndicateBrawn01.getreference() as actor).evaluatepackage()
(Alias_SyndicateBrawn02.getreference() as actor).evaluatepackage()
(Alias_SyndicateBrawn03.getreference() as actor).evaluatepackage()
(Alias_SyndicateBrawn04.getreference() as actor).evaluatepackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_36
Function Fragment_36()
;BEGIN AUTOCAST TYPE BaboEncounter06BScript
Quest __temp = self as Quest
BaboEncounter06BScript kmyQuest = __temp as BaboEncounter06BScript
;END AUTOCAST
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).ReadySurrender(false)
(Alias_PlayerAlias as BaboBrawlingPlayerREF).ClearEssential()
kmyQuest.EndEncounterFledFromStalkers()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_32
Function Fragment_32()
;BEGIN AUTOCAST TYPE BaboEncounter06BScript
Quest __temp = self as Quest
BaboEncounter06BScript kmyQuest = __temp as BaboEncounter06BScript
;END AUTOCAST
;BEGIN CODE
(Alias_DebtCollector.getreference() as Actor).SetUnconscious(false)
(Alias_SyndicateBrawn01.getreference() as Actor).SetUnconscious(false)
(Alias_SyndicateBrawn02.getreference() as Actor).SetUnconscious(false)
(Alias_SyndicateBrawn03.getreference() as Actor).SetUnconscious(false)
(Alias_SyndicateBrawn04.getreference() as Actor).SetUnconscious(false)
(BaboSexController as BaboSexControllerManager).ReadySurrender(false)
kmyQuest.RecoverCrewAfterCombat()

(Alias_DebtCollector.getreference() as Actor).GetActorBase().SetEssential(false)
(Alias_SyndicateBrawn01.getreference() as Actor).GetActorBase().SetEssential(false)
(Alias_SyndicateBrawn02.getreference() as Actor).GetActorBase().SetEssential(false)
(Alias_SyndicateBrawn03.getreference() as Actor).GetActorBase().SetEssential(false)
(Alias_SyndicateBrawn04.getreference() as Actor).GetActorBase().SetEssential(false)

(BaboSexController as BaboSexControllerManager).pacifyAliasArray(Crews)
(Alias_PlayerAlias as BaboBrawlingPlayerREF).ClearEssential()
kmyQuest.PlaceCrewRing()
SceneManager.Encounter06BScenePlay(7, true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
BaboEventLoanSharkCollectInterestReady.setvalue(0)
BaboPlayerGotStrippedGlobal.SetValue(0)
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_30
Function Fragment_30()
;BEGIN AUTOCAST TYPE BaboEncounter06BScript
Quest __temp = self as Quest
BaboEncounter06BScript kmyQuest = __temp as BaboEncounter06BScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.TellCrewGetLost()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_29
Function Fragment_29()
;BEGIN AUTOCAST TYPE BaboEncounter06BScript
Quest __temp = self as Quest
BaboEncounter06BScript kmyQuest = __temp as BaboEncounter06BScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.GotoGuild(180)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_16
Function Fragment_16()
;BEGIN AUTOCAST TYPE BaboEncounter06BScript
Quest __temp = self as Quest
BaboEncounter06BScript kmyQuest = __temp as BaboEncounter06BScript
;END AUTOCAST
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).ReadySurrender(false)
kmyQuest.RecoverCrewAfterCombat()

(Alias_DebtCollector.getreference() as Actor).GetActorBase().SetEssential(false)
(Alias_SyndicateBrawn01.getreference() as Actor).GetActorBase().SetEssential(false)
(Alias_SyndicateBrawn02.getreference() as Actor).GetActorBase().SetEssential(false)
(Alias_SyndicateBrawn03.getreference() as Actor).GetActorBase().SetEssential(false)
(Alias_SyndicateBrawn04.getreference() as Actor).GetActorBase().SetEssential(false)

(BaboSexController as BaboSexControllerManager).pacifyAliasArray(Crews)
(Alias_PlayerAlias as BaboBrawlingPlayerREF).ClearEssential()
kmyQuest.PlaceCrewRing()
SceneManager.Encounter06BScenePlay(9, true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_20
Function Fragment_20()
;BEGIN AUTOCAST TYPE BaboEncounter06BScript
Quest __temp = self as Quest
BaboEncounter06BScript kmyQuest = __temp as BaboEncounter06BScript
;END AUTOCAST
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).ReadySurrender(false)
(Alias_PlayerAlias as BaboBrawlingPlayerREF).ClearEssential()
kmyQuest.EndEncounterFled(8)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN AUTOCAST TYPE BaboEncounter06BScript
Quest __temp = self as Quest
BaboEncounter06BScript kmyQuest = __temp as BaboEncounter06BScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.SettleOverpaySplitToGuild()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_17
Function Fragment_17()
;BEGIN AUTOCAST TYPE BaboEncounter06BScript
Quest __temp = self as Quest
BaboEncounter06BScript kmyQuest = __temp as BaboEncounter06BScript
;END AUTOCAST
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).ReadySurrender(false)
kmyQuest.RecoverCrewAfterCombat()

(Alias_DebtCollector.getreference() as Actor).GetActorBase().SetEssential(false)
(Alias_SyndicateBrawn01.getreference() as Actor).GetActorBase().SetEssential(false)
(Alias_SyndicateBrawn02.getreference() as Actor).GetActorBase().SetEssential(false)
(Alias_SyndicateBrawn03.getreference() as Actor).GetActorBase().SetEssential(false)
(Alias_SyndicateBrawn04.getreference() as Actor).GetActorBase().SetEssential(false)

(BaboSexController as BaboSexControllerManager).pacifyAliasArray(Crews)
(Alias_PlayerAlias as BaboBrawlingPlayerREF).ClearEssential()
kmyQuest.PlaceCrewRing()
kmyQuest.CombatDefeated(BaboEncounter06Variable.getvalue() as int)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN AUTOCAST TYPE BaboEncounter06BScript
Quest __temp = self as Quest
BaboEncounter06BScript kmyQuest = __temp as BaboEncounter06BScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.RelocateForGroupSex()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_19
Function Fragment_19()
;BEGIN AUTOCAST TYPE BaboEncounter06BScript
Quest __temp = self as Quest
BaboEncounter06BScript kmyQuest = __temp as BaboEncounter06BScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.SLHHChoke()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_28
Function Fragment_28()
;BEGIN AUTOCAST TYPE BaboEncounter06BScript
Quest __temp = self as Quest
BaboEncounter06BScript kmyQuest = __temp as BaboEncounter06BScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.GotoGuild(190)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_22
Function Fragment_22()
;BEGIN CODE
BaboEncounter06Variable.setvalue(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN AUTOCAST TYPE BaboEncounter06BScript
Quest __temp = self as Quest
BaboEncounter06BScript kmyQuest = __temp as BaboEncounter06BScript
;END AUTOCAST
;BEGIN CODE
MsgCtrl.EncounterEvent06BMessagebox(8)
(Alias_PlayerAlias as BaboBrawlingPlayerREF).CheckEssential()
(Alias_PlayerAlias as BaboBrawlingPlayerREF).RegisterOnHitExExtra(Alias_SyndicateBrawn01.getreference() as actor)
(Alias_PlayerAlias as BaboBrawlingPlayerREF).RegisterOnHitExExtra(Alias_SyndicateBrawn02.getreference() as actor)
(Alias_PlayerAlias as BaboBrawlingPlayerREF).RegisterOnHitExExtra(Alias_SyndicateBrawn03.getreference() as actor)
(Alias_PlayerAlias as BaboBrawlingPlayerREF).RegisterOnHitExExtra(Alias_SyndicateBrawn04.getreference() as actor)
kmyQuest.RegisterSurrenderEvent()
(BaboSexController as BaboSexControllerManager).ChallengeStartArray(Crews)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN AUTOCAST TYPE BaboEncounter06BScript
Quest __temp = self as Quest
BaboEncounter06BScript kmyQuest = __temp as BaboEncounter06BScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.ParkCrewInDumpster()
SetStage(255)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ActorBase Property BaboEncounter06BThug01  Auto  

ActorBase Property BaboEncounter06BThug02  Auto  

ActorBase Property BaboEncounter06BThug03  Auto  

GlobalVariable Property BaboEventLoanSharkCollectInterestReady  Auto  

Quest Property BaboSexController  Auto  

ReferenceAlias[] Property Crews  Auto  

BaboMsgManager Property MsgCtrl  Auto  

GlobalVariable Property BaboEncounter06Variable  Auto  

BaboSceneManager Property SceneManager  Auto  

GlobalVariable Property BaboPlayerGotStrippedGlobal  Auto  
