Scriptname BaboCheckIfPlayerDetected extends Quest  

ReferenceAlias Property NPCRA Auto

Event OnInit()
	Actor npc = NPCRA.GetReference() as Actor
	int handle = ModEvent.Create("Babo_CheckIfPlayerDetected")
	if handle
		ModEvent.PushBool(handle, npc != none)
		ModEvent.Send(handle)
	endif
	Stop()
EndEvent
