Scriptname BaboXMarkerMoverGeneric extends ReferenceAlias  

Actor Property PlayerRef  Auto 
ReferenceAlias Property PlayerVoiceRef  Auto
ReferenceAlias Property PlayerVoiceStandbyRef  Auto

Function PlayerVoiceMovein()
	PlayerVoiceRef.GetReference().MoveTo(PlayerRef)
EndFunction

Function PlayerVoiceMoveOut()
	PlayerVoiceRef.GetReference().MoveTo(PlayerVoiceStandbyRef.GetReference())
EndFunction