Scriptname BaboRieklingBedRollLinkRefScript extends ReferenceAlias  

Quest Property BaboEventRieklingThirsk Auto
Actor Property PlayerRef Auto

Event Onactivate(ObjectReference akActionRef)
	if akActionRef == playerRef
		(BaboEventRieklingThirsk as BaboEventRiekling).BedRollSleep()
	endif
EndEvent