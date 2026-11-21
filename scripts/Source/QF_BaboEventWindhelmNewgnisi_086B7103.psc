;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 49
Scriptname QF_BaboEventWindhelmNewgnisi_086B7103 Extends Quest Hidden

;BEGIN ALIAS PROPERTY ArgonianH04
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ArgonianH04 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ArgonianH02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ArgonianH02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Citizen03Ref
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Citizen03Ref Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PlayerAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PlayerAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Citizen02Ref
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Citizen02Ref Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ArgonianH05
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ArgonianH05 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ArgonianH03
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ArgonianH03 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY InnKeeperRef
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_InnKeeperRef Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Citizen05Ref
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Citizen05Ref Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Citizen04Ref
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Citizen04Ref Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BrunwulfREF
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BrunwulfREF Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Citizen01Ref
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Citizen01Ref Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Citizen06Ref
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Citizen06Ref Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ArgonianH01Copy
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ArgonianH01Copy Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ArgonianH01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ArgonianH01 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_33
Function Fragment_33()
;BEGIN AUTOCAST TYPE BaboEventNewgnisisMasterScript
Quest __temp = self as Quest
BaboEventNewgnisisMasterScript kmyQuest = __temp as BaboEventNewgnisisMasterScript
;END AUTOCAST
;BEGIN CODE
BMQuest.pacifyAliasArray(argonians)
(Alias_PlayerAlias as BaboNewgnisisDuelRefScript).ClearEssential()
BMQuest.ReadySurrender(false)
Utility.wait(1.0)
kmyQuest.AltDefeated(2)
BMQuest.LosingControl()
kmyQuest.UnRegisterEvents()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_45
Function Fragment_45()
;BEGIN AUTOCAST TYPE BaboEventNewgnisisMasterScript
Quest __temp = self as Quest
BaboEventNewgnisisMasterScript kmyQuest = __temp as BaboEventNewgnisisMasterScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.RegisterUpdate(24)
kmyQuest.ClearArgonians(true)
kmyQuest.ClearSpectators()
BMQuest.CompatiblityCheck(False)
kmyQuest.Messagebox(9)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_25
Function Fragment_25()
;BEGIN AUTOCAST TYPE BaboEventNewgnisisMasterScript
Quest __temp = self as Quest
BaboEventNewgnisisMasterScript kmyQuest = __temp as BaboEventNewgnisisMasterScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.BrunwulfGone()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN AUTOCAST TYPE BaboEventNewgnisisMasterScript
Quest __temp = self as Quest
BaboEventNewgnisisMasterScript kmyQuest = __temp as BaboEventNewgnisisMasterScript
;END AUTOCAST
;BEGIN CODE
BMQuest.SexCustom(Alias_PlayerAlias, Alias_ArgonianH02, Alias_ArgonianH03, None, None, aggressive, Vaginal, MMF, True, "WNAS02", "WindhelmNewgnisisAfterSex02", true)
BRMQuest.SexCountgangbang(1)
BMQuest.CorruptionExp(3.0)
kmyQuest.Messagebox(4)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_41
Function Fragment_41()
;BEGIN AUTOCAST TYPE BaboEventNewgnisisMasterScript
Quest __temp = self as Quest
BaboEventNewgnisisMasterScript kmyQuest = __temp as BaboEventNewgnisisMasterScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.ScenePlay(10, true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_28
Function Fragment_28()
;BEGIN AUTOCAST TYPE BaboEventNewgnisisMasterScript
Quest __temp = self as Quest
BaboEventNewgnisisMasterScript kmyQuest = __temp as BaboEventNewgnisisMasterScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.Messagebox(6)
Utility.wait(5.0)
sendModEvent("SSLV Entry")
BMQuest.CorruptionExp(3.0)
Setstage(245)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_27
Function Fragment_27()
;BEGIN AUTOCAST TYPE BaboEventNewgnisisMasterScript
Quest __temp = self as Quest
BaboEventNewgnisisMasterScript kmyQuest = __temp as BaboEventNewgnisisMasterScript
;END AUTOCAST
;BEGIN CODE
;(Alias_PlayerAlias as BaboBrawlingPlayerREF).CheckEssential()
BMQuest.ChallengeStart(Alias_ArgonianH01Copy)
kmyQuest.Messagebox(3)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_29
Function Fragment_29()
;BEGIN AUTOCAST TYPE BaboEventNewgnisisMasterScript
Quest __temp = self as Quest
BaboEventNewgnisisMasterScript kmyQuest = __temp as BaboEventNewgnisisMasterScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.TriggerBoxReset()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
(Alias_ArgonianH01.getRef() as Actor).EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_34
Function Fragment_34()
;BEGIN AUTOCAST TYPE BaboEventNewgnisisMasterScript
Quest __temp = self as Quest
BaboEventNewgnisisMasterScript kmyQuest = __temp as BaboEventNewgnisisMasterScript
;END AUTOCAST
;BEGIN CODE
BMQuest.SexCustom(Alias_PlayerAlias, Alias_ArgonianH02, Alias_ArgonianH03, None, None, rape, Vaginal, MMF, True, "WNAS01B", "WindhelmNewgnisisAfterSex01B", true)
BRMQuest.SexCount(2)
BMQuest.CorruptionExp(1.0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN AUTOCAST TYPE BaboEventNewgnisisMasterScript
Quest __temp = self as Quest
BaboEventNewgnisisMasterScript kmyQuest = __temp as BaboEventNewgnisisMasterScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.RegisterEvents()
(Alias_PlayerAlias as BaboNewgnisisDuelRefScript).CheckEssential()
BMQuest.ChallengeStartArray(argonians)
kmyQuest.Messagebox(1)
(Alias_ArgonianH01 as BaboBrawlingNewgnisisREF).UnRegisterOnHitExExtra()
(Alias_ArgonianH02 as BaboBrawlingNewgnisisREF).UnRegisterOnHitExExtra()
(Alias_ArgonianH03 as BaboBrawlingNewgnisisREF).UnRegisterOnHitExExtra()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_39
Function Fragment_39()
;BEGIN AUTOCAST TYPE BaboEventNewgnisisMasterScript
Quest __temp = self as Quest
BaboEventNewgnisisMasterScript kmyQuest = __temp as BaboEventNewgnisisMasterScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.SetDefaultActors()
kmyQuest.Messagebox(7)
Setstage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_48
Function Fragment_48()
;BEGIN AUTOCAST TYPE BaboEventNewgnisisMasterScript
Quest __temp = self as Quest
BaboEventNewgnisisMasterScript kmyQuest = __temp as BaboEventNewgnisisMasterScript
;END AUTOCAST
;BEGIN CODE
BRMQuest.IncreaseReputation(20, 10)
BRMQuest.DecreaseReputationBitch(20)
kmyQuest.SetDefaultActors()
kmyQuest.Messagebox(10)
Setstage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN AUTOCAST TYPE BaboEventNewgnisisMasterScript
Quest __temp = self as Quest
BaboEventNewgnisisMasterScript kmyQuest = __temp as BaboEventNewgnisisMasterScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.SendingSexEvent(Alias_PlayerAlias, Alias_ArgonianH01)
BRMQuest.SexCount(2)
BMQuest.CorruptionExp(1.0)
;{After rape, It goes to Stage 65}
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_20
Function Fragment_20()
;BEGIN AUTOCAST TYPE BaboEventNewgnisisMasterScript
Quest __temp = self as Quest
BaboEventNewgnisisMasterScript kmyQuest = __temp as BaboEventNewgnisisMasterScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.DisableTorturePole()
BMQuest.DisableEssential()
BMQuest.Recovercontrol()
BRMQuest.DecreaseReputation(-25, 0)
kmyQuest.GoState()
kmyQuest.RegisterUpdate(168)
Alias_InnKeeperRef.Clear()
kmyQuest.ClearArgonians(true)
kmyQuest.ClearSpectators()
BMQuest.CompatiblityCheck(False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN AUTOCAST TYPE BaboEventNewgnisisMasterScript
Quest __temp = self as Quest
BaboEventNewgnisisMasterScript kmyQuest = __temp as BaboEventNewgnisisMasterScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.GoState()
Alias_InnKeeperRef.Clear()

Actor[] actors = New Actor[3]
actors[0] = (Alias_ArgonianH01.getreference() as actor)
actors[1] = (Alias_ArgonianH02.getreference() as actor)
actors[2] = (Alias_ArgonianH03.getreference() as actor)
BMQuest.DeleteWhenAbleWithTimeout(actors, 60)

Alias_ArgonianH01.Clear()
Alias_ArgonianH02.Clear()
Alias_ArgonianH03.Clear()
Alias_BrunwulfRef.Clear()
Alias_Citizen01Ref.Clear()
Alias_Citizen02Ref.Clear()
Alias_Citizen03Ref.Clear()
Alias_Citizen04Ref.Clear()
Alias_Citizen05Ref.Clear()
Alias_Citizen06Ref.Clear()
BMQuest.CompatiblityCheck(False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_36
Function Fragment_36()
;BEGIN AUTOCAST TYPE BaboEventNewgnisisMasterScript
Quest __temp = self as Quest
BaboEventNewgnisisMasterScript kmyQuest = __temp as BaboEventNewgnisisMasterScript
;END AUTOCAST
;BEGIN CODE
BMQuest.SexCustom(Alias_PlayerAlias, Alias_ArgonianH03, None, None, None, rape, Vaginal, MF, True, "WNAS01B", "WindhelmNewgnisisAfterSex01B", true)
BRMQuest.SexCount(1)
BMQuest.CorruptionExp(1.0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_44
Function Fragment_44()
;BEGIN AUTOCAST TYPE BaboEventNewgnisisMasterScript
Quest __temp = self as Quest
BaboEventNewgnisisMasterScript kmyQuest = __temp as BaboEventNewgnisisMasterScript
;END AUTOCAST
;BEGIN CODE
BRMQuest.IncreaseReputation(10, 0)
BRMQuest.DecreaseReputationBitch(15)
kmyQuest.RegisterUpdate(24)
kmyQuest.ClearArgonians(true)
kmyQuest.ClearSpectators()
BMQuest.CompatiblityCheck(False)
kmyQuest.Messagebox(8)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE BaboEventNewgnisisMasterScript
Quest __temp = self as Quest
BaboEventNewgnisisMasterScript kmyQuest = __temp as BaboEventNewgnisisMasterScript
;END AUTOCAST
;BEGIN CODE
BMQuest.CompatiblityCheck(True)
kmyQuest.SpawnArgonians()
kmyQuest.TriggerCountPlus(1)
BMQuest.LosingControl()
if kmyQuest.ScenePlay(1, true) == false
setstage(20)
endif
;Scene01.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_16
Function Fragment_16()
;BEGIN AUTOCAST TYPE BaboEventNewgnisisMasterScript
Quest __temp = self as Quest
BaboEventNewgnisisMasterScript kmyQuest = __temp as BaboEventNewgnisisMasterScript
;END AUTOCAST
;BEGIN CODE
sendModEvent("SSLV Entry")
BMQuest.CorruptionExp(3.0)
BMQuest.RecoverControl(true)
kmyQuest.PlayPantingAnim()
kmyQuest.UnEquipZazItem()
Setstage(245)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_32
Function Fragment_32()
;BEGIN AUTOCAST TYPE BaboEventNewgnisisMasterScript
Quest __temp = self as Quest
BaboEventNewgnisisMasterScript kmyQuest = __temp as BaboEventNewgnisisMasterScript
;END AUTOCAST
;BEGIN CODE
BMQuest.pacifyAliasArray(argonians)
(Alias_PlayerAlias as BaboNewgnisisDuelRefScript).ClearEssential()
BMQuest.ReadySurrender(false)
Utility.wait(1.0)
kmyQuest.AltDefeated(1)
BMQuest.LosingControl()
kmyQuest.UnRegisterEvents()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_30
Function Fragment_30()
;BEGIN CODE
BMQuest.LosingControl()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN AUTOCAST TYPE BaboEventNewgnisisMasterScript
Quest __temp = self as Quest
BaboEventNewgnisisMasterScript kmyQuest = __temp as BaboEventNewgnisisMasterScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.ScenePlay(3, true)
;{After the Scene, It goes to Stage 60(If killed one of them) or 85(failed to kill even one)}
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_37
Function Fragment_37()
;BEGIN AUTOCAST TYPE BaboEventNewgnisisMasterScript
Quest __temp = self as Quest
BaboEventNewgnisisMasterScript kmyQuest = __temp as BaboEventNewgnisisMasterScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.ScenePlay(8, true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_38
Function Fragment_38()
;BEGIN AUTOCAST TYPE BaboEventNewgnisisMasterScript
Quest __temp = self as Quest
BaboEventNewgnisisMasterScript kmyQuest = __temp as BaboEventNewgnisisMasterScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.ScenePlay(9, true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_43
Function Fragment_43()
;BEGIN AUTOCAST TYPE BaboEventNewgnisisMasterScript
Quest __temp = self as Quest
BaboEventNewgnisisMasterScript kmyQuest = __temp as BaboEventNewgnisisMasterScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.TeleportArgonianstoExitEnd()
BMQuest.Recovercontrol()
(Alias_InnkeeperRef.getReference() as Actor).EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_42
Function Fragment_42()
;BEGIN CODE
BMQuest.Recovercontrol()
BRMQuest.AddingTitletoPlayerRef(BaboFactionArgonianDefeatTitle)
(Alias_InnkeeperRef.getReference() as Actor).EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_22
Function Fragment_22()
;BEGIN AUTOCAST TYPE BaboEventNewgnisisMasterScript
Quest __temp = self as Quest
BaboEventNewgnisisMasterScript kmyQuest = __temp as BaboEventNewgnisisMasterScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.GoState()
kmyQuest.RegisterUpdate(1)
;{this will return it to stage 5}
BMQuest.CompatiblityCheck(False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_23
Function Fragment_23()
;BEGIN AUTOCAST TYPE BaboEventNewgnisisMasterScript
Quest __temp = self as Quest
BaboEventNewgnisisMasterScript kmyQuest = __temp as BaboEventNewgnisisMasterScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.GoStateBefore()
BaboEventCornerClubTeleportBox.disable()
setstage(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_46
Function Fragment_46()
;BEGIN AUTOCAST TYPE BaboEventNewgnisisMasterScript
Quest __temp = self as Quest
BaboEventNewgnisisMasterScript kmyQuest = __temp as BaboEventNewgnisisMasterScript
;END AUTOCAST
;BEGIN CODE
BRMQuest.DecreaseReputation(-5, 0)
kmyQuest.SetDefaultActors()
kmyQuest.Messagebox(7)
Setstage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
BMQuest.SexCustom(Alias_PlayerAlias, Alias_ArgonianH01, None, None, None, Conquering, Vaginal, MF, True, "WNAS01", "WindhelmNewgnisisAfterSex01", true)
BRMQuest.SexCount(2)
BMQuest.CorruptionExp(1.0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_17
Function Fragment_17()
;BEGIN AUTOCAST TYPE BaboEventNewgnisisMasterScript
Quest __temp = self as Quest
BaboEventNewgnisisMasterScript kmyQuest = __temp as BaboEventNewgnisisMasterScript
;END AUTOCAST
;BEGIN CODE
;{Argonians took me but Brunwulf saved me...}
kmyQuest.RescueInnMoving()
(Alias_BrunwulfRef.getReference() as Actor).EvaluatePackage()
BMQuest.RecoverControl(true)
kmyQuest.PlayPantingAnim()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_47
Function Fragment_47()
;BEGIN AUTOCAST TYPE BaboEventNewgnisisMasterScript
Quest __temp = self as Quest
BaboEventNewgnisisMasterScript kmyQuest = __temp as BaboEventNewgnisisMasterScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.SetDefaultActors()
kmyQuest.Messagebox(7)
Setstage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN AUTOCAST TYPE BaboEventNewgnisisMasterScript
Quest __temp = self as Quest
BaboEventNewgnisisMasterScript kmyQuest = __temp as BaboEventNewgnisisMasterScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.ScenePlay(4, true)
;{After the Scene, It goes to Stage 85}
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_19
Function Fragment_19()
;BEGIN AUTOCAST TYPE BaboEventNewgnisisMasterScript
Quest __temp = self as Quest
BaboEventNewgnisisMasterScript kmyQuest = __temp as BaboEventNewgnisisMasterScript
;END AUTOCAST
;BEGIN CODE
BRMQuest.DecreaseReputation(-15, 0)
BRMQuest.AddingTitletoPlayerRef(BaboFactionArgonianDefeatedTitle)
BRMQuest.SetTitleGlobal(BaboGlobalArgonianDefeatedTitle, 1)
kmyQuest.SetDefaultActors()
kmyQuest.Messagebox(5)
Setstage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_18
Function Fragment_18()
;BEGIN AUTOCAST TYPE BaboEventNewgnisisMasterScript
Quest __temp = self as Quest
BaboEventNewgnisisMasterScript kmyQuest = __temp as BaboEventNewgnisisMasterScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.VisitAgainToggle(False)
BMQuest.DisableEssential()
BMQuest.PacifyAlias(Alias_ArgonianH01)
BMQuest.Recovercontrol(true)
kmyQuest.GoState()
kmyQuest.RegisterUpdate(168)

kmyQuest.ClearArgonians(false)
Alias_InnKeeperRef.Clear()
kmyQuest.ClearSpectators()
BMQuest.CompatiblityCheck(False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN AUTOCAST TYPE BaboEventNewgnisisMasterScript
Quest __temp = self as Quest
BaboEventNewgnisisMasterScript kmyQuest = __temp as BaboEventNewgnisisMasterScript
;END AUTOCAST
;BEGIN CODE
Utility.wait(2.0)
kmyQuest.showingStart()
KmyQuest.MovetoShowcase()
Utility.wait(4.0)
kmyQuest.ScenePlay(5, true)
BRMQuest.AddingTitletoPlayerRef(BaboFactionArgonianDisplayedFuckToyTitle)
BRMQuest.SetTitleGlobal(BaboGlobalArgonianDisplayedFuckToyTitle, 1)
;{BlackOutScene, Player will be displayed to all citizens}
;{This is the Route 01}
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN AUTOCAST TYPE BaboEventNewgnisisMasterScript
Quest __temp = self as Quest
BaboEventNewgnisisMasterScript kmyQuest = __temp as BaboEventNewgnisisMasterScript
;END AUTOCAST
;BEGIN CODE
;NMScript.BaboEventWindhelmNewgnisisScene05.Stop()
;{Argonian took me...}
kmyQuest.DraggingtoSexMarketWithPossibility()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_31
Function Fragment_31()
;BEGIN AUTOCAST TYPE BaboEventNewgnisisMasterScript
Quest __temp = self as Quest
BaboEventNewgnisisMasterScript kmyQuest = __temp as BaboEventNewgnisisMasterScript
;END AUTOCAST
;BEGIN CODE
BMQuest.pacifyAliasArray(argonians)

(Alias_ArgonianH02.getreference() as actor).evaluatepackage()
(Alias_ArgonianH03.getreference() as actor).evaluatepackage()

BMQuest.DisableEssential()
kmyQuest.VisitAgainToggle(False)

kmyQuest.RegisterUpdate(168)

BRMQuest.AddingTitletoPlayerRef(BaboFactionArgonianDefeatTitle)
BRMQuest.IncreaseReputation(10, 3)

BMQuest.Recovercontrol(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_35
Function Fragment_35()
;BEGIN AUTOCAST TYPE BaboEventNewgnisisMasterScript
Quest __temp = self as Quest
BaboEventNewgnisisMasterScript kmyQuest = __temp as BaboEventNewgnisisMasterScript
;END AUTOCAST
;BEGIN CODE
BMQuest.SexCustom(Alias_PlayerAlias, Alias_ArgonianH02, None, None, None, rape, Vaginal, MF, True, "WNAS01B", "WindhelmNewgnisisAfterSex01B", true)
BRMQuest.SexCount(1)
BMQuest.CorruptionExp(1.0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_40
Function Fragment_40()
;BEGIN AUTOCAST TYPE BaboEventNewgnisisMasterScript
Quest __temp = self as Quest
BaboEventNewgnisisMasterScript kmyQuest = __temp as BaboEventNewgnisisMasterScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.ConcoctPoison()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN AUTOCAST TYPE BaboEventNewgnisisMasterScript
Quest __temp = self as Quest
BaboEventNewgnisisMasterScript kmyQuest = __temp as BaboEventNewgnisisMasterScript
;END AUTOCAST
;BEGIN CODE
;NMScript.BaboEventWindhelmNewgnisisScene05.Stop()
;{Argonians started to run and Player and Brunwulf will converse in the inn. After the talk It will go to 76}
(Alias_ArgonianH01.getRef() as Actor).EvaluatePackage()
(Alias_ArgonianH02.getRef() as Actor).EvaluatePackage()
(Alias_ArgonianH03.getRef() as Actor).EvaluatePackage()
kmyQuest.RescueInnMoving()
(Alias_BrunwulfRef.getRef() as Actor).EvaluatePackage()
BMQuest.RecoverControl(true)
kmyQuest.PlayPantingAnim()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_26
Function Fragment_26()
;BEGIN AUTOCAST TYPE BaboEventNewgnisisMasterScript
Quest __temp = self as Quest
BaboEventNewgnisisMasterScript kmyQuest = __temp as BaboEventNewgnisisMasterScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.SpawnCopyArgonian()
(Alias_ArgonianH01Copy.getRef() as Actor).EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_24
Function Fragment_24()
;BEGIN AUTOCAST TYPE BaboEventNewgnisisMasterScript
Quest __temp = self as Quest
BaboEventNewgnisisMasterScript kmyQuest = __temp as BaboEventNewgnisisMasterScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.GoStateBefore()
kmyQuest.TriggerBoxReset()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN AUTOCAST TYPE BaboEventNewgnisisMasterScript
Quest __temp = self as Quest
BaboEventNewgnisisMasterScript kmyQuest = __temp as BaboEventNewgnisisMasterScript
;END AUTOCAST
;BEGIN CODE
BMQuest.pacifyAliasArray(argonians)
(Alias_PlayerAlias as BaboNewgnisisDuelRefScript).ClearEssential()
BMQuest.ReadySurrender(false)
Utility.wait(1.0)
kmyQuest.ScenePlay(2, true)

BMQuest.LosingControl()
kmyQuest.UnRegisterEvents()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_21
Function Fragment_21()
;BEGIN AUTOCAST TYPE BaboEventNewgnisisMasterScript
Quest __temp = self as Quest
BaboEventNewgnisisMasterScript kmyQuest = __temp as BaboEventNewgnisisMasterScript
;END AUTOCAST
;BEGIN CODE
BMQuest.Recovercontrol()
kmyQuest.RegisterUpdate(24)
kmyQuest.ClearArgonians(true)
kmyQuest.ClearSpectators()
;{Returns to Stage05}
BMQuest.CompatiblityCheck(False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN AUTOCAST TYPE BaboEventNewgnisisMasterScript
Quest __temp = self as Quest
BaboEventNewgnisisMasterScript kmyQuest = __temp as BaboEventNewgnisisMasterScript
;END AUTOCAST
;BEGIN CODE
BMQuest.Recovercontrol()
kmyQuest.TeleportArgonianstoExitEnd()
(Alias_InnKeeperRef.getRef() as Actor).EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN AUTOCAST TYPE BaboEventNewgnisisMasterScript
Quest __temp = self as Quest
BaboEventNewgnisisMasterScript kmyQuest = __temp as BaboEventNewgnisisMasterScript
;END AUTOCAST
;BEGIN CODE
;(BaboEventCornerClubStageTriggerBox as BaboDefaultOnEnterTriggerScript).ReArmTrigger()
BaboEventCornerClubTeleportBox.enable()
(BaboEventCornerClubTeleportBox as BaboTeleportOnEnterTrigger).ReArmTrigger()
kmyQuest.TeleportArgonianstoEventRoom()
BMQuest.RecoverControl(true)
(Alias_ArgonianH01.getRef() as Actor).EvaluatePackage()
(Alias_ArgonianH02.getRef() as Actor).EvaluatePackage()
(Alias_ArgonianH03.getRef() as Actor).EvaluatePackage()
(Alias_InnKeeperRef.getRef() as Actor).EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

BaboReputationMasterScript Property BRMQuest Auto  

BaboSexControllerManager Property BMQuest Auto  

BaboDiaMonitorScript Property BDMQuest Auto

Scene Property Scene01  Auto  

ObjectReference Property TheDoorRef  Auto  

Scene Property Scene02  Auto  

String Property Necro Auto  

String Property MF Auto  

String Property Vaginal Auto  

Scene Property Scene03  Auto  

Scene Property Scene04  Auto  

String Property AfterSexS  Auto  

String Property AfterSexScene  Auto  

String Property Rape  Auto  

String Property MMF  Auto  

String Property Aggressive  Auto  

String Property AnotherSexMF01S  Auto  

String Property AnotherSexMF01  Auto  

String Property Conquering  Auto  

Scene Property Scene05  Auto  

Faction Property BaboFactionArgonianDefeatedTitle  Auto  

Faction Property BaboFactionArgonianDisplayedFuckToyTitle  Auto  

GlobalVariable Property BaboGlobalArgonianDefeatedTitle  Auto  

GlobalVariable Property BaboGlobalArgonianDisplayedFuckToyTitle  Auto  

ObjectReference Property BaboEventNewGnisisInnkeeperXmarker  Auto  

Faction Property BaboFactionArgonianDefeatTitle  Auto  

 BaboEventNewgnisisMasterScript  Property NMScript Auto

ObjectReference Property BaboEventCornerClubTeleportBox  Auto  

Quest Property BaboSceneController  Auto  

ReferenceAlias[] Property argonians  Auto  
