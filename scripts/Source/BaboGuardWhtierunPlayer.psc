Scriptname BaboGuardWhtierunPlayer extends ReferenceAlias  
{ReferenceAlias}

Event OnSit(ObjectReference akFurniture)
;	debug.MessageBox("Player sat down.")
 
	(GetOwningQuest() as WITavernScript).PlayerSatDown()

EndEvent

 Event OnGetUp(ObjectReference akFurniture)
;	debug.MessageBox("Player got up.")
 

EndEvent


Event OnLocationChange(Location akOldLoc, Location akNewLoc)
		(GetOwningQuest() as WITavernScript).PlayerCHangedLocation()
	
EndEvent