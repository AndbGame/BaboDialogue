;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 43
Scriptname QF__0851CC84 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Scene_Marker3
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Scene_Marker3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Guard02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Guard02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ElisifTheFairREF
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ElisifTheFairREF Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldImperial
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldImperial Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SybilleStentorREF
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SybilleStentorREF Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CenterMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CenterMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldSons
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldSons Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PlayerChest
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PlayerChest Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FalkFirebeardREF
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FalkFirebeardREF Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Scene_Marker2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Scene_Marker2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY NobleAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_NobleAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MarkerFalkFireBeard
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MarkerFalkFireBeard Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Scene_Marker1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Scene_Marker1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BolgeirBearclawREF
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BolgeirBearclawREF Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Noble
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Noble Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PlayerAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PlayerAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MarkerBolgeirRef
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MarkerBolgeirRef Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TRIGGER
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TRIGGER Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MarkerSybilleStentorRef
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MarkerSybilleStentorRef Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Guard03
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Guard03 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MarkerElisifRef
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MarkerElisifRef Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldContested
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldContested Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Guard01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Guard01 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_28
Function Fragment_28()
;BEGIN AUTOCAST TYPE BaboDiaQuest
Quest __temp = self as Quest
BaboDiaQuest kmyQuest = __temp as BaboDiaQuest
;END AUTOCAST
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).ChallengeStart(Alias_Noble)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_27
Function Fragment_27()
;BEGIN CODE
;kmyQuest.RapeFemalePlayer(Alias_Noble)
(BaboSexController as BaboSexControllerManager).SexCustomTag(Alias_PlayerAlias, Alias_Noble, None, None, None, "Rape, Vaginal", "Femdom, Bigguy", True, "E11Sex01", "Encounter11Sex01", true)
BRMQuest.SexCount(1)
(BaboSexController as BaboSexControllerManager).CorruptionExp(1.0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_42
Function Fragment_42()
;BEGIN CODE
(Alias_Noble.getRef() as Actor).EvaluatePackage()
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
(BaboSexController as BaboSexControllerManager).ChallengeStart(Alias_Guard01)
(BaboSexController as BaboSexControllerManager).ChallengeStart(Alias_Guard02)
(BaboSexController as BaboSexControllerManager).ChallengeStart(Alias_Guard03)
(Alias_PlayerAlias as BaboBrawlingPlayerREF).RegisterOnHitExExtra(BaboEncounter11GuardFaction)
(Alias_Noble.getRef() as Actor).EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_24
Function Fragment_24()
;BEGIN CODE
(Alias_Noble.getRef() as Actor).EvaluatePackage()
(BaboSexController as BaboSexControllerManager).DisableEssential()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_30
Function Fragment_30()
;BEGIN AUTOCAST TYPE BaboDiaQuest
Quest __temp = self as Quest
BaboDiaQuest kmyQuest = __temp as BaboDiaQuest
;END AUTOCAST
;BEGIN CODE
Debug.SendAnimationEvent((Alias_PlayerAlias.getReference() as Actor), "IdleForceDefaultState")
(BaboSexController as BaboSexControllerManager).losingcontrol()

actor nobleref = Alias_Noble.getReference() as Actor

(Alias_Noble.getReference() as Actor).EvaluatePackage()
(Alias_PlayerAlias.getReference() as Actor).EvaluatePackage()
(Alias_Guard01.getReference() as Actor).EvaluatePackage()
(Alias_Guard02.getReference() as Actor).EvaluatePackage()
(Alias_Guard03.getReference() as Actor).EvaluatePackage()
Utility.wait(7.0)
Alias_Noble.clear()
Alias_NobleAlias.forcerefto(nobleref)
Utility.wait(3.0)
(Alias_PlayerAlias.getReference() as Actor).moveto(BaboEventScene04MarkerP01)
nobleref.moveto(BaboEventScene04MarkerNoble01)
(Alias_Guard01.getReference() as Actor).moveto(BaboEventScene04MarkerGuard01)
Setstage(60)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_29
Function Fragment_29()
;BEGIN AUTOCAST TYPE BaboDiaQuest
Quest __temp = self as Quest
BaboDiaQuest kmyQuest = __temp as BaboDiaQuest
;END AUTOCAST
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).pacifyAlias(Alias_Noble)
(BaboSexController as BaboSexControllerManager).pacifyAlias(Alias_Guard01)
(BaboSexController as BaboSexControllerManager).pacifyAlias(Alias_Guard02)
(BaboSexController as BaboSexControllerManager).pacifyAlias(Alias_Guard03)
(BaboSexController as BaboSexControllerManager).CompatiblityCheck(True)
Utility.wait(2.0)
(BaboSexController as BaboSexControllerManager).LosingControl()
(BaboSexController as BaboSexControllerManager).BCLEventScenePlay(2, "BaboEncounter11")
(BaboSexController as BaboSexControllerManager).DisableEssential()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN AUTOCAST TYPE WEScript
Quest __temp = self as Quest
WEScript kmyQuest = __temp as WEScript
;END AUTOCAST
;BEGIN CODE
; debug.trace(self + "stage 255, calling DeleteWhenAble() on created aliases")
if (BaboEncounterQuestmarker.GetStageDone(11))
BaboEncounterQuestmarker.setstage(111)
endif
(BaboSexController as BaboSexControllerManager).DisableEssential()
(BaboSexController as BaboSexControllerManager).CompatiblityCheck(false)
Alias_Noble.GetReference().DeleteWhenAble()
Alias_NobleAlias.GetReference().DeleteWhenAble()
Alias_Guard01.GetReference().DeleteWhenAble()
Alias_Guard02.GetReference().DeleteWhenAble()
Alias_Guard03.GetReference().DeleteWhenAble()

