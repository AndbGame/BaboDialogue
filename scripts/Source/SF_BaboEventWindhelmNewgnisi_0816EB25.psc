;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname SF_BaboEventWindhelmNewgnisi_0816EB25 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
int random = Utility.RandomInt(0, 2)
;0 - Proceed 1 - Slavemarket 2 - sell to noble
BaboSceneTriggerGlobal.setvalue(random)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
if BaboSceneTriggerGlobal.getvalue() == 0
GetOwningQuest().SetStage(50)
;(Getowningquest() as BaboEventNewgnisisMasterScript).SucceedingBoss(ArgonianH03)
elseif BaboSceneTriggerGlobal.getvalue() == 1
(Getowningquest() as BaboEventNewgnisisMasterScript).DraggingtoSexMarketWithPossibility()
elseif BaboSceneTriggerGlobal.getvalue() == 2
(Getowningquest() as BaboEventNewgnisisMasterScript).GotoKidnapEvent()
endif
Game.getplayer().removefromfaction(BaboPlayerSurrenderFaction)
stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property BaboSceneTriggerGlobal  Auto  

ReferenceAlias Property ArgonianH03  Auto  

Faction Property BaboPlayerSurrenderFaction  Auto  
