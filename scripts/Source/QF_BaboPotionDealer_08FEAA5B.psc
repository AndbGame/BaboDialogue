;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 7
Scriptname QF_BaboPotionDealer_08FEAA5B Extends Quest Hidden

;BEGIN ALIAS PROPERTY CreatureRef04
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CreatureRef04 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Coman
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Coman Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CreatureRef01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CreatureRef01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CreatureRef02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CreatureRef02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CreatureRef03
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CreatureRef03 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
Alias_Coman.ForceRefto(BaboPotionDealerXmarkerRef.PlaceActorAtMe(BaboAlchemist_Ivarsteadwoodelf))
Alias_Coman.getactorreference().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;Waiting
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
;Player got raped by a troll
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
Alias_Coman.getactorreference().addtofaction(BaboPotionDealerFaction)
Game.getplayer().additem(BaboTrollEssence, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
Alias_Coman.getactorreference().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
(BaboPotionDealer_EnterTriggerRef as BaboDefaultOnEnterTriggerScript).ReArmTrigger()
setstage(5)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
Alias_Coman.getactorreference().deletewhenable()
Alias_Coman.clear()
Alias_CreatureRef01.clear()
Alias_CreatureRef02.clear()
Alias_CreatureRef03.clear()
Alias_CreatureRef04.clear()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property BaboPotionDealerXmarkerRef  Auto  

ActorBase Property BaboAlchemist_Ivarsteadwoodelf  Auto  

ObjectReference Property BaboPotionDealer_EnterTriggerRef  Auto  

Faction Property BaboPotionDealerFaction  Auto  

Potion Property BaboTrollEssence  Auto  
