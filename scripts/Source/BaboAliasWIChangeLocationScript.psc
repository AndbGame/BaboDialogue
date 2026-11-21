Scriptname BaboAliasWIChangeLocationScript extends ReferenceAlias  


LocationAlias Property NewLocationRef  Auto  
Bool Property StopQuestOnLocationChange = false auto
{Default: false; If the player changes location, should this quest stop?}
Bool Property StageChangeOnLocationChange = false auto
Bool Property StopQuestOnLocationTimeChange = false auto
Bool Property StopQuestOnInterior = false auto
Bool Property StopQuestOnLocationTimeChangeOr = false auto
Bool Property StageChangeOnLocationChangewStageup = false auto
Bool Property StageChangeOnLocationChangewStagedown = false auto
Bool Property StageChangeOnLocationChangewStagemiddle = false auto
int property NextStage Auto
int property CurrentStageup Auto
int property NextStageup Auto
int property CurrentStagedown Auto
int property NextStagedown Auto

int property CurrentStagemiddledown Auto
int property CurrentStagemiddleup Auto
int property NextStagemiddle Auto
Actor Property PlayerRef Auto
int Property TimeA Auto
int Property TimeB Auto



Event OnLocationChange(Location akOldLoc, Location akNewLoc)
; --- andb: ported from crajjjj stability patch 6.1.1.3 (BaboAliasWIChangeLocationScript), reduced:
; guard the empty location alias only. In 6.51 an unresolved NewLocationRef.GetLocation() (alias
; not filled, or a reference-following alias whose ref stands in a location-less wilderness cell)
; makes every "left the location" test evaluate TRUE (None.IsChild() errors to False,
; None == akNewLoc is False) -> spurious setstage/Stop on the quests configured with these flags.
; The patch's `akNewLoc == None -> return` is deliberately NOT ported: with a valid targetLoc a
; None akNewLoc is well-defined in 6.51 (IsChild(None) = False -> "left" fires), and suppressing
; it would change the author's configured semantics for wilderness movement.
	Location targetLoc = NewLocationRef.GetLocation()
	if targetLoc == None
		return
	endif
	bool isChildLocation = targetLoc.IsChild(akNewLoc)
	bool isExactLocation = (targetLoc == akNewLoc)

	if StageChangeOnLocationChangewStageup
		If !isChildLocation && Getowningquest().getstage() >= CurrentStageup
			GetOwningQuest().setstage(NextStageup)
		EndIf
	EndIf
	if StageChangeOnLocationChangewStagedown
		If !isChildLocation && Getowningquest().getstage() <= CurrentStagedown
			GetOwningQuest().setstage(NextStagedown)
		EndIf
	EndIf
	if StageChangeOnLocationChangewStagemiddle
		If !isChildLocation && Getowningquest().getstage() >= CurrentStagemiddleup && Getowningquest().getstage() <= CurrentStagemiddledown
			GetOwningQuest().setstage(NextStagemiddle)
		EndIf
	EndIf
	if StageChangeOnLocationChange
		If !isExactLocation
			GetOwningQuest().setstage(NextStage)
		EndIf
	EndIf
	if StopQuestOnLocationChange
		If !isExactLocation
			GetOwningQuest().Stop()
			return
		EndIf
	EndIf
	if StopQuestOnLocationTimeChange
		If !isExactLocation
			if GetCurrentHourOfDay() > TimeA && GetCurrentHourOfDay() < TimeB
				GetOwningQuest().Stop()
				return
			endif
		EndIf
	EndIf
	if StopQuestOnLocationTimeChangeOr
		If !isExactLocation
			if GetCurrentHourOfDay() > TimeA || GetCurrentHourOfDay() < TimeB
				GetOwningQuest().Stop()
				return
			endif
		EndIf
	EndIf
	if StopQuestOnInterior
		If PlayerRef.isininterior()
			GetOwningQuest().Stop()
			return
		EndIf
	EndIf
EndEvent


float Function GetCurrentHourOfDay() 
 
	float Time = Utility.GetCurrentGameTime()
	Time -= Math.Floor(Time) ; Remove "previous in-game days passed" bit
	Time *= 24 ; Convert from fraction of a day to number of hours
	Return Time
 
EndFunction