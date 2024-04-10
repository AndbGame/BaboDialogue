;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname BaboEvent03Dialogue17 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
BMQuest.PlayerActor.additem(FoodWineBottle02, 1)
GetOwningQuest().SetStage(10)
BMQuest.ForAlias(akspeaker, InnKeepRef)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Potion Property FoodWineBottle02 Auto
BaboEventNewgnisisMasterScript Property BMQuest Auto
Referencealias Property InnkeepRef Auto
