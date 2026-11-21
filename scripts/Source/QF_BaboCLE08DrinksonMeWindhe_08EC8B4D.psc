;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 8
Scriptname QF_BaboCLE08DrinksonMeWindhe_08EC8B4D Extends Quest Hidden

;BEGIN ALIAS PROPERTY Innkeeper
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Innkeeper Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY NewLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_NewLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PlayerAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PlayerAlias Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
BaboCLE08WindhelmDrinkDonotAccept.setvalue(1)
setstage(250)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
BaboCLE08DrinkGold.setvalue(0);reset

int randomi = Utility.randomint(200, 300)
float totalsum = (BaboChangeLocation08FraudWindhelmTab.getvalue() * randomi) + BaboCLE08WindhelmDrinkGold.getvalue()
BaboCLE08DrinkGold.setvalue(totalsum)
UpdateCurrentInstanceGlobal(BaboCLE08DrinkGold)

(Alias_Innkeeper.getreference() as actor).addtofaction(BaboCLE08InnKeeperFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
BaboCLE08WindhelmDrinkDonotAccept.setvalue(0)
setstage(250)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
BaboCLE08WindhelmDrinkGold.setvalue(BaboCLE08WindhelmDrinkGold.getvalue() + BaboCLE08DrinkGold.getvalue())
Setstage(250)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
int imoney = BaboCLE08DrinkGold.getvalue() as int

Game.getplayer().removeitem(Gold001, imoney, false, Alias_Innkeeper.getreference() as actor)
BaboCLE08WindhelmDrinkGold.setvalue(0)
(Alias_Innkeeper.getreference() as actor).setfactionrank(BaboCLE08InnKeeperFaction, 2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
BaboChangeLocation08FraudWindhelmTabCount.setvalue(BaboChangeLocation08FraudWindhelmTabCount.getvalue() + BaboChangeLocation08FraudWindhelmTab.getvalue())
BaboChangeLocation08FraudWindhelmTab.setvalue(0)
setstage(255)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
BaboCLE08WindhelmDrinkGold.setvalue(BaboCLE08WindhelmDrinkGold.getvalue() + BaboCLE08DrinkGold.getvalue())
(BaboSexController as BaboSexControllerManager).ReputationDecrease(30, 10)
(Alias_Innkeeper.getreference() as actor).setfactionrank(BaboCLE08InnKeeperFaction, 1)
Setstage(250)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Faction Property BaboCLE08InnKeeperFaction Auto
GlobalVariable Property BaboCLE08DrinkGold Auto
GlobalVariable Property BaboCLE08WindhelmDrinkGold Auto
GlobalVariable Property BaboCLE08WindhelmDrinkDonotAccept Auto
GlobalVariable Property BaboChangeLocation08FraudWindhelmTab  Auto  

Quest Property BaboSexController  Auto  

MiscObject Property Gold001  Auto  

GlobalVariable Property BaboChangeLocation08FraudWindhelmTabCount  Auto  