; debug.trace(self + "stage 255, calling ReArmTrigger() on trigger" + Alias_Trigger.GetReference())
(Alias_Trigger.GetReference() as WETriggerScript).ReArmTrigger()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_32
Function Fragment_32()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).UnEquipRestraints(Alias_PlayerAlias.getreference() as actor)
(BaboSexController as BaboSexControllerManager).RecoverControl(true)
(Alias_ElisifTheFairREF.getRef() as Actor).EvaluatePackage()
(Alias_NobleAlias.getRef() as Actor).EvaluatePackage()
(Alias_Guard01.getRef() as Actor).EvaluatePackage()
BRMQuest.AddingTitletoPlayerRef(BaboFactionDeviousNobleSonFuckToyTitle)
BRMQuest.SetTitleGlobal(BaboGlobalDeviousNobleSonFuckToyTitle, 1)
BRMQuest.DecreaseReputation(40, 20)
(BaboSexController as BaboSexControllerManager).EncounterEvent11Messagebox(2)
BaboEncounterQuestmarker.setstage(11)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_26
Function Fragment_26()
;BEGIN CODE
;kmyQuest.RapeFaintedFemalePlayer(Alias_Noble)
(BaboSexController as BaboSexControllerManager).SexCustomTag(Alias_PlayerAlias, Alias_Noble, None, None, None, "Faint, Necro, Vaginal", "Femdom, Bigguy", True, "E11Sex01", "Encounter11Sex01", true)
BRMQuest.SexCount(1)
(BaboSexController as BaboSexControllerManager).CorruptionExp(1.0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_33
Function Fragment_33()
;BEGIN CODE
Debug.SendAnimationEvent((Alias_PlayerAlias.getReference() as Actor), "IdleForceDefaultState")
(BaboSexController as BaboSexControllerManager).EquipRestraintsYoke(Alias_PlayerAlias.getreference() as actor, true)
(Alias_FalkFirebeardREF.getRef() as Actor).moveto(Alias_MarkerFalkFireBeard.getreference())
(Alias_ElisifthefairREF.getRef() as Actor).moveto(Alias_MarkerElisifRef.getreference())
(Alias_BolgeirBearclawREF.getRef() as Actor).moveto(Alias_MarkerBolgeirRef.getreference())
(Alias_SybilleStentorREF.getRef() as Actor).moveto(Alias_MarkerSybilleStentorRef.getreference())
(BaboSexController as BaboSexControllerManager).EncounterEvent11Messagebox(1)
(BaboSexController as BaboSexControllerManager).CorruptionExp(5.0)
(BaboSexController as BaboSexControllerManager).TraumaExp(5.0)
(BaboSexController as BaboSexControllerManager).BaboEvent11ScenePlay(4)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_34
Function Fragment_34()
;BEGIN CODE
Utility.wait(2.0)
(BaboSexController as BaboSexControllerManager).BaboEvent11ScenePlay(3)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_37
Function Fragment_37()
;BEGIN CODE
SetStage(55)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_21
Function Fragment_21()
;BEGIN CODE
;debug.notification("Encounter 11 Started")
(Alias_Noble.getRef() as Actor).EvaluatePackage()
(Alias_Guard01.getRef() as Actor).EvaluatePackage()
(Alias_Guard02.getRef() as Actor).EvaluatePackage()
(Alias_Guard03.getRef() as Actor).EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_22
Function Fragment_22()
;BEGIN CODE
(Alias_Guard01.getRef() as Actor).EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_39
Function Fragment_39()
;BEGIN CODE
;Debug.messagebox("He ran away")
setstage(255)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_31
Function Fragment_31()
;BEGIN CODE
(Alias_NobleAlias.getRef() as Actor).EvaluatePackage()
(Alias_Guard01.getRef() as Actor).EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_38
Function Fragment_38()
;BEGIN AUTOCAST TYPE BaboDiaQuest
Quest __temp = self as Quest
BaboDiaQuest kmyQuest = __temp as BaboDiaQuest
;END AUTOCAST
;BEGIN CODE
;Debug.messagebox("I have killed the noble... ")
(BaboSexController as BaboSexControllerManager).ChallengeStart(Alias_Guard01)
(BaboSexController as BaboSexControllerManager).ChallengeStart(Alias_Guard02)
(BaboSexController as BaboSexControllerManager).ChallengeStart(Alias_Guard03)
(BaboSexController as BaboSexControllerManager).CorruptionExpLoss(2.0)
setstage(255)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_25
Function Fragment_25()
;BEGIN CODE
(Alias_NobleAlias.getRef() as Actor).EvaluatePackage()
(Alias_Guard01.getRef() as Actor).EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_41
Function Fragment_41()
;BEGIN CODE
BaboEncounterQuestmarker.setstage(111)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Faction Property BaboFactionDeviousNobleSonFuckToyTitle  Auto  

GlobalVariable Property BaboGlobalDeviousNobleSonFuckToyTitle  Auto  

BaboReputationMasterScript Property BRMQuest Auto

Scene Property BaboEncounter11Scene04  Auto  

BaboDiaQuest Property BDQuest  Auto  

Quest Property BaboEncounterQuestMarker  Auto  

Quest Property BaboSexController  Auto  

ObjectReference Property BaboEventScene04MarkerP01  Auto  

ObjectReference Property BaboEventScene04MarkerNoble01  Auto  

ObjectReference Property BaboEventScene04MarkerGuard01  Auto

Faction Property BaboEncounter11GuardFaction  Auto  
