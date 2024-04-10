Scriptname BaboEventGallow extends ObjectReference  Conditional

Idle Property zbfxGallowsEnterIdle  Auto  
Idle Property zbfxGallowsStruggleIdle  Auto  
Idle Property zbfxGallowsSlowStruggleIdle  Auto  
Idle Property zbfxGallowsVictimDead  Auto  
idle property DeathAnimationStart auto

Static property CommonTableRound01 Auto
armor property zbfxPussyDropsArmor auto
armor property zbfxPeeFemaleArmor auto
keyword property ArmorCuirass auto
keyword property ClothingBody auto

Sound Property zbfxSoundFemaleBreathing  auto
Sound Property zbfxSoundMaleBreathing  auto
Sound Property zbfxSoundFemaleFear  auto
Sound Property zbfxSoundFastCreak  auto
Sound Property zbfxSoundSlowCreak  auto
Sound Property zbfxSoundTumble  auto
sound property zbfxSoundFemaleChoking auto
sound property zbfxSoundMaleChoking auto
Actor property PlayerRef auto

ImageSpaceModifier Property zbfxStranglingImageSpace  Auto  

zbfBondageShell Property zbf  Auto  

Bool Property ManualControlled  Auto  
Bool Property KillVictim  Auto  
int property VictimState auto conditional

int property VictimStateNone = 0 AutoReadOnly
int property VictimStateWaiting = 1 AutoReadOnly
int property VictimStateDying = 2 AutoReadOnly
int property VictimStateDead = 3 AutoReadOnly

Actor victim
objectreference chair
bool isNaked
bool isGagged
bool isFemale
bool isPlayer
bool isCanceled
bool isFirstPersonView

int humanSound
int deviceSound

function Trace(string text)
	Debug .Trace("$$ NOOSE :" + text)
	;Debug.Notification(text)
endfunction

event OnUpdate()
endevent

event OnActivate( ObjectReference theRef )
	if victim
		isCanceled = true
		GotoState("cleanup")
		return
	endif

	if !theRef 
		return
	endif

	victim = theRef as actor
	if victim.GetSitState() == 4
		victim = none
		return
	endif

	isFemale = victim.GetLeveledActorBase().GetSex()
	isNaked = !victim.WornHaskeyword(ArmorCuirass) && !victim.WornHaskeyword(ClothingBody)
	isGagged = victim.WornHaskeyword(zbf.zbfEffectGagSound)

	isCanceled = false

	isPlayer = Game.GetPlayer() == victim
	if isPlayer
		RegisterForCameraState()
	endif
	;Trace(theRef.GetDisplayName() + " gets noosed " + victim.GetSitState())

	victim.Playidle(zbfxGallowsEnterIdle)

	;Trace("isFemale="+ isFemale + ", isNaked=" + isNaked + ", isGagged=" + isGagged + ", isBlindfolded=" + isBlindfolded + ", isFirstPersonView=" + isFirstPersonView)

	if CommonTableRound01
		chair = victim.placeatme(CommonTableRound01)
		chair.SetScale(0.75)
		chair.MoveTo(victim, 0, 0, -50.0)
	endif

	GotoState("waiting")
endevent

function CleanupSound()
	if deviceSound
		Sound.StopInstance(deviceSound)
		deviceSound = 0
	endif
	if humanSound
		Sound.StopInstance(humanSound)
		humanSound = 0
	endif
endfunction

function CleanupFacialAnimations()
	if victim
		victim.SetExpressionOverride(16, 1)
		victim.ClearExpressionOverride()
		MfgConsoleFunc.ResetPhonemeModifier(victim)
	endif
endfunction

function Continue(float afterSeconds = 15.0)
	if GetState() != ""
		RegisterForSingleUpdate(afterSeconds)
	endif
endfunction

function Cleanup()
	GotoState("cleanup")
endfunction

state waiting
	event OnBeginState()
		Trace(GetState())
		VictimState = VictimStateWaiting
		zbf.SetFaceAnimation(victim,zbf.iFaceAnimFear,70)
		if isFemale
			humanSound = zbfxSoundFemaleFear.Play(victim)
		endif
		if !ManualControlled
			RegisterForSingleUpdate(8.0)
		endif
	endevent
	event OnEndState()
		Trace("leave " + GetState())
		CleanupSound()
		if chair
			if !isCanceled
				Sound.SetInstanceVolume(zbfxSoundTumble.Play(chair),1)
				if isPlayer
					Game.ShakeController(1, 1, 0.5)
					if Game.GetCameraState() == 0
						Game.ShakeCamera(none,1,0.5)
						if !victim.WornHaskeyword(zbf.zbfEffectBlind)
							zbfxStranglingImageSpace.Apply()
						endif
					endif
				endif
			endif
			chair.disable()
			chair.delete()
			chair = none
		;/
		elseif LinkCustom02 && !isCanceled
			ObjectReference trapdoor = GetLinkedRef(LinkCustom02)
			if trapdoor
				zbfxSoundTumble.Play(trapdoor)
				trapdoor.SetOpen(true)
				bool r = trapdoor.PlayGamebryoAnimation("AnimOpen01")
				if isPlayer
					Game.ShakeController(1, 1, 0.5)
					if isFirstPersonView
						Game.ShakeCamera(none,1,0.5)
						if !isBlindfolded
							zbfxStranglingImageSpace.Apply()
						endif
					endif
				endif
				if !r
					trapdoor.Disable()
				endif
				Trace("trapdoor = " + r)			
			endif
		elseif LinkCustom03 && !isCanceled
			ObjectReference platform = GetLinkedRef(LinkCustom03)
			if platform
				Trace("got platform")
				zbfxSoundTumble.Play(platform)
				if isPlayer
					Game.ShakeController(1, 1, 0.5)
					if isFirstPersonView
						Game.ShakeCamera(none,1,0.5)
						if !isBlindfolded
							zbfxStranglingImageSpace.Apply()
						endif
					endif
				endif
				platform.Disable()
			endif
		/;
		endif
	endevent
	event OnUpdate()
		GotoState("struggling")
	endevent
