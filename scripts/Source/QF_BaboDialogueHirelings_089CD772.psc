;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 7
Scriptname QF_BaboDialogueHirelings_089CD772 Extends Quest Hidden

;BEGIN ALIAS PROPERTY MercenaryAnimal
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MercenaryAnimal Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PlayerAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PlayerAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FollowerRef01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FollowerRef01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MercenaryRef
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MercenaryRef Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FollowerRef03
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FollowerRef03 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FollowerRef02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FollowerRef02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WasMercenaryRef
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WasMercenaryRef Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;Struggle Animation Start
(BaboSexController as BaboSexControllerManager).SLHHActivate(Alias_MercenaryRef.getreference() as actor, None)
Utility.wait(60.0)
setstage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
setobjectivecompleted(15)
setstage(12)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
setobjectivedisplayed(16)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;Hired Mercenary
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
setobjectivedisplayed(15)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN AUTOCAST TYPE BaboDialogueHirelingsQuest
Quest __temp = self as Quest
BaboDialogueHirelingsQuest kmyQuest = __temp as BaboDialogueHirelingsQuest
;END AUTOCAST
;BEGIN CODE
kmyQuest.DismissFollower(4)
Setstage(0)
Reset()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
setobjectivecompleted(16)
setstage(12)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property BaboSexController  Auto  
