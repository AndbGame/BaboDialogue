;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 97
Scriptname QF_BaboChangeLocationEvent08_085084A2 Extends Quest Hidden

;BEGIN ALIAS PROPERTY WaitMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WaitMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY StandbyMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_StandbyMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY InnCenterMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_InnCenterMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY GuardBarrackMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_GuardBarrackMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY OldLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_OldLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FollowerRef
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FollowerRef Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LookAtMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LookAtMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MarkerInCurrentHold
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MarkerInCurrentHold Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Maybefan
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Maybefan Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY OldCenterMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_OldCenterMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY NewLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_NewLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SpouseRef
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SpouseRef Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PlayerRef
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PlayerRef Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SpawnMarker01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SpawnMarker01 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN CODE
(Alias_MaybeFan.getreference() as actor).Deletewhenable()
BaboChangeLocation08FanVisit.setvalue(BaboChangeLocation08FanVisit.getvalue() + 1)
setstage(255)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_40
Function Fragment_40()
;BEGIN CODE
TotalRep -= 3
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_95
Function Fragment_95()
;BEGIN CODE
setstage(230)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
;Maybe fan becomes Realfan
TotalRep += 10
(BaboSexController as BaboSexControllerManager).BCLEvent08ActorStore(Alias_MaybeFan, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
;Ignored
TotalRep -= 5
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_49
Function Fragment_49()
;BEGIN CODE
Actor akactor = Alias_MaybeFan.Getreference() as actor
akactor.say(BaboChangeLocationEvent08BranchAttackedT01)
TotalRep -= 2
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_80
Function Fragment_80()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).ChangeLocationEvent08Messagebox(10)
(Alias_MaybeFan.getreference() as actor).additem(BaboEventPlayerAutograph, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_22
Function Fragment_22()
;BEGIN CODE
;Autograph
TotalRepBitch -= 15
TotalRep += 10
(BaboSexController as BaboSexControllerManager).ChangeLocationEvent08Messagebox(2)
Babo_Favorfromfan.cast(Alias_MaybeFan.getreference() as actor, Alias_PlayerRef.getreference() as actor)
(Alias_MaybeFan.getreference() as actor).additem(BaboEventPlayerAutograph, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_45
Function Fragment_45()
;BEGIN CODE
TotalRep -= 3
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_17
Function Fragment_17()
;BEGIN CODE
TotalRep += 10
(BaboSexController as BaboSexControllerManager).BCLEvent08ActorStore(Alias_MaybeFan, 5)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_36
Function Fragment_36()
;BEGIN CODE
TotalRep += 10
(BaboSexController as BaboSexControllerManager).DefineStruggleActor(Alias_Maybefan)
(BaboSexController as BaboSexControllerManager).StateChange("BaboFrontHugState")
(BaboSexController as BaboSexControllerManager).BCLEventScenePlay(2, "BaboChangeLocationEvent08")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_60
Function Fragment_60()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).BCLEventScenePlay(4, "BaboChangeLocationEvent08")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_20
Function Fragment_20()
;BEGIN CODE
TotalRepBitch += 4
TotalRep -= 10
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_64
Function Fragment_64()
;BEGIN CODE
(Alias_MaybeFan.getreference() as actor).additem(BaboEventPlayerAutograph, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_62
Function Fragment_62()
;BEGIN CODE
(Alias_MaybeFan.getreference() as actor).evaluatepackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_52
Function Fragment_52()
;BEGIN CODE
TotalRep -= 4
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_86
Function Fragment_86()
;BEGIN CODE
TotalRep -= 5
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_56
Function Fragment_56()
;BEGIN CODE
int choice = BaboCL08AssaultMsg.Show()

if choice == 0
	Setstage(100)
elseif choice == 1
	Setstage(45)
elseif choice == 2
	setstage(48)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_90
Function Fragment_90()
;BEGIN CODE
TotalRep += 3
(BaboSexController as BaboSexControllerManager).GetEdibleSusFormlist(Alias_PlayerRef.getreference() as actor, 0, 5, true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_30
Function Fragment_30()
;BEGIN CODE
int choice = BaboCL08AutographMsg.Show()

if choice == 0
	(BaboSexController as BaboSexControllerManager).BCLEventScenePlay(1, "BaboChangeLocationEvent08")
elseif choice == 1
	if (BaboSexController as BaboSexControllerManager).CustomResistChance(Alias_PlayerRef.getreference() as actor, 30, 60, "Speech")
		choice = BaboCL08AutographMsgB.Show()
		if choice == 0
			(BaboSexController as BaboSexControllerManager).BCLEventScenePlay(1, "BaboChangeLocationEvent08")
		else
			setstage(22)
		endif
	else
		choice = BaboCL08AutographMsgBFail.Show()
		if choice == 0
			(BaboSexController as BaboSexControllerManager).BCLEventScenePlay(1, "BaboChangeLocationEvent08")
		endif
	endif
else
	setstage(22)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_44
Function Fragment_44()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).BCLEventScenePlay(1, "BaboChangeLocationEvent08")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
TotalRep += 3
(BaboSexController as BaboSexControllerManager).GetEdibleFormlist(Alias_PlayerRef.getreference() as actor, 2, 3, false)
(BaboSexController as BaboSexControllerManager).GetEdibleFormlist(Alias_PlayerRef.getreference() as actor, 3, 2, false)
(BaboSexController as BaboSexControllerManager).GetEdibleFormlist(Alias_PlayerRef.getreference() as actor, 0, 4, true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN CODE
TotalRep += 10
(BaboSexController as BaboSexControllerManager).BCLEvent08ActorStore(Alias_MaybeFan, 3)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_96
Function Fragment_96()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).BCLEventScenePlay(6, "BaboChangeLocationEvent08")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_76
Function Fragment_76()
;BEGIN CODE
BaboChangeLocation08Loc.setvalue(5)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_31
Function Fragment_31()
;BEGIN CODE
;Autograph but fraud
(BaboSexController as BaboSexControllerManager).CustomLoanSharkLoanReady(5000, 1.5, 5)
(BaboSexController as BaboSexControllerManager).ChangeLocationEvent08Messagebox(3)
(Alias_MaybeFan.getreference() as actor).additem(BaboEventPlayerAutograph, 1)
Babo_Favorfromfan.cast(Alias_MaybeFan.getreference() as actor, Alias_PlayerRef.getreference() as actor)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE BaboDiaQuest
Quest __temp = self as Quest
BaboDiaQuest kmyQuest = __temp as BaboDiaQuest
;END AUTOCAST
;BEGIN CODE
Actor akactor = Alias_MaybeFan.Getreference() as actor
TotalRep = 0
int randomi = Utility.randomint(0, 100)
BaboChangeLocation08Fraud.setvalue(0)
(BaboSexController as BaboSexControllerManager).SetSLAArousal(akactor, randomi)
(BaboSexController as BaboSexControllerManager).SetRandomCharacterRank(akactor)
(BaboSexController as BaboSexControllerManager).IsactorRapist(akactor, 10, false)
(BaboSexController as BaboSexControllerManager).SetBehaviorPattern(akactor, 5)
(BaboSexController as BaboSexControllerManager).AppearanceCalc()

kmyQuest.Gotostate("ChangeLocationEvent08A")
kmyQuest.fRegisterForSingleUpdateGameTime(4.0)
(Alias_MaybeFan.getreference() as actor).evaluatepackage()
setStage(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_88
Function Fragment_88()
;BEGIN CODE
(Alias_MaybeFan.getreference() as actor).evaluatepackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_94
Function Fragment_94()
;BEGIN CODE
setstage(230)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_91
Function Fragment_91()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).CustomLoanSharkLoan()
setstage(230)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_53
Function Fragment_53()
;BEGIN AUTOCAST TYPE BaboDiaQuest
Quest __temp = self as Quest
BaboDiaQuest kmyQuest = __temp as BaboDiaQuest
;END AUTOCAST
;BEGIN CODE
kmyQuest.FadeinMove(Alias_playerref, Alias_GuardBarrackMarker, 180, true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_19
Function Fragment_19()
;BEGIN CODE
TotalRep += 10
(BaboSexController as BaboSexControllerManager).BCLEvent08ActorStore(Alias_MaybeFan, 7)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_48
Function Fragment_48()
;BEGIN CODE
Actor akactor = Alias_MaybeFan.Getreference() as actor
akactor.say(BaboChangeLocationEvent08BranchAttackedT01)
TotalRep -= 8
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_63
Function Fragment_63()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).ReputationIncrease(TotalRep, TotalRep/2)
(BaboSexController as BaboSexControllerManager).ReputationBitchIncrease(TotalRepBitch)
(BaboSexController as BaboSexControllerManager).ActorStore(Alias_MaybeFan.getreference() as actor)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_77
Function Fragment_77()
;BEGIN CODE
BaboChangeLocation08Loc.setvalue(6)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_18
Function Fragment_18()
;BEGIN CODE
TotalRep += 10
(BaboSexController as BaboSexControllerManager).BCLEvent08ActorStore(Alias_MaybeFan, 6)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_37
Function Fragment_37()
;BEGIN CODE
BaboChangeLocationEvent08AutographScene02.stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_93
Function Fragment_93()
;BEGIN CODE
int ilocation = BaboChangeLocation08Loc.getvalue() as int
(BaboSexController as BaboSexControllerManager).CL08StalkerActorStore(Alias_MaybeFan, ilocation)
Alias_MaybeFan.clear()
setstage(230)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_74
Function Fragment_74()
;BEGIN CODE
BaboChangeLocation08Loc.setvalue(3)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_50
Function Fragment_50()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).BCLEventScenePlay(1, "BaboChangeLocationEvent08")
BaboChangeLocation08Fraud.setvalue(1) ; it means player knows the fan is a fraud
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_55
Function Fragment_55()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).BCLEventScenePlay(3, "BaboChangeLocationEvent08")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_81
Function Fragment_81()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).ChangeLocationEvent08Messagebox(10)
(Alias_MaybeFan.getreference() as actor).additem(BaboEventPlayerAutograph, 1)
Babo_Favorfromfan.cast(Alias_MaybeFan.getreference() as actor, Alias_PlayerRef.getreference() as actor)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_41
Function Fragment_41()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).ReputationIncrease(TotalRep, TotalRep/2)
(BaboSexController as BaboSexControllerManager).ReputationBitchIncrease(TotalRepBitch)
setstage(250)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
;Good bye
TotalRepBitch -= 15
TotalRep += 5
(BaboSexController as BaboSexControllerManager).ChangeLocationEvent08Messagebox(1)
Babo_Favorfromfan.cast(Alias_MaybeFan.getreference() as actor, Alias_PlayerRef.getreference() as actor)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_39
Function Fragment_39()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).ChangeLocationEvent08Messagebox(5)
Actor Kidnapper = Alias_Maybefan.Getreference() as actor
Alias_Maybefan.clear()
if BaboKidnapEvent.isrunning()
BaboKidnapEvent.setstage(255)
BaboKidnapEvent.stop()
Utility.wait(1.0)
(BaboSexController as BaboSexControllerManager).KidnapQuestStart(Kidnapper, none, Utility.randomint(6, 7), None)
else
(BaboSexController as BaboSexControllerManager).KidnapQuestStart(Kidnapper, none, Utility.randomint(6, 7), None)
endif
Utility.wait(7.0)
(BaboKidnapEvent as BaboKidnapEvenScript).StartUptheEvent(4)
setstage(250)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_61
Function Fragment_61()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).SLHHActivate(Alias_Maybefan.getreference() as actor, none)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_57
Function Fragment_57()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).ChangeLocationEvent08Messagebox(8)
(BaboSexController as BaboSexControllerManager).ActorChallengeStart(Alias_MaybeFan.getreference() as actor)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_66
Function Fragment_66()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).ChangeLocationEvent08Messagebox(3)
(Alias_MaybeFan.getreference() as actor).additem(BaboEventPlayerAutograph, 1)
Babo_Favorfromfan.cast(Alias_MaybeFan.getreference() as actor, Alias_PlayerRef.getreference() as actor)

