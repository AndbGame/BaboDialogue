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
	if StageChangeOnLocationChangewStageup
		If !(NewLocationRef.getlocation().Ischild(akNewLoc)) && Getowningquest().getstage() >= CurrentStageup
			GetOwningQuest().setstage(NextStageup)
		EndIf
	EndIf
	if StageChangeOnLocationChangewStagedown
		If !(NewLocationRef.getlocation().Ischild(akNewLoc)) && Getowningquest().getstage() <= CurrentStagedown
			GetOwningQuest().setstage(NextStagedown)
		EndIf
	EndIf
	if StageChangeOnLocationChangewStagemiddle
		If !(NewLocationRef.getlocation().Ischild(akNewLoc)) && Getowningquest().getstage() >= CurrentStagemiddleup && Getowningquest().getstage() <= CurrentStagemiddledown
			GetOwningQuest().setstage(NextStagemiddle)
		EndIf
	EndIf
	if StageChangeOnLocationChange
		If !(NewLocationRef.getlocation() == akNewLoc)
			GetOwningQuest().setstage(NextStage)
		EndIf
	EndIf
	if StopQuestOnLocationChange
		If !(NewLocationRef.getlocation() == akNewLoc)
			GetOwningQuest().Stop()
			return
		EndIf
	EndIf
	if StopQuestOnLocationTimeChange
		If !(NewLocationRef.getlocation() == akNewLoc)
			if GetCurrentHourOfDay() > TimeA && GetCurrentHourOfDay() < TimeB
				GetOwningQuest().Stop()
				return
			endif
		EndIf
	EndIf
	if StopQuestOnLocationTimeChangeOr
		If !(NewLocationRef.getlocation() == akNewLoc)
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