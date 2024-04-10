;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 21
Scriptname QF_BaboEncounter09_0852BFC1 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Central_Marker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Central_Marker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Victim
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Victim Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Falmer02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Falmer02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldContested
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldContested Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FalmerVictory02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FalmerVictory02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Scene_Marker3
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Scene_Marker3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FalmerVictory03
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FalmerVictory03 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TRIGGER
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TRIGGER Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PostEncounterSnadBoxRef02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PostEncounterSnadBoxRef02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PlayerAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PlayerAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FalmerVictory01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FalmerVictory01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PostEncounterSnadBoxRef01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PostEncounterSnadBoxRef01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldSons
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldSons Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Scene_Marker1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Scene_Marker1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Scene_Marker2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Scene_Marker2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldImperial
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldImperial Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Falmer01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Falmer01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Falmer03
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Falmer03 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_16
Function Fragment_16()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).EncounterEvent09Messagebox(5)
(BaboSexController as BaboSexControllerManager).SexCustomTag(Alias_PlayerAlias, Alias_FalmerVictory01, Alias_FalmerVictory03, None, None, "", "", true, "Event09Sex01", "Encounter09Sex01", true)
(BaboSexController as BaboSexControllerManager).AddSexCount(1)
(BaboSexController as BaboSexControllerManager).AddGroupSexCount(1)
Utility.wait(30)
(BaboSexController as BaboSexControllerManager).SexCustom(Alias_Victim, Alias_Falmer02, None, None, None, "Vaginal", "", "", false, none, none, true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_20
Function Fragment_20()
;BEGIN AUTOCAST TYPE BaboDiaQuest
Quest __temp = self as Quest
BaboDiaQuest kmyQuest = __temp as BaboDiaQuest
;END AUTOCAST
;BEGIN CODE
(Alias_Falmer01.getRef() as Actor).EvaluatePackage()
(Alias_Falmer02.getRef() as Actor).EvaluatePackage()
(Alias_Falmer03.getRef() as Actor).EvaluatePackage()
(Alias_Victim.getRef() as Actor).EvaluatePackage()
Utility.wait(5.0)
(BaboSexController as BaboSexControllerManager).SexCustomTag(Alias_Victim, Alias_Falmer02, None, None, None, "Aggressive", "", true, "Event09SexNPC", "Encounter09SexNPC", true)
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
;debug.notification("Encounter 9 Started")
(Alias_Falmer01.getRef() as Actor).EvaluatePackage()
(Alias_Falmer02.getRef() as Actor).EvaluatePackage()
(Alias_Falmer03.getRef() as Actor).EvaluatePackage()
(Alias_Victim.getRef() as Actor).EvaluatePackage()
Utility.wait(5.0)
;kmyQuest.RapeCustom(Alias_Victim, Alias_Falmer02, Alias_Falmer03, None, None, Creature, none, none, false, none, none, true)
(BaboSexController as BaboSexControllerManager).SexCustomTag(Alias_Victim, Alias_Falmer02, Alias_Falmer03, None, None, "Aggressive", "", true, "Event09SexNPC", "Encounter09SexNPC", true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_17
Function Fragment_17()
;BEGIN CODE
Setstage(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).FadeinScene(true)
(BaboSexController as BaboSexControllerManager).StopAllSexlabAnimations()
(BaboSexController as BaboSexControllerManager).EncounterEvent09Messagebox(1)
setstage(40)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).EncounterEvent09Messagebox(3)
setstage(255)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).FHUInflationEvent(Alias_victim.getreference(), BaboFalmerDebugRef as form, true, 3, 5, 0, "")
setstage(3)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).FHUInflationEvent(Alias_PlayerAlias.getreference(), BaboFalmerDebugRef as form, true, 3, 6, 0, "")
(BaboSexController as BaboSexControllerManager).FadeinScene(true)
(BaboSexController as BaboSexControllerManager).StopAllSexlabAnimations()
;Utility.wait(4.0)
;(BaboSexController as BaboSexControllerManager).FHUInflationEvent(Alias_PlayerAlias.getreference(), BaboFalmerDebugRef as form, true, 2, 2, 0, "")
;Utility.wait(2.0)
(BaboSexController as BaboSexControllerManager).EncounterEvent09Messagebox(1)
setstage(40)
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
;Sex Ended
(Alias_Falmer01.getRef() as Actor).EvaluatePackage()
(Alias_Falmer02.getRef() as Actor).EvaluatePackage()
(Alias_Falmer03.getRef() as Actor).EvaluatePackage()
(Alias_Victim.getRef() as Actor).EvaluatePackage()
kmyQuest.EquipRestraints((Alias_Victim.getReference() as Actor))
kmyQuest.EquipCumItem((Alias_Victim.getReference() as Actor))
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN AUTOCAST TYPE BaboDiaQuest
Quest __temp = self as Quest
BaboDiaQuest kmyQuest = __temp as BaboDiaQuest
;END AUTOCAST
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).pacifyAlias(Alias_Falmer01)
(BaboSexController as BaboSexControllerManager).pacifyAlias(Alias_Falmer02)
(BaboSexController as BaboSexControllerManager).pacifyAlias(Alias_Falmer03)

(BaboSexController as BaboSexControllerManager).DisableEssential()

int numberi
numberi = (BaboSexController as BaboSexControllerManager).GetAliasArray(Alias_Falmer01, Alias_Falmer02, Alias_Falmer03, None, None)
BaboEncounter09FalmerNum.setvalue(numberi)

