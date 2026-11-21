;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 3
Scriptname SF_BaboEventAnimalCareMarkar_08F5C29B Extends Scene Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
if (OwnerRef.getreference() as actor).HasLos(PlayerRef)
(OwnerRef.getreference() as actor).setfactionrank(BaboEventAnimalCareOwnerFaction, 1)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
(Getowningquest() as BaboEventAnimalCareMarkarthScript).AddTitle()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property OwnerRef  Auto  

Actor Property PlayerRef  Auto  

Faction Property BaboEventAnimalCareOwnerFaction  Auto  
