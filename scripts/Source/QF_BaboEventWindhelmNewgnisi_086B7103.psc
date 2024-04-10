;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 30
Scriptname QF_BaboEventWindhelmNewgnisi_086B7103 Extends Quest Hidden

;BEGIN ALIAS PROPERTY ArgonianH02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ArgonianH02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Citizen05Ref
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Citizen05Ref Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Citizen04Ref
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Citizen04Ref Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ArgonianH01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ArgonianH01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PlayerRef
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PlayerRef Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Citizen01Ref
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Citizen01Ref Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY InnKeeperRef
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_InnKeeperRef Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ArgonianH03
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ArgonianH03 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Citizen06Ref
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Citizen06Ref Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ArgonianH01Copy
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ArgonianH01Copy Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BrunwulfREF
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BrunwulfREF Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Citizen02Ref
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Citizen02Ref Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Citizen03Ref
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Citizen03Ref Auto
;END ALIAS PROPERTY

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

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN AUTOCAST TYPE BaboEventNewgnisisMasterScript
Quest __temp = self as Quest
BaboEventNewgnisisMasterScript kmyQuest = __temp as BaboEventNewgnisisMasterScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.BaboEventWindhelmNewgnisisScene04.Stop()
Utility.wait(5)
kmyQuest.showingStart()
KmyQuest.MovetoShowcase()
Utility.wait(10)
kmyQuest.BaboEventWindhelmNewgnisisScene05.Start()
BDMQuest.RandomAheMenu(Game.getplayer())
BRMQuest.DecreaseReputation(-20, 0)
BMQuest.CorruptionExp(5.0)
BRMQuest.AddingTitletoPlayerRef(BaboFactionArgonianDisplayedFuckToyTitle)
BRMQuest.SetTitleGlobal(BaboGlobalArgonianDisplayedFuckToyTitle, 1)
;{BlackOutScene, Player will be displayed to all citizens}
;{This is the Route 01}
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
Scene02.Stop()
BMQuest.SexCustom(Alias_PlayerRef, Alias_ArgonianH01, None, None, None, Conquering, Vaginal, MF, True, "WNAS01", "WindhelmNewgnisisAfterSex01", true)
BRMQuest.SexCount(2)
BMQuest.CorruptionExp(1.0)
;{I am defeated. After sex twice, It goes to Stage 55}
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN CODE
BMQuest.LosingControl()
(Alias_InnKeeperRef.getRef() as Actor).Moveto(BaboEventNewGnisisInnkeeperXmarker)
Utility.wait(1.0)
(Alias_InnKeeperRef.getRef() as Actor).EvaluatePackage()
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
setstage(1)
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

;BEGIN FRAGMENT Fragment_29
Function Fragment_29()
;BEGIN AUTOCAST TYPE BaboEventNewgnisisMasterScript
Quest __temp = self as Quest
BaboEventNewgnisisMasterScript kmyQuest = __temp as BaboEventNewgnisisMasterScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.TriggerBoxReset()
;After killing the argonians. Stand by for another spin.
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
(Alias_PlayerRef as BaboBrawlingPlayerREF).CheckEssential()
BMQuest.ChallengeStart(Alias_ArgonianH01)
BMQuest.ChallengeStart(Alias_ArgonianH02)
BMQuest.ChallengeStart(Alias_ArgonianH03)
TheDoorRef.Lock(True, False)
kmyQuest.Messagebox(1)
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
kmyQuest.Messagebox(5)
Setstage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN CODE
(Alias_ArgonianH01.getRef() as Actor).EvaluatePackage()
(Alias_ArgonianH02.getRef() as Actor).EvaluatePackage()
(Alias_ArgonianH03.getRef() as Actor).EvaluatePackage()
TheDoorRef.Lock(False, False)
Utility.wait(20)
Setstage(92)
;{After Sex they leave}
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

;BEGIN FRAGMENT Fragment_25
Function Fragment_25()
;BEGIN AUTOCAST TYPE BaboEventNewgnisisMasterScript
Quest __temp = self as Quest
BaboEventNewgnisisMasterScript kmyQuest = __temp as BaboEventNewgnisisMasterScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.UnEquipZazItem()
kmyQuest.DisableTorturePole()
kmyQuest.ClearArgonians()
kmyQuest.RegisterUpdate(24)
;{After one day, the argonian will return. stage 77 go}
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
NMScript.BaboEventWindhelmNewgnisisScene03.Stop()
BMQuest.SexCustom(Alias_PlayerRef, Alias_ArgonianH02, Alias_ArgonianH03, None, None, aggressive, Vaginal, MMF, True, "WNAS02", "WindhelmNewgnisisAfterSex02", true)
BRMQuest.SexCountgangbang(1)
BMQuest.CorruptionExp(3.0)
kmyQuest.Messagebox(4)
;{They will just leave the bar... It goes to 90}
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
;{Finally Damn Argonians are all dead. Now Everything is back to normal. I wish...}
kmyQuest.VisitAgainToggle(False)
BMQuest.DisableEssential()
BMQuest.PacifyAlias(Alias_ArgonianH01)
BMQuest.Recovercontrol(true)
kmyQuest.GoState()
kmyQuest.RegisterUpdate(168)
Alias_ArgonianH01.GetReference().DeleteWhenAble()
Alias_ArgonianH01Copy.GetReference().DeleteWhenAble()
Alias_ArgonianH02.GetReference().DeleteWhenAble()
Alias_ArgonianH03.GetReference().DeleteWhenAble()
Alias_InnKeeperRef.Clear()
Alias_ArgonianH01.Clear()
Alias_ArgonianH01Copy.Clear()
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

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN AUTOCAST TYPE BaboEventNewgnisisMasterScript
Quest __temp = self as Quest
BaboEventNewgnisisMasterScript kmyQuest = __temp as BaboEventNewgnisisMasterScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.SendingSexEvent(Alias_PlayerRef, Alias_ArgonianH01)
BRMQuest.SexCount(2)
BMQuest.CorruptionExp(1.0)
;{After rape, It goes to Stage 65}
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
;(Alias_PlayerRef as BaboBrawlingPlayerREF).CheckEssential()
BMQuest.ChallengeStart(Alias_ArgonianH01Copy)
kmyQuest.Messagebox(3)
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
NMScript.BaboEventWindhelmNewgnisisScene05.Stop()
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

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
(Alias_ArgonianH01.getRef() as Actor).EvaluatePackage()
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
(Alias_BrunwulfRef.getRef() as Actor).EvaluatePackage()
BMQuest.RecoverControl(true)
kmyQuest.PlayPantingAnim()
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

