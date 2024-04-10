;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname BaboDiaTestTIF14 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
Dummy = PlayerRef.PlaceAtMe(zbfTorturePoleCustom03StdWood, 1, false, true)
Float CharacterAngle = PlayerRef.GetAngleZ()
Dummy.MoveTo(PlayerRef,DistanceInFront*Math.Sin(CharacterAngle),DistanceInFront*Math.Cos(CharacterAngle),DistanceZ)
Dummy.SetAngle(0,0,CharacterAngle)
Dummy.Enable()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Furniture Property zbfTorturePoleCustom03StdWood  Auto  
Actor Property PlayerRef Auto
ObjectReference Dummy
Float Property DistanceZ Auto
Float Property DistanceInFront Auto
