;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 7
Scriptname SF_BaboBadEndThiefScene_09F99A02 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
GetOwningQuest().setstage(60)
Xmarkermover.PlayerVoiceMoveOut()
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
Xmarkermover.PlayerVoiceMoveOut()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
(Getowningquest() as BaboBadEndQuest).UnregisterUpdate()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
If game.getplayer().getitemcount(gold001) >= 100
Game.getplayer().removeitem(gold001, 1500, false, Alias_Raper.getactorreference())
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
Xmarkermover.PlayerVoiceMovein()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).EquipGag(Game.getplayer(), false)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

MiscObject Property Gold001  Auto  

ReferenceAlias Property Alias_Raper  Auto  
BaboXMarkerMoverGeneric Property XmarkerMover Auto

Keyword Property BaboRestraintsWoodenGag  Auto  

Quest Property BaboSexController  Auto  
