;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 52
Scriptname QF_BaboDialogueWhiterun_09B67C31 Extends Quest Hidden

;BEGIN ALIAS PROPERTY GuestRef
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_GuestRef Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ViceCaptainRef
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ViceCaptainRef Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY OrcVisitorRef01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_OrcVisitorRef01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY OrcVisitorRef02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_OrcVisitorRef02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DuelMarkerJudge
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DuelMarkerJudge Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PlayerRef
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PlayerRef Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CaptainRef
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CaptainRef Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ViceCaptainDuelRef
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ViceCaptainDuelRef Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ViceCaptainDeadRef
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ViceCaptainDeadRef Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MovePointA
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MovePointA Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DuelMarkerFoe
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DuelMarkerFoe Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PlayerMovePointBreezehomeEvent
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PlayerMovePointBreezehomeEvent Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MovePointB
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MovePointB Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DuelMarkerPlayer
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DuelMarkerPlayer Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PlayerMovePointBreezehome
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PlayerMovePointBreezehome Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY OrcVisitorRef03
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_OrcVisitorRef03 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN AUTOCAST TYPE BaboDialogueWhiterunScript
Quest __temp = self as Quest
BaboDialogueWhiterunScript kmyQuest = __temp as BaboDialogueWhiterunScript
;END AUTOCAST
;BEGIN CODE
;Fade in - Player and other actors will be placed in place.
;ViceCaptain move to the pc's home
kmyQuest.PreParethesceneA01()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
;Reset quest
(BaboSetstageOnEnterTriggerWhiterun01 as BaboDefaultOnEnterTriggerScript).ReArmTrigger()
(BaboSetstageOnEnterTriggerWhiterun02 as BaboDefaultOnEnterTriggerScript).ReArmTrigger()
BaboSetstageOnEnterTriggerWhiterun01.disable()
BaboSetstageOnEnterTriggerWhiterun01A.disable()
(Alias_ViceCaptainRef.getref() as actor).delete()
(Alias_ViceCaptainDeadRef.getref() as actor).delete()
(Alias_ViceCaptainDuelRef.getref() as actor).delete()
(Alias_OrcVisitorRef01.getref() as actor).delete()
(Alias_OrcVisitorRef02.getref() as actor).delete()
(Alias_OrcVisitorRef03.getref() as actor).delete()
Utility.wait(1.0)
Alias_ViceCaptainRef.clear()
Alias_ViceCaptainDuelRef.clear()
Alias_ViceCaptainDeadRef.clear()
Alias_OrcVisitorRef01.clear()
Alias_OrcVisitorRef02.clear()
Alias_OrcVisitorRef03.clear()
Alias_CaptainRef.clear()
BaboEventWhiterunViceCaptainDuelXmakerRef.disable()
BaboWhiterunCellDoor02Ref.lock()
BaboWhiterunCellDoor02Ref.disable()
WhiterunCellDoor02Ref.enable()
BaboWhiterunBreezehomeVCEnding.setvalue(0)
;BaboWhiterunBreezehomeVCEnding 0 = StartingPoint
;BaboWhiterunBreezehomeVCEnding 1 = Killed him
;BaboWhiterunBreezehomeVCEnding 2 = Let him loose
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_44
Function Fragment_44()
;BEGIN AUTOCAST TYPE BaboDialogueWhiterunScript
Quest __temp = self as Quest
BaboDialogueWhiterunScript kmyQuest = __temp as BaboDialogueWhiterunScript
;END AUTOCAST
;BEGIN CODE
;BaboDialogueWhiterunSceneVC07c.stop()
kmyQuest.Message(3)
BDQuest.CorruptionExpLoss(20.0)
BDQuest.TraumaExpLoss(6.0)
(Alias_CaptainRef.getreference() as actor).moveto(BaboDialogueWhiterunXmarker07)
BDQuest.FadeinMove(Alias_PlayerRef, Alias_PlayerMovePointBreezehome, 118, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_40
Function Fragment_40()
;BEGIN CODE
;sexfinished
;BaboDialogueWhiterunSceneVCStage57.stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN AUTOCAST TYPE BaboDialogueWhiterunScript
Quest __temp = self as Quest
BaboDialogueWhiterunScript kmyQuest = __temp as BaboDialogueWhiterunScript
;END AUTOCAST
;BEGIN CODE
;Now he will stay in Player's home. He will rape Player time to time by force.
kmyQuest.PreparethesceneB(3)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_42
Function Fragment_42()
;BEGIN CODE
;Designating Captain Alias
Alias_CaptainRef.forcerefto(CommanderCaiusRef)
setstage(5)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
;Scene Ended. The fight begins
BaboDialogueWhiterunScene02.stop()
BDQuest.NPCChallengeStart(Alias_ViceCaptainRef, Alias_OrcVisitorRef01)
BDQuest.NPCChallengeStart(Alias_ViceCaptainRef, Alias_OrcVisitorRef02)
BDQuest.NPCChallengeStart(Alias_ViceCaptainRef, Alias_OrcVisitorRef03)
Utility.wait(5.0)
;BaboSetstageOnEnterTriggerWhiterun01.enable()
BaboSetstageOnEnterTriggerWhiterun01A.enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_46
Function Fragment_46()
;BEGIN CODE
;Register TImer
Actor ViceCaptainActor = Alias_ViceCaptainRef.getactorreference()
Alias_ViceCaptainDeadRef.forcerefto(ViceCaptainActor)
Alias_ViceCaptainRef.clear()

(Alias_ViceCaptainDeadRef.getref() as actor).EvaluatePackage()

BFVS.RegisterUpdate(6)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_36
Function Fragment_36()
;BEGIN AUTOCAST TYPE BaboDialogueWhiterunScript
Quest __temp = self as Quest
BaboDialogueWhiterunScript kmyQuest = __temp as BaboDialogueWhiterunScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.StopDuel()
(Alias_Playerref as BaboViceCaptainDuelRefScript).ClearEssential()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_18
Function Fragment_18()
;BEGIN CODE
BaboDialogueWhiterunSceneVC02.forcestart()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_43
Function Fragment_43()
;BEGIN CODE
Alias_CaptainRef.forcerefto(SinmirRef)
setstage(5)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_51
Function Fragment_51()
;BEGIN CODE
Actor ViceCaptainActor = Alias_ViceCaptainRef.getactorreference()
Alias_ViceCaptainDeadRef.forcerefto(ViceCaptainActor)
Alias_ViceCaptainRef.clear()
(Alias_ViceCaptainDeadRef.getref() as actor).EvaluatePackage()
BFVS.RegisterUpdate(4)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_16
Function Fragment_16()
;BEGIN AUTOCAST TYPE BaboDialogueWhiterunScript
Quest __temp = self as Quest
BaboDialogueWhiterunScript kmyQuest = __temp as BaboDialogueWhiterunScript
;END AUTOCAST
;BEGIN CODE
;Until stage 100, Vice Captain's misdeeds are concealed.
;Your taken belongings are retrieved.
;Orc events are reset
kmyQuest.Message(6)
BaboChestWhiterun.removeallitems(WhiterunBreezehomePlayerChest, false, true)
BaboOrcVisitorScript.AfterWhiterunViceCaptainClearQuest()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_47
Function Fragment_47()
;BEGIN AUTOCAST TYPE BaboDialogueWhiterunScript
Quest __temp = self as Quest
BaboDialogueWhiterunScript kmyQuest = __temp as BaboDialogueWhiterunScript
;END AUTOCAST
;BEGIN CODE
BaboWhiterunBreezehomeVCEnding.setvalue(1)
kmyQuest.Message(7)
Alias_ViceCaptainDeadRef.getactorreference().deletewhenable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_32
Function Fragment_32()
;BEGIN AUTOCAST TYPE BaboDialogueWhiterunScript
Quest __temp = self as Quest
BaboDialogueWhiterunScript kmyQuest = __temp as BaboDialogueWhiterunScript
;END AUTOCAST
;BEGIN CODE
;You thereatened the vice captain. You should report this to the captain.
kmyQuest.Message(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_38
Function Fragment_38()
;BEGIN AUTOCAST TYPE BaboDialogueWhiterunScript
Quest __temp = self as Quest
BaboDialogueWhiterunScript kmyQuest = __temp as BaboDialogueWhiterunScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.BacktoNormalDuelActors()
;Fade in... It goes to 57
BDQuest.LosingControl()
(Alias_ViceCaptainRef.getref() as actor).moveto(BaboDialogueWhiterunXmarker06)
(Alias_CaptainRef.getreference() as actor).moveto(BaboDialogueWhiterunXmarker07)
BDQuest.FadeinMove(Alias_PlayerRef, Alias_PlayerMovePointBreezehome, 57, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
;First Scene Stop: Captain and ViceCaptain
BaboDialogueWhiterunScene01.stop()
(Alias_ViceCaptainRef.getref() as actor).EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;Vice captain has come. Imperial side
Actor ViceCaptain = BaboDialogueWhiterunViceCaptainXmarkerRef.PlaceActorAtMe(BaboWhiterunViceCaptainImperial, 4)
Alias_ViceCaptainRef.forcerefto(ViceCaptain)
if BaboMCMRe.BabodialoguewhiterunUpdating == false
Setstage(6)
else
Setstage(30)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;Nothing happens
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_37
Function Fragment_37()
;BEGIN AUTOCAST TYPE BaboDialogueWhiterunScript
Quest __temp = self as Quest
BaboDialogueWhiterunScript kmyQuest = __temp as BaboDialogueWhiterunScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.StopDuel()

BRMQuest.DecreaseReputation(50, 20)
BDQuest.CorruptionExp(20.0)
BRMQuest.AddingTitletoPlayerRef(BaboFactionPitifulHeroineTitle)
BRMQuest.SetTitleGlobal(BaboGlobalPitifulHeroineTitle, 1)
(Alias_Playerref as BaboViceCaptainDuelRefScript).ClearEssential()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_33
Function Fragment_33()
;BEGIN AUTOCAST TYPE BaboDialogueWhiterunScript
Quest __temp = self as Quest
BaboDialogueWhiterunScript kmyQuest = __temp as BaboDialogueWhiterunScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.PreparethesceneVC07()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN AUTOCAST TYPE BaboDialogueWhiterunScript
Quest __temp = self as Quest
BaboDialogueWhiterunScript kmyQuest = __temp as BaboDialogueWhiterunScript
;END AUTOCAST
;BEGIN CODE
;ForceGreet
kmyQuest.PlayerRecoverControl()
(Alias_ViceCaptainRef.getreference() as actor).EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
;Fade in... It goes to 20
BDQuest.EquipCumItem(Alias_PlayerRef.getreference() as actor)
BDQuest.LosingControl()
BDQuest.FadeinMove(Alias_PlayerRef, Alias_PlayerMovePointBreezehomeEvent, 20, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;Vice captain has come. StormCloack side
Actor ViceCaptain = BaboDialogueWhiterunViceCaptainXmarkerRef.PlaceActorAtMe(BaboWhiterunViceCaptainStormcloack, 4)
Alias_ViceCaptainRef.forcerefto(ViceCaptain)
if BaboMCMRe.BabodialoguewhiterunUpdating == false
Setstage(6)
else
Setstage(30)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN CODE
;The combat has ended. ViceCaptain, he sweeped them off.
(Alias_ViceCaptainRef.getref() as actor).EvaluatePackage()
BaboDialogueWhiterunScene03.forcestart()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
;First Scene Start: Captain and ViceCaptain
BaboDialogueWhiterunScene01.start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_50
Function Fragment_50()
;BEGIN CODE
(Alias_ViceCaptainRef.getref() as actor).EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_20
Function Fragment_20()
;BEGIN AUTOCAST TYPE BaboDialogueWhiterunScript
Quest __temp = self as Quest
BaboDialogueWhiterunScript kmyQuest = __temp as BaboDialogueWhiterunScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.BacktoNormalDuelActors()
Utility.wait(1.0);wait for the scene stop
Alias_CaptainRef.getactorref().evaluatepackage()
Alias_ViceCaptainRef.getactorref().evaluatepackage()
Utility.wait(10.0)
Alias_CaptainRef.getactorref().moveto(BaboDialogueWhiterunXmarkerJail02)
Alias_ViceCaptainRef.getactorref().moveto(BaboDialogueWhiterunXmarkerJail01)
Utility.wait(3.0);wait for the scene stop
kmyQuest.Message(5)
BDQuest.RecoverControl()
BaboWhiterunCellDoor02Ref.enable()
WhiterunCellDoor02Ref.disable()

BRMQuest.IncreaseReputation(20, 20)
BRMQuest.AddingTitletoPlayerRef(BaboFactionWarMaidenTitle)
BRMQuest.SetTitleGlobal(BaboGlobalWarMaidenTitle, 1)
BDQuest.CorruptionExpLoss(15.0)
BDQuest.TraumaExpLoss(5.0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_49
Function Fragment_49()
;BEGIN CODE
;He vanished End of the quest
Actor ViceCaptainActor = Alias_ViceCaptainDeadRef.getactorreference()
BaboWhiterunBreezehomeVCEnding.setvalue(2)
BaboWhiterunCellDoor02Ref.lock()
BaboWhiterunCellDoor02Ref.disable()
WhiterunCellDoor02Ref.enable()
ViceCaptainActor.deletewhenable()
Alias_ViceCaptainDeadRef.clear()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_45
Function Fragment_45()
;BEGIN CODE
BRMQuest.DecreaseReputation(100, 30)
BRMQuest.AddingTitletoPlayerRef(BaboFactionPitifulHeroineTitle)
BRMQuest.SetTitleGlobal(BaboGlobalPitifulHeroineTitle, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_19
Function Fragment_19()
;BEGIN CODE
;BaboDialogueWhiterunSceneVC02.stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_17
Function Fragment_17()
;BEGIN AUTOCAST TYPE BaboDialogueWhiterunScript
Quest __temp = self as Quest
BaboDialogueWhiterunScript kmyQuest = __temp as BaboDialogueWhiterunScript
;END AUTOCAST
;BEGIN CODE
Utility.wait(1.0);wait for the scene stop
Alias_CaptainRef.getactorref().evaluatepackage()
Alias_ViceCaptainRef.getactorref().evaluatepackage()
Utility.wait(10.0)
Alias_CaptainRef.getactorref().moveto(BaboDialogueWhiterunXmarkerJail02)
Alias_ViceCaptainRef.getactorref().moveto(BaboDialogueWhiterunXmarkerJail01)
Utility.wait(6.0);wait for the scene stop
kmyQuest.Message(4)
BDQuest.RecoverControl()
BaboWhiterunCellDoor02Ref.enable()
WhiterunCellDoor02Ref.disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_39
Function Fragment_39()
;BEGIN CODE
(Alias_PlayerRef.getreference() as actor).PlayIdle(Playerfaint02)
BDMScript.RandomPainMenu(Game.getplayer())
(Alias_ViceCaptainRef.getref() as actor).EvaluatePackage()
BaboDialogueWhiterunSceneVCStage57.forcestart();sexstart
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_35
Function Fragment_35()
;BEGIN AUTOCAST TYPE BaboDialogueWhiterunScript
Quest __temp = self as Quest
BaboDialogueWhiterunScript kmyQuest = __temp as BaboDialogueWhiterunScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.StartDuel()
(Alias_Playerref as BaboViceCaptainDuelRefScript).CheckEssential(Alias_ViceCaptainDuelRef.getreference())
kmyQuest.Message(2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_34
Function Fragment_34()
;BEGIN CODE
;BaboDialogueWhiterunSceneVC07.forcestart()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_41
Function Fragment_41()
;BEGIN CODE
;sexquit
Utility.wait(5.0)
setstage(60)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
;He will follow PC. Evaluate Package. Waiting for orcs coming to PC's home.
(Alias_ViceCaptainRef.getref() as actor).EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN AUTOCAST TYPE BaboDialogueWhiterunScript
Quest __temp = self as Quest
BaboDialogueWhiterunScript kmyQuest = __temp as BaboDialogueWhiterunScript
;END AUTOCAST
;BEGIN CODE
;Player rejected his deal. back to stage 10
BDMScript.StruggleAnim(Alias_PlayerRef.getreference() as actor, (Alias_ViceCaptainRef.getref() as actor), false, None, None)
Utility.wait(1.0)
BaboEventWhiterunOrcVisitiors.Reset()
Utility.wait(1.0)
BaboEventWhiterunOrcVisitiors.setstage(5)
Utility.wait(1.0)
kmyQuest.PreparethesceneB(0)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Actor Property CommanderCaiusref  Auto  

Actor Property SinmirRef  Auto  

ObjectReference Property BaboDialogueWhiterunViceCaptainXmarkerRef  Auto  

ActorBase Property BaboWhiterunViceCaptainImperial  Auto  

ActorBase Property BaboWhiterunViceCaptainStormcloack  Auto  

Scene Property BaboDialogueWhiterunScene01  Auto  

ObjectReference Property BaboDialogueWhiterunXmarker01  Auto  

ObjectReference Property BaboDialogueWhiterunXmarker02  Auto  

ObjectReference Property BaboDialogueWhiterunXmarker03  Auto  

Scene Property BaboDialogueWhiterunScene02  Auto  

ObjectReference Property BaboDialogueWhiterunXmarker05  Auto  

Scene Property BaboDialogueWhiterunScene03  Auto  

ObjectReference Property BaboSetstageOnEnterTriggerWhiterun01  Auto  

Idle Property PlayerFaint  Auto  

BaboDiaMonitorScript Property BDMScript Auto

Quest Property BaboEventWhiterunOrcVisitiors  Auto  

ObjectReference Property BaboDialogueWhiterunXmarkerJail01  Auto  

ObjectReference Property BaboDialogueWhiterunXmarkerJail02  Auto  

Scene Property BaboDialogueWhiterunSceneVC02  Auto  

ObjectReference Property WhiterunBreezehomePlayerChest  Auto  

ObjectReference Property BaboChestWhiterun  Auto 

BaboEventWhiterunOrcVisitorsScript Property BaboOrcVisitorScript Auto

BaboReputationMasterScript Property BRMQuest Auto

Faction Property BaboFactionPitifulHeroineTitle  Auto  

GlobalVariable Property BaboGlobalPitifulHeroineTitle  Auto  

Faction Property BaboFactionWarMaidenTitle  Auto

GlobalVariable Property BaboGlobalWarMaidenTitle  Auto

ObjectReference Property BaboEventWhiterunViceCaptainDuelXmakerRef  Auto

BaboSexControllerManager Property BDQuest Auto
BaboBoyFriendVariableScript Property BFVS Auto
BaboMCMRestart Property BaboMCMRe Auto
Scene Property BaboDialogueWhiterunSceneVC07  Auto  

ObjectReference Property BaboDialogueWhiterunXmarker06  Auto  

Idle Property Playerfaint02  Auto  

Scene Property BaboDialogueWhiterunSceneVCStage57  Auto  

ReferenceAlias Property NPCAlias01  Auto  

Quest Property BaboMonitorScript  Auto  

ObjectReference Property BaboSetstageOnEnterTriggerWhiterun02  Auto  

Scene Property BaboDialogueWhiterunSceneVC07b  Auto  

ObjectReference Property WhiterunCellDoor02Ref  Auto  

ObjectReference Property BaboWhiterunCellDoor02Ref  Auto  

Scene Property BaboDialogueWhiterunSceneVC07c  Auto  

GlobalVariable Property BaboWhiterunBreezehomeVCEnding  Auto  

ObjectReference Property BaboSetstageOnEnterTriggerWhiterun01A  Auto  

ObjectReference Property BaboDialogueWhiterunXmarker07  Auto  
