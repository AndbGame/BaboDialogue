Scriptname BaboHangingControlScript extends Quest  
;Experimental
Actor AttachedActor
Actor DummyPlayerActor
Actor Property PlayerRef Auto
Actorbase Property Player Auto
string HeadAttachNode ="NPC Head [Head]"
string NeckAttachNode = "npc neck [neck]"
string RopeAttachNode = "Vert05"
string RopeAttachNode2 = "Vert06"
string DummyAttachNode="AttachDummy"


float starthealth
float health

bool sprung
bool isFemale
bool isGagged
bool playerVictim
bool autoplay


string lh ="NPC L Hand [LHnd]"
string rh ="NPC R Hand [RHnd]"
string rf ="NPC R Foot [Rft ]"
string lf ="NPC L Foot [Lft ]"

float dummyX
float dummyY
float dummyZ

float NeckX
float NeckY
float NeckZ

int humanSound
int deviceSound


;Functional Proprties/////////////////////////////////////////////////////////////////////////
objectreference property rope Auto
objectreference property BaboHangingDummyRef Auto

;optional Functionalitys///////////////////////////////////////////////////////////////////////
Bool property automaticForPlayer Auto
Bool property automaticForNPC Auto
Bool property TieFeet Auto
Bool property removeCuffsOnRelease Auto
Bool property onlyRopeShootdown Auto
Bool nonLethal
float property timerPhase1 Auto
float property timerPhase2 auto
float property damageModifierPlayer auto
float property damageModifierNPC auto
float property deathCamDuration auto

;cosmetic Options/////////////////////////////////////////////////////////////////////////////
armor property collar Auto
armor property cuffs Auto

;sound Options/////////////////////////////////////////////////////////////////////////////////////
Sound Property soundFemaleRecovery  auto
Sound Property soundMaleRecovery  auto
Sound Property soundFemaleWaiting  auto
Sound Property soundMaleWaiting  auto
Sound Property soundSlowCreak  auto
Sound Property soundFastCreak  auto
Sound Property soundTrapdoor  auto
sound property soundFemaleChoking auto
sound property soundMaleChoking auto
zbfBondageShell Property zbf  Auto

Function VerifyActor(actor akactor = none)
	if akactor
		AttachedActor = akactor
	else
		AttachedActor = PlayerRef
	endif
EndFunction

Function VerifyRope(ObjectReference akobject)
	Rope = akobject
EndFunction

Function VerifyAutoplay(Bool BAutoplay)
	Autoplay = BAutoplay
EndFunction

Function VerifyLethal(Bool BLethal)
	nonLethal = BLethal
EndFunction

Function GallowStateStage(int StateStage)
if StateStage == 1
	GotoState("standby")
elseif StateStage == 2
	GotoState("waiting")
elseif StateStage == 3
	GotoState("struggling")
elseif StateStage == 4
	GotoState("dead")
else
	GotoState("")
endif
EndFunction

Function EquipCollar(actor akactor)
	akactor.EquipItem(collar, false, true)
	akactor.EquipItem(cuffs, false, true)
EndFunction

Function NextStage(int StageNum)
EndFunction

Function OnBeginFunction()

EndFunction

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack,  bool abBashAttack, bool abHitBlocked)
EndEvent


State standby

Event OnBeginState()
	;Debug.notification("StandBy")
	if AttachedActor == PlayerRef
		AttachedActor = rope.PlaceActorAtMe(Player)
		AttachedActor.removeallitems()
		EquipCollar(AttachedActor)
	Endif
	Rope.ApplyHavokImpulse(1.0, 0.0, 0.0, 10.0)
	Utility.wait(2.0)
	AttachedActor.setunconscious(true)
	;AttachedActor.PushActorAway(AttachedActor, 0.1);WIP. One of the nemesis mods altered this one. Need another way to make an actor enter ragdoll state.
	Debug.SendAnimationEvent(AttachedActor, "Ragdoll")
	AttachedActor.SetActorValue("Paralysis", 1)
	AttachActorBone(rope, NeckAttachNode)
	if nonLethal
		AttachedActor.killessential(AttachedActor)
	endif
	;registerForUpdate(0.2)
	GotoState("dead")	
EndEvent

