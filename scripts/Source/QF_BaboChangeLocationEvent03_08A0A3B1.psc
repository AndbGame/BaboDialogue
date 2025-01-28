;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 26
Scriptname QF_BaboChangeLocationEvent03_08A0A3B1 Extends Quest Hidden

;BEGIN ALIAS PROPERTY NewLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_NewLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Thug01SpawnPlace03
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Thug01SpawnPlace03 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Thug01SpawnPlace02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Thug01SpawnPlace02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BalagogGroNolobRef
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BalagogGroNolobRef Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PlayerDisplayXmarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PlayerDisplayXmarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Thug03Ref
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Thug03Ref Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Thug05Ref
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Thug05Ref Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Thug02Ref
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Thug02Ref Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Thug01SpawnPlace01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Thug01SpawnPlace01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY InnKeeperRef
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_InnKeeperRef Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Thug01Ref
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Thug01Ref Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Thug04Ref
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Thug04Ref Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Thug01SpawnPlace04
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Thug01SpawnPlace04 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CenterMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CenterMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PlayerRef
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PlayerRef Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Thug01SpawnPlace05
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Thug01SpawnPlace05 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY OldLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_OldLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CompanionRef
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CompanionRef Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_20
Function Fragment_20()
;BEGIN CODE
;Bandits are all gone
BaboChangeLocationEvent03Scene04s.Stop()
BackCellarDoorRef.Lock()
BaboChangeLocationEvent03CellerXmarker01.Disable()
(Alias_Thug01Ref.getref() as actor).Evaluatepackage()
(Alias_Thug02Ref.getref() as actor).Evaluatepackage()
(Alias_Thug03Ref.getref() as actor).Evaluatepackage()
(Alias_Thug04Ref.getref() as actor).Evaluatepackage()
(Alias_Thug05Ref.getref() as actor).Evaluatepackage()
(Alias_Thug01Ref.getref() as actor).DeleteWhenable()
(Alias_Thug02Ref.getref() as actor).DeleteWhenable()
(Alias_Thug03Ref.getref() as actor).DeleteWhenable()
(Alias_Thug04Ref.getref() as actor).DeleteWhenable()
(Alias_Thug05Ref.getref() as actor).DeleteWhenable()
BDQuest.FadeinMove(Alias_PlayerRef, None, 2, false)
Utility.wait(15.0)
BDQuest.recovercontrol()
(BaboSexController as BaboSexControllerManager).NightgateInnMessagebox(5)

;You can proceed to 250 after reporting to the inn keeper.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
;Thug Standing by
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
;simple slavery activated
BRMQuest.AddingTitletoPlayerRef(BaboFactionNightgateInnFuckedTitle)
BRMQuest.SetTitleGlobal(BaboGlobalNightGateInnFuckedTitle, 1)
BRMQuest.DecreaseReputation(30, 20)
BackCellarDoorRef.Lock(false)
BDQuest.RetrieveEquipments(Game.getplayer())
BDQuest.RecoverControl()
Utility.wait(1.0)
sendModEvent("SSLV Entry")
kmyQuest.TraumaExp(2)
kmyQuest.CorruptionExp(5.0)
(BaboSexController as BaboSexControllerManager).NightgateInnMessagebox(6)
setstage(255)
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
;Simple Slavery 0, bandits just left player alone.
;BDQuest.FadeinMove(Alias_PlayerRef, None, 2, false)

(Alias_Thug01Ref.getref() as actor).Evaluatepackage()
(Alias_Thug02Ref.getref() as actor).Evaluatepackage()
(Alias_Thug03Ref.getref() as actor).Evaluatepackage()
(Alias_Thug04Ref.getref() as actor).Evaluatepackage()
(Alias_Thug05Ref.getref() as actor).Evaluatepackage()
Utility.wait(3.0)
(Alias_Thug01Ref.getref() as actor).Delete()
(Alias_Thug02Ref.getref() as actor).Delete()
(Alias_Thug03Ref.getref() as actor).Delete()
(Alias_Thug04Ref.getref() as actor).Delete()
(Alias_Thug05Ref.getref() as actor).Delete()
BackCellarDoorRef.Lock()
BaboChangeLocationEvent03CellerXmarker01.Disable()
Utility.wait(7.0)
BDQuest.recovercontrol()
(BaboSexController as BaboSexControllerManager).NightgateInnMessagebox(4)

