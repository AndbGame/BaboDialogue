Scriptname BaboDiaRestraintPoleTrap extends ObjectReference  


Event onReset()
	self.resettrap()
endEvent

Function resettrap()
	;playAnimation("GoStandby")
	;Utility.wait(1.0)
	;playAnimation("Reset01")
	PlayAnimation("TNTRReset")
endfunction

Function RideInstant(actor akactor)
	Debug.SendanimationEvent(akactor, "RestraintPole_Fail_Loop")
	playAnimation("Trigger_FailInstant")
EndFunction

Function RideInsertionInstant(actor akactor)
	Debug.SendanimationEvent(akactor, "RestraintPole_Insertion_Loop")
	playAnimation("Trigger_FailInsertionInstant")
EndFunction

