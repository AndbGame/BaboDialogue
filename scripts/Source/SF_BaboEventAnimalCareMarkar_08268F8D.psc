;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname SF_BaboEventAnimalCareMarkar_08268F8D Extends Scene Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
if (Getowningquest() as BaboEventAnimalCareMarkarthScript).PetKillMotion(Alias_OwnerRef.getreference() as actor)
GetOwningQuest().SetStage(75)
else
GetOwningQuest().SetStage(85)
endif
stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_OwnerRef  Auto  