;You can proceed to stage 250 by talking to the inn keeper
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN AUTOCAST TYPE BaboDiaQuest
Quest __temp = self as Quest
BaboDiaQuest kmyQuest = __temp as BaboDiaQuest
;END AUTOCAST
;BEGIN CODE
;Sex Start
Submission = True
kmyQuest.LosingControl()
Utility.wait(1.0)
BaboChangeLocationEvent03CellerXmarker01.Disable()
BaboChangeLocationEvent03CellerXmarker02.Disable()
kmyQuest.FadeinMove(Alias_PlayerRef, Alias_PlayerDisplayXmarker, 35, true)
Game.getplayer().unequipall()
kmyquest.ConfiscatedEquipments(game.getplayer())
(Alias_Thug01Ref.getref() as actor).Moveto(Babochnagelocation03ThugScene02Place01)
(Alias_Thug02Ref.getref() as actor).Moveto(Babochnagelocation03ThugScene02Place02)
(Alias_Thug03Ref.getref() as actor).Moveto(Babochnagelocation03ThugScene02Place03)
(Alias_Thug04Ref.getref() as actor).Moveto(Babochnagelocation03ThugScene02Place04)
(Alias_Thug05Ref.getref() as actor).Moveto(Babochnagelocation03ThugScene02Place05)
kmyQuest.CorruptionExp(1.0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN AUTOCAST TYPE BaboDiaQuest
Quest __temp = self as Quest
BaboDiaQuest kmyQuest = __temp as BaboDiaQuest
;END AUTOCAST
;BEGIN CODE
;Combat Start
BaboChangeLocationEvent03Scene01.Stop()

kmyQuest.RecoverControl()

kmyQuest.ChallengeStart(Alias_Thug01Ref)
kmyQuest.ChallengeStart(Alias_Thug02Ref)
kmyQuest.ChallengeStart(Alias_Thug03Ref)
kmyQuest.ChallengeStart(Alias_Thug04Ref)
kmyQuest.ChallengeStart(Alias_Thug05Ref)

Submission = False
(BaboSexController as BaboSexControllerManager).NightgateInnMessagebox(2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_17
Function Fragment_17()
;BEGIN AUTOCAST TYPE BaboDiaQuest
Quest __temp = self as Quest
BaboDiaQuest kmyQuest = __temp as BaboDiaQuest
;END AUTOCAST
;BEGIN CODE
;I was raped... display...
Utility.wait(3.0)
Debug.SendAnimationEvent(Game.getplayer(), "IdleForceDefaultState")
kmyQuest.LosingControl()
kmyQuest.FadeinMove(Alias_PlayerRef, Alias_PlayerDisplayXmarker, 40, true)
(Alias_PlayerRef.getref() as actor).Evaluatepackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN AUTOCAST TYPE BaboDiaQuest
Quest __temp = self as Quest
BaboDiaQuest kmyQuest = __temp as BaboDiaQuest
;END AUTOCAST
;BEGIN CODE
;Fadeout
Debug.SendAnimationEvent(Game.getplayer(), "IdleForceDefaultState")
BaboChangeLocationEvent03Scene02.Stop()
BaboChangeLocationEvent03CellerXmarker02.Disable()
kmyQuest.FadeinMove(Alias_PlayerRef, Alias_PlayerDisplayXmarker, 33, true)
Game.getplayer().unequipall()
kmyquest.ConfiscatedEquipments(game.getplayer())
BDSMonitor.RandomPainMenu(Game.getplayer())
(Alias_Thug01Ref.getref() as actor).Moveto(Babochnagelocation03ThugScene02Place01)
(Alias_Thug02Ref.getref() as actor).Moveto(Babochnagelocation03ThugScene02Place02)
(Alias_Thug03Ref.getref() as actor).Moveto(Babochnagelocation03ThugScene02Place03)
(Alias_Thug04Ref.getref() as actor).Moveto(Babochnagelocation03ThugScene02Place04)
(Alias_Thug05Ref.getref() as actor).Moveto(Babochnagelocation03ThugScene02Place05)
kmyQuest.DisableEssential()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;dummy
if BaboDebugging.getvalue() == 1
Debug.notification("BaboDialogue: Change Location Event 03 fired")
endif
(BaboSexController as BaboSexControllerManager).StopAlltheEncounters()
ObjectReference TSP01 = Alias_Thug01SpawnPlace01.getref() as objectreference
ObjectReference TSP02 = Alias_Thug01SpawnPlace02.getref() as objectreference
ObjectReference TSP03 = Alias_Thug01SpawnPlace03.getref() as objectreference
ObjectReference TSP04 = Alias_Thug01SpawnPlace04.getref() as objectreference
ObjectReference TSP05 = Alias_Thug01SpawnPlace05.getref() as objectreference
Actor BCLThug01 = TSP01.PlaceActorAtMe(BaboChangeLocation03Thugs, 3)
Actor BCLThug02 = TSP02.PlaceActorAtMe(BaboChangeLocation03Thugs, 3)
Actor BCLThug03 = TSP03.PlaceActorAtMe(BaboChangeLocation03Thugs, 3)
Actor BCLThug04 = TSP04.PlaceActorAtMe(BaboChangeLocation03Thugs, 4)
Actor BCLThug05 = TSP05.PlaceActorAtMe(BaboChangeLocation03Thugs, 3)
Alias_Thug01Ref.ForceRefTo(BCLThug01)
Alias_Thug02Ref.ForceRefTo(BCLThug02)
Alias_Thug03Ref.ForceRefTo(BCLThug03)
Alias_Thug04Ref.ForceRefTo(BCLThug04)
Alias_Thug05Ref.ForceRefTo(BCLThug05)

If BalagogGroNolobRef.isdead()
Else
Alias_BalagogGroNolobRef.forcerefto(BalagogGroNolobRef)
BalagogGroNolobRef.moveto(GourmetPondMarker)
(Alias_BalagogGroNolobRef.getref() as actor).Evaluatepackage()
EndIf
If HadringREF.isdead()
setstage(1)
Else
Alias_innkeeperref.forcerefto(HadringREF)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN AUTOCAST TYPE BaboDiaQuest
Quest __temp = self as Quest
BaboDiaQuest kmyQuest = __temp as BaboDiaQuest
;END AUTOCAST
;BEGIN CODE
;Boss - Ok rape her as you wish.
Utility.wait(3.0)
kmyQuest.LosingControl()
If submission
BaboChangeLocationEvent03Scene04s.forceStart()
else
BaboChangeLocationEvent03Scene04.forceStart()
Endif
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
;MMF
BaboChangeLocationEvent03Scene04.Stop()
Utility.wait(1.0)
BDQuest.RapeCustom(Alias_PlayerRef, Alias_Thug03Ref, Alias_Thug05Ref, None, None, MMF, Rape, Babo, True, AfterSexS3, AfterSexScene3, true)
BRMQuest.SexCount(1)
kmyQuest.CorruptionExp(2.0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
; Player noticed something wierd...
Utility.wait(2.0)
(BaboSexController as BaboSexControllerManager).NightgateInnMessagebox(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN AUTOCAST TYPE BaboDiaQuest
Quest __temp = self as Quest
BaboDiaQuest kmyQuest = __temp as BaboDiaQuest
;END AUTOCAST
;BEGIN CODE
;Player Defeated

kmyQuest.pacifyAlias(Alias_Thug01Ref)
kmyQuest.pacifyAlias(Alias_Thug02Ref)
kmyQuest.pacifyAlias(Alias_Thug03Ref)
kmyQuest.pacifyAlias(Alias_Thug04Ref)
kmyQuest.pacifyAlias(Alias_Thug05Ref)

(Alias_Thug01Ref.getref() as actor).RestoreAV("health", 500.0)
(Alias_Thug02Ref.getref() as actor).RestoreAV("health", 500.0)
(Alias_Thug03Ref.getref() as actor).RestoreAV("health", 500.0)
(Alias_Thug04Ref.getref() as actor).RestoreAV("health", 500.0)
(Alias_Thug05Ref.getref() as actor).RestoreAV("health", 500.0)

(Alias_Thug01Ref.getref() as actor).SetUnconscious(false)
(Alias_Thug02Ref.getref() as actor).SetUnconscious(false)
(Alias_Thug03Ref.getref() as actor).SetUnconscious(false)
(Alias_Thug04Ref.getref() as actor).SetUnconscious(false)
(Alias_Thug05Ref.getref() as actor).SetUnconscious(false)

Utility.wait(1.0)
kmyQuest.LosingControl()
BaboChangeLocationEvent03Scene02.forceStart()
kmyQuest.DisableEssential()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN AUTOCAST TYPE BaboDiaQuest
Quest __temp = self as Quest
BaboDiaQuest kmyQuest = __temp as BaboDiaQuest
;END AUTOCAST
;BEGIN CODE
;Surrounded by thugs

;(Alias_Thug01Ref.getref() as actor).Evaluatepackage()
;(Alias_Thug02Ref.getref() as actor).Evaluatepackage()
;(Alias_Thug03Ref.getref() as actor).Evaluatepackage()
;(Alias_Thug04Ref.getref() as actor).Evaluatepackage()
;(Alias_Thug05Ref.getref() as actor).Evaluatepackage()

BaboChangeLocationEvent03Scene01.ForceStart()
If BaboChangeLocationEvent03Scene01.isplaying()
BaboChangeLocationEvent03CellerXmarker01.Enable()
kmyQuest.LosingControl()
else
;debug.notification("The scene is not playing.")
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_16
Function Fragment_16()
;BEGIN CODE
BaboChangeLocationEvent03Scene03.forceStart()
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
;Bandits just left me. Thank god.
kmyQuest.recovercontrol()
(BaboSexController as BaboSexControllerManager).NightgateInnMessagebox(3)
BackCellarDoorRef.Lock()
BaboChangeLocationEvent03CellerXmarker01.Disable()
;It's time to go to stage 250. Let's talk to the inn keeper
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_24
Function Fragment_24()
;BEGIN CODE
;Title obtained
BRMQuest.AddingTitletoPlayerRef(BaboFactionNightgateInnFuckedTitle)
BRMQuest.SetTitleGlobal(BaboGlobalNightGateInnFuckedTitle, 1)
BRMQuest.DecreaseReputation(30, 20)
BackCellarDoorRef.Lock(false)
BDQuest.RetrieveEquipments(Game.getplayer())
(BaboSexController as BaboSexControllerManager).NightgateInnMessagebox(7)
setstage(255)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
;Standing by
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;The end

Actor[] actors
actors = New Actor[5]
actors[0] = (Alias_Thug01Ref.getreference() as actor)
actors[1] = (Alias_Thug02Ref.getreference() as actor)
actors[2] = (Alias_Thug03Ref.getreference() as actor)
actors[3] = (Alias_Thug04Ref.getreference() as actor)
actors[4] = (Alias_Thug05Ref.getreference() as actor)
(BaboSexController as BaboSexControllerManager).DeleteWhenAbleWithTimeout(actors, 60)

Alias_BalagogGroNolobRef.Clear()
Alias_Thug01Ref.Clear()
Alias_Thug02Ref.Clear()
Alias_Thug03Ref.Clear()
Alias_Thug04Ref.Clear()
Alias_Thug05Ref.Clear()
Alias_CompanionRef.Clear()
Alias_InnkeeperRef.Clear()
BDQuest.DisableEssential()
BDQuest.RetrieveEquipments(Game.getplayer())
BaboChangeLocationEvent03CellerXmarker01.Disable()
BaboChangeLocationEvent03CellerXmarker02.Enable()
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_19
Function Fragment_19()
;BEGIN AUTOCAST TYPE BaboDiaQuest
Quest __temp = self as Quest
BaboDiaQuest kmyQuest = __temp as BaboDiaQuest
;END AUTOCAST
;BEGIN CODE
If Submission
kmyQuest.FadeinMove(Alias_PlayerRef, None, 90, true)
Game.getplayer().moveto(Babochnagelocation03ThugScene03Place06)
Else
BaboChangeLocationEvent03Scene05.Start(); it goes to 45 or 90 
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN AUTOCAST TYPE BaboDiaQuest
Quest __temp = self as Quest
BaboDiaQuest kmyQuest = __temp as BaboDiaQuest
;END AUTOCAST
;BEGIN CODE
;MF Start
BaboChangeLocationEvent03Scene03.Stop()
Game.getplayer().moveto(Babochnagelocation03ThugScene03Place06)
BDQuest.RapeCustom(Alias_PlayerRef, Alias_Thug04Ref, None, None, None, Defeated, Rape, Babo, True, AfterSexS3, AfterSexScene3, true)
BRMQuest.SexCount(1)
kmyQuest.CorruptionExp(2.0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN CODE
; Conversation with boss
;BaboChangeLocationEvent03Scene03.Stop()

(Alias_Thug01Ref.getref() as actor).Evaluatepackage()
(Alias_Thug02Ref.getref() as actor).Evaluatepackage()
(Alias_Thug03Ref.getref() as actor).Evaluatepackage()
(Alias_Thug04Ref.getref() as actor).Evaluatepackage()
(Alias_Thug05Ref.getref() as actor).Evaluatepackage()

;BaboChangeLocationEvent03CellerXmarker01.Disable()

;setstage(35)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN AUTOCAST TYPE BaboDiaQuest
Quest __temp = self as Quest
BaboDiaQuest kmyQuest = __temp as BaboDiaQuest
;END AUTOCAST
;BEGIN CODE
;Thugs are going to die

(Alias_Thug01Ref.getref() as actor).getactorbase().setessential(false)
(Alias_Thug02Ref.getref() as actor).getactorbase().setessential(false)
(Alias_Thug03Ref.getref() as actor).getactorbase().setessential(false)
(Alias_Thug04Ref.getref() as actor).getactorbase().setessential(false)
(Alias_Thug05Ref.getref() as actor).getactorbase().setessential(false)

(Alias_Thug01Ref.getref() as actor).kill(Game.getplayer())
(Alias_Thug02Ref.getref() as actor).kill(Game.getplayer())
(Alias_Thug03Ref.getref() as actor).kill(Game.getplayer())
(Alias_Thug04Ref.getref() as actor).kill(Game.getplayer())
(Alias_Thug05Ref.getref() as actor).kill(Game.getplayer())

kmyQuest.DisableEssential()
BaboChangeLocationEvent03CellerXmarker02.Enable()
BaboChangeLocationEvent03CellerXmarker01.Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_18
Function Fragment_18()
;BEGIN AUTOCAST TYPE BaboDiaQuest
Quest __temp = self as Quest
BaboDiaQuest kmyQuest = __temp as BaboDiaQuest
;END AUTOCAST
;BEGIN CODE
;Whole Scene Over. Decision time. This goes to 80 or 120
BaboChangeLocationEvent03Scene05.Stop()
BDQuest.FadeinMove(Alias_PlayerRef, None, 2, false)
Utility.wait(5.0)
(Alias_Thug01Ref.getref() as actor).Disable()
(Alias_Thug02Ref.getref() as actor).Disable()
(Alias_Thug03Ref.getref() as actor).Disable()
(Alias_Thug04Ref.getref() as actor).Disable()
(Alias_Thug05Ref.getref() as actor).Disable()
kmyQuest.DraggingtoSexMarketWithPossibility()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_25
Function Fragment_25()
;BEGIN CODE
;BaboFactionNightgateInnVictoryTitle
BRMQuest.AddingTitletoPlayerRef(BaboFactionNightgateInnVictoryTitle)
BRMQuest.SetTitleGlobal(BaboGlobalNightGateInnVictoryTitle, 1)
BRMQuest.IncreaseReputation(20, 10)
BDQuest.RetrieveEquipments(Game.getplayer())
setstage(255)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property BaboChangeLocationEvent03CellerXmarker01  Auto  

ObjectReference Property BaboChangeLocationEvent03CellerXmarker02  Auto  

ObjectReference Property FrontCellarDoorRef  Auto  

ObjectReference Property BackCellarDoorRef  Auto  

ObjectReference Property FrontCellarDoorRef02  Auto  

Actor Property BalagogGroNolobRef  Auto  

Actor Property HadringREF  Auto  

Scene Property BaboChangeLocationEvent03Scene01  Auto  

Bool Submission = false

Scene Property BaboChangeLocationEvent03Scene02  Auto  

Scene Property BaboChangeLocationEvent03Scene03  Auto  

ObjectReference Property Babochnagelocation03ThugScene02Place01  Auto  

ObjectReference Property Babochnagelocation03ThugScene02Place02  Auto  

ObjectReference Property Babochnagelocation03ThugScene02Place03  Auto  

ObjectReference Property Babochnagelocation03ThugScene02Place04  Auto  

ObjectReference Property Babochnagelocation03ThugScene02Place05  Auto  

Scene Property BaboChangeLocationEvent03Scene04  Auto  

Scene Property BaboChangeLocationEvent03Scene05  Auto  

BaboDiaQuest Property BDQuest  Auto  

BaboReputationMasterScript Property BRMQuest  Auto  

String Property Defeated  Auto  

String Property rape  Auto  

String Property Babo  Auto  

String Property AfterSexS3  Auto  

String Property AfterSexScene3  Auto  

String Property MMF  Auto  

ObjectReference Property Babochnagelocation03ThugScene03Place06  Auto  

Faction Property BaboFactionNightgateInnFuckedTitle  Auto  

Faction Property BaboFactionNightgateInnVictoryTitle  Auto  

Scene Property BaboChangeLocationEvent03Scene04s  Auto  

ActorBase Property BaboChangeLocation03Thugs  Auto  

BaboDiaMonitorScript Property BDSMonitor  Auto  

ObjectReference Property GourmetPondMarker  Auto  

GlobalVariable Property BaboGlobalNightGateInnFuckedTitle  Auto  

GlobalVariable Property BaboGlobalNightGateInnVictoryTitle  Auto  

Quest Property BaboSexController  Auto  

Quest Property BaboDialogueMCM  Auto  

GlobalVariable Property BaboDebugging  Auto  
