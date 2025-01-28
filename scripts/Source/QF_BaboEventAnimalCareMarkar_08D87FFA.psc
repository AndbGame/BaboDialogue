;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 24
Scriptname QF_BaboEventAnimalCareMarkar_08D87FFA Extends Quest Hidden

;BEGIN ALIAS PROPERTY MarkerCreatureDeparture
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MarkerCreatureDeparture Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY OwnerRef
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_OwnerRef Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SpawnMarkerCreature
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SpawnMarkerCreature Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CreatureRef
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CreatureRef Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SpawnMarkerOwner
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SpawnMarkerOwner Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MarkerOwnerDeparture
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MarkerOwnerDeparture Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CreatureTalkingActivator
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CreatureTalkingActivator Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN AUTOCAST TYPE BaboEventAnimalCareMarkarthScript
Quest __temp = self as Quest
BaboEventAnimalCareMarkarthScript kmyQuest = __temp as BaboEventAnimalCareMarkarthScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.MatewithPet("Oral")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_16
Function Fragment_16()
;BEGIN CODE
PlayerRef.additem(gold001, 3000)
(BaboSexController as BaboSexControllerManager).ReputationIncrease(5, 0)
(BaboSexController as BaboSexControllerManager).ReputationBitchCreature(3)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).AnimalCareMarkarthEventMessagebox(1)
(Alias_OwnerRef.getreference() as actor).evaluatepackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).AnimalCareEventMessagebox(1)
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
stop()
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
(BaboSexController as BaboSexControllerManager).AnimalCareMarkarthEventMessagebox(4)
kmyQuest.PetDiedPermit()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN AUTOCAST TYPE BaboEventAnimalCareMarkarthScript
Quest __temp = self as Quest
BaboEventAnimalCareMarkarthScript kmyQuest = __temp as BaboEventAnimalCareMarkarthScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.MatewithPet("Anal")
kmyQuest.AddTitle()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).AnimalCareEventMessagebox(2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN CODE
PlayerRef.additem(gold001, 1500)
(BaboSexController as BaboSexControllerManager).ReputationIncrease(15, 0)
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
(BaboSexController as BaboSexControllerManager).AnimalCareMarkarthEventMessagebox(3)
kmyQuest.PetDied()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN AUTOCAST TYPE BaboEventAnimalCareMarkarthScript
Quest __temp = self as Quest
BaboEventAnimalCareMarkarthScript kmyQuest = __temp as BaboEventAnimalCareMarkarthScript
;END AUTOCAST
;BEGIN CODE
kmyquest.FinalInspection()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
(Alias_CreatureRef.getreference() as actor).evaluatepackage()
BaboAnimalCareHelpMessage.ShowAsHelpMessage("", 5, 30, 3)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_22
Function Fragment_22()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).AnimalCareMarkarthEventMessagebox(2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_21
Function Fragment_21()
;BEGIN CODE
(BaboEventAnimalCareMarkarthTriggerRef as BaboDefaultOnEnterTriggerScript).ReArmTrigger()
Alias_CreatureRef.forcerefto((Alias_SpawnMarkerCreature.Getreference()).placeatme(BabolvlDog))
Alias_OwnerRef.forcerefto((Alias_SpawnMarkerOwner.Getreference()).placeatme(BaboEventAnimalCareOwner))
BaboEventAnimalCareMarkarthXmarkerfur.enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).AnimalCareEventMessagebox(4)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).AnimalCareEventMessagebox(5)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN AUTOCAST TYPE BaboEventAnimalCareMarkarthScript
Quest __temp = self as Quest
BaboEventAnimalCareMarkarthScript kmyQuest = __temp as BaboEventAnimalCareMarkarthScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.Initial()
;kmyQuest.CreatureBlockState(true)
kmyQuest.SetTimer(12.0)
;(BaboSexController as BaboSexControllerManager).AnimalCareEventMessagebox(9)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).AnimalCareEventMessagebox(3)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN AUTOCAST TYPE BaboEventAnimalCareMarkarthScript
Quest __temp = self as Quest
BaboEventAnimalCareMarkarthScript kmyQuest = __temp as BaboEventAnimalCareMarkarthScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.MatewithPet("Vaginal")
kmyQuest.AddTitle()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_20
Function Fragment_20()
;BEGIN CODE
(BaboEventAnimalCareMarkarthTriggerRef as BaboDefaultOnEnterTriggerScript).ReArmTrigger()
Alias_CreatureRef.forcerefto((Alias_SpawnMarkerCreature.Getreference()).placeatme(BabolvlSkeever))
Alias_OwnerRef.forcerefto((Alias_SpawnMarkerOwner.Getreference()).placeatme(BaboEventAnimalCareOwner))
BaboEventAnimalCareMarkarthXmarkerfur.enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
int randomi = Utility.randomint(0, 1)
BaboEventAnimalCareScenario.setvalue(randomi)
SetStage(1)
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

ActorBase Property BaboEventAnimalCareOwner  Auto  

ActorBase Property BabolvlSkeever  Auto  

ActorBase Property BabolvlDog  Auto  

GlobalVariable Property BaboEventAnimalCareScenario  Auto  
