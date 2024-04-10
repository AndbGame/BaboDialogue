;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 3
Scriptname QF_BaboSpectatorWOEnemyScrip_08D1336B Extends Quest Hidden

;BEGIN ALIAS PROPERTY Bystander03
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bystander03 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ObjectiveActor
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ObjectiveActor Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bystander02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bystander02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bystander01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bystander01 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
BSWOBaboEventAnimalCareScene01.start()
int RB = 0
if Alias_Bystander01
RB += 1
endif
if Alias_Bystander02
RB += 1
endif
if Alias_Bystander03
RB += 1
endif
(BaboSexController as BaboSexControllerManager).ReputationBitchCreature(RB)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property BSWOBaboEventAnimalCareScene01  Auto  

Quest Property BaboSexController  Auto  