Alias_Falmer01.clear()
Alias_Falmer02.clear()
Alias_Falmer03.clear()

Alias_FalmerVictory01.forcerefto(BaboTempList.getat(0) as actor)
if numberi > 1
Alias_FalmerVictory02.forcerefto(BaboTempList.getat(1) as actor)
endif
if numberi > 2
Alias_FalmerVictory03.forcerefto(BaboTempList.getat(2) as actor)
endif

setstage(15)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN CODE
(Alias_PlayerAlias.Getreference() as actor).moveto(Alias_PostEncounterSnadBoxRef01.GetReference())
(BaboSexController as BaboSexControllerManager).FadeOutScene(true)
(BaboSexController as BaboSexControllerManager).ReputationBitchIncrease(10)
(BaboSexController as BaboSexControllerManager).ReputationDecrease(15, 0)
setstage(255)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).BCLEventScenePlay(2, "BaboEncounter09")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE WEScript
Quest __temp = self as Quest
WEScript kmyQuest = __temp as WEScript
;END AUTOCAST
;BEGIN CODE
; debug.trace(self + "stage 255, calling ReArmTrigger() on trigger" + Alias_Trigger.GetReference())
(Alias_Trigger.GetReference() as WETriggerScript).ReArmTrigger()

(BaboSexController as BaboSexControllerManager).DisableEssential()

Alias_FalmerVictory01.GetReference().DeleteWhenAble()
Alias_FalmerVictory02.GetReference().DeleteWhenAble()
Alias_FalmerVictory03.GetReference().DeleteWhenAble()
Alias_Falmer01.GetReference().DeleteWhenAble()
Alias_Falmer02.GetReference().DeleteWhenAble()
Alias_Falmer03.GetReference().DeleteWhenAble()
Alias_Victim.GetReference().DeleteWhenAble()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).FadeinScene(false)
(Alias_Victim.getReference() as Actor).moveto(Alias_PostEncounterSnadBoxRef01.getreference())
(BaboSexController as BaboSexControllerManager).ReputationIncrease(10, 5)
(BaboSexController as BaboSexControllerManager).ReputationBitchDecrease(15)
(BaboSexController as BaboSexControllerManager).PlusRescueCount(1)
Setstage(60)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_19
Function Fragment_19()
;BEGIN CODE
(Alias_Victim.getRef() as Actor).EvaluatePackage()
(BaboSexController as BaboSexControllerManager).FadeoutScene(false)
(BaboSexController as BaboSexControllerManager).EncounterEvent09Messagebox(6)
Setstage(255)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_18
Function Fragment_18()
;BEGIN AUTOCAST TYPE BaboDiaQuest
Quest __temp = self as Quest
BaboDiaQuest kmyQuest = __temp as BaboDiaQuest
;END AUTOCAST
;BEGIN CODE
Actor akactor = Alias_Victim.getReference() as Actor
kmyQuest.UnEquipRestraints(akactor)
kmyQuest.UnEquipCumItem(akactor)
akactor.SetOutfit(BaboDefeatedAdventurerOutfit002)
akactor.AddItem(FalmerSword)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).EncounterEvent09Messagebox(5)
(BaboSexController as BaboSexControllerManager).SexCustomTag(Alias_PlayerAlias, Alias_FalmerVictory01, None, None, None, "", "", true, "Event09Sex01", "Encounter09Sex01", true)
(BaboSexController as BaboSexControllerManager).AddSexCount(1)
Utility.wait(30)
(BaboSexController as BaboSexControllerManager).SexCustom(Alias_Victim, Alias_Falmer02, None, None, None, "Vaginal", "", "", false, none, none, true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).ChallengeStart(Alias_Falmer01)
(BaboSexController as BaboSexControllerManager).StopAllSexlabAnimations()
Utility.wait(5.0)
(BaboSexController as BaboSexControllerManager).ChallengeStart(Alias_Falmer02)
(BaboSexController as BaboSexControllerManager).ChallengeStart(Alias_Falmer03)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).pacifyAlias(Alias_Falmer01)
(BaboSexController as BaboSexControllerManager).pacifyAlias(Alias_Falmer02)
(BaboSexController as BaboSexControllerManager).pacifyAlias(Alias_Falmer03)

(BaboSexController as BaboSexControllerManager).DisableEssential()
(BaboSexController as BaboSexControllerManager).LosingControl()
Utility.wait(1.0)
(BaboSexController as BaboSexControllerManager).RecoverControl()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).EncounterEvent09Messagebox(4)
(BaboSexController as BaboSexControllerManager).SexCustomTag(Alias_PlayerAlias, Alias_FalmerVictory01, None, None, None, "", "", true, "Event09Sex01", "Encounter09Sex01", true)
(BaboSexController as BaboSexControllerManager).AddSexCount(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
;The victim died
(BaboSexController as BaboSexControllerManager).EncounterEvent09Messagebox(2)
setstage(255)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property RescueCount  Auto  

GlobalVariable Property BaboSlaveRescueCountStore  Auto  

GlobalVariable Property BaboSlaveRescueCount  Auto  

String Property Creature  Auto  

Quest Property BaboSexController  Auto  

FormList Property BaboTempList  Auto  

GlobalVariable Property BaboEncounter09FalmerNum  Auto  

Actor Property BaboFalmerDebugRef  Auto  

Outfit Property BaboDefeatedAdventurerOutfit002  Auto  

WEAPON Property FalmerSword  Auto  
