;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 25
Scriptname QF_BaboLoanSharks_08194462 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Guard3
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Guard3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CrewRiften
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CrewRiften Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY XmarkerSolitude
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_XmarkerSolitude Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DepositBoxAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DepositBoxAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Guard4
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Guard4 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PlayerRef
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PlayerRef Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY XmarkerRiften
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_XmarkerRiften Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CustomerC
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CustomerC Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CreatureB
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CreatureB Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY RepayBox
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_RepayBox Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LoansharkBoss
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LoansharkBoss Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CreatureA
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CreatureA Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CrewSolitude
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CrewSolitude Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CustomerB
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CustomerB Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Guard
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Guard Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CustomerA
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CustomerA Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Guard2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Guard2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LoansharkCrew
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LoansharkCrew Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_24
Function Fragment_24()
;BEGIN CODE
BaboEventLoanSharkLead.setvalue(1)
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

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property BaboLoanSharksScene01  Auto  

Scene Property BaboLoanSharksScene03  Auto  

GlobalVariable Property BaboEventLoanSharkLead  Auto  
