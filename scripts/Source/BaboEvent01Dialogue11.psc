;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname BaboEvent01Dialogue11 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
BaboEventQuest.Unequipzazitem()
(GetowningQuest() as BaboEventWhiterunOrcVisitorsScript).ActorinDefaultPlace()
(GetowningQuest() as BaboEventWhiterunOrcVisitorsScript).PlayerinDefaultPlace()
GetowningQuest().Setstage(67)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

BaboEventWhiterunOrcVisitorsScript Property BaboEventQuest Auto
