Scriptname BaboFollowerControllerScript extends Quest  

Package Property DoNothing Auto

Referencealias property CurrentFollower01 Auto
Referencealias property CurrentFollower02 Auto
Referencealias property CurrentFollower03 Auto
Referencealias property CurrentFollower04 Auto
Referencealias property CurrentFollower05 Auto
Referencealias property CurrentFollower06 Auto
ReferenceAlias[] Property CurrentFollowerArray Auto

Actor[] Property FollowerActors Auto hidden

Referencealias property PotentialFollower01 Auto
Referencealias property PotentialFollower02 Auto
Referencealias property PotentialFollower03 Auto
Referencealias property PotentialFollower04 Auto
Referencealias property PotentialFollower05 Auto
Referencealias property PotentialFollower06 Auto
ReferenceAlias[] Property PotentialFollowerArray Auto

Spell Property BaboCalmSpell Auto

Faction Property dunPrisonerFaction Auto
Faction Property BaboDialogueFriendFaction Auto

Idle[] Property RestrainIdles Auto
Armor Property BaboGagLogBitNPC Auto
Armor Property BaboWristRope01 Auto

;(BaboFollowerController as BaboFollowerControllerScript).DetectFollowers() - When the fight starts
;(BaboFollowerController as BaboFollowerControllerScript).PacifyAllFollowers()  - When you are defeated
;(BaboFollowerController as BaboFollowerControllerScript).TieUpFollowers(true) - While you are being harrassed
;(BaboFollowerController as BaboFollowerControllerScript).ClearAllAliases() - When the quest is stopped

Bool Property IsTieup = false Auto

Function DetectFollowers()
	Start()
	;UnregisterForUpdateGameTime()
EndFunction

int Function PacifyAllFollowers()
	Int actorCount = 0
	Actor CurrentFollower
	Int ii = 0
	While ii < 6
		CurrentFollower = CurrentFollowerArray[ii].GetReference() as Actor
		If CurrentFollower != None
			Self.PacifyFollowers(CurrentFollower, true, true)
			actorCount += 1
		EndIf
		ii += 1
	EndWhile
	RegisterForSingleUpdateGameTime(24)
	Return actorCount
EndFunction

Event OnUpdateGameTime()
	ClearAllAliases()
EndEvent

Function ClearAllAliases()
	if IsTieup
		TieUpFollowers(false)
	endif
		PacifyFollowers(PotentialFollower01.getreference() as actor, true, false)
		PacifyFollowers(PotentialFollower02.getreference() as actor, true, false)
		PacifyFollowers(PotentialFollower03.getreference() as actor, true, false)
		PacifyFollowers(PotentialFollower04.getreference() as actor, true, false)
		PacifyFollowers(PotentialFollower05.getreference() as actor, true, false)
		PacifyFollowers(PotentialFollower06.getreference() as actor, true, false)
		
		PotentialFollower01.clear()
		PotentialFollower02.clear()
		PotentialFollower03.clear()
		PotentialFollower04.clear()
		PotentialFollower05.clear()
		PotentialFollower06.clear()

	UnregisterForUpdateGameTime()
	
	stop()
EndFunction

Bool Function PacifyFollowers(actor Target, Bool StayPut = True, Bool Enter = True)

	If Enter
		If !Target.IsInFaction(dunPrisonerFaction) && !Target.IsInFaction(BaboDialogueFriendFaction)
			Target.AddSpell(BaboCalmSpell)
			Target.AddToFaction(dunPrisonerFaction)
			Target.AddToFaction(BaboDialogueFriendFaction)
			Target.StopCombat()
			Target.StopCombatAlarm()
			If StayPut
				ActorUtil.AddPackageOverride(Target, DoNothing, 100, 1)
				Target.EvaluatePackage()
				TieUp(Target, true)
			Endif
			Return True
		Else
			Target.StopCombatAlarm()
		Endif
	Else
		If Target.isinfaction(BaboDialogueFriendFaction)
			Target.RemoveFromFaction(dunPrisonerFaction)
			Target.RemoveFromFaction(BaboDialogueFriendFaction)
			If StayPut
				ActorUtil.RemovePackageOverride(Target, DoNothing)
				Target.EvaluatePackage()
				TieUp(Target, false)
			Endif
			Target.RemoveSpell(BaboCalmSpell)
			Return True
		Endif
	Endif
	Return False
EndFunction

Function TieUp(actor akactor, Bool Enter = true)

if Enter
	akactor.additem(BaboGagLogBitNPC, 1, true)
	akactor.additem(BaboWristRope01, 1, true)
	akactor.equipitem(BaboGagLogBitNPC, true, false)
	akactor.equipitem(BaboWristRope01, true, false)

	int i = Utility.randomint(0, 8)
	akactor.SetRestrained()
	akactor.SetDontMove(True)
	akactor.playidle(RestrainIdles[i])
Else
	akactor.unequipitem(BaboGagLogBitNPC)
	akactor.unequipitem(BaboWristRope01)
	akactor.removeitem(BaboGagLogBitNPC, 1)
	akactor.removeitem(BaboWristRope01, 1)

	akactor.SetRestrained(false)
	akactor.SetDontMove(false)
	Debug.SendAnimationEvent(akactor, "IdleForceDefaultState")
Endif
	
EndFunction

Function TieUpFollowers(Bool Tie = true)
	Int ii = 0
	Actor CurrentFollower
if Tie
	While ii < 6
		CurrentFollower = CurrentFollowerArray[ii].GetReference() as Actor
		if CurrentFollower
			Self.TieUp(CurrentFollower, true)
		endif
		ii += 1
	EndWhile
	IsTieup = true
Else
	While ii < 6
		CurrentFollower = CurrentFollowerArray[ii].GetReference() as Actor
		if CurrentFollower
			Self.TieUp(CurrentFollower, false)
			
			If CurrentFollower.isinfaction(BaboDialogueFriendFaction)
				CurrentFollower.RemoveFromFaction(dunPrisonerFaction)
				CurrentFollower.RemoveFromFaction(BaboDialogueFriendFaction)
				ActorUtil.RemovePackageOverride(CurrentFollower, DoNothing)
				CurrentFollower.EvaluatePackage()
				TieUp(CurrentFollower, false)
				CurrentFollower.RemoveSpell(BaboCalmSpell)
			Endif	
		endif

		ii += 1
	EndWhile
	IsTieup = false
	Reset()
	Stop()
Endif
endfunction