Scriptname BaboChainUpsidePoleScript extends ObjectReference  

;bool property StartOpen = True Auto
Actor Property TActor Auto Hidden
{It should be filled before the code fires.}
Bool Property Debuggingmode = false auto

;Standby - do nothing
;Static - Ready to fire
;Chainup - Chain up / it goes to ChainupLoop automatically
;ChainupLoop - Looping
;ChainupLoopShake - She moves abruptly

Function ResetClutter()
	playAnimation("StartOpen");it goes to static
	Gotostate("")
EndFunction

Function Flutter()
;Null
EndFunction

int Function ActivateClutter()
	Gotostate("Standby")
	return 1
EndFunction

state Standby
	Event OnBeginState()
		playAnimation("Standby"); It goes to Static
		TActor.moveto(self.GetNthLinkedRef(0))
		TActor.setvehicle(self.GetNthLinkedRef(0))
		;TActor.moveto(Self)
		Debug.sendanimationevent(Tactor, "BaboChainPoleUpBeforeEnter")
		if Debuggingmode
			Utility.wait(4.0)
			ActivateClutter()
		endif
	endEvent
	int Function ActivateClutter()
		playAnimation("Trigger01"); It goes to Chainup
		;playAnimationAndWait("Trigger01","Trans01")
		Debug.sendanimationevent(Tactor, "BaboChainPoleUpEnter")
		WaitForAnimationEvent("Trans01")
		Debug.sendanimationevent(Tactor, "BaboChainPoleUpLoop")
		gotostate("Up")
		return 2
	EndFunction

endState

state Up
	Event OnBeginState()
		if Debuggingmode
			Utility.wait(1.0)
			Flutter()
		endif
	EndEvent
	
	Function Flutter()
		playAnimation("TriggerShake")
		Debug.sendanimationevent(Tactor, "BaboChainPoleUpLoopShake")
		WaitForAnimationEvent("Trans03")
		Debug.sendanimationevent(Tactor, "BaboChainPoleUpEnterLoop")
		if Debuggingmode
			Utility.wait(4.0)
			ActivateClutter()
		endif
	EndFunction
	int Function ActivateClutter()
		playAnimation("Trigger02"); It goes to Chaindown
		Debug.sendanimationevent(Tactor, "BaboChainPoleDownEnter")
		WaitForAnimationEvent("Trans02")
		Debug.sendanimationevent(Tactor, "BaboChainPoleDownEnterLoop")
		gotostate("Down")
		return 3
	EndFunction
endState


State Down
	Event OnBeginState()
		if Debuggingmode
			Utility.wait(4.0)
			ResetClutter()
		endif
	EndEvent
	Function ResetClutter()
		playAnimation("Reset01");it goes to static
		Gotostate("")
	EndFunction
EndState