Function OnBeginFunction()
	Debug.notification("StandBy")
	CleanupConstraints()

	if AttachedActor != PlayerRef
		attachedActor.setrestrained(true)
		playerVictim = false
	Else
		playerVictim = true
	EndIf

	;if !autoplay
	;	if playerVictim && automaticForPlayer
	;		autoplay=true
	;	EndIf
	;	if !playerVictim && automaticForNPC
	;		autoplay=true
	;	EndIf
	;EndIf

	BaboHangingDummyRef.enable()
	utility.wait(0.1)
	BaboHangingDummyRef.MoveToNode(AttachedActor, NeckAttachNode)
	utility.wait(0.1)
	neckX=BaboHangingDummyRef.GetPositionX()
	neckY=BaboHangingDummyRef.GetPositionY()
	neckZ=BaboHangingDummyRef.GetPositionZ()

	BaboHangingDummyRef.TranslateTo(dummyX, dummyY, dummyZ, 0, 0, 0, 300)
	utility.wait(0.1)
	DummyAttach()
	utility.wait(0.1)
	BaboHangingDummyRef.splineTranslateTo(dummyX, dummyY, neckZ+(-18), 0, 0, 0, 20, 20)

	starthealth = AttachedActor.GetBaseActorValue("health")
	;EquipCollar(AttachedActor)
	isFemale = attachedActor.GetLeveledActorBase().GetSex()
	isGagged = attachedActor.WornHaskeyword(zbf.zbfEffectGagSound)

	if !isGagged
		if IsFemale
			humansound = soundFemaleWaiting.play(attachedActor)
		else
			humansound = soundMaleWaiting.play(attachedActor)
		EndIf
	EndIf
	
	If autoplay
		GotoState("waiting")
	endif
EndFunction

EndState

State waiting
	
	Event OnBeginState()
	Debug.notification("Waiting")
		if autoplay
			;autoplayPhase1()
			NextStage(1)
		EndIf
	EndEvent

Function NextStage(int StageNum)
		if StageNum == 1
			debug.sendAnimationEvent(AttachedActor, "zazStruggleRope_Interactive")
			BaboHangingDummyRef.splineTranslateTo(dummyX+(0.0), dummyY-(0.0), neckZ+(-12), 0, 0, 0, 30,30)
			registerForUpdate(1.0)
			GotoState("struggling")
			return
		ElseIf StageNum == 2
			sprung = true
			finalize(NeckAttachNode)
			return
		ElseIf StageNum == 3
			releaseAlive()
			return
		Else
			return
		EndIf
EndFunction

	
	Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack,  bool abBashAttack, bool abHitBlocked)
			releaseAlive()
	EndEvent

	Event OnEndState()
		cleanupSound()
	EndEvent	
	
EndState

State struggling

	Event OnBeginState()
	Debug.notification("Struggling")
		cleanupSound()
		deviceSound = soundFastCreak.play(rope)
		Sound.SetInstanceVolume(deviceSound, 1)

		if !isGagged
			if isFemale
				humansound = soundFemaleChoking.play(AttachedActor)
			else
				humansound = soundMaleChoking.play(AttachedActor)
			EndIf
			Sound.SetInstanceVolume(humansound, 1)
		EndIf

		if !playerVictim
			attachedActor.setunconscious(true)
		EndIf

		if autoplay
			;autoplayPhase2()
			NextStage(2)
			autoplay = false
		EndIf

	EndEvent

Function NextStage(int StageNum)
	if StageNum == 1
		return
	elseif StageNum == 2
		UnregisterForUpdate()
		sprung = true
		finalize(NeckAttachNode)
		return
	elseif StageNum == 3
		releaseAlive()
		return
	endif
EndFunction

	
	Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack,  bool abBashAttack, bool abHitBlocked)
		UnregisterForUpdate()
		debug.sendAnimationEvent(AttachedActor, "ZazGallow_Loop")
		BaboHangingDummyRef.splineTranslateTo(dummyX+(0.0), dummyY-(0.0), neckZ+(-18), 0, 0, 0, 30,30)
		if !playerVictim
			attachedActor.setRestrained(true)
			attachedActor.setunconscious(false)
		EndIf
		GotoState("waiting")
		return
	EndEvent

	Event OnEndState()
		cleanupSound()
		if !isGagged && !sprung
			if isFemale
				humansound = soundFemaleRecovery.play(AttachedActor)
			else
				humansound = soundMaleRecovery.play(AttachedActor)
			EndIf
			Sound.SetInstanceVolume(humansound, 1)
		EndIf
	EndEvent	

EndState

State dead
	Event OnBeginState()
		;Debug.notification("Dead")
		cleanupSound()
		deviceSound = soundSlowCreak.play(rope)
		Sound.SetInstanceVolume(deviceSound, 1)
		;registerForSingleUpdate(20.0)
	EndEvent
	
	Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack,  bool abBashAttack, bool abHitBlocked)
		if AttachedActor != none
			RemoveActor()
		EndIf
		ReInitialize()
	EndEvent

	Function NextStage(int StageNum)
		if StageNum == 1
			return
		elseif StageNum == 2
			if AttachedActor !=none
				RemoveActor()
			EndIf
			ReInitialize()
			return
		elseif StageNum == 3
			return
		endif
	EndFunction
