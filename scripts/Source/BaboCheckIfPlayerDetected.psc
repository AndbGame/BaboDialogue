Scriptname BaboCheckIfPlayerDetected extends Quest  

ReferenceAlias Property NPCRA Auto

Event OnInit()
; --- andb: ported from crajjjj stability patch 6.1.1.3 (BaboCheckIfPlayerDetected) quest-locator stops cleanly on an empty alias
	if NPCRA == None
		Stop()
		return
	endif
	Actor npc = NPCRA.GetReference() as Actor
	int handle = ModEvent.Create("Babo_CheckIfPlayerDetected")
	if handle
		ModEvent.PushBool(handle, npc != none)
		ModEvent.Send(handle)
	endif
	Stop()
EndEvent
