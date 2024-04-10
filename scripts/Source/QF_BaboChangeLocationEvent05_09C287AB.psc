;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 17
Scriptname QF_BaboChangeLocationEvent05_09C287AB Extends Quest Hidden

;BEGIN ALIAS PROPERTY NewLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_NewLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY OldLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_OldLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PlayerRef
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PlayerRef Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CenterMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CenterMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Visitor
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Visitor Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HomeOwner
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HomeOwner Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SpawnMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SpawnMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Guard
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Guard Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN CODE
;SLHH Activated! - No used anymore stage
(BaboSexController as BaboSexControllerManager).ChangeLocationEvent05Messagebox(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
;Scene Start
(BaboSexController as BaboSexControllerManager).LosingControl()
(BaboSexController as BaboSexControllerManager).BCLEvent05ScenePlay(3)
Utility.wait(1.0)
(BaboSexController as BaboSexControllerManager).RandomExhaustionIdle(PlayerRef)

BRMQuest.AddingTitletoPlayerRef(BaboFactionWhiterunSoftTouchTitle)
BRMQuest.SetTitleGlobal(BaboGlobalWhiterunSoftTouchTitle, 1)
(BaboSexController as BaboSexControllerManager).ReputationBitchIncrease(2)
(BaboSexController as BaboSexControllerManager).CorruptionExp(1.0)
(BaboSexController as BaboSexControllerManager).AddSexCount(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
;After sex
;BaboChangeLocationEvent05Scene02.Start()
(BaboSexController as BaboSexControllerManager).BCLEvent05ScenePlay(2)
(BaboSexController as BaboSexControllerManager).LewdnessExp(1.0)
(BaboSexController as BaboSexControllerManager).CorruptionExp(1.0)
(BaboSexController as BaboSexControllerManager).ReputationBitchIncrease(4)
(BaboSexController as BaboSexControllerManager).LosingControl()
;After the scene, go to 80
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
;SLHH Escape
Actor Guard = (Alias_SpawnMarker.getref() as objectreference).PlaceActorAtMe(BaboGuardWhiterunExterior01, 4)
Alias_Guard.forcerefto(Guard)
(Alias_Guard.getref() as actor).evaluatepackage()
kmyQuest.CorruptionExpLoss(2.0)
kmyQuest.TraumaExpLoss(1.0)
Utility.wait(1.0)
Setstage(90)
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
;Guard and the visitor go to the jail
kmyQuest.UnregisterSexlabHooks()
(Alias_Guard.getref() as actor).evaluatepackage()
(Alias_Visitor.getref() as actor).evaluatepackage()
(Alias_Visitor.getref() as actor).Deletewhenable()
(Alias_Guard.getref() as actor).Deletewhenable()
PlayerRef.ApplyHavokImpulse(0, 0, 1, 1)
(BaboSexController as BaboSexControllerManager).RecoverControl(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
;Nothing Happened. The visitor went away
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
;After Raped
(BaboSexController as BaboSexControllerManager).ReputationBitchIncrease(2)
Actor Guard = (Alias_SpawnMarker.getref() as objectreference).PlaceActorAtMe(BaboGuardWhiterunExterior01, 4)
Alias_Guard.forcerefto(Guard)
(Alias_Guard.getreference() as actor).evaluatepackage()
Utility.wait(1.0)
Setstage(26)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN CODE
;SLHH Escape
Actor Guard = (Alias_SpawnMarker.getref() as objectreference).PlaceActorAtMe(BaboGuardWhiterunExterior02, 4)
Alias_Guard.forcerefto(Guard)
(Alias_Guard.getref() as actor).evaluatepackage()
Utility.wait(1.0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;BDquest.RapeCustom(Alias_PlayerRef, Alias_Visitor, None, None, None,Vaginal, Doggy, Aggressive, True, AfterSexS, AfterSexScene, true) ;Sex Start
(BaboSexController as BaboSexControllerManager).SexCustomTag(Alias_PlayerRef, Alias_Visitor, None, None, None,"Vaginal, Doggy, MF", "Femdom", True, "CLEvent05Sex02", "ChangeLocationEvent05Sex02", true)
(BaboSexController as BaboSexControllerManager).AddSexCount(1)
(BaboSexController as BaboSexControllerManager).CorruptionExp(2.0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_16
Function Fragment_16()
;BEGIN AUTOCAST TYPE BaboDiaQuest
Quest __temp = self as Quest
BaboDiaQuest kmyQuest = __temp as BaboDiaQuest
;END AUTOCAST
;BEGIN CODE
kmyQuest.RegisterSexlabHooks()
kmyQuest.SLHHRegisterAnimationEvent() ;Registering SLHH Animations
kmyQuest.SLHHActivate(Alias_Visitor.getreference() as actor, None);SLHH Start
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
(Alias_Visitor.getreference() as actor).evaluatepackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
;After Raped
(BaboSexController as BaboSexControllerManager).ReputationBitchIncrease(2)
Actor Guard = (Alias_SpawnMarker.getref() as objectreference).PlaceActorAtMe(BaboGuardWhiterunExterior02, 4)
Alias_Guard.forcerefto(Guard)
(Alias_Guard.getreference() as actor).evaluatepackage()
Utility.wait(1.0)
Setstage(26)
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
;The visitor leaves
kmyQuest.UnregisterSexlabHooks()
(Alias_Visitor.getref() as actor).evaluatepackage()
(Alias_Visitor.getref() as actor).Deletewhenable()
Utility.wait(5.0)
(BaboSexController as BaboSexControllerManager).RecoverControl(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN AUTOCAST TYPE BaboDiaQuest
Quest __temp = self as Quest
BaboDiaQuest kmyQuest = __temp as BaboDiaQuest
;END AUTOCAST
;BEGIN CODE
;After SLHH Escape
kmyQuest.UnregisterSexlabHooks()
(Alias_Visitor.getref() as actor).evaluatepackage()
(Alias_Visitor.getref() as actor).Deletewhenable()
(Alias_Guard.getref() as actor).Deletewhenable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;End of the quest
(Alias_Visitor.getref() as actor).Deletewhenable()
(Alias_Guard.getref() as actor).Deletewhenable()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
;When accept sex
(BaboSexController as BaboSexControllerManager).SexCustomTag(Alias_PlayerRef, Alias_Visitor, None, None, None,"Cowgirl, MF", "", True, "CLEvent05Sex01", "ChangeLocationEvent05Sex01", true)
(BaboSexController as BaboSexControllerManager).CorruptionExp(1.0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN CODE
;WARNING: Unable to load fragment source from function Fragment_15 in script QF_BaboChangeLocationEvent05_09C287AB
;Source NOT loaded
if (BaboSexController as BaboSexControllerManager).IsactorRapist(Alias_Visitor.getreference() as actor, 40)
BaboChangeLocationEvent05VisitorGlobal.setvalue(1)
else
BaboChangeLocationEvent05VisitorGlobal.setvalue(0)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

BaboDiaQuest Property BDQuest Auto

BaboReputationMasterScript Property BRMQuest Auto

GlobalVariable Property BaboSexualHarassmentGlobal  Auto  

String Property Vaginal  Auto  

String Property Cowgirl  Auto  

String Property Doggy  Auto  

String Property Aggressive  Auto  

String Property MF  Auto  

String Property AfterSexS  Auto  

String Property AfterSexScene  Auto  

Scene Property BaboChangeLocationEvent05Scene02  Auto  

Scene Property BaboChangeLocationEvent05Scene03  Auto  

ActorBase Property BaboGuardWhiterunExterior01  Auto  

ActorBase Property BaboGuardWhiterunExterior02  Auto  

Idle Property BaboExhaustedBack02  Auto  

Quest Property BaboSexController  Auto  

Actor Property PlayerRef  Auto  

GlobalVariable Property BaboGlobalWhiterunSoftTouchTitle  Auto  

Faction Property BaboFactionWhiterunSoftTouchTitle  Auto  

GlobalVariable Property BaboChangeLocationEvent05VisitorGlobal  Auto  
