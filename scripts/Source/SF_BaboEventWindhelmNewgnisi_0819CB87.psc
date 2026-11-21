;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname SF_BaboEventWindhelmNewgnisi_0819CB87 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
if BaboSceneTriggerGlobal.getvalue() == 0
(Getowningquest() as BaboEventNewgnisisMasterScript).DraggingtoSexMarketWithPossibility()
elseif BaboSceneTriggerGlobal.getvalue() == 1
(Getowningquest() as BaboEventNewgnisisMasterScript).GotoKidnapEvent()
endif
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
int random = Utility.RandomInt(0, 1)
;0 - Slavemarket 1 - sell to noble
BaboSceneTriggerGlobal.setvalue(random)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property BaboSceneTriggerGlobal  Auto  
