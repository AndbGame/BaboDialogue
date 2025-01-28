;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 30
Scriptname QF_BaboChangeLocationEvent02_088E1C6E Extends Quest Hidden

;BEGIN ALIAS PROPERTY myHoldLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TRIGGER
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TRIGGER Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CenterMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CenterMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CreatureRef
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CreatureRef Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldContested
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldContested Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PlayerAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PlayerAlias Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_29
Function Fragment_29()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).ChallengeStart(Alias_CreatureRef)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_20
Function Fragment_20()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).SexCustomTag(Alias_playerAlias, Alias_CreatureRef, None, None, None, "", "", true, "CLEvent02PlainSnow", "ChangeLocationEvent02PlainSnow", true)
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

;BEGIN FRAGMENT Fragment_21
Function Fragment_21()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).SexCustomTag(Alias_playerAlias, Alias_CreatureRef, None, None, None, "", "", true, "CLEvent02PlainSnow", "ChangeLocationEvent02PlainSnow", true)
(BaboSexController as BaboSexControllerManager).AddSexCount(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).SexCustomTag(Alias_playerAlias, Alias_CreatureRef, None, None, None, "", "", true, "CLEvent02PlainSnow", "ChangeLocationEvent02PlainSnow", true)
(BaboSexController as BaboSexControllerManager).AddSexCount(1)
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

;BEGIN FRAGMENT Fragment_22
Function Fragment_22()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).SexCustomTag(Alias_playerAlias, Alias_CreatureRef, None, None, None, "", "", true, "CLEvent02PlainSnow", "ChangeLocationEvent02PlainSnow", true)
(BaboSexController as BaboSexControllerManager).AddSexCount(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).ChangeLocationEvent02Messagebox(5)
(BaboSexController as BaboSexControllerManager).SexCustomTag(Alias_playerAlias, Alias_CreatureRef, None, None, None, "Vaginal", "", true, "CLEvent02PlainSnow", "ChangeLocationEvent02PlainSnow", true)
(BaboSexController as BaboSexControllerManager).AddSexCount(1)
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

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN CODE
Utility.wait(2.0)
(BaboSexController as BaboSexControllerManager).ChangeLocationEvent02Messagebox(4)
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

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).ChangeLocationEvent02Messagebox(8)
(BaboSexController as BaboSexControllerManager).SLHHActivate(Alias_CreatureRef.getactorreference(), None)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
if BaboDebugging.getvalue() == 1
Debug.notification("BaboDialogue: Change Location Event 02 PlainSnow fired")
endif
(BaboSexController as BaboSexControllerManager).CompatiblityCheck(True)
(BaboSexController as BaboSexControllerManager).pacifyAlias(Alias_CreatureRef)
(Alias_CreatureRef.getref() as actor).EvaluatePackage()
(BaboSexController as BaboSexControllerManager).StealArmorStart(true, Alias_CreatureRef.getreference())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_28
Function Fragment_28()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).ChangeLocationEvent02Messagebox(6)
(BaboSexController as BaboSexControllerManager).SexCustomTag(Alias_playerAlias, Alias_CreatureRef, None, None, None, "Vaginal", "", true, "CLEvent02PlainSnow", "ChangeLocationEvent02PlainSnow", true)
(BaboSexController as BaboSexControllerManager).AddSexCount(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_23
Function Fragment_23()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).ChangeLocationEvent02Messagebox(6)
(BaboSexController as BaboSexControllerManager).SexCustomTag(Alias_playerAlias, Alias_CreatureRef, None, None, None, "Vaginal", "", true, "CLEvent02PlainSnow", "ChangeLocationEvent02PlainSnow", true)
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
(BaboSexController as BaboSexControllerManager).pacifyAlias(Alias_CreatureRef)
Alias_CreatureRef.trytoaddtofaction(BaboChangeLocationEvent02FactionAfter)
setstage(20)
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

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).SexCustomTag(Alias_playerAlias, Alias_CreatureRef, None, None, None, "", "", true, "CLEvent02PlainSnow", "ChangeLocationEvent02PlainSnow", true)
(BaboSexController as BaboSexControllerManager).AddSexCount(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_16
Function Fragment_16()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).ChangeLocationEvent02Messagebox(7)
(BaboSexController as BaboSexControllerManager).SexCustomTag(alias_PlayerAlias, Alias_CreatureRef, None, None, None, "Vaginal", "", true, "CLEvent02PlainSnow", "ChangeLocationEvent02PlainSnow", true)
(BaboSexController as BaboSexControllerManager).AddSexCount(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_27
Function Fragment_27()
;BEGIN CODE
Utility.wait(2.0)
(BaboSexController as BaboSexControllerManager).ChangeLocationEvent02Messagebox(3)
Setstage(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_24
Function Fragment_24()
;BEGIN CODE
Utility.wait(2.0)
(BaboSexController as BaboSexControllerManager).ChangeLocationEvent02Messagebox(3)
Setstage(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
;Copulation Start
(BaboSexController as BaboSexControllerManager).SexCustomTag(Alias_playerAlias, Alias_CreatureRef, None, None, None, "", "", true, "CLEvent02PlainSnow", "ChangeLocationEvent02PlainSnow", true)
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
Actor[] actors
if Alias_CreatureRef
(Alias_CreatureRef.getref() as actor).EvaluatePackage()
actors = New Actor[1]
actors[0] = (Alias_CreatureRef.getreference() as actor)
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
(BaboSexController as BaboSexControllerManager).SexCustomTag(Alias_playerAlias, Alias_CreatureRef, None, None, None, "Vaginal", "", true, "CLEvent02PlainSnow", "ChangeLocationEvent02PlainSnow", true)
(BaboSexController as BaboSexControllerManager).AddSexCount(1)
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

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).ChangeLocationEvent02Messagebox(6)
(BaboSexController as BaboSexControllerManager).SexCustomTag(Alias_playerAlias, Alias_CreatureRef, None, None, None, "Vaginal", "", true, "CLEvent02PlainSnow", "ChangeLocationEvent02PlainSnow", true)
(BaboSexController as BaboSexControllerManager).AddSexCount(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_26
Function Fragment_26()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).ChangeLocationEvent02Messagebox(10)
(BaboSexController as BaboSexControllerManager).SexCustomTag(alias_PlayerAlias, Alias_CreatureRef, None, None, None, "Vaginal", "", true, "CLEvent02PlainSnow", "ChangeLocationEvent02PlainSnow", true)
(BaboSexController as BaboSexControllerManager).AddSexCount(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_18
Function Fragment_18()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).ChangeLocationEvent02Messagebox(6)
(BaboSexController as BaboSexControllerManager).SexCustomTag(Alias_playerAlias, Alias_CreatureRef, None, None, None, "Vaginal", "", true, "CLEvent02PlainSnow", "ChangeLocationEvent02PlainSnow", true)
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

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Faction Property BaboChangeLocationEvent02FactionAfter  Auto  

Faction Property BaboChangeLocationEvent02FactionBefore  Auto  

Quest Property BaboSexController  Auto  

GlobalVariable Property BaboDebugging  Auto  
