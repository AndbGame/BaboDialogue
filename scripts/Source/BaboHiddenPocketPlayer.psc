Scriptname BaboHiddenPocketPlayer  extends ReferenceAlias

Referencealias property HiddenPocket Auto
Quest Property BaboSexController Auto
Actor player
;ObjectReference pocket
;SexLabFramework SexLab

Event OnInit()
	OnPlayerLoadGame()
EndEvent

Event OnPlayerLoadGame()
	player = GetReference() as Actor
	(HiddenPocket as BaboHiddenPocket).OnInit()
	;pocket = HiddenPocketRA.GetReference()
	;SexLab = Game.GetFormFromFile(0x00000d62, "SexLab.esm") as SexLabFramework
	;RegisterForModEvent("HookOrgasmEnd", "OnOrgasmEnd")
	RegisterForModEvent("Babo_CheckIfPlayerDetected", "OnCheckFinished")
EndEvent

Event OnCheckFinished(bool detected)
	if detected
		(BaboSexController as BaboSexControllerManager).HiddenPocketMessagebox(1)
	else
		(HiddenPocket.getreference()).Activate(player)
	endif
EndEvent