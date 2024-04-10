;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname BaboDiaGeneralGuards_TIF01 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
int Reputation = Baboreputation.getvalue() as int
int Follownum = BaboGuardFollowNum.getvalue() as int
Baboreputation.setvalue(Reputation - 100)
BaboGuardFollowNum.setvalue(FollowNum + 1)

Actor Follow01 = FollowGuard01.getReference() as actor
Actor Follow02 = FollowGuard02.getReference() as actor

If !Follow01
FollowGuard01.forcerefto(akspeaker)
elseif Follow01 && !Follow02
FollowGuard02.forcerefto(akspeaker)
else
;WTF
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property BaboReputation  Auto  

GlobalVariable Property BaboGuardFollowNum  Auto  

ReferenceAlias Property FollowGuard01  Auto  

ReferenceAlias Property FollowGuard02  Auto  
