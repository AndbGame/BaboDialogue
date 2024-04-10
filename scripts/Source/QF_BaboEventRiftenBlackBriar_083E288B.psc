;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname QF_BaboEventRiftenBlackBriar_083E288B Extends Quest Hidden

;BEGIN ALIAS PROPERTY PlayerRef
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PlayerRef Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FollowerVictim02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FollowerVictim02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SibbiRef
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SibbiRef Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FollowerVictim03
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FollowerVictim03 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FollowerVictim01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FollowerVictim01 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
RegisterForSingleUpdateGameTime(48.0)
debug.messagebox("I have only two days.. I'd better be hurry or I will be in great peril on my safety...")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
debug.messagebox("The time has elapsed... I gotta be more careful of what is coming to me, or maybe I can talk a little sense into him and deal with this mess.")
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
