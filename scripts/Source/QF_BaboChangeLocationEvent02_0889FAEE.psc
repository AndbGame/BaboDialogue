;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 12
Scriptname QF_BaboChangeLocationEvent02_0889FAEE Extends Quest Hidden

;BEGIN ALIAS PROPERTY CenterMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CenterMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TRIGGER
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TRIGGER Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PlayerAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PlayerAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CreatureRef
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CreatureRef Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).SexCustomTag(Alias_PlayerAlias, Alias_CreatureRef, None, None, None, "MovingDick", "", true, "CLEvent02DLC02", "ChangeLocationEvent02DLC02", true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).CompatiblityCheck(true)
(Alias_CreatureRef.getref() as actor).EvaluatePackage()
setstage(5)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
Utility.wait(2.0)
Setstage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).SexCustomTag(Alias_PlayerAlias, Alias_CreatureRef, None, None, None, "MovingDick", "", true, "CLEvent02DLC02", "ChangeLocationEvent02DLC02", true)
(BaboSexController as BaboSexControllerManager).AddSexCount(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).SexCustomTag(Alias_PlayerAlias, Alias_CreatureRef, None, None, None, "MovingDick", "", true, "CLEvent02DLC02", "ChangeLocationEvent02DLC02", true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).SexCustomTag(Alias_PlayerAlias, Alias_CreatureRef, None, None, None, "MovingDick", "", true, "CLEvent02DLC02", "ChangeLocationEvent02DLC02", true)
(BaboSexController as BaboSexControllerManager).AddSexCount(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN CODE
Utility.wait(2.0)
Setstage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).SexCustomTag(Alias_PlayerAlias, Alias_CreatureRef, None, None, None, "MovingDick", "", true, "CLEvent02DLC02", "ChangeLocationEvent02DLC02", true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).SexCustomTag(Alias_PlayerAlias, Alias_CreatureRef, None, None, None, "MovingDick", "", true, "CLEvent02DLC02", "ChangeLocationEvent02DLC02", true)
(BaboSexController as BaboSexControllerManager).AddSexCount(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).SexCustomTag(Alias_PlayerAlias, Alias_CreatureRef, None, None, None, "MovingDick", "", true, "CLEvent02DLC02", "ChangeLocationEvent02DLC02", true)
(BaboSexController as BaboSexControllerManager).AddSexCount(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).ChangeLocationEvent02Messagebox(1)
Game.DisablePlayerControls(false, false, true, false, false, false, false)
Alias_CreatureRef.trytoremovefromfaction(BaboChangeLocationEvent02FactionBefore)
Alias_CreatureRef.trytoaddtofaction(BaboChangeLocationEvent02FactionAfter)
Utility.wait(1.0)
(Alias_CreatureRef.getref() as actor).StopCombat()
(Alias_CreatureRef.getref() as actor).SetActorValue("Aggression", 1)
Utility.wait(5.0)
setstage(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).SexCustomTag(Alias_PlayerAlias, Alias_CreatureRef, None, None, None, "MovingDick", "", true, "CLEvent02DLC02", "ChangeLocationEvent02DLC02", true)
(BaboSexController as BaboSexControllerManager).AddSexCount(1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property BaboSexController  Auto  

Faction Property BaboChangeLocationEvent02FactionBefore  Auto  

Faction Property BaboChangeLocationEvent02FactionAfter  Auto  