if BaboChangeLocation08Loc.getvalue() == 1
	BaboChangeLocation08FraudWindhelmTab.setvalue(BaboChangeLocation08FraudWindhelmTab.getvalue() + 1)
elseif BaboChangeLocation08Loc.getvalue() == 2
	BaboChangeLocation08FraudRiftenTab.setvalue(BaboChangeLocation08FraudRiftenTab.getvalue() + 1)
elseif BaboChangeLocation08Loc.getvalue() == 3
	BaboChangeLocation08FraudSolitudeTab.setvalue(BaboChangeLocation08FraudSolitudeTab.getvalue() + 1)
elseif BaboChangeLocation08Loc.getvalue() == 4
	BaboChangeLocation08FraudBYOH01Tab.setvalue(BaboChangeLocation08FraudBYOH01Tab.getvalue() + 1)
elseif BaboChangeLocation08Loc.getvalue() == 5
	BaboChangeLocation08FraudBYOH02Tab.setvalue(BaboChangeLocation08FraudBYOH02Tab.getvalue() + 1)
elseif BaboChangeLocation08Loc.getvalue() == 6
	BaboChangeLocation08FraudBYOH03Tab.setvalue(BaboChangeLocation08FraudBYOH03Tab.getvalue() + 1)
elseif BaboChangeLocation08Loc.getvalue() == 7
	BaboChangeLocation08FraudsolstheimTab.setvalue(BaboChangeLocation08FraudsolstheimTab.getvalue() + 1)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_83
