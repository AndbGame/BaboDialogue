;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 12
Scriptname QF_BaboChangeLocationEvent09_08559DE1 Extends Quest Hidden

;BEGIN ALIAS PROPERTY OldLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_OldLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PlayerAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PlayerAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Collector
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Collector Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY NewLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_NewLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LocationCenterMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LocationCenterMarker Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN AUTOCAST TYPE BaboDiaQuest
Quest __temp = self as Quest
BaboDiaQuest kmyQuest = __temp as BaboDiaQuest
;END AUTOCAST
;BEGIN CODE
LoanShark.Messagebox(6)
kmyQuest.fUnRegisterForUpdateGameTime()
kmyQuest.fRegisterForSingleUpdateGameTime(1.0)
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
BaboLoanSharkAvoidCollector.setvalue(0)
BaboLoanSharkCollectorEncounterCount.value += 1
kmyQuest.fUnRegisterForUpdateGameTime()
kmyQuest.fRegisterForSingleUpdateGameTime(6.0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
LoanShark.PayWeeklyInterest(BaboWeeklyInterestDueGlobal.getvalue() as int)
LoanShark.Messagebox(8)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE BaboDiaQuest
Quest __temp = self as Quest
BaboDiaQuest kmyQuest = __temp as BaboDiaQuest
;END AUTOCAST
;BEGIN CODE
kmyQuest.gotostate("ChangeLocationEvent09")
if LoanShark.InterestExceedsPrincipal()
if LoanShark.HandleCollateral()
SetStage(50)
else
SetStage(120)
endif
else
LoanShark.UpdateWeeklyInterestDue()
UpdateCurrentInstanceGlobal(BaboWeeklyInterestDueGlobal)
UpdateCurrentInstanceGlobal(BaboWeeklyInterestDueHalfGlobal)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
(Alias_Collector.getreference() as actor).deletewhenable()
BaboEventLoanSharkCollectInterestReady.setvalue(0)
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN AUTOCAST TYPE BaboDiaQuest
Quest __temp = self as Quest
BaboDiaQuest kmyQuest = __temp as BaboDiaQuest
;END AUTOCAST
;BEGIN CODE
LoanShark.UpdateWeeklyInterestDue()
UpdateCurrentInstanceGlobal(BaboWeeklyInterestDueGlobal)
UpdateCurrentInstanceGlobal(BaboWeeklyInterestDueHalfGlobal)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
(Alias_Collector.getreference() as actor).evaluatepackage()
LoanShark.BumpWeeklyInterest()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
BaboLoanSharkAvoidCollector.setvalue(1)
(Alias_Collector.getreference() as actor).evaluatepackage()
LoanShark.BumpWeeklyInterest()
setstage(255)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
LoanShark.PayWeeklyInterest(BaboWeeklyInterestDueGlobal.getvalue() as int / 2)
LoanShark.Messagebox(9)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
LoanShark.HandleCollectorInterestOverPrincipal()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN AUTOCAST TYPE BaboDiaQuest
Quest __temp = self as Quest
BaboDiaQuest kmyQuest = __temp as BaboDiaQuest
;END AUTOCAST
;BEGIN CODE
LoanShark.Messagebox(7)
kmyQuest.fUnRegisterForUpdateGameTime()
kmyQuest.fRegisterForSingleUpdateGameTime(1.0)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property BaboWeeklyInterestDueGlobal  Auto  

GlobalVariable Property BabodebtPaybackValueGlobal  Auto  

GlobalVariable Property BabodebtValueGlobal  Auto  

BaboLoanSharkScript Property LoanShark  Auto  

Quest Property BaboSexController  Auto  

GlobalVariable Property BaboLoanSharkCollectorEncounterCount  Auto  

MiscObject Property Gold001  Auto  

GlobalVariable Property BaboEventLoanSharkCollectInterestReady  Auto  

GlobalVariable Property BaboLoanSharkAvoidCollector  Auto  

GlobalVariable Property BaboWeeklyInterestDueHalfGlobal  Auto  
