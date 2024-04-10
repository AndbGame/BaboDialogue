;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname BaboDiaHirelingD08 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
Game.getplayer().removeitem(Gold001, DiscountedHirelingGold.getvalue() as int)
(Getowningquest() as BaboDialogueHirelingsQuest).SetFollower(akspeaker, True)
(Getowningquest() as BaboDialogueHirelingsQuest).SexlabApproachQuit()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property MercenaryRef  Auto  
ReferenceAlias Property WasMercenaryRef  Auto  


MiscObject Property Gold001  Auto  

GlobalVariable Property DiscountedHirelingGold Auto
