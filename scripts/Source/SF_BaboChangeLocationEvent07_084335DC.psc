;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname SF_BaboChangeLocationEvent07_084335DC Extends Scene Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
(GuestRef01.getreference() as actor).addtofaction(SLAX_RapistFaction)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Faction Property SLAX_RapistFaction  Auto  

ReferenceAlias Property GuestRef01  Auto  

Faction Property sla_Arousal  Auto  
