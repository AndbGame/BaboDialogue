Scriptname BaboTestTeleportButtonScript extends ObjectReference  

Actor Property PlayerRef Auto
ObjectReference Property TeleportMarker Auto

event onActivate(objectReference akActivator)
	PlayerRef.moveto(TeleportMarker)
endevent