;BEGIN FRAGMENT Fragment_21
Function Fragment_21()
;BEGIN AUTOCAST TYPE BaboEventNewgnisisMasterScript
Quest __temp = self as Quest
BaboEventNewgnisisMasterScript kmyQuest = __temp as BaboEventNewgnisisMasterScript
;END AUTOCAST
;BEGIN CODE
;{Argonians are gone. Now Everything is back to normal, perhaps...}
BMQuest.Recovercontrol()
kmyQuest.RegisterUpdate(24)
TheDoorRef.Lock(False, False)
Alias_InnKeeperRef.Clear()
Alias_ArgonianH01.GetReference().DeleteWhenAble()
Alias_ArgonianH02.GetReference().DeleteWhenAble()
Alias_ArgonianH03.GetReference().DeleteWhenAble()
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
;{Returns to Stage05}
BMQuest.CompatiblityCheck(False)
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
;{I am a slave now... My reputation hit the bottom...}
kmyQuest.DisableTorturePole()
BMQuest.DisableEssential()
BMQuest.Recovercontrol()
BRMQuest.DecreaseReputation(-25, 0)
kmyQuest.GoState()
kmyQuest.RegisterUpdate(168)
Alias_ArgonianH01.GetReference().DeleteWhenAble()
Alias_ArgonianH01Copy.GetReference().DeleteWhenAble()
Alias_ArgonianH02.GetReference().DeleteWhenAble()
Alias_ArgonianH03.GetReference().DeleteWhenAble()
Alias_InnKeeperRef.Clear()
Alias_ArgonianH01.Clear()
Alias_ArgonianH01Copy.Clear()
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
Scene01.Start()
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
;{Argonians are all dead. Now Everything is back to normal.}
BMQuest.DisableEssential()
BMQuest.Recovercontrol(true)
kmyQuest.GoState()
kmyQuest.VisitAgainToggle(False)
kmyQuest.RegisterUpdate(168)
TheDoorRef.Lock(False, False)
BRMQuest.AddingTitletoPlayerRef(BaboFactionArgonianDefeatTitle)
BRMQuest.IncreaseReputation(10, 3)
Alias_InnKeeperRef.Clear()
Alias_ArgonianH01.GetReference().DeleteWhenAble()
Alias_ArgonianH02.GetReference().DeleteWhenAble()
Alias_ArgonianH03.GetReference().DeleteWhenAble()
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

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN AUTOCAST TYPE BaboEventNewgnisisMasterScript
Quest __temp = self as Quest
BaboEventNewgnisisMasterScript kmyQuest = __temp as BaboEventNewgnisisMasterScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.BaboEventWindhelmNewgnisisScene03.Stop()
Utility.wait(1.0)
kmyQuest.BaboEventWindhelmNewgnisisScene04.Start()
;{After the Scene, It goes to Stage 85}
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
kmyQuest.BaboEventWindhelmNewgnisisScene03.Start()
;{After the Scene, It goes to Stage 60(If killed one of them) or 85(failed to kill even one)}
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
Scene01.Stop()
(BaboEventCornerClubStageTriggerBox as BaboDefaultOnEnterTriggerScript).ReArmTrigger()
BMQuest.RecoverControl(true)
(Alias_ArgonianH01.getRef() as Actor).EvaluatePackage()
(Alias_ArgonianH02.getRef() as Actor).EvaluatePackage()
(Alias_ArgonianH03.getRef() as Actor).EvaluatePackage()
(Alias_InnKeeperRef.getRef() as Actor).EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
BMQuest.pacifyAlias(Alias_ArgonianH01)
BMQuest.pacifyAlias(Alias_ArgonianH02)
BMQuest.pacifyAlias(Alias_ArgonianH03)
BMQuest.DisableEssential()
Utility.wait(1.0)
Scene02.Start()
Utility.wait(1.0)
BMQuest.LosingControl()
Utility.wait(1.0)
TheDoorRef.Lock(False, False)
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
NMScript.BaboEventWindhelmNewgnisisScene05.Stop()
;{Argonian took me...}
kmyQuest.DraggingtoSexMarketWithPossibility()
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

ObjectReference Property BaboEventCornerClubStageTriggerBox  Auto  

 BaboEventNewgnisisMasterScript  Property NMScript Auto