Function Fragment_83()
;BEGIN CODE
TotalRep -= 5
TotalRepBitch += 2
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_72
Function Fragment_72()
;BEGIN CODE
BaboChangeLocation08Loc.setvalue(2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_47
Function Fragment_47()
;BEGIN CODE
Actor akactor = Alias_MaybeFan.Getreference() as actor
akactor.say(BaboChangeLocationEvent08BranchAttackedT01)
TotalRep -= 15
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_67
Function Fragment_67()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).ChangeLocationEvent08Messagebox(3)
(Alias_MaybeFan.getreference() as actor).additem(BaboEventPlayerAutograph, 1)
Babo_Favorfromfan.cast(Alias_MaybeFan.getreference() as actor, Alias_PlayerRef.getreference() as actor)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN CODE
TotalRep += 10
(BaboSexController as BaboSexControllerManager).BCLEvent08ActorStore(Alias_MaybeFan, 2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_51
Function Fragment_51()
;BEGIN CODE
TotalRep -= 2
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_24
Function Fragment_24()
;BEGIN CODE
;Hug
(BaboSexController as BaboSexControllerManager).DefineStruggleActor(Alias_Maybefan)
(BaboSexController as BaboSexControllerManager).StateChange("BaboFrontHugState")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_82
Function Fragment_82()
;BEGIN CODE
TotalRepBitch += 1
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_54
Function Fragment_54()
;BEGIN CODE
(Alias_MaybeFan.getreference() as actor).delete()
(BaboSexController as BaboSexControllerManager).CustomLoanSharkLoanReady(0, 0, 0)
TotalRep = 2
TotalRepbitch = 0
(BaboSexController as BaboSexControllerManager).ChangeLocationEvent08Messagebox(7)
setstage(230)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_58
Function Fragment_58()
;BEGIN CODE
(Alias_MaybeFan.getreference() as actor).moveto(Alias_OldCenterMarker.getreference())
(Alias_PlayerRef.getreference() as actor).moveto(Alias_OldCenterMarker.getreference())
Utility.wait(1.0)
(BaboSexController as BaboSexControllerManager).ChangeLocationEvent08Messagebox(9)
(BaboSexController as BaboSexControllerManager).SexCustom(Alias_PlayerRef, Alias_MaybeFan, None, None, None, "MF", "Oral", "", true, "CLEvent08", "ChangeLocationEvent08", false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
TotalRepBitch -= 7
TotalRep -= 5
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_78
Function Fragment_78()
;BEGIN CODE
BaboChangeLocation08Loc.setvalue(7)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_16
Function Fragment_16()
;BEGIN CODE
TotalRep += 10
(BaboSexController as BaboSexControllerManager).BCLEvent08ActorStore(Alias_MaybeFan, 4)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_89
Function Fragment_89()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).BCLEventScenePlay(5, "BaboChangeLocationEvent08")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_75
Function Fragment_75()
;BEGIN CODE
BaboChangeLocation08Loc.setvalue(4)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_32
Function Fragment_32()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).CustomLoanSharkLoanReady(0, 0, 0)
TotalRepBitch = 0
TotalRep = 0
Setstage(250)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_73
Function Fragment_73()
;BEGIN CODE
BaboChangeLocation08Loc.setvalue(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_71
Function Fragment_71()
;BEGIN CODE
BaboChangeLocation08Loc.setvalue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN CODE
;Nothing
TotalRep -= 2
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_79
Function Fragment_79()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).CustomLoanSharkLoanReady(5000, 1.5, 5)
(BaboSexController as BaboSexControllerManager).ChangeLocationEvent08Messagebox(10)
(Alias_MaybeFan.getreference() as actor).additem(BaboEventPlayerAutograph, 1)
Babo_Favorfromfan.cast(Alias_MaybeFan.getreference() as actor, Alias_PlayerRef.getreference() as actor)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_59
Function Fragment_59()
;BEGIN CODE
(Alias_MaybeFan.getreference() as actor).moveto(Alias_OldCenterMarker.getreference())
(Alias_PlayerRef.getreference() as actor).moveto(Alias_OldCenterMarker.getreference())
Utility.wait(1.0)
(BaboSexController as BaboSexControllerManager).ChangeLocationEvent08Messagebox(11)
(BaboSexController as BaboSexControllerManager).SexCustom(Alias_PlayerRef, Alias_MaybeFan, None, None, None, "Rape", "Aggressive", "MF", true, "CLEvent08", "ChangeLocationEvent08", true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_46
Function Fragment_46()
;BEGIN CODE
TotalRep -= 6
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_42
Function Fragment_42()
;BEGIN CODE
int choice = BaboCL08AutographMsg.Show()

if choice == 0
	(BaboSexController as BaboSexControllerManager).BCLEventScenePlay(1, "BaboChangeLocationEvent08")
elseif choice == 1
	if (BaboSexController as BaboSexControllerManager).CustomResistChance(Alias_PlayerRef.getreference() as actor, 30, 60, "Speech")
		choice = BaboCL08AutographMsgA.Show()
		if choice == 0
			(BaboSexController as BaboSexControllerManager).BCLEventScenePlay(1, "BaboChangeLocationEvent08")
		else
			setstage(22)
		endif
	else
		choice = BaboCL08AutographMsgBFail.Show()
		if choice == 0
			(BaboSexController as BaboSexControllerManager).BCLEventScenePlay(1, "BaboChangeLocationEvent08")
		endif
	endif
else
	setstage(22)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_85
Function Fragment_85()
;BEGIN CODE
TotalRep -= 5
TotalRepBitch += 7
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_38
Function Fragment_38()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).ChangeLocationEvent08Messagebox(4)
(BaboSexController as BaboSexControllerManager).SLHHChokeActivate(Alias_Maybefan.getreference() as actor)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_92
Function Fragment_92()
;BEGIN CODE
setstage(230)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_87
Function Fragment_87()
;BEGIN CODE
TotalRep += 10
(BaboSexController as BaboSexControllerManager).DefineStruggleActor(Alias_Maybefan)
(BaboSexController as BaboSexControllerManager).StateChange("BaboFrontHugState")
(BaboSexController as BaboSexControllerManager).BCLEventScenePlay(2, "BaboChangeLocationEvent08")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_84
Function Fragment_84()
;BEGIN CODE
TotalRep -= 5
TotalRepBitch += 5
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property BaboSexController  Auto  