EndState

;Functions /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

Event OnUpdate()
		
		if !Sprung
			if AttachedActor.getSitstate() !=3
				ReleaseAlive() 
				reInitialize()
				return
			EndIf
		EndIf

		health=attachedActor.GetActorValue("Health")
		
		if health <=11
			unregisterForUpdate()
			if nonLethal
				GotoState("dead")
				if !sprung
					AttachedActor.setunconscious(true)
					AttachedActor.PushActorAway(AttachedActor, 0.5)
					AttachedActor.SetAV("Paralysis", 1)
					AttachActorBone(rope, NeckAttachNode)
				EndIf
				utility.wait(deathCamDuration)
				game.removeHavokConstraints(AttachedActor, NeckAttachNode, rope, RopeAttachNode)
				game.removeHavokConstraints(AttachedActor, HeadAttachNode, rope, RopeAttachNode)
				AttachedActor.PushActorAway(AttachedActor, 0.5)
				utility.wait(3.0)
				game.removeHavokConstraints(AttachedActor,rh,AttachedActor,lh)
				if(TieFeet)
					game.removeHavokConstraints(AttachedActor,rf,AttachedActor,lf)
				EndIf


				If playervictim
					AttachedActor.setunconscious(false)
					AttachedActor.setRestrained(false)
					AttachedActor.SetAV("Paralysis", 0)
					;AttachedActor.removeItem(collar, 1, true)
					;if removeCuffsOnRelease
					;	AttachedActor.removeItem(cuffs, 1, true)
					;EndIf
					ReInitialize()	
				EndIf
				releaseAlive()			
;Experimantal////Lethal_Block+++++++++++++++++++++++++++++++++++++++++++++++
			Else
				if playerVictim
					if !sprung
						;AttachedActor.setunconscious(true)
						;AttachedActor.PushActorAway(AttachedActor, 0.5)
						;AttachedActor.SetAV("Paralysis", 1)
						;AttachActorBone(rope, NeckAttachNode)
					EndIf
					finalize(neckAttachNode)				
				Else
					AttachedActor.killessential(AttachedActor)
					AttachActorBone(rope, NeckAttachNode)
				EndIf
				sprung=true
				UnregisterForUpdate()
				GotoState("dead")
				return
			EndIf
;Experimantal////Lethal_Block+++++++++++++++++++++++++++++++++++++++++++++++
		EndIf
		
		if playerVictim
			attachedActor.damageActorValue("Health", damageModifierPlayer)
		Else
			attachedActor.damageActorValue("Health", damageModifierNPC)
		EndIf

EndEvent

Function CleanupSound()
	Sound.StopInstance(humanSound)
	humansound=0
	Sound.StopInstance(deviceSound)
	deviceSound=0
EndFunction

Function finalize(String AAttachpoint)
	If nonLethal
		AttachedActor.setunconscious(true)
		AttachedActor.PushActorAway(AttachedActor, 0.1)
		AttachedActor.SetAV("Paralysis", 1)
		AttachActorBone(rope, NeckAttachNode)
		registerForUpdate(0.2)
		GotoState("dead")
		return
	EndIf
	If playerVictim
		Game.SetGameSettingFloat("fPlayerDeathReloadTime", deathCamDuration)
		AttachedActor.killessential(PlayerRef)
		AttachActorBone(rope, AAttachpoint)
	Else
		AttachedActor.setunconscious(true)
		AttachedActor.PushActorAway(AttachedActor, 0.5)
		AttachedActor.SetAV("Paralysis", 1)
		AttachActorBone(rope, AAttachpoint)
		utility.wait(0.5)
		AttachedActor.KillEssential(PlayerRef)
		AttachedActor.GetActorBase().SetEssential(false)
		AttachedActor.Kill(PlayerRef)
		GotoState("dead")
	EndIf
EndFunction

Function AttachActorBone(objectReference attachobject, string attachpoint)
	
	;utility.wait(0.2)
	DummyRelease()
	BaboHangingDummyRef.disable()
;+++++++++++test++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	;CleanupConstraints()
;+++++++++++test++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++	
	;game.removeHavokConstraints(AttachedActor, NeckAttachNode, AttachedActor, NeckAttachNode)
	;utility.wait(1.0)
	game.addHavokBallAndSocketConstraint(AttachedActor, attachPoint, attachobject, RopeAttachNode, 1,-2,2)
	;utility.wait(0.2)
	game.addHavokBallAndSocketConstraint(AttachedActor,rh,AttachedActor,lh,0,0,0)

	if(TieFeet)
	game.addHavokBallAndSocketConstraint(AttachedActor,rf,AttachedActor,lf,8,0,0)
	EndIf

