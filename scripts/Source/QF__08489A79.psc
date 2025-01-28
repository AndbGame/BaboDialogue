;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 55
Scriptname QF__08489A79 Extends Quest Hidden

;BEGIN ALIAS PROPERTY myHoldContested
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldContested Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Scene_Marker4
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Scene_Marker4 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ThugPost03
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ThugPost03 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ThugPost01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ThugPost01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TRIGGER
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TRIGGER Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Scene_Marker3
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Scene_Marker3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CenterMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CenterMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldSons
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldSons Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Scene_Marker1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Scene_Marker1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BanditCamp
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_BanditCamp Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Thug01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Thug01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DwellingLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_DwellingLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Scene_Marker2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Scene_Marker2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldImperial
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldImperial Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Thug04
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Thug04 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY StolenGoods
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_StolenGoods Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Thug02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Thug02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Thug03
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Thug03 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY VictimWoman
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_VictimWoman Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PlayerRef
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PlayerRef Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ThugPost02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ThugPost02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ThugPost04
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ThugPost04 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_32
Function Fragment_32()
;BEGIN CODE
BaboEncounter07Persuasion.setvalue(BaboEncounter07Persuasion.getvalue() - 80)
(BaboSexController as BaboSexControllerManager).BCLEventScenePlay(2, "BaboEncounter07")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_25
Function Fragment_25()
;BEGIN CODE
;35 - rape time
(BaboSexController as BaboSexControllerManager).EncounterEvent07Messagebox(5)
(BaboSexController as BaboSexControllerManager).SexCustomTag(Alias_PlayerRef, Alias_ThugPost01, None, None, None, "Aggressive", "Femdom, FM", true, "Event07Sex02", "Encounter07Sex02", true)
(BaboSexController as BaboSexControllerManager).AddSexCount(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_24
Function Fragment_24()
;BEGIN CODE
;15 - Kidnap Quest Start or SSLV
(BaboSexController as BaboSexControllerManager).PairedMotionNPC(Alias_VictimWoman.getreference() as actor, Alias_Thug01.getreference() as actor, 0, false)
(BaboSexController as BaboSexControllerManager).UnEquipRestraints(Alias_PlayerRef.getreference() as actor)
(BaboSexController as BaboSexControllerManager).EncounterEvent07Messagebox(2)
Actor Thug01 = Alias_Thug01.Getreference() as actor
Actor Thug02 = Alias_Thug02.Getreference() as actor
Alias_Thug01.clear()
Alias_Thug02.clear()
int randomi = Utility.randomint(10, 12)
if (BaboSexController as BaboSexControllerManager).KidnapQuestStart(Thug01, Thug02, randomi, None)
(BaboKidnapEvent as BaboKidnapEvenScript).StartUptheEvent(10)
endif
setstage(250)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_29
Function Fragment_29()
;BEGIN CODE
;50 - speech. - scene
(BaboSexController as BaboSexControllerManager).BCLEventScenePlay(4, "BaboEncounter07")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_49
Function Fragment_49()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).ReputationIncrease(12, 6)
(BaboSexController as BaboSexControllerManager).ReputationBitchincrease(5)
(BaboSexController as BaboSexControllerManager).PlusRescueCount(1)
setstage(255)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_27
Function Fragment_27()
;BEGIN CODE
;20 - battle
(BaboSexController as BaboSexControllerManager).PairedMotionNPC(Alias_VictimWoman.getreference() as actor, Alias_Thug04.getreference() as actor, 0, false)
(BaboSexController as BaboSexControllerManager).PairedMotionNPC(None, Alias_Thug01.getreference() as actor, 0, false)
(BaboSexController as BaboSexControllerManager).EncounterEvent07Messagebox(3)
(Alias_PlayerRef as BaboBrawlingPlayerREF).CheckEssential()
(Alias_PlayerRef as BaboBrawlingPlayerREF).RegisterOnHitExExtra(BaboEncounter07Faction)
(BaboSexController as BaboSexControllerManager).ChallengeStart(Alias_Thug01)
(BaboSexController as BaboSexControllerManager).ChallengeStart(Alias_Thug02)
(BaboSexController as BaboSexControllerManager).ChallengeStart(Alias_Thug03)
(BaboSexController as BaboSexControllerManager).ChallengeStart(Alias_Thug04)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_38
Function Fragment_38()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).EncounterEvent07Messagebox(6)
(BaboSexController as BaboSexControllerManager).SexCustomTag(Alias_PlayerRef, Alias_ThugPost01, Alias_ThugPost02, None, None, "Aggressive", "Femdom", true, "Event07Sex02", "Encounter07Sex02", true)
(BaboSexController as BaboSexControllerManager).AddSexCount(1)
(BaboSexController as BaboSexControllerManager).AddGroupSexCount(1)
(BaboSexController as BaboSexControllerManager).PairedMotionNPC(Alias_VictimWoman.getreference() as actor, Alias_ThugPost03.getreference() as actor, 7, true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_48
Function Fragment_48()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).ReputationIncrease(10, 5)
(BaboSexController as BaboSexControllerManager).ReputationBitchDecrease(15)
(BaboSexController as BaboSexControllerManager).PlusRescueCount(1)
setstage(255)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_52
Function Fragment_52()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).EncounterEvent07Messagebox(8)
setstage(255)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_54
Function Fragment_54()
;BEGIN CODE
;6 - Submit and scene
BaboEncounter07Persuasion.setvalue(BaboEncounter07Persuasion.getvalue() - 30)
(BaboSexController as BaboSexControllerManager).BCLEventScenePlay(2, "BaboEncounter07")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_34
Function Fragment_34()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).BCLEventScenePlay(3, "BaboEncounter07")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_47
Function Fragment_47()
;BEGIN AUTOCAST TYPE WEScript
Quest __temp = self as Quest
WEScript kmyQuest = __temp as WEScript
;END AUTOCAST
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).EncounterEvent07Messagebox(2)
(BaboSexController as BaboSexControllerManager).PairedMotionNPC(Alias_VictimWoman.getreference() as actor, Alias_ThugPost04.getreference() as actor, 0, false)
Actor ThugPost01 = Alias_ThugPost01.Getreference() as actor
Actor ThugPost02 = Alias_ThugPost02.Getreference() as actor
Actor ThugPost03 = Alias_ThugPost03.Getreference() as actor
Actor ThugPost04 = Alias_ThugPost04.Getreference() as actor
Alias_ThugPost01.clear()
Alias_ThugPost02.clear()
Alias_ThugPost03.clear()
Alias_ThugPost04.clear()
Actor VictimWoman = Alias_VictimWoman.Getreference() as actor
Alias_VictimWoman.clear()
if (BaboSexController as BaboSexControllerManager).KidnapQuestStart(ThugPost01, ThugPost02, 11, None)
(BaboKidnapEvent as BaboKidnapEvenScript).FillKidnapperActors(None, None, ThugPost03, ThugPost04, None, None, None, None)
(BaboKidnapEvent as BaboKidnapEvenScript).FillVictimActors(VictimWoman, None, None)
(BaboKidnapEvent as BaboKidnapEvenScript).StartUptheEvent(10)
endif
setstage(255)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_33
Function Fragment_33()
;BEGIN CODE
;(BaboSexController as BaboSexControllerManager).BCLEventScenePlay(0, "BaboEncounter07")
(BaboSexController as BaboSexControllerManager).QTEAnimation(Alias_PlayerRef.getreference() as actor, Alias_Thug02.getreference() as actor, false, "", "", true)
(BaboSexController as BaboSexControllerManager).PairedMotionNPC(Alias_VictimWoman.getreference() as actor, Alias_Thug04.getreference() as actor, 0, false)
(BaboSexController as BaboSexControllerManager).EncounterEvent07Messagebox(1)
(BaboSexController as BaboSexControllerManager).SexCustom(Alias_PlayerRef, Alias_Thug02, Alias_Thug03, Alias_Thug04, None, "Aggressive", None, None, true, "Encounter07S01", "Encounter07Sex01", true)
Utility.wait(3.0)
(BaboSexController as BaboSexControllerManager).PairedMotionNPC(Alias_VictimWoman.getreference() as actor, Alias_Thug01.getreference() as actor, 1, true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_50
Function Fragment_50()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).EncounterEvent07Messagebox(4)
(Alias_PlayerRef as BaboBrawlingPlayerREF).CheckEssential()
(Alias_PlayerRef as BaboBrawlingPlayerREF).RegisterOnHitExExtra(BaboEncounter07Faction)
(BaboSexController as BaboSexControllerManager).ChallengeStart(Alias_Thug03)
(BaboSexController as BaboSexControllerManager).ChallengeStart(Alias_Thug04)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_31
Function Fragment_31()
;BEGIN CODE
;57 - 2nd round
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_21
Function Fragment_21()
;BEGIN CODE
;debug.notification("Encounter 7 Started")
BaboEncounter07Persuasion.setvalue(100)
BaboEncounter07Scenarioe.setvalue(0)
BaboEncounter07BanditNum.setvalue(1)
(BaboSexController as BaboSexControllerManager).PairedMotionNPC(Alias_VictimWoman.getreference() as actor, Alias_Thug04.getreference() as actor, 6, true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_42
Function Fragment_42()
;BEGIN CODE
;Bandits Leave
(BaboSexController as BaboSexControllerManager).PairedMotionNPC(Alias_VictimWoman.getreference() as actor, Alias_Thug04.getreference() as actor, 0, false)
(BaboSexController as BaboSexControllerManager).UnEquipRestraints(Alias_PlayerRef.getreference() as actor)
setstage(41)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_43
Function Fragment_43()
;BEGIN CODE
;Negotiation Success
(Alias_Thug01.Getreference() as actor).evaluatepackage()
(Alias_Thug02.Getreference() as actor).evaluatepackage()
(Alias_Thug03.Getreference() as actor).evaluatepackage()
(Alias_Thug04.Getreference() as actor).evaluatepackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_26
Function Fragment_26()
;BEGIN AUTOCAST TYPE WEScript
Quest __temp = self as Quest
WEScript kmyQuest = __temp as WEScript
;END AUTOCAST
;BEGIN CODE
;30 - Player defeat
(BaboSexController as BaboSexControllerManager).pacifyAlias(Alias_Thug01)
(BaboSexController as BaboSexControllerManager).pacifyAlias(Alias_Thug02)
(BaboSexController as BaboSexControllerManager).pacifyAlias(Alias_Thug03)
(BaboSexController as BaboSexControllerManager).pacifyAlias(Alias_Thug04)
(BaboSexController as BaboSexControllerManager).DisableEssential()

int numberi
numberi = (BaboSexController as BaboSexControllerManager).GetAliasArray(Alias_Thug01, Alias_Thug02, Alias_Thug03, Alias_Thug04, None)
BaboEncounter07BanditNum.setvalue(numberi)

Alias_Thug01.clear()
Alias_Thug02.clear()
Alias_Thug03.clear()
Alias_Thug04.clear()

Alias_ThugPost01.forcerefto(BaboTempList.getat(0) as actor)
if numberi > 1
Alias_ThugPost02.forcerefto(BaboTempList.getat(1) as actor)
endif
if numberi > 2
Alias_ThugPost03.forcerefto(BaboTempList.getat(2) as actor)
endif
if numberi > 3
Alias_ThugPost04.forcerefto(BaboTempList.getat(3) as actor)
endif
(BaboSexController as BaboSexControllerManager).BCLEventScenePlay(5, "BaboEncounter07")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_40
Function Fragment_40()
;BEGIN CODE
setstage(40)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_51
Function Fragment_51()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).EncounterEvent07Messagebox(7)
setstage(255)
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