ActorBase Property BaboEventChangeLocation08Visitor01  Auto  

Message Property BaboCL08AutographMsg  Auto  

Message Property BaboCL08AutographMsgA  Auto  

Message Property BaboCL08AutographMsgB  Auto  

Message Property BaboCL08AutographMsgBFail  Auto  

GlobalVariable Property BaboChangeLocation08Loc  Auto  

Scene Property BaboChangeLocationEvent08AutographScene02  Auto  

Quest Property BaboKidnapEvent  Auto  

GlobalVariable Property BaboChangeLocation08Fraud  Auto  

Int Property TotalRep  Auto  

Int Property TotalRepBitch  Auto  

Topic Property BaboChangeLocationEvent08BranchAttackedT01  Auto  

GlobalVariable Property BaboChangeLocation08FanVisit  Auto  

Message Property BaboCL08AssaultMsg  Auto  

Book Property BaboEventPlayerAutograph  Auto  

SPELL Property Babo_Favorfromfan  Auto  

GlobalVariable Property BaboChangeLocation08FraudWindhelmTab  Auto  

GlobalVariable Property BaboChangeLocation08FraudRiftenTab  Auto  

GlobalVariable Property BaboChangeLocation08FraudSolitudeTab  Auto  

GlobalVariable Property BaboChangeLocation08FraudBYOH01Tab  Auto  

GlobalVariable Property BaboChangeLocation08FraudBYOH02Tab  Auto  

GlobalVariable Property BaboChangeLocation08FraudBYOH03Tab  Auto  

GlobalVariable Property BaboChangeLocation08FraudsolstheimTab  Auto  
