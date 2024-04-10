Scriptname BaboAllureCapturingMagic extends ActiveMagicEffect  


Int TrapStage
Quest Property AllureQuest  Auto
Actor Property Victim Auto
Actor Property Raper Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)

Victim = akTarget
Raper = akCaster

If (Victim == Game.Getplayer())
	If (TrapStage == 0)
		TrapStage = 1
		debug.messagebox ("TrapStage becomes 1")
	elseif (TrapStage == 1)
		Game.ForceThirdPerson()
		Game.DisablePlayerControls(abmenu =true)
		Victim.SetUnconscious(true)
		Utility.wait(3.0)
		ClearTrapVariables()
		AllureQuest.setStage(15)
	EndIf
EndIf

EndEvent
	
Function ClearTrapVariables()

	TrapStage = 0

EndFunction