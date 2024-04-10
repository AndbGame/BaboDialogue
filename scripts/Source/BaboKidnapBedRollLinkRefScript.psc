Scriptname BaboKidnapBedRollLinkRefScript extends ReferenceAlias  

Quest Property BaboKidnapEvent Auto

Event Onactivate(ObjectReference akActionRef)
	(BaboKidnapEvent as BaboKidnapEvenScript).BedRollSleep()
EndEvent