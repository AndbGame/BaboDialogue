;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname BaboDiaTestTIF20 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
if ActorRef04
BDQuest.RapeCustom(PlayerRef, ActorRef01, ActorRef02, ActorRef03, ActorRef04, MF, CF, Aggressive, False, None, None, true)
elseif ActorRef03
BDQuest.RapeCustom(PlayerRef, ActorRef01, ActorRef02, ActorRef03, None, MF, CF, Aggressive, False, None, None, true)
elseif ActorRef02
BDQuest.RapeCustom(PlayerRef, ActorRef01, ActorRef02, None, None, MF, CF, Aggressive, False, None, None, true)
else
BDQuest.RapeCustom(PlayerRef, ActorRef01, None, None, None, MF, CF, Aggressive, False, None, None, true)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

BaboDiaQuest Property BDQuest Auto
ReferenceAlias Property ActorRef01  Auto  
ReferenceAlias Property ActorRef02  Auto  
ReferenceAlias Property ActorRef03  Auto  
ReferenceAlias Property ActorRef04  Auto  
ReferenceAlias Property PlayerRef  Auto  
String Property MF Auto
String Property CF Auto
String Property Aggressive Auto