EndFunction


Function Initialize()
	rope.SetMotionType(2, true)
	BaboHangingDummyRef.enable()
	utility.wait(0.3)
	BaboHangingDummyRef.translateTo(dummyX+(0.0), dummyY-(0.0), dummyZ-(0.0), 0, 0, 0,300)
	sprung = false
	dummyX = BaboHangingDummyRef.GetPositionX()
	dummyY = BaboHangingDummyRef.GetPositionY()
	dummyZ = BaboHangingDummyRef.GetPositionZ()
	;BaboHangingDummyRef.disable()
	;Trapdoor.blockActivation(true)
	;Self.BlockActivation(false)
	;AttachedActor=none
	GotoState("standby")
EndFunction

Function ReInitialize()
	sprung = false
	BaboHangingDummyRef.enable()
	utility.wait(0.3)
	BaboHangingDummyRef.translateTo(dummyX+(0.0), dummyY-(0.0), dummyZ-(0.0), 0, 0, 0,300)
	utility.wait(0.3)
	BaboHangingDummyRef.disable()
	AttachedActor.delete()
	AttachedActor.disable()
	;Trapdoor.blockActivation(true)
	;Self.BlockActivation(false)
	AttachedActor = none
	GotoState("")
	autoplay=false
EndFunction


Function DummyAttach()
	game.addHavokBallAndSocketConstraint(BaboHangingDummyRef, DummyAttachNode, rope, RopeAttachNode2, 0, 0, 3, 0,0,0)
	;game.addHavokBallAndSocketConstraint(BaboHangingDummyRef, DummyAttachNode, rope, RopeAttachNode, 0,-2,15)
EndFunction

Function DummyRelease()
	game.removeHavokConstraints(BaboHangingDummyRef, DummyAttachNode, rope, RopeAttachNode2)
	;game.removeHavokConstraints(BaboHangingDummyRef, DummyAttachNode, rope, RopeAttachNode)
EndFunction

Function RemoveActor()
	game.removeHavokConstraints(AttachedActor, NeckAttachNode, rope, RopeAttachNode)
	game.removeHavokConstraints(AttachedActor, HeadAttachNode, rope, RopeAttachNode)
	AttachedActor.disable()
	AttachedActor.enable()
	utility.wait(0.5)
	game.addHavokBallAndSocketConstraint(AttachedActor,rh,AttachedActor,lh,0,0,0)
	if(TieFeet)
	game.addHavokBallAndSocketConstraint(AttachedActor,rf,AttachedActor,lf,8,0,0)
	EndIf
	AttachedActor = none
EndFunction

Function CleanupConstraints()
	game.removeHavokConstraints(AttachedActor, NeckAttachNode, AttachedActor, NeckAttachNode)
	game.removeHavokConstraints(AttachedActor, rf, AttachedActor, rf)
	game.removeHavokConstraints(AttachedActor, lf, AttachedActor, lf)
	game.removeHavokConstraints(AttachedActor, lh, AttachedActor, lh)
	game.removeHavokConstraints(AttachedActor, rh, AttachedActor, rh)
EndFunction

Function ReleaseAlive()
	unregisterForUpdate()
	AttachedActor.removeItem(collar, 1, true)
	if removeCuffsOnRelease
		AttachedActor.removeItem(cuffs, 1, true)
	EndIf
	If !playerVictim
		AttachedActor.setunconscious(true)
		AttachedActor.SetAV("Paralysis", 1)
		AttachedActor.PushActorAway(AttachedActor, 0.5)
		utility.wait(1.0)
		AttachedActor.setunconscious(false)
		AttachedActor.setRestrained(false)
		AttachedActor.SetAV("Paralysis", 0)
		ReInitialize()
	EndIf
EndFunction

Function autoplayPhase1()
	utility.wait(2.0)
	if AttachedActor.getSitstate() !=3
		ReleaseAlive() 
		reInitialize()
		return
	EndIf
	utility.wait(timerPhase1)
	if AttachedActor.getSitstate() !=3
		ReleaseAlive() 
		reInitialize()
		return
	EndIf
	NextStage(1)
EndFunction

Function autoPlayPhase2()
	utility.wait(1.0)
;	if AttachedActor.getSitstate() !=3 || AttachedActor ==none
;		return
;	EndIf
;	utility.wait(timerPhase2)
;	if AttachedActor.getSitstate() !=3 || AttachedActor ==none
;		return
;	EndIf

	NextStage(2)
	autoplay=false
Endfunction