endstate

state struggling
	event OnBeginState()
		Trace(GetState())
		VictimState = VictimStateDying
		victim.PlayIdle(zbfxGallowsStruggleIdle)
		deviceSound = zbfxSoundFastCreak.Play(self)
		Sound.SetInstanceVolume(deviceSound,1)
		if !isGagged
			if isFemale
				humanSound = zbfxSoundFemaleChoking.Play(victim)
			else
				humanSound = zbfxSoundMaleChoking.Play(victim)
			endif
		endif
		if !ManualControlled
			RegisterForSingleUpdate(30.0)
		endif
	endevent
	event OnEndState()
		Trace("leave " + GetState())
		CleanupSound()
	endevent
	event OnUpdate()
		GotoState("dying")
	endevent
endstate

state dying
	event OnBeginState()
		Trace(GetState())
		victim.PlayIdle(zbfxGallowsSlowStruggleIdle)
		deviceSound = zbfxSoundSlowCreak.Play(self)
		if isNaked && isFemale
			victim.AddItem(zbfxPeeFemaleArmor,1,true)
			victim.EquipItem(zbfxPeeFemaleArmor,false,true)
		endif
		if !ManualControlled
			RegisterForSingleUpdate(15.0)
		endif
	endevent
	event OnEndState()
		Trace("leave " + GetState())
		CleanupSound()
		if isNaked && isFemale
			victim.UnEquipItem(zbfxPeeFemaleArmor,false,true)
			victim.RemoveItem(zbfxPeeFemaleArmor,abSilent=true)
			if humanSound
				Sound.StopInstance(humanSound)
				humanSound = 0
			endif
		endif		
	endevent
	event OnUpdate()
		GotoState("dead")
	endevent
endstate

state dead
	event OnBeginState()
		Trace(GetState())
		VictimState = VictimStateDead
		CleanupFacialAnimations()
		victim.PlayIdle(zbfxGallowsVictimDead)
		if !isPlayer
			victim.SetUnconscious(true)
		endif
		if isNaked && isFemale
			victim.AddItem(zbfxPussyDropsArmor,1,true)
			victim.EquipItem(zbfxPussyDropsArmor,false,true)
		endif
		deviceSound = zbfxSoundSlowCreak.Play(self)
		Sound.SetInstanceVolume(deviceSound,1)
		RegisterForSingleUpdate(20.0)
	endevent
	event OnUpdate()
		Trace("dead - silence")
		CleanupSound()
		if isNaked && isFemale
			victim.UnEquipItem(zbfxPussyDropsArmor,false,true)
			victim.RemoveItem(zbfxPussyDropsArmor,abSilent=true)
			if humanSound
				Sound.StopInstance(humanSound)
				humanSound = 0
			endif
		endif
		victim.SendModEvent("zbfxGallowsVictimDead")
		if KillVictim
			;Utility.wait(10)
			victim.KillEssential()
		endif
	endevent
endstate

state cleanup
	event OnBeginState()
		if victim
			if !isPlayer
				victim.SetUnconscious(false)
			endif
			if isCanceled
				if isPlayer
					Game.ShakeController(0.5, 0.5, 1.0)
					zbfxStranglingImageSpace.Remove()
				endif
				Trace(GetState() + " isCanceled")
			else
				Trace(GetState())
			endif
			if isPlayer
				UnRegisterForCameraState()
			endif
			CleanupSound()
			CleanupFacialAnimations()
			if isNaked && isFemale
				victim.UnEquipItem(zbfxPussyDropsArmor,false,true)
				victim.UnEquipItem(zbfxPeeFemaleArmor,false,true)
				victim.RemoveItem(zbfxPussyDropsArmor,abSilent=true)
				victim.RemoveItem(zbfxPeeFemaleArmor,abSilent=true)
			endif
			victim.SendModEvent("zbfxGallowsVictimLeft")
			if isCanceled
				if VictimState == VictimStateDead
					victim.PlayIdle(DeathAnimationStart)
				else
					victim.PlayIdle(zbf.zbfIdleForceDefault)
					if VictimState == VictimStateDying
						if isFemale
							zbfxSoundFemaleBreathing.Play(victim)
						else
							zbfxSoundMaleBreathing.Play(victim)
						endif
					endif
				endif
			endif
			if chair
				chair.disable()
				chair.delete()
				chair = none
			endif
			victim = none
		endif
		isCanceled = false
		ManualControlled = false
		VictimState = VictimStateNone
		GotoState("")
	endevent
	event OnActivate( ObjectReference theRef )
	endevent
endstate

Event OnPlayerCameraState(int oldState, int newState)
	if VictimState > VictimStateWaiting
		if newState != 0
			zbfxStranglingImageSpace.Remove()
		else
			zbfxStranglingImageSpace.Apply()
		endif
	endif
EndEvent