(BaboSexController as BaboSexControllerManager).DisableEssential()

Alias_Thug01.GetReference().DeleteWhenAble()
Alias_Thug02.GetReference().DeleteWhenAble()
Alias_Thug03.GetReference().DeleteWhenAble()
Alias_Thug04.GetReference().DeleteWhenAble()
Alias_ThugPost01.GetReference().DeleteWhenAble()
Alias_ThugPost02.GetReference().DeleteWhenAble()
Alias_ThugPost03.GetReference().DeleteWhenAble()
Alias_ThugPost04.GetReference().DeleteWhenAble()
Alias_VictimWoman.GetReference().DeleteWhenAble()
; debug.trace(self + "stage 255, calling ReArmTrigger() on trigger" + Alias_Trigger.GetReference())
(Alias_Trigger.GetReference() as WETriggerScript).ReArmTrigger()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_30
Function Fragment_30()
;BEGIN CODE
(Alias_Thug01.Getreference() as actor).evaluatepackage()
(Alias_Thug02.Getreference() as actor).evaluatepackage()
(Alias_Thug03.Getreference() as actor).evaluatepackage()
(Alias_Thug04.Getreference() as actor).evaluatepackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_41
Function Fragment_41()
;BEGIN CODE
setstage(40)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_53
Function Fragment_53()
;BEGIN CODE
;7 - speech. - scene
(BaboSexController as BaboSexControllerManager).BCLEventScenePlay(4, "BaboEncounter07")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_45
Function Fragment_45()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).EncounterEvent07Messagebox(2)
(BaboSexController as BaboSexControllerManager).PairedMotionNPC(Alias_VictimWoman.getreference() as actor, Alias_ThugPost02.getreference() as actor, 0, false)
Actor ThugPost01 = Alias_ThugPost01.Getreference() as actor
Actor ThugPost02 = Alias_ThugPost02.Getreference() as actor
Alias_ThugPost01.clear()
Alias_ThugPost02.clear()
Actor VictimWoman = Alias_VictimWoman.Getreference() as actor
Alias_VictimWoman.clear()
if (BaboSexController as BaboSexControllerManager).KidnapQuestStart(ThugPost01, ThugPost02, 10, None)
(BaboKidnapEvent as BaboKidnapEvenScript).FillKidnapperActors(None, None, None, None, None, None, None, None)
(BaboKidnapEvent as BaboKidnapEvenScript).FillVictimActors(VictimWoman, None, None)
(BaboKidnapEvent as BaboKidnapEvenScript).StartUptheEvent(10)
endif

