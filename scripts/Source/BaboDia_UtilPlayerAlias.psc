Scriptname BaboDia_UtilPlayerAlias extends ReferenceAlias
{Player alias on BaboDialogueUtil. Refreshes nudity score on any equip change.}

; Debounce: many mods strip several slots in one frame.
float Property NudityRefreshDelay = 0.3 Auto

Event OnObjectEquipped(Form akBaseObject, ObjectReference akReference)
	RequestNudityRefresh()
EndEvent

Event OnObjectUnequipped(Form akBaseObject, ObjectReference akReference)
	RequestNudityRefresh()
EndEvent

Function RequestNudityRefresh()
	UnregisterForUpdate()
	RegisterForSingleUpdate(NudityRefreshDelay)
EndFunction

Event OnUpdate()
	Quest q = GetOwningQuest()
	if q
		(q as BaboDia_Util).UpdatePlayerNudityValue()
	endif
EndEvent

; Reload the JSON caches on every save load so edits apply to existing saves
Event OnPlayerLoadGame()
	(GetOwningQuest() as BaboDia_Util).ReloadNudeKeywordCache()
EndEvent
