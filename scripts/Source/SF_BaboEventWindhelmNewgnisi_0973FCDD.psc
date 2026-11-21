;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname SF_BaboEventWindhelmNewgnisi_0973FCDD Extends Scene Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
Game.getplayer().removefromfaction(BaboPlayerSurrenderFaction)
GetOwningQuest().SetStage(50)
stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Faction Property BaboPlayerSurrenderFaction  Auto  
