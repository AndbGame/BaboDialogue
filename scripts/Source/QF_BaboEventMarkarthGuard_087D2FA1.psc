;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 17
Scriptname QF_BaboEventMarkarthGuard_087D2FA1 Extends Quest Hidden

;BEGIN ALIAS PROPERTY BaboEventMarkarthGuardXmarker01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BaboEventMarkarthGuardXmarker01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY StrictGuard01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_StrictGuard01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ConfiscateChestRef
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ConfiscateChestRef Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BaboEventMarkarthGuardXmarker02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BaboEventMarkarthGuardXmarker02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DStrictGuard
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DStrictGuard Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PlayerRef
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PlayerRef Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BaboEventMarkarthGuardXmarker03
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BaboEventMarkarthGuardXmarker03 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BaboEventMarkarthGuardXmarker04
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BaboEventMarkarthGuardXmarker04 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY StrictGuard02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_StrictGuard02 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN AUTOCAST TYPE BaboEventMarkarthGuardMasterScript
Quest __temp = self as Quest
BaboEventMarkarthGuardMasterScript kmyQuest = __temp as BaboEventMarkarthGuardMasterScript
;END AUTOCAST
;BEGIN CODE
Utility.wait(5.0)
kmyQuest.Exhaustion((Alias_PlayerRef.getref() as actor), False)
Setstage(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE BaboEventMarkarthGuardMasterScript
Quest __temp = self as Quest
BaboEventMarkarthGuardMasterScript kmyQuest = __temp as BaboEventMarkarthGuardMasterScript
;END AUTOCAST
;BEGIN CODE
Alias_StrictGuard01.Clear()
Alias_StrictGuard02.Clear()
Alias_DStrictGuard.Clear()
kmyQuest.GoStateBefore()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN CODE
BaboMarkarthStrictGuardTriggerGlobal.setvalue(BaboMarkarthStrictGuardTriggerGlobal.getvalue() + 1)
Setstage(5)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;Move to Location
(BaboSexController as BaboSexControllerManager).CompatiblityCheck(True)
(BaboSexController as BaboSexControllerManager).LosingControl()

Utility.wait(1.0)

Int Random = Utility.Randomint(0, 1)
If Random == 1
(BaboSexController as BaboSexControllerManager).BCLEventScenePlay(1, "BaboEventMarkarthGuard")
Else
(BaboSexController as BaboSexControllerManager).BCLEventScenePlay(2, "BaboEventMarkarthGuard")
EndIf
(BaboSexController as BaboSexControllerManager).MarkarthGuardMessagebox(1)
(BaboSexController as BaboSexControllerManager).CorruptionExp(3.0)
(BaboSexController as BaboSexControllerManager).TraumaExp(3.0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN AUTOCAST TYPE BaboEventMarkarthGuardMasterScript
Quest __temp = self as Quest
BaboEventMarkarthGuardMasterScript kmyQuest = __temp as BaboEventMarkarthGuardMasterScript
;END AUTOCAST
;BEGIN CODE
;You started the fight against the guard
(BaboSexController as BaboSexControllerManager).ChallengeStart(Alias_DStrictGuard)
kmyQuest.RegisterUpdate(3)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN AUTOCAST TYPE BaboEventMarkarthGuardMasterScript
Quest __temp = self as Quest
BaboEventMarkarthGuardMasterScript kmyQuest = __temp as BaboEventMarkarthGuardMasterScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.ConfiscateInventory02()
(BaboSexController as BaboSexControllerManager).MarkarthGuardMessagebox(3)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN AUTOCAST TYPE BaboEventMarkarthGuardMasterScript
Quest __temp = self as Quest
BaboEventMarkarthGuardMasterScript kmyQuest = __temp as BaboEventMarkarthGuardMasterScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.RegisterUpdate(24)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_16
Function Fragment_16()
;BEGIN CODE
;Move to Location and Scene Start 00b
(BaboSexController as BaboSexControllerManager).BCLEventScenePlay(3, "BaboEventMarkarthGuard")
(BaboSexController as BaboSexControllerManager).SpectatorActivate((Alias_DStrictGuard.getref() as actor), None)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN AUTOCAST TYPE BaboEventMarkarthGuardMasterScript
Quest __temp = self as Quest
BaboEventMarkarthGuardMasterScript kmyQuest = __temp as BaboEventMarkarthGuardMasterScript
;END AUTOCAST
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).QTEAnimation(Alias_PlayerRef.getref() as actor, Alias_DStrictGuard.getref() as actor, false, "", "", true)
(BaboSexController as BaboSexControllerManager).BCLEventScenePlay(4, "BaboEventMarkarthGuard")
kmyQuest.Exhaustion((Alias_PlayerRef.getreference() as actor), True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN AUTOCAST TYPE BaboEventMarkarthGuardMasterScript
Quest __temp = self as Quest
BaboEventMarkarthGuardMasterScript kmyQuest = __temp as BaboEventMarkarthGuardMasterScript
;END AUTOCAST
;BEGIN CODE
;The end of the quest. Returns to the starting point. She went through harsh investigation

(BaboSexController as BaboSexControllerManager).pacifyAlias(Alias_DStrictGuard)

Alias_StrictGuard01.GetReference().DeleteWhenAble()
Alias_StrictGuard02.GetReference().DeleteWhenAble()
Alias_DStrictGuard.GetReference().DeleteWhenAble()

kmyQuest.GoState()
kmyQuest.RegisterUpdate(24)
(BaboSexController as BaboSexControllerManager).CompatiblityCheck(False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN AUTOCAST TYPE BaboEventMarkarthGuardMasterScript
Quest __temp = self as Quest
BaboEventMarkarthGuardMasterScript kmyQuest = __temp as BaboEventMarkarthGuardMasterScript
;END AUTOCAST
;BEGIN CODE
;The end of the quest. Returns to the starting point. She ran away
Alias_StrictGuard01.GetReference().DeleteWhenAble()
Alias_StrictGuard02.GetReference().DeleteWhenAble()
Alias_DStrictGuard.GetReference().DeleteWhenAble()

kmyQuest.GoState()
kmyQuest.RegisterUpdate(24)
(BaboSexController as BaboSexControllerManager).CompatiblityCheck(False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;I ran away
CrimeFactionReach.setcrimegold(500)
setstage(160)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).MarkarthGuardMessagebox(4)
Setstage(150)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN CODE
;Move to Location and Scene Start 00a
(BaboSexController as BaboSexControllerManager).BCLEventScenePlay(3, "BaboEventMarkarthGuard")
(BaboSexController as BaboSexControllerManager).SpectatorActivate((Alias_DStrictGuard.getref() as actor), None)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN AUTOCAST TYPE BaboEventMarkarthGuardMasterScript
Quest __temp = self as Quest
BaboEventMarkarthGuardMasterScript kmyQuest = __temp as BaboEventMarkarthGuardMasterScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.StartQuest()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
;You attacked the guard and killed him(This is an aborted stage)
;CrimeFactionReach.setcrimegold(2000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN AUTOCAST TYPE BaboEventMarkarthGuardMasterScript
Quest __temp = self as Quest
BaboEventMarkarthGuardMasterScript kmyQuest = __temp as BaboEventMarkarthGuardMasterScript
;END AUTOCAST
;BEGIN CODE
;This is the end of a investigation. But if you dare to attack the guard you will fight him
kmyQuest.ConfiscateInventory()
kmyQuest.RegisterUpdate(5)
Utility.wait(1.0)
(BaboSexController as BaboSexControllerManager).SpectatorChangeStatus(250)
Utility.wait(1.0)
(Alias_DStrictGuard.GetReference() as actor).Evaluatepackage()
BRMQuest.DecreaseReputation(30, 10)
BRMQuest.AddingTitletoPlayerRef(BaboFactionInvestigationMarkarthTitle)
BRMQuest.SetTitleGlobal(BaboGlobalInvestigationMarkarthTitle, 1)
(BaboSexController as BaboSexControllerManager).MarkarthGuardMessagebox(2)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property BaboMarkarthStrictGuardTriggerGlobal Auto
ObjectReference Property TriggerSwitchStrictGuard Auto

BaboReputationMasterScript Property BRMQuest Auto

Faction Property CrimeFactionReach  Auto  

Scene Property Scene01  Auto  

BaboDiaMonitorScript Property BMQuest Auto

Scene Property Scene02  Auto  

Faction Property BaboFactionInvestigationMarkarthTitle  Auto  

GlobalVariable Property BaboGlobalInvestigationMarkarthTitle  Auto  

String Property BaboInvestigationWhileVictim  Auto  

String Property BaboInvestigationWhileGuard  Auto  

Scene Property BaboEventMarkarthGuardScene00a  Auto  

Scene Property BaboEventMarkarthGuardScene00b  Auto  

Quest Property BaboSexController  Auto  
