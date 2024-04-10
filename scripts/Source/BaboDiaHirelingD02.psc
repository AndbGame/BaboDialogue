;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname BaboDiaHirelingD02 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
;HasHirelingGV.Value = HasHirelingGV.value + 1
Game.getplayer().removeitem(Gold001, DiscountedHirelingGold.getvalue() as int)
(Getowningquest() as BaboDialogueHirelingsQuest).SetFollower(akspeaker, True)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

MiscObject Property Gold001  Auto  

GlobalVariable Property DiscountedHirelingGold  Auto  

globalvariable Property HasHirelingGV  Auto

Faction Property CurrentHireling  Auto  

Quest Property DialogueFollower  Auto  

Faction Property BaboCurrentHireling  Auto  
