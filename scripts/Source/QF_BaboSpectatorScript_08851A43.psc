;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 6
Scriptname QF_BaboSpectatorScript_08851A43 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Bystander06
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bystander06 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bystander02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bystander02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bystander03
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bystander03 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Opponent
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Opponent Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PlayerRef
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PlayerRef Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bystander04
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bystander04 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Friend01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Friend01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bystander01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bystander01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bystander05
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bystander05 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bystander07
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bystander07 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
;Default Scene
Self.BaboSpectatorScriptDefaultScene01.start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
self.BSBaboChangeLocationEvent07Scene01.start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;## Function Example##
;Function Brawl(Actor pTarget, Actor pTargetFriend = None)
;	BrawlKeyword.SendStoryEvent(None, pTarget, pTargetFriend)
;endFunction
;##############
Setstage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;End fo the spectators
BaboChangeLocationEvent01Scene01.Stop()
BSBaboEventMarkarthGuardScene01.Stop()
BSBaboChangeLocationEvent07Scene01.stop()

Alias_Bystander01.Clear()
Alias_Bystander02.Clear()
Alias_Bystander03.Clear()
Alias_Bystander04.Clear()
Alias_Bystander05.Clear()
Alias_Friend01.Clear()
Alias_Opponent.Clear()
Stop()
Reset()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
Self.BSBaboChangeLocationEvent01Scene01.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
Self.BSBaboEventMarkarthGuardScene01.Start()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property BaboChangeLocationEvent01Scene01  Auto  

Scene Property BSBaboEventMarkarthGuardScene01  Auto  

Scene Property BaboSpectatorScriptDefaultScene01  Auto  

Scene Property BSBaboChangeLocationEvent01Scene01  Auto  

Scene Property BSBaboChangeLocationEvent07Scene01  Auto  
