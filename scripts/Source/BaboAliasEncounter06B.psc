Scriptname BaboAliasEncounter06B extends ReferenceAlias  
; Crew boss alias only. Unload + stage gate. Stage >= 90 ignored.
BaboEncounter06BScript Property Encounter06B Auto

Event OnUnLoad()
	Encounter06B.CrewBossUnloaded()
EndEvent