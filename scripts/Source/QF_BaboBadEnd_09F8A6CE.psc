;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 50
Scriptname QF_BaboBadEnd_09F8A6CE Extends Quest Hidden

;BEGIN ALIAS PROPERTY FarmerM2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FarmerM2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Creature
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Creature Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PlayerRef
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PlayerRef Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FarmerF
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FarmerF Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Raper2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Raper2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Raper
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Raper Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Helper
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Helper Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY GuardM
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_GuardM Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FarmerM
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FarmerM Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PlayerVoiceStandbyRef
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PlayerVoiceStandbyRef Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY GuardM2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_GuardM2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PlayerVoiceRef
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PlayerVoiceRef Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CenterMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CenterMarker Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN CODE
;Gotoslavery
;After the scene it goes to 199
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_32
Function Fragment_32()
;BEGIN AUTOCAST TYPE BaboBadEndQuest
Quest __temp = self as Quest
BaboBadEndQuest kmyQuest = __temp as BaboBadEndQuest
;END AUTOCAST
;BEGIN CODE
kmyQuest.SpawnVariable(5)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_21
Function Fragment_21()
;BEGIN AUTOCAST TYPE BaboBadEndQuest
Quest __temp = self as Quest
BaboBadEndQuest kmyQuest = __temp as BaboBadEndQuest
;END AUTOCAST
;BEGIN CODE
kmyQuest.RevertQuest(4)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_47
Function Fragment_47()
;BEGIN CODE
Alias_Helper.getactorreference().evaluatepackage()
Utility.wait(10.0)
setstage(255)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_29
Function Fragment_29()
;BEGIN AUTOCAST TYPE BaboBadEndQuest
Quest __temp = self as Quest
BaboBadEndQuest kmyQuest = __temp as BaboBadEndQuest
;END AUTOCAST
;BEGIN CODE
kmyQuest.CreatureRapeStart();
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN AUTOCAST TYPE BaboBadEndQuest
Quest __temp = self as Quest
BaboBadEndQuest kmyQuest = __temp as BaboBadEndQuest
;END AUTOCAST
;BEGIN CODE
kmyQuest.ForceSceneStart(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_33
Function Fragment_33()
;BEGIN AUTOCAST TYPE BaboBadEndQuest
Quest __temp = self as Quest
BaboBadEndQuest kmyQuest = __temp as BaboBadEndQuest
;END AUTOCAST
;BEGIN CODE
kmyQuest.SpawnVariable(6)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_43
Function Fragment_43()
;BEGIN AUTOCAST TYPE BaboBadEndQuest
Quest __temp = self as Quest
BaboBadEndQuest kmyQuest = __temp as BaboBadEndQuest
;END AUTOCAST
;BEGIN CODE
kmyQuest.RapeStart(Alias_FarmerM, None, None, None, "MF", "Aggressive", None, True, "BEAS01", "BadEndAfterSex01", True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_42
Function Fragment_42()
;BEGIN AUTOCAST TYPE BaboBadEndQuest
Quest __temp = self as Quest
BaboBadEndQuest kmyQuest = __temp as BaboBadEndQuest
;END AUTOCAST
;BEGIN CODE
kmyQuest.RevertQuest(5)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_22
Function Fragment_22()
;BEGIN AUTOCAST TYPE BaboBadEndQuest
Quest __temp = self as Quest
BaboBadEndQuest kmyQuest = __temp as BaboBadEndQuest
;END AUTOCAST
;BEGIN CODE
kmyQuest.ClearRestraints()
;kmyQuest.UnEquipCumItem(Alias_PlayerRef.getreference() as actor)
;kmyQuest.UnEquipRestraints(Alias_PlayerRef.getreference() as actor)

Alias_FarmerM.getactorreference().deletewhenable()
Alias_FarmerM2.getactorreference().deletewhenable()
Alias_GuardM.getactorreference().deletewhenable()
Alias_GuardM2.getactorreference().deletewhenable()
Alias_Creature.getactorreference().deletewhenable()
Alias_Helper.getactorreference().deletewhenable()
Alias_Raper.getactorreference().deletewhenable()
Alias_Raper2.getactorreference().deletewhenable()

Alias_FarmerM.clear()
Alias_FarmerM2.clear()
Alias_GuardM.clear()
Alias_GuardM2.clear()
Alias_Creature.clear()
Alias_Helper.clear()
Alias_Raper.clear()
Alias_Raper2.clear()

stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_31
Function Fragment_31()
;BEGIN AUTOCAST TYPE BaboBadEndQuest
Quest __temp = self as Quest
BaboBadEndQuest kmyQuest = __temp as BaboBadEndQuest
;END AUTOCAST
;BEGIN CODE
kmyQuest.ForceSceneStart(5)
BSCM.TraumaExp(1.0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN AUTOCAST TYPE BaboBadEndQuest
Quest __temp = self as Quest
BaboBadEndQuest kmyQuest = __temp as BaboBadEndQuest
;END AUTOCAST
;BEGIN CODE
kmyQuest.SpawnVariable(3)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_23
Function Fragment_23()
;BEGIN AUTOCAST TYPE BaboBadEndQuest
Quest __temp = self as Quest
BaboBadEndQuest kmyQuest = __temp as BaboBadEndQuest
;END AUTOCAST
;BEGIN CODE
kmyQuest.RevertQuest(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN AUTOCAST TYPE BaboBadEndQuest
Quest __temp = self as Quest
BaboBadEndQuest kmyQuest = __temp as BaboBadEndQuest
;END AUTOCAST
;BEGIN CODE
kmyQuest.AfterSex(2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_34
Function Fragment_34()
;BEGIN AUTOCAST TYPE BaboBadEndQuest
Quest __temp = self as Quest
BaboBadEndQuest kmyQuest = __temp as BaboBadEndQuest
;END AUTOCAST
;BEGIN CODE
kmyQuest.SpawnVariable(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_30
Function Fragment_30()
;BEGIN AUTOCAST TYPE BaboBadEndQuest
Quest __temp = self as Quest
BaboBadEndQuest kmyQuest = __temp as BaboBadEndQuest
;END AUTOCAST
;BEGIN CODE
kmyQuest.AfterSex(4)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_49
Function Fragment_49()
;BEGIN AUTOCAST TYPE BaboBadEndQuest
Quest __temp = self as Quest
BaboBadEndQuest kmyQuest = __temp as BaboBadEndQuest
;END AUTOCAST
;BEGIN CODE
kmyQuest.RevertQuest(2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_19
Function Fragment_19()
;BEGIN CODE
Alias_Helper.getactorreference().evaluatepackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_36
Function Fragment_36()
;BEGIN AUTOCAST TYPE BaboBadEndQuest
Quest __temp = self as Quest
BaboBadEndQuest kmyQuest = __temp as BaboBadEndQuest
;END AUTOCAST
;BEGIN CODE
kmyQuest.ForceSceneStart(0)
BSCM.TraumaExp(1.0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_20
Function Fragment_20()
;BEGIN AUTOCAST TYPE BaboBadEndQuest
Quest __temp = self as Quest
BaboBadEndQuest kmyQuest = __temp as BaboBadEndQuest
;END AUTOCAST
;BEGIN CODE
kmyQuest.RevertQuest(3)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_45
Function Fragment_45()
;BEGIN CODE
Setstage(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN AUTOCAST TYPE BaboBadEndQuest
Quest __temp = self as Quest
BaboBadEndQuest kmyQuest = __temp as BaboBadEndQuest
;END AUTOCAST
;BEGIN CODE
kmyQuest.SpawnVariable(2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_16
Function Fragment_16()
;BEGIN AUTOCAST TYPE BaboBadEndQuest
Quest __temp = self as Quest
BaboBadEndQuest kmyQuest = __temp as BaboBadEndQuest
;END AUTOCAST
;BEGIN CODE
if BaboSimpleSlaveryChance.getvalue() == 1
SendModEvent("SSLV Entry")
BSCM.TraumaExp(5.0)
BSCM.CorruptionExp(10.0)
Utility.wait(1.0)
setstage(255)
else
(BaboSexController as BaboSexControllerManager).BadEndMessagebox(9)
kmyQuest.RescueFromGuards()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN CODE
;NoSlavery
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_39
Function Fragment_39()
;BEGIN CODE
Alias_FarmerM.getactorreference().evaluatepackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_37
Function Fragment_37()
;BEGIN CODE
Alias_FarmerM.getactorreference().evaluatepackage()
Utility.wait(10.0)
setstage(60)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_38
Function Fragment_38()
;BEGIN CODE
Alias_FarmerM.getactorreference().evaluatepackage()
setstage(60)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
Alias_Helper.getactorreference().evaluatepackage()
Utility.wait(10.0)
setstage(255)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE BaboBadEndQuest
Quest __temp = self as Quest
BaboBadEndQuest kmyQuest = __temp as BaboBadEndQuest
;END AUTOCAST
;BEGIN CODE
kmyQuest.SpawnVariable(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_24
Function Fragment_24()
;BEGIN AUTOCAST TYPE BaboBadEndQuest
Quest __temp = self as Quest
BaboBadEndQuest kmyQuest = __temp as BaboBadEndQuest
;END AUTOCAST
;BEGIN CODE
kmyQuest.StartScenarioe()
kmyQuest.BadEndCount()
kmyQuest.ResetAnimation()
BSCM.TraumaExp(5.0)
BSCM.CorruptionExp(8.0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_25
Function Fragment_25()
;BEGIN AUTOCAST TYPE BaboBadEndQuest
Quest __temp = self as Quest
BaboBadEndQuest kmyQuest = __temp as BaboBadEndQuest
;END AUTOCAST
;BEGIN CODE
kmyQuest.StripandGetdressed()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_27
Function Fragment_27()
;BEGIN AUTOCAST TYPE BaboBadEndQuest
Quest __temp = self as Quest
BaboBadEndQuest kmyQuest = __temp as BaboBadEndQuest
;END AUTOCAST
;BEGIN CODE
kmyQuest.PastTime()
utility.wait(2.0)
setstage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_28
Function Fragment_28()
;BEGIN AUTOCAST TYPE BaboBadEndQuest
Quest __temp = self as Quest
BaboBadEndQuest kmyQuest = __temp as BaboBadEndQuest
;END AUTOCAST
;BEGIN CODE
kmyQuest.ForceSceneStart(2)
BSCM.TraumaExp(2.0)
BSCM.CorruptionExp(2.0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN AUTOCAST TYPE BaboBadEndQuest
Quest __temp = self as Quest
BaboBadEndQuest kmyQuest = __temp as BaboBadEndQuest
;END AUTOCAST
;BEGIN CODE
kmyQuest.RapeStart(Alias_Raper, Alias_Raper2, None, None, "MMF", "Aggressive", "Rape", True, "BEAS01", "BadEndAfterSex01", True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_46
Function Fragment_46()
;BEGIN AUTOCAST TYPE BaboBadEndQuest
Quest __temp = self as Quest
BaboBadEndQuest kmyQuest = __temp as BaboBadEndQuest
;END AUTOCAST
;BEGIN CODE
kmyQuest.RevertQuest(3)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_48
Function Fragment_48()
;BEGIN AUTOCAST TYPE BaboBadEndQuest
Quest __temp = self as Quest
BaboBadEndQuest kmyQuest = __temp as BaboBadEndQuest
;END AUTOCAST
;BEGIN CODE
kmyQuest.RevertQuest(6)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_41
Function Fragment_41()
;BEGIN AUTOCAST TYPE BaboBadEndQuest
Quest __temp = self as Quest
BaboBadEndQuest kmyQuest = __temp as BaboBadEndQuest
;END AUTOCAST
;BEGIN CODE
kmyQuest.RevertQuest(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN AUTOCAST TYPE BaboBadEndQuest
Quest __temp = self as Quest
BaboBadEndQuest kmyQuest = __temp as BaboBadEndQuest
;END AUTOCAST
;BEGIN CODE
kmyQuest.RevertQuest(2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_18
Function Fragment_18()
;BEGIN AUTOCAST TYPE BaboBadEndQuest
Quest __temp = self as Quest
BaboBadEndQuest kmyQuest = __temp as BaboBadEndQuest
;END AUTOCAST
;BEGIN CODE
kmyQuest.ForceSceneStart(4)
BSCM.CreatureTraumaExp(1.0)
BSCM.CorruptionExp(1.0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_44
Function Fragment_44()
;BEGIN AUTOCAST TYPE BaboBadEndQuest
Quest __temp = self as Quest
BaboBadEndQuest kmyQuest = __temp as BaboBadEndQuest
;END AUTOCAST
;BEGIN CODE
kmyQuest.AfterSex(5)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN AUTOCAST TYPE BaboBadEndQuest
Quest __temp = self as Quest
BaboBadEndQuest kmyQuest = __temp as BaboBadEndQuest
;END AUTOCAST
;BEGIN CODE
kmyQuest.SpawnVariable(4)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_26
Function Fragment_26()
;BEGIN AUTOCAST TYPE BaboBadEndQuest
Quest __temp = self as Quest
BaboBadEndQuest kmyQuest = __temp as BaboBadEndQuest
;END AUTOCAST
;BEGIN CODE
kmyQuest.Fadein()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_17
Function Fragment_17()
;BEGIN AUTOCAST TYPE BaboBadEndQuest
Quest __temp = self as Quest
BaboBadEndQuest kmyQuest = __temp as BaboBadEndQuest
;END AUTOCAST
;BEGIN CODE
kmyQuest.ForceSceneStart(3)
BSCM.TraumaExp(1.0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_35
Function Fragment_35()
;BEGIN AUTOCAST TYPE BaboBadEndQuest
Quest __temp = self as Quest
BaboBadEndQuest kmyQuest = __temp as BaboBadEndQuest
;END AUTOCAST
;BEGIN CODE
kmyQuest.ForceSceneStart(6)
BSCM.TraumaExp(1.0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_40
Function Fragment_40()
;BEGIN AUTOCAST TYPE BaboBadEndQuest
Quest __temp = self as Quest
BaboBadEndQuest kmyQuest = __temp as BaboBadEndQuest
;END AUTOCAST
;BEGIN CODE
setstage(255)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment


BaboSexControllerManager Property BSCM Auto

Quest Property BaboSexController  Auto  

GlobalVariable Property BaboSimpleSlaveryChance  Auto  
