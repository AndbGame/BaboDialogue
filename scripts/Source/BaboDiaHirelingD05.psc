;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname BaboDiaHirelingD05 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
(Getowningquest() as BaboDialogueHirelingsQuest).DismissFollower(0)
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
Faction Property PotentialHireling  Auto  
