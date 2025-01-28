;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 45
Scriptname QF_BaboChangeLocationEvent02_089A4F55 Extends Quest Hidden

;BEGIN ALIAS PROPERTY myHoldLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TRIGGER
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TRIGGER Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CreatureRef
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CreatureRef Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CreatureRef02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CreatureRef02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CreatureRef05
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CreatureRef05 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CreatureRef03
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CreatureRef03 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CenterMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CenterMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PlayerAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PlayerAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldContested
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldContested Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CreatureRef01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CreatureRef01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CreatureRef04
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CreatureRef04 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_26
Function Fragment_26()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).ChangeLocationEvent02Messagebox(10)
(BaboSexController as BaboSexControllerManager).SexCustomTag(alias_PlayerAlias, Alias_CreatureRef, None, None, None, "Vaginal", "", true, "CLEvent02", "ChangeLocationEvent02", true)
(BaboSexController as BaboSexControllerManager).AddSexCount(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).ChangeLocationEvent02Messagebox(6)
(BaboSexController as BaboSexControllerManager).SexCustomTag(Alias_playerAlias, Alias_CreatureRef, None, None, None, "Vaginal", "", true, "CLEvent02", "ChangeLocationEvent02", true)
(BaboSexController as BaboSexControllerManager).AddSexCount(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_36
Function Fragment_36()
;BEGIN CODE
Utility.wait(2.0)
(BaboSexController as BaboSexControllerManager).ChangeLocationEvent02Messagebox(12)
Setstage(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_21
Function Fragment_21()
;BEGIN CODE
Utility.wait(2.0)
(BaboSexController as BaboSexControllerManager).ChangeLocationEvent02Messagebox(3)
Setstage(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
Utility.wait(2.0)
(BaboSexController as BaboSexControllerManager).ChangeLocationEvent02Messagebox(3)
Setstage(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
Utility.wait(2.0)
(BaboSexController as BaboSexControllerManager).ChangeLocationEvent02Messagebox(3)
Setstage(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_31
Function Fragment_31()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).ChallengeStart(Alias_CreatureRef01)
(BaboSexController as BaboSexControllerManager).ChallengeStart(Alias_CreatureRef02)
(BaboSexController as BaboSexControllerManager).ChallengeStart(Alias_CreatureRef03)
(BaboSexController as BaboSexControllerManager).ChallengeStart(Alias_CreatureRef04)
(BaboSexController as BaboSexControllerManager).ChallengeStart(Alias_CreatureRef05)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).ChangeLocationEvent02Messagebox(5)
(BaboSexController as BaboSexControllerManager).SexCustomTag(Alias_playerAlias, Alias_CreatureRef, None, None, None, "Vaginal", "", true, "CLEvent02", "ChangeLocationEvent02", true)
(BaboSexController as BaboSexControllerManager).AddSexCount(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;Copulation Ready
(BaboSexController as BaboSexControllerManager).ChangeLocationEvent02Messagebox(1)
Game.DisablePlayerControls(false, false, true, false, false, false, false)

if Alias_CreatureRef.getreference()
(BaboSexController as BaboSexControllerManager).pacifyAlias(Alias_CreatureRef)
Alias_CreatureRef.trytoaddtofaction(BaboChangeLocationEvent02FactionAfter)
setstage(20)
else
(BaboSexController as BaboSexControllerManager).pacifyAlias(Alias_CreatureRef01)
(BaboSexController as BaboSexControllerManager).pacifyAlias(Alias_CreatureRef02)
(BaboSexController as BaboSexControllerManager).pacifyAlias(Alias_CreatureRef03)
(BaboSexController as BaboSexControllerManager).pacifyAlias(Alias_CreatureRef04)
(BaboSexController as BaboSexControllerManager).pacifyAlias(Alias_CreatureRef05)
setstage(11)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
;Copulation Start
(BaboSexController as BaboSexControllerManager).SexCustomTag(Alias_playerAlias, Alias_CreatureRef, None, None, None, "", "", true, "CLEvent02", "ChangeLocationEvent02", true)
(BaboSexController as BaboSexControllerManager).AddSexCount(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_40
Function Fragment_40()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).SexCustomTag(Alias_PlayerAlias, Alias_CreatureRef03, Alias_CreatureRef04, None, None, "Aggressive", "", true, "CLEvent02Ex", "ChangeLocationEvent02Ex", true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_27
Function Fragment_27()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).ChangeLocationEvent02Messagebox(10)
(BaboSexController as BaboSexControllerManager).SexCustomTag(alias_PlayerAlias, Alias_CreatureRef, None, None, None, "Vaginal", "", true, "CLEvent02", "ChangeLocationEvent02", true)
(BaboSexController as BaboSexControllerManager).AddSexCount(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_24
Function Fragment_24()
;BEGIN CODE
Utility.wait(2.0)
(BaboSexController as BaboSexControllerManager).ChangeLocationEvent02Messagebox(9)
Setstage(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
;Copulation Start
(BaboSexController as BaboSexControllerManager).SexCustomTag(Alias_PlayerAlias, Alias_CreatureRef, None, None, None, "Vaginal", "", true, "CLEvent02", "ChangeLocationEvent02", true)
(BaboSexController as BaboSexControllerManager).AddSexCount(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_35
Function Fragment_35()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).SexCustomTag(Alias_PlayerAlias, Alias_CreatureRef01, None, None, None, "Vaginal", "", true, "CLEvent02", "ChangeLocationEvent02", true)
(BaboSexController as BaboSexControllerManager).AddSexCount(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_18
Function Fragment_18()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).ChangeLocationEvent02Messagebox(11)
(BaboSexController as BaboSexControllerManager).SexCustomTag(Alias_playerAlias, Alias_CreatureRef, None, None, None, "", "", true, "CLEvent02", "ChangeLocationEvent02", true)
(BaboSexController as BaboSexControllerManager).AddSexCount(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_25
Function Fragment_25()
;BEGIN CODE
Utility.wait(2.0)
(BaboSexController as BaboSexControllerManager).ChangeLocationEvent02Messagebox(9)
Setstage(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_44
Function Fragment_44()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).ChangeLocationEvent02Messagebox(14)
Utility.wait(30.0)
setstage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_20
Function Fragment_20()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).SexCustomTag(Alias_playerAlias, Alias_CreatureRef, None, None, None, "Vaginal", "", true, "CLEvent02", "ChangeLocationEvent02", true)
(BaboSexController as BaboSexControllerManager).AddSexCount(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
;After the Copulation
Debug.sendanimationevent(Alias_PlayerAlias.getreference() as actor, "BaboFaintFEnd")
utility.wait(30.0)
setstage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_32
Function Fragment_32()
;BEGIN CODE
if BaboDebugging.getvalue() == 1
Debug.notification("BaboDialogue: Change Location Event 02 fired")
endif

(BaboSexController as BaboSexControllerManager).CompatiblityCheck(True)
(BaboSexController as BaboSexControllerManager).pacifyAlias(Alias_CreatureRef)
(Alias_CreatureRef.getref() as actor).EvaluatePackage()
(BaboSexController as BaboSexControllerManager).StealArmorStart(true, BaboDialogueFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_16
Function Fragment_16()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).ChangeLocationEvent02Messagebox(7)
(BaboSexController as BaboSexControllerManager).SexCustomTag(alias_PlayerAlias, Alias_CreatureRef, None, None, None, "Vaginal", "", true, "CLEvent02", "ChangeLocationEvent02", true)
(BaboSexController as BaboSexControllerManager).AddSexCount(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_22
Function Fragment_22()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).ChangeLocationEvent02Messagebox(5)
(BaboSexController as BaboSexControllerManager).SexCustomTag(Alias_playerAlias, Alias_CreatureRef, None, None, None, "", "", true, "CLEvent02", "ChangeLocationEvent02", true)
(BaboSexController as BaboSexControllerManager).AddSexCount(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_38
Function Fragment_38()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).SexCustomTag(Alias_PlayerAlias, Alias_CreatureRef01, Alias_CreatureRef02, None, None, "Aggressive", "", true, "CLEvent02Ex", "ChangeLocationEvent02Ex", true)
(BaboSexController as BaboSexControllerManager).AddSexCount(3)
(BaboSexController as BaboSexControllerManager).AddGroupSexCount(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN CODE
Utility.wait(2.0)
(BaboSexController as BaboSexControllerManager).ChangeLocationEvent02Messagebox(4)
Setstage(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN CODE
Utility.wait(10.0)
Alias_CreatureRef.trytoaddtofaction(BaboChangeLocationEvent02FactionBefore)
Alias_CreatureRef.trytoremovefromfaction(BaboChangeLocationEvent02FactionAfter)
Utility.wait(1.0)
(Alias_CreatureRef.getref() as actor).SetActorValue("Aggression", 3)

(BaboSexController as BaboSexControllerManager).ChallengeStart(Alias_CreatureRef)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_41
Function Fragment_41()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).SexCustomTag(Alias_PlayerAlias, Alias_CreatureRef01, Alias_CreatureRef02, None, None, "Aggressive", "", true, "CLEvent02Ex", "ChangeLocationEvent02Ex", true)
(BaboSexController as BaboSexControllerManager).AddSexCount(4)
(BaboSexController as BaboSexControllerManager).AddGroupSexCount(2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
if BaboDebugging.getvalue() == 1
Debug.notification("BaboDialogue: Change Location Event 02 fired Skeevers")
endif
(BaboSexController as BaboSexControllerManager).CompatiblityCheck(True)
actor akactor = Alias_CreatureRef.getreference() as actor

Alias_CreatureRef.clear()
Alias_CreatureRef01.forcerefto(akactor)
Alias_CreatureRef02.forcerefto(akactor.placeactoratme(BaboCLEvent02Skeever))
Alias_CreatureRef03.forcerefto(akactor.placeactoratme(BaboCLEvent02Skeever))
Alias_CreatureRef04.forcerefto(akactor.placeactoratme(BaboCLEvent02Skeever))
Alias_CreatureRef05.forcerefto(akactor.placeactoratme(BaboCLEvent02Skeever))

(BaboSexController as BaboSexControllerManager).pacifyAlias(Alias_CreatureRef01)
(BaboSexController as BaboSexControllerManager).pacifyAlias(Alias_CreatureRef02)
(BaboSexController as BaboSexControllerManager).pacifyAlias(Alias_CreatureRef03)
(BaboSexController as BaboSexControllerManager).pacifyAlias(Alias_CreatureRef04)
(BaboSexController as BaboSexControllerManager).pacifyAlias(Alias_CreatureRef05)

(Alias_CreatureRef01.getref() as actor).EvaluatePackage()
(Alias_CreatureRef02.getref() as actor).EvaluatePackage()
(Alias_CreatureRef03.getref() as actor).EvaluatePackage()
(Alias_CreatureRef04.getref() as actor).EvaluatePackage()
(Alias_CreatureRef05.getref() as actor).EvaluatePackage()
(BaboSexController as BaboSexControllerManager).StealArmorStart(true, BaboDialogueFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_28
Function Fragment_28()
;BEGIN CODE
Utility.wait(2.0)
(BaboSexController as BaboSexControllerManager).ChangeLocationEvent02Messagebox(9)
Setstage(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_37
Function Fragment_37()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).SexCustomTag(Alias_PlayerAlias, Alias_CreatureRef01, Alias_CreatureRef02, None, None, "Vaginal", "", true, "CLEvent02", "ChangeLocationEvent02", true)
(BaboSexController as BaboSexControllerManager).AddSexCount(2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN CODE
;After the copulation
Utility.wait(2.0)
(BaboSexController as BaboSexControllerManager).ChangeLocationEvent02Messagebox(2)
Utility.wait(2.0)
setstage(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_43
Function Fragment_43()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).ChangeLocationEvent02Messagebox(13)
(BaboSexController as BaboSexControllerManager).pacifyAlias(Alias_CreatureRef02)
(BaboSexController as BaboSexControllerManager).pacifyAlias(Alias_CreatureRef03)
(BaboSexController as BaboSexControllerManager).pacifyAlias(Alias_CreatureRef04)
(BaboSexController as BaboSexControllerManager).pacifyAlias(Alias_CreatureRef05)
Utility.wait(30.0)
setstage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_42
Function Fragment_42()
;BEGIN CODE
if BaboDebugging.getvalue() == 1
Debug.notification("BaboDialogue: Change Location Event 02 fired Wolves")
endif

(BaboSexController as BaboSexControllerManager).CompatiblityCheck(True)
actor akactor = Alias_CreatureRef.getreference() as actor

Alias_CreatureRef.clear()
Alias_CreatureRef01.forcerefto(akactor)
Alias_CreatureRef02.forcerefto(akactor.placeactoratme(BaboEncWolf))
Alias_CreatureRef03.forcerefto(akactor.placeactoratme(BaboEncWolf))
Alias_CreatureRef04.forcerefto(akactor.placeactoratme(BaboEncWolf))
Alias_CreatureRef05.forcerefto(akactor.placeactoratme(BaboEncWolf))

(BaboSexController as BaboSexControllerManager).pacifyAlias(Alias_CreatureRef01)
(BaboSexController as BaboSexControllerManager).pacifyAlias(Alias_CreatureRef02)
(BaboSexController as BaboSexControllerManager).pacifyAlias(Alias_CreatureRef03)
(BaboSexController as BaboSexControllerManager).pacifyAlias(Alias_CreatureRef04)
(BaboSexController as BaboSexControllerManager).pacifyAlias(Alias_CreatureRef05)

(Alias_CreatureRef01.getref() as actor).EvaluatePackage()
(Alias_CreatureRef02.getref() as actor).EvaluatePackage()
(Alias_CreatureRef03.getref() as actor).EvaluatePackage()
(Alias_CreatureRef04.getref() as actor).EvaluatePackage()
(Alias_CreatureRef05.getref() as actor).EvaluatePackage()
(BaboSexController as BaboSexControllerManager).StealArmorStart(true, BaboDialogueFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_29
Function Fragment_29()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).ChangeLocationEvent02Messagebox(6)
(BaboSexController as BaboSexControllerManager).SexCustomTag(Alias_playerAlias, Alias_CreatureRef, None, None, None, "Vignal", "", true, "CLEvent02", "ChangeLocationEvent02", true)
(BaboSexController as BaboSexControllerManager).AddSexCount(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).ChangeLocationEvent02Messagebox(8)
(BaboSexController as BaboSexControllerManager).SLHHActivate(Alias_CreatureRef.getactorreference(), None)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_23
Function Fragment_23()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).SexCustomTag(Alias_playerAlias, Alias_CreatureRef, None, None, None, "", "", true, "CLEvent02", "ChangeLocationEvent02", true)
(BaboSexController as BaboSexControllerManager).AddSexCount(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
;Copulation Start
(BaboSexController as BaboSexControllerManager).SexCustomTag(Alias_PlayerAlias, Alias_CreatureRef, None, None, None, "Vaginal", "", true, "CLEvent02", "ChangeLocationEvent02", true)
(BaboSexController as BaboSexControllerManager).AddSexCount(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;The end of the quest
(BaboSexController as BaboSexControllerManager).RetrieveConfiscatedBelongings()
(BaboSexController as BaboSexControllerManager).CompatiblityCheck(False)
(BaboSexController as BaboSexControllerManager).DisableEssential()
(BaboSexController as BaboSexControllerManager).StealArmorStart(false, Alias_CreatureRef.getreference())
(Alias_CreatureRef.getref() as actor).EvaluatePackage()

Actor[] actors
if Alias_CreatureRef
actors = New Actor[1]
actors[0] = (Alias_CreatureRef.getreference() as actor)
(BaboSexController as BaboSexControllerManager).DeleteWhenAbleWithTimeout(actors, 60)
endif

if Alias_CreatureRef01
actors = New Actor[5]
actors[0] = (Alias_CreatureRef01.getreference() as actor)
actors[1] = (Alias_CreatureRef02.getreference() as actor)
actors[2] = (Alias_CreatureRef03.getreference() as actor)
actors[3] = (Alias_CreatureRef04.getreference() as actor)
actors[4] = (Alias_CreatureRef05.getreference() as actor)
(BaboSexController as BaboSexControllerManager).DeleteWhenAbleWithTimeout(actors, 60)
endif
; debug.trace(self + "stage 255, calling ReArmTrigger() on trigger" + Alias_Trigger.GetReference())
(Alias_Trigger.GetReference() as WETriggerScript).ReArmTrigger()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_19
Function Fragment_19()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).SexCustomTag(Alias_playerAlias, Alias_CreatureRef, None, None, None, "Vaginal", "", true, "CLEvent02", "ChangeLocationEvent02", true)
(BaboSexController as BaboSexControllerManager).AddSexCount(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_33
Function Fragment_33()
;BEGIN CODE
int numberi
numberi = (BaboSexController as BaboSexControllerManager).GetAliasArray(Alias_CreatureRef01, Alias_CreatureRef02, Alias_CreatureRef03, Alias_CreatureRef04, Alias_CreatureRef05)
BaboChangeLocationEvent02CreatureNum.setvalue(numberi)

Alias_CreatureRef01.clear()
Alias_CreatureRef02.clear()
Alias_CreatureRef03.clear()
Alias_CreatureRef04.clear()
Alias_CreatureRef05.clear()

Alias_CreatureRef01.forcerefto(BaboTempList.getat(0) as actor)
if numberi > 1
Alias_CreatureRef02.forcerefto(BaboTempList.getat(1) as actor)
endif
if numberi > 2
Alias_CreatureRef03.forcerefto(BaboTempList.getat(2) as actor)
endif
if numberi > 3
Alias_CreatureRef04.forcerefto(BaboTempList.getat(3) as actor)
endif
if numberi > 4
Alias_CreatureRef05.forcerefto(BaboTempList.getat(4) as actor)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
Utility.wait(2.0)
(BaboSexController as BaboSexControllerManager).ChangeLocationEvent02Messagebox(3)
Setstage(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_39
Function Fragment_39()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).SexCustomTag(Alias_PlayerAlias, Alias_CreatureRef03, None, None, None, "Aggressive", "", true, "CLEvent02Ex", "ChangeLocationEvent02Ex", true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_30
Function Fragment_30()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).ChallengeStart(Alias_CreatureRef)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_34
Function Fragment_34()
;BEGIN CODE
setstage(100)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property BaboTempStolenGoodsRef  Auto  

Faction Property BaboChangeLocationEvent02FactionAfter  Auto  

Faction Property BaboChangeLocationEvent02FactionBefore  Auto  

String Property Aggressive  Auto  

String Property Bear  Auto  

String Property wolf  Auto  

String Property SabreCat  Auto  

String Property Rough  Auto  

String Property Troll  Auto  

String Property Vaginal  Auto  

String Property AfterSexScene3  Auto  

String Property AfterSexS3  Auto  

BaboReputationMasterScript Property BRMQuest  Auto  

GlobalVariable Property BaboHorribleHarassment  Auto  

Quest Property BaboSexController  Auto  

Faction Property BaboDialogueFaction  Auto  

ActorBase Property BaboCLEvent02SkeeverBoss  Auto  

ActorBase Property BaboCLEvent02Skeever  Auto  

FormList Property BaboTempList  Auto  

GlobalVariable Property BaboChangeLocationEvent02CreatureNum  Auto  

ActorBase Property BaboEncWolf  Auto  

GlobalVariable Property BaboDebugging  Auto  
