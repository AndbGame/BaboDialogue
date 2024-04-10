;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 24
Scriptname QF_BaboLoanSharks_08194462 Extends Quest Hidden

;BEGIN ALIAS PROPERTY CrewRiften
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CrewRiften Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PlayerRef
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PlayerRef Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CrewSolitude
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CrewSolitude Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY XmarkerSolitude
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_XmarkerSolitude Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CustomerC
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CustomerC Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LoansharkBoss
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LoansharkBoss Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY XmarkerRiften
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_XmarkerRiften Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LoansharkCrew
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LoansharkCrew Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CustomerA
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CustomerA Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CustomerB
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CustomerB Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN AUTOCAST TYPE BaboLoanSharkScript
Quest __temp = self as Quest
BaboLoanSharkScript kmyQuest = __temp as BaboLoanSharkScript
;END AUTOCAST
;BEGIN CODE
;Sex Start
;One man Sex
kmyQuest.ReceptionSex(Alias_PlayerRef, Alias_CustomerA, None, None, None, "MF", "Vaginal", "Anal", True, "LSAS01", "LoanSharkAfterSex01", False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN AUTOCAST TYPE BaboLoanSharkScript
Quest __temp = self as Quest
BaboLoanSharkScript kmyQuest = __temp as BaboLoanSharkScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.ReceptionSex(Alias_PlayerRef, Alias_CustomerA, None, None, None, "MF", "Vaginal", "Anal", True, "LSAS01", "LoanSharkAfterSex01", True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN AUTOCAST TYPE BaboLoanSharkScript
Quest __temp = self as Quest
BaboLoanSharkScript kmyQuest = __temp as BaboLoanSharkScript
;END AUTOCAST
;BEGIN CODE
;Second round
kmyQuest.SpawnCustomer(2)
Utility.wait(5.0)
BaboLoanSharksScene03.forcestart()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_19
Function Fragment_19()
;BEGIN AUTOCAST TYPE BaboLoanSharkScript
Quest __temp = self as Quest
BaboLoanSharkScript kmyQuest = __temp as BaboLoanSharkScript
;END AUTOCAST
;BEGIN CODE
;Sex Round 2
kmyQuest.ReceptionSex(Alias_PlayerRef, Alias_CustomerA, Alias_CustomerB, None, None, "MMF", "Vaginal", "Aggressive", True, "LSAS02", "LoanSharkAfterSex02", True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN AUTOCAST TYPE BaboLoanSharkScript
Quest __temp = self as Quest
BaboLoanSharkScript kmyQuest = __temp as BaboLoanSharkScript
;END AUTOCAST
;BEGIN CODE
;FadeOut
kmyQuest.FadeinMove(None, None, 25, true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_23
Function Fragment_23()
;BEGIN AUTOCAST TYPE BaboLoanSharkScript
Quest __temp = self as Quest
BaboLoanSharkScript kmyQuest = __temp as BaboLoanSharkScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.Scene04Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN AUTOCAST TYPE BaboLoanSharkScript
Quest __temp = self as Quest
BaboLoanSharkScript kmyQuest = __temp as BaboLoanSharkScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.DraggingtoSexMarketWithPossibility()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN AUTOCAST TYPE BaboLoanSharkScript
Quest __temp = self as Quest
BaboLoanSharkScript kmyQuest = __temp as BaboLoanSharkScript
;END AUTOCAST
;BEGIN CODE
;Pause time
kmyQuest.CustomersLeaving()
kmyQuest.Skipthescenes35()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN AUTOCAST TYPE BaboLoanSharkScript
Quest __temp = self as Quest
BaboLoanSharkScript kmyQuest = __temp as BaboLoanSharkScript
;END AUTOCAST
;BEGIN CODE
;Sex Round 2
kmyQuest.ReceptionSex(Alias_PlayerRef, Alias_CustomerA, None, None, None, "MF", "Vaginal", "Aggressive", True, "LSAS01", "LoanSharkAfterSex01", True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN AUTOCAST TYPE BaboLoanSharkScript
Quest __temp = self as Quest
BaboLoanSharkScript kmyQuest = __temp as BaboLoanSharkScript
;END AUTOCAST
;BEGIN CODE
;Ready for another round.
kmyQuest.Messagebox(3)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_17
Function Fragment_17()
;BEGIN AUTOCAST TYPE BaboLoanSharkScript
Quest __temp = self as Quest
BaboLoanSharkScript kmyQuest = __temp as BaboLoanSharkScript
;END AUTOCAST
;BEGIN CODE
;Sex Start
;One man Sex
kmyQuest.ReceptionSex(Alias_PlayerRef, Alias_CustomerA, Alias_CustomerB, None, None, "MMF", "Vaginal", "Anal", True, "LSAS02", "LoanSharkAfterSex02", False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN CODE
;Bounty
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
Alias_CrewSolitude.getactorreference().delete()
Alias_CrewRiften.getactorreference().delete()
Alias_CrewSolitude.clear()
Alias_CrewRiften.clear()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN AUTOCAST TYPE BaboLoanSharkScript
Quest __temp = self as Quest
BaboLoanSharkScript kmyQuest = __temp as BaboLoanSharkScript
;END AUTOCAST
;BEGIN CODE
;Start Prostitute
kmyQuest.PrepareStart()
kmyQuest.SpawnCustomer(1)
Utility.wait(5.0)
BaboLoanSharksScene01.forcestart()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN AUTOCAST TYPE BaboLoanSharkScript
Quest __temp = self as Quest
BaboLoanSharkScript kmyQuest = __temp as BaboLoanSharkScript
;END AUTOCAST
;BEGIN CODE
;Being released instead of SSLV You won't be able to get here. Dummy
kmyQuest.TeleportBack()
setstage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_16
Function Fragment_16()
;BEGIN CODE
;debug.notification("BaboLoanSharks Starts")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN AUTOCAST TYPE BaboLoanSharkScript
Quest __temp = self as Quest
BaboLoanSharkScript kmyQuest = __temp as BaboLoanSharkScript
;END AUTOCAST
;BEGIN CODE
;Sold to Slave Market
kmyQuest.EndofProstitute(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_18
Function Fragment_18()
;BEGIN AUTOCAST TYPE BaboLoanSharkScript
Quest __temp = self as Quest
BaboLoanSharkScript kmyQuest = __temp as BaboLoanSharkScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.ReceptionSex(Alias_PlayerRef, Alias_CustomerA, Alias_CustomerB, None, None, "MMF", "Vaginal", "Anal", True, "LSAS02", "LoanSharkAfterSex02", True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN AUTOCAST TYPE BaboLoanSharkScript
Quest __temp = self as Quest
BaboLoanSharkScript kmyQuest = __temp as BaboLoanSharkScript
;END AUTOCAST
;BEGIN CODE
;Pause time
kmyQuest.CustomersLeaving()
kmyQuest.Skipthescenes25()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN AUTOCAST TYPE BaboLoanSharkScript
Quest __temp = self as Quest
BaboLoanSharkScript kmyQuest = __temp as BaboLoanSharkScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.EndofProstitute(0)
setstage(100)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property BaboLoanSharksScene01  Auto  

Scene Property BaboLoanSharksScene03  Auto  
