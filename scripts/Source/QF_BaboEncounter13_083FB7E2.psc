;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 25
Scriptname QF_BaboEncounter13_083FB7E2 Extends Quest Hidden

;BEGIN ALIAS PROPERTY SlaverBoss
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SlaverBoss Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY house
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_house Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Scene_Marker4
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Scene_Marker4 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Slaver03
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Slaver03 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Scene_Marker1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Scene_Marker1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PlayerRef
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PlayerRef Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Slaver01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Slaver01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CenterMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CenterMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Follower03
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Follower03 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Follower01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Follower01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Scene_Marker3
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Scene_Marker3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Slaver02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Slaver02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Scene_Marker2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Scene_Marker2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Follower02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Follower02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TRIGGER
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TRIGGER Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Farmer
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Farmer Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN AUTOCAST TYPE BaboDiaQuest
Quest __temp = self as Quest
BaboDiaQuest kmyQuest = __temp as BaboDiaQuest
;END AUTOCAST
;BEGIN CODE
kmyQuest.EnableEssential()
(BaboFollowerController as BaboFollowerControllerScript).DetectFollowers()
kmyQuest.ChallengeStart(Alias_SlaverBoss)
kmyQuest.ChallengeStart(Alias_Slaver01)
kmyQuest.ChallengeStart(Alias_Slaver02)
kmyQuest.ChallengeStart(Alias_Slaver03)
;In order to capture Player
(BaboSexController as BaboSexControllerManager).CustomLoanSharkLoanReady(0, 0, 0)
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
if BaboEncounter13EndVariable.getvalue() == 1
(BaboReputationScript as BaboReputationMasterScript).DecreaseReputation(5, 5)
elseif BaboEncounter13EndVariable.getvalue() == 2
(BaboReputationScript as BaboReputationMasterScript).IncreaseReputation(10, 5)
elseif BaboEncounter13EndVariable.getvalue() == 3
(BaboReputationScript as BaboReputationMasterScript).IncreaseReputation(20, 20)
elseif BaboEncounter13EndVariable.getvalue() == 4
(BaboReputationScript as BaboReputationMasterScript).DecreaseReputation(10, 0)
endif

Alias_SlaverBoss.GetReference().DeleteWhenAble()
Alias_Slaver01.GetReference().DeleteWhenAble()
Alias_Slaver02.GetReference().DeleteWhenAble()
Alias_Slaver03.GetReference().DeleteWhenAble()
Alias_Farmer.GetReference().DeleteWhenAble()

kmyQuest.DisableEssential()
kmyQuest.CompatiblityCheck(True)
(BaboFollowerController as BaboFollowerControllerScript).ClearAllAliases()
(BaboSexController as BaboSexControllerManager).CustomLoanSharkLoan()
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
(BaboSexController as BaboSexControllerManager).EncounterEvent13Messagebox(1)
(BaboSexController as BaboSexControllerManager).SexCustom(Alias_PlayerRef, Alias_SlaverBoss, Alias_Slaver01, Alias_Slaver02, None, "Aggressive", "MMMF", "Rape", true, "E13S01", "Encounter13Sex01", True)
(BaboReputationScript as BaboReputationMasterScript).SexCountgangbang(4)
kmyquest.CorruptionExp(3.0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_16
Function Fragment_16()
;BEGIN CODE
;Farmer Died
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_22
Function Fragment_22()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).CustomLoanSharkLoanReady(BaboEncounter13Debt.getvalue(), 1.4, 3)
setstage(110)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_21
Function Fragment_21()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).CustomLoanSharkLoanReady(BaboEncounter13Debt.getvalue(), 1.3, 3)
setstage(110)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
BaboEncounter13Debt.setvalue(20000)
UpdateCurrentInstanceGlobal(BaboEncounter13Debt)
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
(BaboFollowerController as BaboFollowerControllerScript).PacifyAllFollowers()
kmyQuest.pacifyAlias(Alias_SlaverBoss)
kmyQuest.pacifyAlias(Alias_Slaver01)
kmyQuest.pacifyAlias(Alias_Slaver02)
kmyQuest.pacifyAlias(Alias_Slaver03)
kmyQuest.DisableEssential()
kmyQuest.CompatiblityCheck(True)
Utility.wait(2.0)
BaboEncounter13EndVariable.setvalue(4)
(BaboFollowerController as BaboFollowerControllerScript).TieUpFollowers(true)
(BaboSexController as BaboSexControllerManager).BCLEventScenePlay(6, "BaboEncounter13")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_20
Function Fragment_20()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).CustomLoanSharkLoanReady(BaboEncounter13Debt.getvalue(), 1.2, 3)
setstage(110)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
int randomi = Utility.randomint(0, 3)
BaboEncounter13Variable.setvalue(randomi)
BaboEncounter13EndVariable.setvalue(0)
(BaboSexController as BaboSexControllerManager).CustomLoanSharkLoanReady(0, 0, 0)
;100 - Ignore
;105 - Left her to her fate.
;106 - Intimidated
;107 - Pay Debt
;110 - paid or Intimidated, it's finished anyway.
;115 - BeforeFight Scene Play
;120 - ChallengeStart
;122 - Victory
;125 - Defeated - Scene starts
;126 - Gangbang
;127 - AfterSex Scene
;130 - Solved
;155 - BadEnd Ready
;160 - BadEnd

