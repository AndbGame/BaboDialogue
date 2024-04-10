Scriptname BaboDiawiplayerscript extends ReferenceAlias  
{Script to attach to Player alias in BaboWI quests}

Bool Property StopQuestOnLocationChange = false auto
{Default: false; If the player changes location, should this quest stop?}

Bool Property StopQuestOnLocationChangeInterior = false auto
{Default: false; If the player changes location and it was interior, should this quest stop?}

Bool Property StopQuestOntime = true auto
{Default: truie; If the time passes, should this quest stop?}

float Property StopQuestInTime = 24.0 auto

Event oninit()
	RegisterForSingleUpdateGameTime(StopQuestInTime)
EndEvent

Event OnUpdateGameTime()
	if StopQuestOntime
		GetOwningQuest().Stop()
	endif
EndEvent

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
	if StopQuestOnLocationChange
		If (NewLocationRef.getlocation() == akNewLoc)
		Else
			GetOwningQuest().Stop()
		EndIf
	EndIf

	if StopQuestOnLocationChangeInterior
		If PlayerRef.isininterior()
			GetOwningQuest().Stop()
		EndIf
	EndIf
EndEvent

LocationAlias Property NewLocationRef  Auto  
Actor Property PlayerRef Auto