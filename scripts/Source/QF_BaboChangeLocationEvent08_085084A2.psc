;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 25
Scriptname QF_BaboChangeLocationEvent08_085084A2 Extends Quest Hidden

;BEGIN ALIAS PROPERTY InnCenterMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_InnCenterMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Maybefan
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Maybefan Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY NewLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_NewLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY OldLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_OldLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FollowerRef
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FollowerRef Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MarkerInCurrentHold
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MarkerInCurrentHold Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LookAtMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LookAtMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SpouseRef
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SpouseRef Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SpawnMarker01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SpawnMarker01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PlayerRef
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PlayerRef Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_16
Function Fragment_16()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).ReputationIncrease(10, 10)
(BaboSexController as BaboSexControllerManager).BCLEvent08ActorStore(Alias_MaybeFan, 4)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
;Good bye
(BaboSexController as BaboSexControllerManager).ReputationBitchDecrease(15)
(BaboSexController as BaboSexControllerManager).ReputationIncrease(5, 0)
(BaboSexController as BaboSexControllerManager).ChangeLocationEvent08Messagebox(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_17
Function Fragment_17()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).ReputationIncrease(10, 10)
(BaboSexController as BaboSexControllerManager).BCLEvent08ActorStore(Alias_MaybeFan, 5)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_19
Function Fragment_19()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).ReputationIncrease(10, 10)
(BaboSexController as BaboSexControllerManager).BCLEvent08ActorStore(Alias_MaybeFan, 7)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).ReputationIncrease(10, 10)
(BaboSexController as BaboSexControllerManager).BCLEvent08ActorStore(Alias_MaybeFan, 3)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_20
Function Fragment_20()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).ReputationBitchIncrease(5)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
;Still in the middle of conversation
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

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
;Ignored
(BaboSexController as BaboSexControllerManager).Reputationdecrease(5, 0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_21
Function Fragment_21()
;BEGIN CODE
int choice = BaboCL08AutographMsg.Show()

if choice == 0

(BaboSexController as BaboSexControllerManager).BCLEventScenePlay(1, "BaboChangeLocationEvent08")

else

if (BaboSexController as BaboSexControllerManager).CustomResistChance(Alias_PlayerRef.getreference() as actor, 30, 60, "Speech")
choice = BaboCL08AutographMsgA.Show()
if choice == 0
(BaboSexController as BaboSexControllerManager).BCLEventScenePlay(1, "BaboChangeLocationEvent08")
endif
else
choice = BaboCL08AutographMsgBFail.Show()
if choice == 0
(BaboSexController as BaboSexControllerManager).BCLEventScenePlay(1, "BaboChangeLocationEvent08")
endif
endif
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN CODE
;Nothing
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN CODE
(Alias_MaybeFan.getreference() as actor).Deletewhenable()
setstage(255)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN AUTOCAST TYPE BaboDiaQuest
Quest __temp = self as Quest
BaboDiaQuest kmyQuest = __temp as BaboDiaQuest
;END AUTOCAST
;BEGIN CODE
;Just bye delete the actor
kmyQuest.Gotostate("ChangeLocationEvent08A")
kmyQuest.fRegisterForSingleUpdateGameTime(1.0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_22
Function Fragment_22()
;BEGIN CODE
;Autograph
(BaboSexController as BaboSexControllerManager).ReputationBitchDecrease(15)
(BaboSexController as BaboSexControllerManager).ReputationIncrease(10, 0)
(BaboSexController as BaboSexControllerManager).ChangeLocationEvent08Messagebox(2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
;receive gift
(BaboSexController as BaboSexControllerManager).GetEdibleFormlist(Alias_PlayerRef.getreference() as actor, 2, 3, false)
(BaboSexController as BaboSexControllerManager).GetEdibleFormlist(Alias_PlayerRef.getreference() as actor, 3, 2, false)
(BaboSexController as BaboSexControllerManager).GetEdibleFormlist(Alias_PlayerRef.getreference() as actor, 0, 4, true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).ReputationIncrease(10, 10)
(BaboSexController as BaboSexControllerManager).BCLEvent08ActorStore(Alias_MaybeFan, 2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_18
Function Fragment_18()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).ReputationIncrease(10, 10)
(BaboSexController as BaboSexControllerManager).BCLEvent08ActorStore(Alias_MaybeFan, 6)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
;Maybe fan becomes Realfan
(BaboSexController as BaboSexControllerManager).ReputationIncrease(10, 10)
(BaboSexController as BaboSexControllerManager).BCLEvent08ActorStore(Alias_MaybeFan, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
;The fan may reveal his eveil nature.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
Actor akactor = Alias_MaybeFan.Getreference() as actor
;int randomi = Utility.randomint(0, 2)
;(BaboSexController as BaboSexControllerManager).SetChracterRank(akactor, randomi)
(BaboSexController as BaboSexControllerManager).SetRandomCharacterRank(akactor)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
;Bye but reject his offering.
(BaboSexController as BaboSexControllerManager).ReputationBitchDecrease(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_24
Function Fragment_24()
;BEGIN CODE
;Hug
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
;Staying in the inn for a while
kmyQuest.Gotostate("ChangeLocationEvent08A")
kmyQuest.fRegisterForSingleUpdateGameTime(24.0)
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