setstage(255)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_35
Function Fragment_35()
;BEGIN CODE
Actor Thug03 = Alias_Thug03.Getreference() as actor
Actor Thug04 = Alias_Thug04.Getreference() as actor
Actor VictimWoman = Alias_VictimWoman.Getreference() as actor
Alias_Thug03.clear()
Alias_Thug04.clear()
Alias_VictimWoman.clear()
(BaboKidnapEvent as BaboKidnapEvenScript).FillKidnapperActors(None, None, Thug03, Thug04, None, None, None, None)
(BaboKidnapEvent as BaboKidnapEvenScript).FillVictimActors(VictimWoman, None, None)
(BaboKidnapEvent as BaboKidnapEvenScript).setthestage()
setstage(255)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_23
Function Fragment_23()
;BEGIN CODE
;10 - release the captive or break the promise scene start
(BaboSexController as BaboSexControllerManager).BCLEventScenePlay(0, "BaboEncounter07")
(BaboSexController as BaboSexControllerManager).NPCPairedAnimSequence(Alias_VictimWoman.getreference() as actor, Alias_Thug04.getreference() as actor, "Babo_CapturedPussy_A1", "Babo_CapturedPussy_A2")
(BaboSexController as BaboSexControllerManager).QTEAnimation(Alias_PlayerRef.getreference() as actor, Alias_Thug02.getreference() as actor, false, "", "", true)
(BaboSexController as BaboSexControllerManager).SexCustom(Alias_PlayerRef, Alias_Thug01, None, None, None, "Aggressive", None, None, true, "Encounter07S01", "Encounter07Sex01", true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_28
Function Fragment_28()
;BEGIN CODE
;40 - Player Win - release and go to 60
(BaboSexController as BaboSexControllerManager).DisableEssential()
(Alias_Thug01.Getreference() as actor).evaluatepackage()
(Alias_Thug02.Getreference() as actor).evaluatepackage()
(Alias_Thug03.Getreference() as actor).evaluatepackage()
(Alias_Thug04.Getreference() as actor).evaluatepackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_39
Function Fragment_39()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).EncounterEvent07Messagebox(6)
(BaboSexController as BaboSexControllerManager).SexCustomTag(Alias_PlayerRef, Alias_ThugPost01, Alias_ThugPost02, Alias_ThugPost03, None, "Aggressive", "Femdom", true, "Event07Sex02", "Encounter07Sex02", true)
(BaboSexController as BaboSexControllerManager).AddSexCount(2)
(BaboSexController as BaboSexControllerManager).AddGroupSexCount(1)
(BaboSexController as BaboSexControllerManager).PairedMotionNPC(Alias_VictimWoman.getreference() as actor, Alias_ThugPost04.getreference() as actor, 8, true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_37
Function Fragment_37()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).EncounterEvent07Messagebox(6)
(BaboSexController as BaboSexControllerManager).SexCustomTag(Alias_PlayerRef, Alias_ThugPost01, None, None, None, "Aggressive", "Femdom, FM", true, "Event07Sex02", "Encounter07Sex02", true)
(BaboSexController as BaboSexControllerManager).AddSexCount(1)
(BaboSexController as BaboSexControllerManager).PairedMotionNPC(Alias_VictimWoman.getreference() as actor, Alias_ThugPost02.getreference() as actor, 6, true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_22
Function Fragment_22()
;BEGIN CODE
;5 - Submit and scene
BaboEncounter07Persuasion.setvalue(BaboEncounter07Persuasion.getvalue() - 40)
(BaboSexController as BaboSexControllerManager).BCLEventScenePlay(2, "BaboEncounter07")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_46
Function Fragment_46()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).EncounterEvent07Messagebox(2)
(BaboSexController as BaboSexControllerManager).PairedMotionNPC(Alias_VictimWoman.getreference() as actor, Alias_ThugPost03.getreference() as actor, 0, false)
Actor ThugPost01 = Alias_ThugPost01.Getreference() as actor
Actor ThugPost02 = Alias_ThugPost02.Getreference() as actor
Actor ThugPost03 = Alias_ThugPost03.Getreference() as actor
Alias_ThugPost01.clear()
Alias_ThugPost02.clear()
Alias_ThugPost03.clear()
Actor VictimWoman = Alias_VictimWoman.Getreference() as actor
Alias_VictimWoman.clear()
if (BaboSexController as BaboSexControllerManager).KidnapQuestStart(ThugPost01, ThugPost02, 11, None)
(BaboKidnapEvent as BaboKidnapEvenScript).FillKidnapperActors(None, None, ThugPost03, None, None, None, None, None)
(BaboKidnapEvent as BaboKidnapEvenScript).FillVictimActors(VictimWoman, None, None)
(BaboKidnapEvent as BaboKidnapEvenScript).StartUptheEvent(10)
endif




setstage(255)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_44
Function Fragment_44()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).EncounterEvent07Messagebox(2)
Actor ThugPost01 = Alias_ThugPost01.Getreference() as actor
Alias_ThugPost01.clear()
Actor VictimWoman = Alias_VictimWoman.Getreference() as actor
Alias_VictimWoman.clear()
if (BaboSexController as BaboSexControllerManager).KidnapQuestStart(ThugPost01, None, 10, None)
(BaboKidnapEvent as BaboKidnapEvenScript).FillKidnapperActors(None, None, None, None, None, None, None, None)
(BaboKidnapEvent as BaboKidnapEvenScript).FillVictimActors(VictimWoman, None, None)
(BaboKidnapEvent as BaboKidnapEvenScript).StartUptheEvent(10)
endif

setstage(255)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property BaboSexController  Auto  

GlobalVariable Property BaboEncounter07Persuasion  Auto  

GlobalVariable Property BaboEncounter07Scenarioe  Auto  

Quest Property BaboKidnapEvent  Auto  

Location Property BaboKidnapperLocationCave  Auto  

GlobalVariable Property BaboEncounter07BanditNum  Auto  

FormList Property BaboTempList  Auto  

Faction Property BaboEncounter07Faction  Auto  