;BaboEncounter13EndVariable
;1 - Abandoned
;2 - Intimidated
;3 - PaidDebt
;4 - Defeated
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
BaboEncounter13Debt.setvalue(12000)
UpdateCurrentInstanceGlobal(BaboEncounter13Debt)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN CODE
;Whether it was pay or Intimidation, it's finished
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_19
Function Fragment_19()
;BEGIN CODE
;PayDebt
(BaboSexController as BaboSexControllerManager).CustomLoanSharkLoanReady(BaboEncounter13Debt.getvalue(), 1.1, 3)
setstage(110)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).BCLEventScenePlay(5, "BaboEncounter13")
(BaboSexController as BaboSexControllerManager).EncounterEvent13Messagebox(3)
;PayDebtInstead
BaboEncounter13EndVariable.setvalue(3)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).BCLEventScenePlay(2, "BaboEncounter13")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
BaboEncounter13Debt.setvalue(7000)
UpdateCurrentInstanceGlobal(BaboEncounter13Debt)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
(Alias_Farmer.getreference() as actor).evaluatepackage()
(Alias_SlaverBoss.getreference() as actor).evaluatepackage()
(Alias_Slaver01.getreference() as actor).evaluatepackage()
(Alias_Slaver02.getreference() as actor).evaluatepackage()
(Alias_Slaver03.getreference() as actor).evaluatepackage()
;You leave him/her to his/her fate
BaboEncounter13EndVariable.setvalue(1)
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
(BaboSexController as BaboSexControllerManager).EncounterEvent13Messagebox(1)
(BaboSexController as BaboSexControllerManager).SexCustom(Alias_PlayerRef, Alias_Slaver01, Alias_Slaver02, Alias_Slaver03, None, "Aggressive", "MMMF", "Rape", true, "E13S01", "Encounter13Sex01", True)
(BaboReputationScript as BaboReputationMasterScript).SexCountgangbang(4)
kmyquest.CorruptionExp(3.0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
BaboEncounter13Debt.setvalue(3000)
UpdateCurrentInstanceGlobal(BaboEncounter13Debt)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
(Alias_Farmer.getreference() as actor).evaluatepackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_18
Function Fragment_18()
;BEGIN CODE
BaboBadendKeyword.SendStoryEvent(None, Alias_CenterMarker.getreference())
Utility.wait(1.0)
BaboBadEnd.setstage(2)
Utility.wait(2.0)
BaboBadEnd.setstage(3)
Utility.wait(4.0)
Alias_SlaverBoss.GetReference().Delete()
Alias_Slaver01.GetReference().Delete()
Alias_Slaver02.GetReference().Delete()
Alias_Slaver03.GetReference().Delete()
Alias_Farmer.GetReference().Delete()
BaboBadEnd.setstage(5)
(BaboSexController as BaboSexControllerManager).EncounterEvent13Messagebox(2)
Utility.wait(1.0)
Setstage(255)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).BCLEventScenePlay(4, "BaboEncounter13")
;No fight
BaboEncounter13EndVariable.setvalue(2)
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
; Boss died
kmyQuest.pacifyAlias(Alias_Slaver01)
kmyQuest.pacifyAlias(Alias_Slaver02)
kmyQuest.pacifyAlias(Alias_Slaver03)
kmyQuest.DisableEssential()
kmyQuest.CompatiblityCheck(True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).BCLEventScenePlay(3, "BaboEncounter13")
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property BaboSexController  Auto  

GlobalVariable Property BaboEncounter13Debt  Auto  

GlobalVariable Property BaboEncounter13Variable  Auto  

GlobalVariable Property BaboEncounter13EndVariable  Auto  

Keyword Property BaboBadendKeyword  Auto  

Quest Property BaboBadEnd  Auto  

Quest Property BaboFollowerController  Auto  

Quest Property BaboReputationScript  Auto  
