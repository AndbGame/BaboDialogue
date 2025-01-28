Scriptname BaboDiaSnareRopeTrap extends ObjectReference  


bool property StartOpen = True Auto
Keyword Property ActorTypeNPC auto
bool property OnlyPC = true Auto
{Only PC will get stuck}
perk property LightFoot auto
bool property checkForLightFootPerk = false Auto
bool property QTE = false Auto
{default == true}
globalVariable property LightFootTriggerPercent auto
globalVariable property BaboKidnapPlayerGotTrappedGlobal auto
globalVariable property BaboPlayerDetected auto
Quest Property BaboSexController Auto
Quest Property BaboKidnapEvent Auto
actor property playerRef Auto
actor property actorref auto hidden
int property BaboEvents Auto
{0: None, 1: Kidnap Event}

;ReferenceAlias property BaboTrapMarker Auto

;idle property SnareRopeUndoSelfFail auto
;idle property SnareRopeUndoSelfSuccess auto
;idle property SnareRopeUndoSelfLoop auto
;idle property SnareRopeUndoSelfLoop_Done auto
;idle property SnareRopeUndoSelfStart auto
;idle property SnareRopeStruggle auto
;idle property SnareRopeActivateLoop auto
;idle property SnareRopeActivateEnter auto
idle property StaggerStart auto
idle property NPCGetUp auto
Bool Triggered

Event onReset()
	self.resettrap()
endEvent

event onLoad()
;Debug.notification("Snare Rope  Trap Loaded")
	if StartOpen
		;StartOpen = false;To prevent it from being triggered whenever it is loaded
		playAnimation("Reset01")
		goToState("Open")
	endif
endEvent

Function GetReady()
	playAnimation("TNTRReset")
	goToState("Open")
EndFunction

Function ManageState(String Statename)
	goToState(Statename)
endfunction

auto state Closed
	Event OnBeginState()
	endEvent
	
	event OnTriggerEnter(objectReference TriggerRef)
	endEvent
	
	event OnActivate(objectReference TriggerRef)
		playAnimation("GoStandby")
		resettrap()
		goToState("Open")
	endEvent

endState

State OpenStandby;To prevent something from happening
	Event OnBeginState()
		
	endEvent
	event OnTriggerEnter(objectReference TriggerRef)
	endevent
	event OnActivate(objectReference TriggerRef)
	endEvent
	
	Function QTEFail()
		Debug.sendanimationevent(actorref, "SnareRopeUndoSelfFail")
		playAnimationAndWait("TransB02","TransB03")
	EndFunction
	
	Function QTESuccess()
		Debug.sendanimationevent(actorref, "SnareRopeUndoSelfFail")
		playAnimationAndWait("TransB02","TransB03")
	EndFunction
EndState

state Open
	Event OnBeginState()
	endEvent

	event OnTriggerEnter(objectReference TriggerRef)
	actorref = TriggerRef as actor
		if !TriggerRef.haskeyword(ActorTypeNPC)
			return
		endif
		if OnlyPC && !(actorref == playerref)
			return
		endif
	
		if checkPerks(TriggerRef) && actorref
 			;debug.notification(self + " has been entered by " + actorref.getactorbase().getname())
			GoToState("Busy")
			BaboKidnapPlayerGotTrappedGlobal.setvalue(1)
			(BaboSexController as BaboSexControllerManager).TrapSetCoordinates(actorref, self)
			playAnimation("TriggerA01")
			Debug.sendanimationevent(actorref, "SnareRopeActivateEnter")
			;actorref.playidle(SnareRopeActivateEnter)
			WaitForAnimationEvent("TransA01")
			if BaboEvents == 1
				if actorref.isincombat()
					(BaboKidnapEvent as BaboKidnapEvenScript).GetTrapped(true)
					GoToState("OpenStandby")
				else
					GoToState("Hooked")
				endif
			else
				GoToState("Hooked")
			endif
		endif
	endEvent
	
	event OnActivate(objectReference TriggerRef)
		if BaboEvents == 1
		else
			GoToState("Busy")
			playAnimationAndWait("TriggerDisarm","TransTrapDisarm")
			goToState("ClosedDisarmed")
		endif
	endEvent
endState

state ClosedDisarmed
	Event OnBeginState()		
	endEvent
	
	event OnTriggerEnter(objectReference TriggerRef)
	endEvent
	
	event OnActivate(objectReference TriggerRef)
		playAnimationAndWait("TriggerRearm","TransRearm")
		resettrap()
		goToState("Open")
	endEvent
endState

