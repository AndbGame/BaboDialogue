;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 31
Scriptname QF_BaboChangeLocationEvent01_0884C923 Extends Quest Hidden

;BEGIN ALIAS PROPERTY OldLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_OldLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY StartCity
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_StartCity Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PlayerRef
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PlayerRef Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CityCenter
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CityCenter Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ChallengerRef
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ChallengerRef Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_26
Function Fragment_26()
;BEGIN CODE
;BDMQuest.StruggleAnim((Alias_PlayerRef.getref() as actor), (Alias_ChallengerRef.getref() as actor), False, None, None)
(BaboSexController as BaboSexControllerManager).QTEAnimation((Alias_PlayerRef.getref() as actor), (Alias_ChallengerRef.getref() as actor), false, "", "", true)
BRMQuest.AddingTitletoPlayerRef(BaboFactionChallengerFucktoyTitle)
BRMQuest.SetTitleGlobal(BaboGlobalChallengerFucktoyTitle, 1)
BRMQuest.DecreaseReputation(25, 00)

BRMQuest.AddingTitletoPlayerRef(BaboFactionChallengerFalkreath)
BRMQuest.SetTitleGlobal(BaboGlobalChallengerFalkreath, 1)

Setstage(40)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_20
Function Fragment_20()
;BEGIN CODE
;Guard Helped me...
(BaboSexController as BaboSexControllerManager).UnEquipRestraints((Alias_PlayerRef.getref() as actor))
(BaboSexController as BaboSexControllerManager).UnEquipCumItem((Alias_PlayerRef.getref() as actor))
(BaboSexController as BaboSexControllerManager).ReputationDecrease(0, 20)
setstage(250)
Utility.wait(3.0)
(BaboSexController as BaboSexControllerManager).ChangeLocationEvent01Messagebox(6)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
;The challenger Died
(BaboSexController as BaboSexControllerManager).ChangeLocationEvent01Messagebox(8)
(BaboSexController as BaboSexControllerManager).ReputationIncrease(20, 10)
(BaboSexController as BaboSexControllerManager).CorruptionExpLoss(2.0)
(BaboSexController as BaboSexControllerManager).TraumaExpLoss(1.0)
Utility.Wait(30)
setstage(250)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_30
Function Fragment_30()
;BEGIN CODE
;Debug.Notification("I ran away during the fight")
(BaboSexController as BaboSexControllerManager).ChangeLocationEvent01Messagebox(9)
(BaboSexController as BaboSexControllerManager).ReputationDecrease(10, 0)
(BaboSexController as BaboSexControllerManager).RecoverControl()
(BaboSexController as BaboSexControllerManager).PacifyAlias(Alias_ChallengerRef)
Setstage(250)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).CompatiblityCheck(False)
(BaboSexController as BaboSexControllerManager).SpectatorChangeStatus(250)
Utility.wait(5.0)
setstage(251)
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
Game.GetPlayer().UnequipAll()
Utility.wait(5.0)
(BaboSexController as BaboSexControllerManager).LosingControl()
(BaboSexController as BaboSexControllerManager).BCLEvent01ScenePlay(3)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_22
Function Fragment_22()
;BEGIN CODE
;Go to slavery
;BDMQuest.StruggleAnim((Alias_PlayerRef.getref() as actor), (Alias_ChallengerRef.getref() as actor), False, None, None)
(BaboSexController as BaboSexControllerManager).QTEAnimation((Alias_PlayerRef.getref() as actor), (Alias_ChallengerRef.getref() as actor), false, "", "", true)
(BaboSexController as BaboSexControllerManager).BCLEvent01ScenePlay(0)
setstage(250)
(BaboSexController as BaboSexControllerManager).DraggingtoSexMarket()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_29
Function Fragment_29()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).ChangeLocationEvent01Messagebox(1)
(BaboSexController as BaboSexControllerManager).ReputationDecrease(10, 0)
(BaboSexController as BaboSexControllerManager).RecoverControl()
(BaboSexController as BaboSexControllerManager).PacifyAlias(Alias_ChallengerRef)
Setstage(250)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
;Another Round Start
(BaboSexController as BaboSexControllerManager).ChangeLocationEvent01Messagebox(3)
;kmyQuest.RapeCustom(Alias_PlayerRef, Alias_ChallengerRef, None, None, None, Defeated, Rape, Necro, True, AfterSexS3, AfterSexScene3, true)
(BaboSexController as BaboSexControllerManager).SexCustomTag(Alias_PlayerRef, Alias_ChallengerRef, None, None, None, "Rape, Necro", "Femdom, Bigguy, Shota", True, "CLEvent01Sex02", "ChangeLocationEvent01Sex02", true)
(BaboSexController as BaboSexControllerManager).AddSexCount(1)
(BaboSexController as BaboSexControllerManager).CorruptionExp(2.0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_27
Function Fragment_27()
;BEGIN CODE
;BDMQuest.StruggleAnim((Alias_PlayerRef.getref() as actor), (Alias_ChallengerRef.getref() as actor), False, None, None)
(BaboSexController as BaboSexControllerManager).QTEAnimation((Alias_PlayerRef.getref() as actor), (Alias_ChallengerRef.getref() as actor), false, "", "", true)
BRMQuest.AddingTitletoPlayerRef(BaboFactionChallengerFucktoyTitle)
BRMQuest.SetTitleGlobal(BaboGlobalChallengerFucktoyTitle, 1)
BRMQuest.DecreaseReputation(20, 00)

BRMQuest.AddingTitletoPlayerRef(BaboFactionChallengerMorthal)
BRMQuest.SetTitleGlobal(BaboGlobalChallengerMorthal, 1)

Setstage(40)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_17
Function Fragment_17()
;BEGIN CODE
;He plays with my Pussy
;BDMQuest.StruggleAnim((Alias_PlayerRef.getref() as actor), (Alias_ChallengerRef.getref() as actor), True, BaboEmbarrassment01F, BaboEmbarrassment01MPussy)
(BaboSexController as BaboSexControllerManager).QTEAnimation((Alias_PlayerRef.getref() as actor), (Alias_ChallengerRef.getref() as actor), true, "Babo_FlirtPussy_A01", "Babo_FlirtPussy_A02", true)
;BaboChangeLocationEvent01Scene06.Start()
(BaboSexController as BaboSexControllerManager).BCLEvent01ScenePlay(6)
(BaboSexController as BaboSexControllerManager).ReputationDecrease(10, 0)
(BaboSexController as BaboSexControllerManager).CorruptionExp(2.0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).FadeinMove(Alias_PlayerRef, Alias_CityCenter, 35, 3)
(BaboSexController as BaboSexControllerManager).EquipCumItem((Alias_PlayerRef.getref() as actor))
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
if BaboDebugging.getvalue() == 1
Debug.notification("BaboDialogue: Change Location Event 01 fired")
endif

Actor PChallenger = (Alias_CityCenter.getref() as objectreference).PlaceActorAtMe(BaboChallengerLVL, 4)
Alias_ChallengerRef.forcerefto(PChallenger)
(Alias_ChallengerRef.getref() as actor).EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN CODE
;BDMQuest.StruggleAnim((Alias_PlayerRef.getref() as actor), (Alias_ChallengerRef.getref() as actor), False, None, None)
(BaboSexController as BaboSexControllerManager).QTEAnimation((Alias_PlayerRef.getref() as actor), (Alias_ChallengerRef.getref() as actor), false, "", "", true)
BRMQuest.AddingTitletoPlayerRef(BaboFactionChallengerFucktoyTitle)
BRMQuest.SetTitleGlobal(BaboGlobalChallengerFucktoyTitle, 1)
(BaboSexController as BaboSexControllerManager).ReputationDecrease(30, 0)

BRMQuest.AddingTitletoPlayerRef(BaboFactionChallengerRiften)
BRMQuest.SetTitleGlobal(BaboGlobalChallengerRiften, 1)

Setstage(40)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
;Sex Start
(BaboSexController as BaboSexControllerManager).ChangeLocationEvent01Messagebox(2)
;kmyQuest.RapeCustom(Alias_PlayerRef, Alias_ChallengerRef, None, None, None, Defeated, Rape, Babo, True, AfterSexS3, AfterSexScene3, true)
(BaboSexController as BaboSexControllerManager).SexCustomTag(Alias_PlayerRef, Alias_ChallengerRef, None, None, None, "Rape", "Femdom, Bigguy, Shota", True, "CLEvent01Sex01", "ChangeLocationEvent01Sex01", true)
(BaboSexController as BaboSexControllerManager).AddSexCount(1)
(BaboSexController as BaboSexControllerManager).CorruptionExp(2.0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;Persuasive Sex Start, Finding Inn
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN CODE
;Need help!
;kmyQuest.EquipRestraints((Alias_PlayerRef.getref() as actor)) Already done in the scene
(BaboSexController as BaboSexControllerManager).RecoverControl()
(BaboSexController as BaboSexControllerManager).ChangeLocationEvent01Messagebox(4)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
;Debug.Notification("I ran away 25")
(BaboSexController as BaboSexControllerManager).BCLEvent01ScenePlay(1)
(BaboSexController as BaboSexControllerManager).LosingControl()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_16
Function Fragment_16()
;BEGIN CODE
;He plays with my boobs
;BDMQuest.StruggleAnim((Alias_PlayerRef.getref() as actor), (Alias_ChallengerRef.getref() as actor), True, BaboEmbarrassment01F, BaboEmbarrassment01MChest)
(BaboSexController as BaboSexControllerManager).QTEAnimation((Alias_PlayerRef.getref() as actor), (Alias_ChallengerRef.getref() as actor), true, "Babo_FlirtBreast_A01", "Babo_FlirtBreast_A02", true)
;BaboChangeLocationEvent01Scene05.Start()
(BaboSexController as BaboSexControllerManager).BCLEvent01ScenePlay(5)
BRMQuest.DecreaseReputation(10, 0)
(BaboSexController as BaboSexControllerManager).CorruptionExp(1.0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_23
Function Fragment_23()
;BEGIN CODE
;My friend Helped me...
(BaboSexController as BaboSexControllerManager).UnEquipRestraints((Alias_PlayerRef.getref() as actor))
(BaboSexController as BaboSexControllerManager).UnEquipCumItem((Alias_PlayerRef.getref() as actor))
(BaboSexController as BaboSexControllerManager).ChangeLocationEvent01Messagebox(7)
Utility.wait(5.0)
setstage(250)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_24
Function Fragment_24()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).DisableEssential()
(Alias_ChallengerRef.getref() as actor).EvaluatePackage()
if Alias_ChallengerRef
Actor[] actors = New Actor[1]
actors[0] = (Alias_ChallengerRef.getreference() as actor)
(BaboSexController as BaboSexControllerManager).DeleteWhenAbleWithTimeout(actors, 60)
endif
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
;I lost
(BaboSexController as BaboSexControllerManager).PacifyAlias(Alias_ChallengerRef)
(BaboSexController as BaboSexControllerManager).LosingControl()
Utility.wait(5.0)
(BaboSexController as BaboSexControllerManager).DisableEssential()
(BaboSexController as BaboSexControllerManager).BCLEvent01ScenePlay(2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;Debug.Notification("Fight Start")
(BaboSexController as BaboSexControllerManager).CompatiblityCheck(True)
(BaboSexController as BaboSexControllerManager).ChallengeStart(Alias_ChallengerRef)
(BaboSexController as BaboSexControllerManager).SpectatorActivate((Alias_ChallengerRef.getref() as actor), None)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_19
Function Fragment_19()
;BEGIN CODE
;BDMQuest.StruggleAnim((Alias_PlayerRef.getref() as actor), (Alias_ChallengerRef.getref() as actor), False, None, None)
(BaboSexController as BaboSexControllerManager).QTEAnimation((Alias_PlayerRef.getref() as actor), (Alias_ChallengerRef.getref() as actor), false, "", "", true)
;gotoslaverycontents not yet
setstage(46)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN CODE
(Alias_ChallengerRef.getreference() as actor).moveto(Alias_CityCenter.getreference())
Utility.wait(2.0)
;BDMQuest.StruggleAnim(, , True, BaboEmbarrassment01F, BaboEmbarrassment01M)
(BaboSexController as BaboSexControllerManager).QTEAnimation((Alias_PlayerRef.getref() as actor), (Alias_ChallengerRef.getref() as actor), True, "Babo_Flirt_A01", "Babo_Flirt_A02D", false)
;BaboChangeLocationEvent01Scene04.Start()
(BaboSexController as BaboSexControllerManager).BCLEvent01ScenePlay(4)
(BaboSexController as BaboSexControllerManager).TraumaExp(1.0)
(BaboSexController as BaboSexControllerManager).CorruptionExp(1.0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_21
Function Fragment_21()
;BEGIN CODE
;The challenger freed me
(BaboSexController as BaboSexControllerManager).ReputationDecrease(10, 0)
(BaboSexController as BaboSexControllerManager).ChangeLocationEvent01Messagebox(5)
(BaboSexController as BaboSexControllerManager).UnEquipRestraints((Alias_PlayerRef.getref() as actor))
(BaboSexController as BaboSexControllerManager).UnEquipCumItem((Alias_PlayerRef.getref() as actor))
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_28
Function Fragment_28()
;BEGIN CODE
;BDMQuest.StruggleAnim((Alias_PlayerRef.getref() as actor), (Alias_ChallengerRef.getref() as actor), False, None, None)
(BaboSexController as BaboSexControllerManager).QTEAnimation((Alias_PlayerRef.getref() as actor), (Alias_ChallengerRef.getref() as actor), false, "", "", true)
BRMQuest.AddingTitletoPlayerRef(BaboFactionChallengerFucktoyTitle)
BRMQuest.SetTitleGlobal(BaboGlobalChallengerFucktoyTitle, 1)
BRMQuest.DecreaseReputation(15, 00)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_18
Function Fragment_18()
;BEGIN CODE
;BDMQuest.StruggleAnim((Alias_PlayerRef.getref() as actor), (Alias_ChallengerRef.getref() as actor), False, None, None)
(BaboSexController as BaboSexControllerManager).QTEAnimation((Alias_PlayerRef.getref() as actor), (Alias_ChallengerRef.getref() as actor), false, "", "", true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_25
Function Fragment_25()
;BEGIN CODE
;Debug.Notification("I gave up the figt 26")
(BaboSexController as BaboSexControllerManager).ChangeLocationEvent01Messagebox(1)
(BaboSexController as BaboSexControllerManager).ReputationDecrease(10, 0)
(BaboSexController as BaboSexControllerManager).RecoverControl()
(BaboSexController as BaboSexControllerManager).PacifyAlias(Alias_ChallengerRef)
Setstage(250)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ActorBase Property BaboChallengerLVL  Auto  

Scene Property BaboChangeLocationEvent01Scene01  Auto  

Scene Property BaboChangeLocationEvent01Scene02  Auto  

String Property Defeated  Auto  

String Property rape  Auto  

String Property Babo  Auto  

String Property AfterSexS3  Auto  

String Property AfterSexScene3  Auto  

String Property Necro  Auto  

Scene Property BaboChangeLocationEvent01Scene03  Auto  

BaboDiaMonitorScript Property BDMQuest  Auto  

BaboReputationMasterScript Property BRMQuest  Auto  

String Property BaboEmbarrassment01M  Auto  

String Property BaboEmbarrassment01F  Auto  

Scene Property BaboChangeLocationEvent01Scene04  Auto  

Faction Property BaboFactionChallengerFucktoyTitle  Auto  

GlobalVariable Property BaboGlobalChallengerFucktoyTitle  Auto  

String Property BaboEmbarrassment01MPussy  Auto  

String Property BaboEmbarrassment01MChest  Auto  

Scene Property BaboChangeLocationEvent01Scene05  Auto  

Scene Property BaboChangeLocationEvent01Scene06  Auto  

Location Property FalkreathLocation  Auto  

Location Property RiftenLocation  Auto  

Faction Property BaboFactionChallengerFalkreath  Auto  

Faction Property BaboFactionChallengerRiften  Auto  

GlobalVariable Property BaboGlobalChallengerFalkreath  Auto  

GlobalVariable Property BaboGlobalChallengerRiften  Auto  

GlobalVariable Property BaboGlobalChallengerSolitude  Auto  

GlobalVariable Property BaboGlobalChallengerWhiterun  Auto  

GlobalVariable Property BaboGlobalChallengerWindhelm  Auto  

GlobalVariable Property BaboGlobalChallengerMarkarth  Auto  

Faction Property BaboFactionChallengerMarkarth  Auto  

Faction Property BaboFactionChallengerSolitude  Auto  

Faction Property BaboFactionChallengerWhiterun  Auto  

Faction Property BaboFactionChallengerWindhelm  Auto  

Location Property MorthalLocation  Auto  

GlobalVariable Property BaboGlobalChallengerMorthal  Auto  

Faction Property BaboFactionChallengerMorthal  Auto  

Quest Property BaboSexController  Auto  

GlobalVariable Property BaboDebugging  Auto  
