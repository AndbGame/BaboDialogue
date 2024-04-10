;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 6
Scriptname QF_BaboRescuingSlavesScript_0857D073 Extends Quest Hidden

;BEGIN ALIAS PROPERTY WarningNote
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WarningNote Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
BaboChangeLocationEvent01Trigger.SetValue(1)
Reset()
SetStage(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
Setstage(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
alias_WarningNote.ForceRefTo(Game.GetPlayer().PlaceAtMe(WNote))
(WICourier as WICourierScript).addAliasToContainer(alias_WarningNote)
Setstage(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN AUTOCAST TYPE BaboSlaveRescueScript
Quest __temp = self as Quest
BaboSlaveRescueScript kmyQuest = __temp as BaboSlaveRescueScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.RandomQuestSetting()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
Setstage(50)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Book Property WNote  Auto  

Quest Property WICourier  Auto  

GlobalVariable Property BaboChangeLocationEvent01Trigger  Auto  
