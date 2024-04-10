;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 20
Scriptname QF_BaboEventAnimalCare_08CCC1E7 Extends Quest Hidden

;BEGIN ALIAS PROPERTY CreatureRef
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CreatureRef Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY OwnerRef
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_OwnerRef Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SpawnMarkerCreature
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SpawnMarkerCreature Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MarkerOwnerDeparture
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MarkerOwnerDeparture Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SpawnMarkerOwner
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SpawnMarkerOwner Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MarkerCreatureDeparture
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MarkerCreatureDeparture Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CreatureTalkingActivator
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CreatureTalkingActivator Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN AUTOCAST TYPE BaboEventAnimalCareWhiterunScript
Quest __temp = self as Quest
BaboEventAnimalCareWhiterunScript kmyQuest = __temp as BaboEventAnimalCareWhiterunScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.MatewithHorse("Anal")
kmyQuest.AddTitle()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_17
Function Fragment_17()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).AnimalCareEventMessagebox(6)
setstage(255)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).AnimalCareEventMessagebox(3)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN AUTOCAST TYPE BaboEventAnimalCareWhiterunScript
Quest __temp = self as Quest
BaboEventAnimalCareWhiterunScript kmyQuest = __temp as BaboEventAnimalCareWhiterunScript
;END AUTOCAST
;BEGIN CODE
kmyquest.FinalInspection()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
(BaboEventAnimalCareTriggerRef as BaboDefaultOnEnterTriggerScript).ReArmTrigger()
Alias_CreatureRef.forcerefto((Alias_SpawnMarkerCreature.Getreference()).placeatme(BabolvlStallion))
Alias_OwnerRef.forcerefto((Alias_SpawnMarkerOwner.Getreference()).placeatme(BaboEventAnimalCareOwner))
BaboEventAnimalCareWhiterunXmarkerfur.enable()
Setstage(5)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_18
Function Fragment_18()
;BEGIN AUTOCAST TYPE BaboEventAnimalCareWhiterunScript
Quest __temp = self as Quest
BaboEventAnimalCareWhiterunScript kmyQuest = __temp as BaboEventAnimalCareWhiterunScript
;END AUTOCAST
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).AnimalCareEventMessagebox(7)
kmyQuest.HorseDied()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN AUTOCAST TYPE BaboEventAnimalCareWhiterunScript
Quest __temp = self as Quest
BaboEventAnimalCareWhiterunScript kmyQuest = __temp as BaboEventAnimalCareWhiterunScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.MatewithHorse("Oral")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN AUTOCAST TYPE BaboEventAnimalCareWhiterunScript
Quest __temp = self as Quest
BaboEventAnimalCareWhiterunScript kmyQuest = __temp as BaboEventAnimalCareWhiterunScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.ResetVariables()
if Alias_creatureref
kmyQuest.CreatureBlockState(false)
endif
kmyQuest.ResetVariables()
(Alias_CreatureRef.getreference() as actor).DeleteWhenable()
(Alias_OwnerRef.getreference() as actor).DeleteWhenable()
BaboEventAnimalCareWhiterunXmarkerfur.disable()
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_16
Function Fragment_16()
;BEGIN AUTOCAST TYPE BaboEventAnimalCareWhiterunScript
Quest __temp = self as Quest
BaboEventAnimalCareWhiterunScript kmyQuest = __temp as BaboEventAnimalCareWhiterunScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.MatewithHorse("Vaginal")
kmyQuest.AddTitle()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
(Alias_CreatureRef.getreference() as actor).evaluatepackage()
BaboAnimalCareHelpMessage.ShowAsHelpMessage("", 5, 30, 3)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).AnimalCareEventMessagebox(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
PlayerRef.additem(gold001, 700)
(Alias_OwnerRef.getreference() as actor).evaluatepackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).BCLEventScenePlay(1, "BaboEventAnimalCare")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).AnimalCareEventMessagebox(2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_19
Function Fragment_19()
;BEGIN CODE
PlayerRef.additem(gold001, 3000)
(BaboSexController as BaboSexControllerManager).ReputationIncrease(5, 0)
(BaboSexController as BaboSexControllerManager).ReputationBitchCreature(3)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN AUTOCAST TYPE BaboEventAnimalCareWhiterunScript
Quest __temp = self as Quest
BaboEventAnimalCareWhiterunScript kmyQuest = __temp as BaboEventAnimalCareWhiterunScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.Initial()
kmyQuest.CreatureBlockState(true)
kmyQuest.SetTimer(12.0)
(BaboSexController as BaboSexControllerManager).AnimalCareEventMessagebox(9)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN CODE
PlayerRef.additem(gold001, 1500)
(BaboSexController as BaboSexControllerManager).ReputationIncrease(15, 0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).AnimalCareEventMessagebox(4)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).AnimalCareEventMessagebox(5)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ActorBase Property BabolvlStallion  Auto  

ObjectReference Property BaboEventAnimalCareTriggerRef  Auto  

Quest Property BaboSexController  Auto  

ObjectReference Property BaboEventAnimalCareWhiterunXmarkerfur  Auto  

MiscObject Property Gold001  Auto  

Actor Property PlayerRef  Auto  

Message Property BaboAnimalCareHelpMessage  Auto  

ActorBase Property BaboEventAnimalCareOwner  Auto  
