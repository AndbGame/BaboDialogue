;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 60
Scriptname QF_BaboEventAnimalCareMarkar_08D87FFA Extends Quest Hidden

;BEGIN ALIAS PROPERTY MarkerCreatureDeparture
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MarkerCreatureDeparture Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SpawnMarkerCreature
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SpawnMarkerCreature Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY OwnerRef
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_OwnerRef Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MarkerOwnerDeparture
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MarkerOwnerDeparture Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CreatureRef
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CreatureRef Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SpawnMarkerOwner
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SpawnMarkerOwner Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_50
Function Fragment_50()
;BEGIN CODE
MsgCtrl.AnimalCareEventMessagebox(18)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_24
Function Fragment_24()
;BEGIN AUTOCAST TYPE BaboEventAnimalCareMarkarthScript
Quest __temp = self as Quest
BaboEventAnimalCareMarkarthScript kmyQuest = __temp as BaboEventAnimalCareMarkarthScript
;END AUTOCAST
;BEGIN CODE
(BaboEventAnimalCareMarkarthTriggerRef as BaboDefaultOnEnterTriggerScript).ReArmTrigger()
kmyQuest.PlacePet(2)
BaboEventAnimalCareMarkarthXmarkerfur.enable()
kmyQuest.Initial()
kmyQuest.CreatureBlockState(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_23
Function Fragment_23()
;BEGIN AUTOCAST TYPE BaboEventAnimalCareMarkarthScript
Quest __temp = self as Quest
BaboEventAnimalCareMarkarthScript kmyQuest = __temp as BaboEventAnimalCareMarkarthScript
;END AUTOCAST
;BEGIN CODE
MsgCtrl.AnimalCareMarkarthEventMessagebox(4)
kmyQuest.PetDiedPermit()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_40
Function Fragment_40()
;BEGIN AUTOCAST TYPE BaboEventAnimalCareMarkarthScript
Quest __temp = self as Quest
BaboEventAnimalCareMarkarthScript kmyQuest = __temp as BaboEventAnimalCareMarkarthScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.CreatureBlockState(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_53
Function Fragment_53()
;BEGIN AUTOCAST TYPE BaboEventAnimalCareMarkarthScript
Quest __temp = self as Quest
BaboEventAnimalCareMarkarthScript kmyQuest = __temp as BaboEventAnimalCareMarkarthScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.PayFemalePet(1500, BanningREF)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_44
Function Fragment_44()
;BEGIN CODE
MsgCtrl.AnimalCareMarkarthEventMessagebox(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_55
Function Fragment_55()
;BEGIN AUTOCAST TYPE BaboEventAnimalCareMarkarthScript
Quest __temp = self as Quest
BaboEventAnimalCareMarkarthScript kmyQuest = __temp as BaboEventAnimalCareMarkarthScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.PayFemalePet(1200, BanningREF)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_37
Function Fragment_37()
;BEGIN CODE
MsgCtrl.AnimalCareMarkarthEventMessagebox(12)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN AUTOCAST TYPE BaboEventAnimalCareMarkarthScript
Quest __temp = self as Quest
BaboEventAnimalCareMarkarthScript kmyQuest = __temp as BaboEventAnimalCareMarkarthScript
;END AUTOCAST
;BEGIN CODE
MsgCtrl.AnimalCareEventMessagebox(3)
kmyQuest.TakeCarePet()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_56
Function Fragment_56()
;BEGIN AUTOCAST TYPE BaboEventAnimalCareMarkarthScript
Quest __temp = self as Quest
BaboEventAnimalCareMarkarthScript kmyQuest = __temp as BaboEventAnimalCareMarkarthScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.PayFemalePet(1500, BanningREF)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_26
Function Fragment_26()
;BEGIN AUTOCAST TYPE BaboEventAnimalCareMarkarthScript
Quest __temp = self as Quest
BaboEventAnimalCareMarkarthScript kmyQuest = __temp as BaboEventAnimalCareMarkarthScript
;END AUTOCAST
;BEGIN CODE
if kmyQuest.RouletteAssault(80)
kmyQuest.CreatureBlockState(false)
kmyQuest.ScenePlay(3)
else
MsgCtrl.AnimalCareMarkarthEventMessagebox(2)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_21
Function Fragment_21()
;BEGIN AUTOCAST TYPE BaboEventAnimalCareMarkarthScript
Quest __temp = self as Quest
BaboEventAnimalCareMarkarthScript kmyQuest = __temp as BaboEventAnimalCareMarkarthScript
;END AUTOCAST
;BEGIN CODE
(BaboEventAnimalCareMarkarthTriggerRef as BaboDefaultOnEnterTriggerScript).ReArmTrigger()
kmyQuest.PlacePet(1)
BaboEventAnimalCareMarkarthXmarkerfur.enable()
kmyQuest.Initial()
kmyQuest.CreatureBlockState(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_43
Function Fragment_43()
;BEGIN AUTOCAST TYPE BaboEventAnimalCareMarkarthScript
Quest __temp = self as Quest
BaboEventAnimalCareMarkarthScript kmyQuest = __temp as BaboEventAnimalCareMarkarthScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.SetTimer(12.0)
kmyQuest.CreatureBlockState(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_46
Function Fragment_46()
;BEGIN CODE
MsgCtrl.AnimalCareMarkarthEventMessagebox(6)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_31
Function Fragment_31()
;BEGIN AUTOCAST TYPE BaboEventAnimalCareMarkarthScript
Quest __temp = self as Quest
BaboEventAnimalCareMarkarthScript kmyQuest = __temp as BaboEventAnimalCareMarkarthScript
;END AUTOCAST
;BEGIN CODE
MsgCtrl.AnimalCareMarkarthEventMessagebox(8)
kmyquest.GetViolated(true, "Babo_AnimalCareEventMarkarthStage08Sex", "AnimalCareEventMarkarthStage08Sex", true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_51
Function Fragment_51()
;BEGIN AUTOCAST TYPE BaboEventAnimalCareMarkarthScript
Quest __temp = self as Quest
BaboEventAnimalCareMarkarthScript kmyQuest = __temp as BaboEventAnimalCareMarkarthScript
;END AUTOCAST
;BEGIN CODE
MsgCtrl.AnimalCareMarkarthEventMessagebox(19)
kmyQuest.RollRChance(BanningREF)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_58
Function Fragment_58()
;BEGIN CODE
setstage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_19
Function Fragment_19()
;BEGIN AUTOCAST TYPE BaboEventAnimalCareMarkarthScript
Quest __temp = self as Quest
BaboEventAnimalCareMarkarthScript kmyQuest = __temp as BaboEventAnimalCareMarkarthScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.ResetVariables()
if Alias_creatureref
kmyQuest.CreatureBlockState(false)
endif
kmyQuest.ResetVariables()
(Alias_CreatureRef.getreference() as actor).DeleteWhenable()
(Alias_OwnerRef.getreference() as actor).DeleteWhenable()
BaboEventAnimalCareMarkarthXmarkerfur.disable()
kmyquest.SetTimer(48.0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_52
Function Fragment_52()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).SexCustomActor(PlayerRef, BanningREF, None, None, None, "MF", "Blowjob", None, true, "AnimalCareEventMarkarthStage30S", "AnimalCareEventMarkarthStage30Sex", false)
(BaboSexController as BaboSexControllerManager).ReputationBitchIncrease(5)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN AUTOCAST TYPE BaboEventAnimalCareMarkarthScript
Quest __temp = self as Quest
BaboEventAnimalCareMarkarthScript kmyQuest = __temp as BaboEventAnimalCareMarkarthScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.CreatureBlockState(false)
Debug.sendanimationevent((Alias_CreatureRef.getreference() as actor), "returnToDefault")
(Alias_CreatureRef.getreference() as actor).evaluatepackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE BaboEventAnimalCareMarkarthScript
Quest __temp = self as Quest
BaboEventAnimalCareMarkarthScript kmyQuest = __temp as BaboEventAnimalCareMarkarthScript
;END AUTOCAST
;BEGIN CODE
MsgCtrl.AnimalCareMarkarthEventMessagebox(16)
kmyQuest.PlaceOwner()
int randomi = Utility.randomint(1, 3)
BaboEventAnimalCareMarkarthScenario.setvalue(randomi)
SetStage(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_41
Function Fragment_41()
;BEGIN AUTOCAST TYPE BaboEventAnimalCareMarkarthScript
Quest __temp = self as Quest
BaboEventAnimalCareMarkarthScript kmyQuest = __temp as BaboEventAnimalCareMarkarthScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.AddTitle()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_38
Function Fragment_38()
;BEGIN CODE
MsgCtrl.AnimalCareMarkarthEventMessagebox(13)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_42
Function Fragment_42()
;BEGIN AUTOCAST TYPE BaboEventAnimalCareMarkarthScript
Quest __temp = self as Quest
BaboEventAnimalCareMarkarthScript kmyQuest = __temp as BaboEventAnimalCareMarkarthScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.AddTitle()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_34
Function Fragment_34()
;BEGIN AUTOCAST TYPE BaboEventAnimalCareMarkarthScript
Quest __temp = self as Quest
BaboEventAnimalCareMarkarthScript kmyQuest = __temp as BaboEventAnimalCareMarkarthScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.ScenePlay(5)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_47
Function Fragment_47()
;BEGIN CODE
(Alias_OwnerRef.getreference() as actor).evaluatepackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_36
Function Fragment_36()
;BEGIN CODE
MsgCtrl.AnimalCareMarkarthEventMessagebox(11)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_45
Function Fragment_45()
;BEGIN CODE
MsgCtrl.AnimalCareMarkarthEventMessagebox(12)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_29
Function Fragment_29()
;BEGIN CODE
MsgCtrl.AnimalCareMarkarthEventMessagebox(6)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_20
Function Fragment_20()
;BEGIN AUTOCAST TYPE BaboEventAnimalCareMarkarthScript
Quest __temp = self as Quest
BaboEventAnimalCareMarkarthScript kmyQuest = __temp as BaboEventAnimalCareMarkarthScript
;END AUTOCAST
;BEGIN CODE
(BaboEventAnimalCareMarkarthTriggerRef as BaboDefaultOnEnterTriggerScript).ReArmTrigger()
kmyQuest.PlacePet(0)
BaboEventAnimalCareMarkarthXmarkerfur.enable()
kmyQuest.Initial()
kmyQuest.CreatureBlockState(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_59
Function Fragment_59()
;BEGIN AUTOCAST TYPE BaboEventAnimalCareMarkarthScript
Quest __temp = self as Quest
BaboEventAnimalCareMarkarthScript kmyQuest = __temp as BaboEventAnimalCareMarkarthScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.CreatureBlockState(true)
MsgCtrl.AnimalCareMarkarthEventMessagebox(21)
kmyQuest.ScenePlay(7)
;(BaboSexController as BaboSexControllerManager).BEventAnimalCareMarkarthScenePlay(7)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_25
Function Fragment_25()
;BEGIN AUTOCAST TYPE BaboEventAnimalCareMarkarthScript
Quest __temp = self as Quest
BaboEventAnimalCareMarkarthScript kmyQuest = __temp as BaboEventAnimalCareMarkarthScript
;END AUTOCAST
;BEGIN CODE
(BaboEventAnimalCareMarkarthTriggerRef as BaboDefaultOnEnterTriggerScript).ReArmTrigger()
kmyQuest.PlacePet(3)
BaboEventAnimalCareMarkarthXmarkerfur.enable()
kmyQuest.Initial()
kmyQuest.CreatureBlockState(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN AUTOCAST TYPE BaboEventAnimalCareMarkarthScript
Quest __temp = self as Quest
BaboEventAnimalCareMarkarthScript kmyQuest = __temp as BaboEventAnimalCareMarkarthScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.Reward(Alias_OwnerRef.getreference() as actor)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_32
Function Fragment_32()
;BEGIN AUTOCAST TYPE BaboEventAnimalCareMarkarthScript
Quest __temp = self as Quest
BaboEventAnimalCareMarkarthScript kmyQuest = __temp as BaboEventAnimalCareMarkarthScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.CreatureBlockState(true)
BaboAnimalCareMarkarthViolatedGlobal.setvalue(1)
kmyQuest.AddTitle()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_57
Function Fragment_57()
;BEGIN CODE
MsgCtrl.AnimalCareMarkarthEventMessagebox(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_48
Function Fragment_48()
;BEGIN AUTOCAST TYPE BaboEventAnimalCareMarkarthScript
Quest __temp = self as Quest
BaboEventAnimalCareMarkarthScript kmyQuest = __temp as BaboEventAnimalCareMarkarthScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.CreatureBlockState(true)
Utility.wait(3.0)
(BaboSexController as BaboSexControllerManager).PairedMotionCreature(Alias_CreatureRef.getreference() as actor, playerref, 0, "", false, true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_54
Function Fragment_54()
;BEGIN AUTOCAST TYPE BaboEventAnimalCareMarkarthScript
Quest __temp = self as Quest
BaboEventAnimalCareMarkarthScript kmyQuest = __temp as BaboEventAnimalCareMarkarthScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.PayFemalePet(800, BanningREF)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_28
Function Fragment_28()
;BEGIN CODE
MsgCtrl.AnimalCareMarkarthEventMessagebox(5)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
MsgCtrl.AnimalCareMarkarthEventMessagebox(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_30
Function Fragment_30()
;BEGIN AUTOCAST TYPE BaboEventAnimalCareMarkarthScript
Quest __temp = self as Quest
BaboEventAnimalCareMarkarthScript kmyQuest = __temp as BaboEventAnimalCareMarkarthScript
;END AUTOCAST
;BEGIN CODE
MsgCtrl.AnimalCareMarkarthEventMessagebox(19)
kmyQuest.RollRChance(BanningREF)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_27
Function Fragment_27()
;BEGIN AUTOCAST TYPE BaboEventAnimalCareMarkarthScript
Quest __temp = self as Quest
BaboEventAnimalCareMarkarthScript kmyQuest = __temp as BaboEventAnimalCareMarkarthScript
;END AUTOCAST
;BEGIN CODE
if kmyQuest.RouletteAssault(100)
kmyQuest.CreatureBlockState(false)
kmyQuest.ScenePlay(3)
else
MsgCtrl.AnimalCareMarkarthEventMessagebox(2)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_17
Function Fragment_17()
;BEGIN AUTOCAST TYPE BaboEventAnimalCareMarkarthScript
Quest __temp = self as Quest
BaboEventAnimalCareMarkarthScript kmyQuest = __temp as BaboEventAnimalCareMarkarthScript
;END AUTOCAST
;BEGIN CODE
MsgCtrl.AnimalCareMarkarthEventMessagebox(3)
;(BaboSexController as BaboSexControllerManager).BEventAnimalCareMarkarthScenePlay(7)
kmyQuest.ScenePlay(7)
kmyQuest.PetDied()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
MsgCtrl.AnimalCareMarkarthEventMessagebox(17)
(Alias_OwnerRef.getreference() as actor).evaluatepackage()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property BaboEventAnimalCareMarkarthTriggerRef  Auto  

ActorBase Property BabolvlStallion  Auto  

Quest Property BaboSexController  Auto  

ObjectReference Property BaboEventAnimalCareMarkarthXmarkerfur  Auto  

MiscObject Property Gold001  Auto  

Actor Property PlayerRef  Auto  

Message Property BaboAnimalCareHelpMessage  Auto  

ActorBase Property BabolvlSkeever  Auto  

ActorBase Property BabolvlDog  Auto  

GlobalVariable Property BaboEventAnimalCareScenario  Auto  

GlobalVariable Property BaboEventAnimalCareMarkarthScenario  Auto  

ActorBase Property BabolvlFox  Auto  

ActorBase Property BabolvlWolf  Auto  

Scene Property BaboEventAnimalCareMarkarthScene03  Auto  

GlobalVariable Property BaboAnimalCareMarkarthViolatedGlobal  Auto  

Actor Property BanningREF  Auto  

BaboMsgManager Property MsgCtrl  Auto  