State Hooked
	Event OnBeginState()
		;actorref.playidle(SnareRopeActivateLoop);It's not sequence animation

		Utility.wait(3.0)
		if BaboPlayerDetected.getvalue() == 1
			GoToState("OpenStandby")
			return
		endif
		Debug.sendanimationevent(actorref, "SnareRopeStruggle")
		;actorref.playidle(SnareRopeStruggle)
		playAnimationAndWait("TriggerD01","TransStruggle")
		if BaboPlayerDetected.getvalue() == 1;Double Check
			GoToState("OpenStandby")
			return
		endif
		;playAnimationAndWait("TransA02","TransA03");if actor is killed.
		Debug.sendanimationevent(actorref, "SnareRopeUndoSelfStart")
		;actorref.playidle(SnareRopeUndoSelfStart)
		playAnimationAndWait("TriggerB01","TransB01")
		Debug.sendanimationevent(actorref, "SnareRopeUndoSelfLoop")
		;actorref.playidle(SnareRopeUndoSelfLoop)
		int randomi
		if QTE && (actorref == playerref);This is where QTE is placed
			(BaboSexController as BaboSexControllerManager).StateChange("BaboKidnapQTETextState")
		else
			randomi = Utility.randomint(1, 3)
			Utility.wait(5.0)
			if randomi == 1
				Debug.sendanimationevent(actorref, "SnareRopeUndoSelfSuccess")
				;actorref.playidle(SnareRopeUndoSelfSuccess)
				playAnimationAndWait("TriggerC01","TransC01")
				goToState("Escaped")
			else
				Debug.sendanimationevent(actorref, "SnareRopeUndoSelfFail")
				;actorref.playidle(SnareRopeUndoSelfFail)
				playAnimationAndWait("TransB02","TransB03");Back in Loop
				GoToState("UntieFail")
			endif
		endif
		
	endEvent
	
	event OnTriggerEnter(objectReference TriggerRef)
	endEvent
	
	event OnActivate(objectReference TriggerRef)
	endEvent
EndState

State Busy	;Dummy state to prevent interaction while animating
	Event OnBeginState()
; 		debug.Trace(self + " has entered state Open")
	endEvent
EndState

State UntieFail
	Event OnBeginState()
		Utility.wait(3.0)
		GoToState("Hooked")
	EndEvent
	event OnTriggerEnter(objectReference TriggerRef)
	endEvent
	
	event OnActivate(objectReference TriggerRef)
	endEvent

EndState

State Escaped
	Event OnBeginState()
		;(BaboSexController as BaboSexControllerManager).ClearHookedActor(itrap)
		;Utility.wait(2.0)
		if BaboEvents == 1
			(BaboKidnapEvent as BaboKidnapEvenScript).GetTrapped(false)
		endif
		(BaboSexController as BaboSexControllerManager).TrapResetCoordinates(actorref, true)
		;actorref.playidle(StaggerStart)
		;actorref.playidle(NPCGetUp)
	endEvent
	
	event OnTriggerEnter(objectReference TriggerRef)
	endEvent
	
	event OnActivate(objectReference TriggerRef)
		;You are not supposed to activate it.
		if BaboEvents == 1
			;None
		Else
			resettrap()
			goToState("Open")
		endif
	endEvent
EndState

State Disarmed
	Event OnBeginState()
	endEvent
	
	event OnTriggerEnter(objectReference TriggerRef)
	endEvent
	
	event OnActivate(objectReference TriggerRef)
		playAnimation("TransRearm")
		playAnimation("Reset01")
		goToState("Open")
	endEvent
EndState

State Killed
	Event OnBeginState()
		;Debug.notification("Killed State")
		playAnimationAndWait("TriggerKillEnd","TransTrapKill")
		goToState("Closed")
	endEvent
	
	event OnTriggerEnter(objectReference TriggerRef)
	endEvent
	
	event OnActivate(objectReference TriggerRef)
	endEvent
EndState
event OnTriggerEnter(objectReference TriggerRef)
endEvent
	
event OnActivate(objectReference TriggerRef)
endEvent

Function resettrap()
	;(BaboSexController as BaboSexControllerManager).ResetCoordinates(actorref)
	playAnimation("GoStandby")
	playAnimation("Reset01")
endfunction

Bool function checkPerks(objectReference triggerRef)
	if checkForLightFootPerk
		if  (triggerRef as actor).hasPerk(LightFoot)
			if utility.randomFloat(0.0,100.00) <= LightFootTriggerPercent.getValue()
				return False
			else
				return True
			endif
		Else
			Return True
		EndIf
	else
		return True
	endif
endFunction

Function QTEFail()
	Debug.sendanimationevent(actorref, "SnareRopeUndoSelfFail")
	;actorref.playidle(SnareRopeUndoSelfFail)
	playAnimationAndWait("TransB02","TransB03")

	Utility.wait(3.0)
	Debug.sendanimationevent(actorref, "SnareRopeStruggle")
	;actorref.playidle(SnareRopeStruggle)
	playAnimationAndWait("TriggerD01","TransStruggle")

	Debug.sendanimationevent(actorref, "SnareRopeActivateLoopInstant")
	;Kidnappers coming
EndFunction

Function QTESuccess()
	Debug.sendanimationevent(actorref, "SnareRopeUndoSelfSuccess")
	;actorref.playidle(SnareRopeUndoSelfSuccess)
	playAnimationAndWait("TriggerC01","TransC01")
	goToState("Escaped")
EndFunction

