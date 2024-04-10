Scriptname BaboEventRiekling extends Quest  

Function RieklingSexActor(Actor Actor01, Actor Actor02)

SexCountRiekling.SetValue(SexCountRiekling.GetValue() + 1)

actor[] sexActors = new actor[2]
sexActors[0] = Actor01
sexActors[1] = Actor02
sslBaseAnimation[] anims
anims = SexLab.GetAnimationsByTag(2, "Riekling", "Vaginal")
SexLab.StartSex(sexActors, anims, victim=sexActors[0])

EndFunction

Function SpawnNewRiekling()

	Actor RieklingChief = RieklingChallengerRef.GetActorReference()

	PlayerReference.moveto(MovingPoint04)
	RieklingChief.moveto(MovingPoint04)
	Game.EnablePlayerControls()
	Game.SetPlayerAIDriven(false)
	Actor RieklingWarrior01 = MovingPoint04.PlaceActorAtMe(SpawnRieklingW01, 4)
	RieklingWarrior01Ref.ForceRefTo( RieklingWarrior01)

EndFunction

Function RieklingThreesome(ReferenceAlias Victim, ReferenceAlias Raper01)

	Actor Actor01 = Victim.GetActorReference()
	Actor Actor02 = Raper01.GetActorReference()
	SpawnNewRiekling()
	Utility.wait(2.0)
	Actor Actor03 = RieklingWarrior01Ref.GetActorReference()
	
	actor[] sexActors = new actor[3]
	sexActors[0] = Actor01
	sexActors[1] = Actor02
	sexActors[2] = Actor03
	
	sslBaseAnimation[] anims
	anims = SexLab.GetAnimationsByTag(3, "Riekling", "Aggressive", "Threesome")
	SexCountRiekling.SetValue(SexCountRiekling.GetValue() + 5)
	RegisterForModEvent("AnimationEnd_RieklingThreeAfter", "RieklingThreeAfterT")
	SexLab.StartSex(sexActors, anims, victim=sexActors[0], hook="RieklingThreeAfter")

EndFunction

Int Function RieklingThreesome2(ReferenceAlias Victim, ReferenceAlias Raper01)

	Actor Actor01 = Victim.GetActorReference()
	Actor Actor02 = Raper01.GetActorReference()
	Actor Actor03 = RieklingWarrior01Ref.GetActorReference()

	actor[] sexActors = new actor[3]
	sexActors[0] = Actor01
	sexActors[1] = Actor02
	sexActors[2] = Actor03
	
	Actor01.moveto(MovingPoint04)
	Actor02.moveto(MovingPoint04)
	
	sslBaseAnimation[] anims
	anims = SexLab.GetAnimationsByTag(3, "Riekling", "Aggressive", "Threesome")
	SexCountRiekling.SetValue(SexCountRiekling.GetValue() + 5)
	RegisterForModEvent("AnimationEnd_RieklingThreeAfter", "RieklingThreeAfterT")
	SexLab.StartSex(sexActors, anims, victim=sexActors[0], hook="RieklingThreeAfter")

EndFunction

Function RieklingNewChallenge()

Actor RieklingNewChallenger = SpawnPlace.PlaceActorAtMe(SpawnRiekling, 4)
RieklingChallengerRef.ForceRefTo(RieklingNewChallenger)

EndFunction

Function ChallengeStart(ReferenceAlias AliasToAnger)

	Actor ActorRef = AliasToAnger.GetActorReference()
	actorRef.addtoFaction(NewChallengerFaction)
	PlayerReference.addtoFaction(PlayerChallengerFaction)
	if actorRef.GetActorValue("Confidence") < 4
		actorRef.SetActorValue("Confidence", 4) 
	EndIf

	actorRef.startCombat(Game.GetPlayer())

EndFunction

Function SceneActivate01()

Scene01.Start()

EndFunction

Function pacifyAlias(ReferenceAlias AliasToPacify)

	actorRef.RemoveFromFaction(NewChallengerFaction)
	PlayerReference.RemoveFromFaction(PlayerChallengerFaction)
	Actor ActorRef = AliasToPacify.GetActorReference()
	actorRef.SetActorValue("Aggression", 0) 
	actorRef.StopCombat()
	
EndFunction

Function Fadeout(ReferenceAlias AliasNewChief)

Actor NewChief = AliasNewChief.GetActorReference()

	utility.wait(5)
	FadeToBlackImod.Apply()

	If SexCountNewRiekling.GetValue() == 0

		CrossedRopeWoodRef.Enable()
		Game.GetPlayer().RemoveAllItems(TargetBox, True, True)

	EndIf

	utility.wait(2)

	FadeToBlackImod.PopTo(FadeToBlackHoldImod)
	PlayerReference.moveto(MovingPoint01)
	NewChief.moveto(MovingPoint02)

	utility.wait(5)

	;CrossedRopeWoodRef.OnActivate(PlayerReference)
	CrossedRopeWoodRef.Activate(Game.GetPlayer())
	Game.DisablePlayerControls( true, true, true, false, true, false, true, false )
	Game.SetPlayerAIDriven( true )

	utility.wait(5)

	FadeToBlackHoldImod.PopTo(FadeToBlackBackImod)
	FadeToBlackHoldImod.Remove()

	utility.wait(2)

		If SexCountNewRiekling.GetValue() == 0

			debug.messagebox ("The new cheif confiscated all of my stuff and hid them... I am now fully naked and exhibited.")
			Scene02.Start()
			utility.wait(10)
			BaboEventQuest.setstage(50)

		ElseIf SexCountNewRiekling.GetValue() >= 1
			If SexCountNewRiekling.GetValue() <= 3
				debug.messagebox ("I can still feel the sperm inside of my womb...")
			ElseIf SexCountNewRiekling.GetValue() >= 5
				debug.messagebox ("How many do you have to jerk me.. I can't stand it...")
				BaboEventQuest.setstage(60)
			EndIf

		EndIf

	utility.wait(2)

		;Actor RCR = RieklingChallengerRef.GetActorReference()

	;ActorUtil.AddPackageOverride(RCR, ForceGreet02,100)
	EvaluatePackageOnOff.SetValue(0)
	NewChief.EvaluatePackage()

EndFunction


int Function Restincross()

	utility.wait(5)

	UnEquipRestraints()

	Game.DisablePlayerControls( true, true, true, false, true, false, true, false )
	Game.SetPlayerAIDriven( true )
	;CrossedRopeWoodRef.OnActivate(PlayerReference)
	CrossedRopeWoodRef.Activate(PlayerReference)

	utility.wait(30)

	debug.messagebox ("My another day has ended... My body is now no more than just a bunch of meat for plaything. My breasts and pussy will be always wet ready to be pregnant..")

	utility.wait(5)
	int iwait = 8
	GameHour.SetValue(iwait)

	utility.wait(30)

	debug.messagebox ("My another day has begun... I barely slept.. Regardless of my concern, they drove me to the floor to rape me again...")
	RieklingThreesome2(PlayerRefRef, RieklingChallengerRef)

EndFunction

Int Function NewChiefRape(Actor Victim, Actor Raper01)

	EvaluatePackageOnOff.SetValue(1)

	Victim.moveto(MovingPoint03)
	Raper01.moveto(MovingPoint03)
	Fading()

	Game.EnablePlayerControls()
	Game.SetPlayerAIDriven(false)

	actor[] sexActors = new actor[2]
	sexActors[0] = Victim
	sexActors[1] = Raper01
	sslBaseAnimation[] anims
	anims = SexLab.GetAnimationsByTag(5, "Riekling", "Aggressive", "Vaginal", TagSuppress = "Femdom, Blowjob")
	RegisterForModEvent("AnimationEnd_NewChiefRapeAfter", "ChiefRapeAfterT")

		If SexCountNewRiekling.GetValue() == 0
			debug.messagebox ("I beg for mercy but the new chief doesnt allow it. My body is now being harrased by this filthy little creature.")
		ElseIf SexCountNewRiekling.GetValue() >= 1
			debug.messagebox ("No.. Please! I am not a sexdoll. Don't come in!")
		EndIf

	SexLab.StartSex(sexActors, anims, victim=sexActors[0], hook="NewChiefRapeAfter")
EndFunction


Function EquipRestraints()

PlayerReference.Additem(Yoke, 1, true)
PlayerReference.Additem(AnkleChain, 1, true)
PlayerReference.EquipItem(Yoke, true, true)
PlayerReference.EquipItem(AnkleChain, true, true)

EndFunction

Function UnEquipRestraints()

PlayerReference.UnequipItem(Yoke, true, true)
PlayerReference.UnequipItem(AnkleChain, true, true)
SexDefeatNum.setvalue(SexDefeatNum.getvalue() + 1)

EndFunction


Event ChiefRapeAfterT(string eventName, string argString, float argNum, form sender)

	SexCountNewRiekling.SetValue(SexCountNewRiekling.GetValue() + 1)
	Fadeout(RieklingChallengerRef)
;	UnregisterForModEvent("AnimationEnd_NewChiefRapeAfter")

EndEvent

Event RieklingThreeAfterT(string eventName, string argString, float argNum, form sender)

	SexCountRiekling.SetValue(SexCountRiekling.GetValue() + 3)

	Actor Actor01 = SexLab.HookActors(argString)[0]
	Actor Actor02 = SexLab.HookActors(argString)[1]
	Actor Actor03 = SexLab.HookActors(argString)[2]

	actor[] sexActors = new actor[3]
	sexActors[0] = Actor01
	sexActors[1] = Actor02
	sexActors[2] = Actor03

	sslBaseAnimation[] anims
	anims = SexLab.GetAnimationsByTag(3, "Riekling", "Aggressive", "Threesome", TagSuppress = "Femdom")

	debug.messagebox ("They angrily keep harrassing me... Please somebody.. help..")

	RegisterForModEvent("AnimationEnd_RieklingThreeAfter2", "RieklingThreeAfter2T")
	SexLab.StartSex(sexActors, anims, victim=sexActors[0], hook="RieklingThreeAfter2")
;	UnregisterForModEvent("AnimationEnd_RieklingThreeAfter")

EndEvent

Event RieklingThreeAfter2T(string eventName, string argString, float argNum, form sender)

EquipRestraints()
	If BaboEventQuest.getstage() == 70
		BaboEventQuest.setstage(90)
	ElseIf  BaboEventQuest.getstage() == 100
		debug.messagebox ("When will this madness be over. My pussy hurts... I am not a meat slave...")
	EndIf
EndEvent



Function RegisterUpdate()
RegisterForSingleUpdateGameTime(48.0); this is two days
EndFunction



Event OnUpdateGameTime()
	CrossedRopeWoodRef.disable()
	RieklingChallengerRef.Clear()
	RieklingWarrior01Ref.Clear()
	Utility.Wait(0.1)
	SexCountRiekling.SetValue(0)
	BaboEventQuest.Reset()
	BaboEventQuest.SetStage(10)
EndEvent

Function BacktoThirsk(Referencealias SpeakerRef)

	Actor Speaker = SpeakerRef.getactorreference()

	Game.DisablePlayerControls(true, true, true, false, true, false, true, false)
	Game.SetPlayerAIDriven(true)
	
	Fading()

	Utility.Wait(2)
	
	Game.getplayer().moveto(ChiefPoint01)
	Speaker.moveto(ChiefPoint02)
	ThirskDoor.Setlocklevel(75)
	ThirskDoor.lock()

	Utility.Wait(3)
	
	debug.messagebox ("It dragged me to this horrifying, stinky place... The door is locked tight. I failed to run away...")
	
	Game.EnablePlayerControls()
	Game.SetPlayerAIDriven(false)

EndFunction

Function Fading()

	FadeToBlackImod.Apply()
	utility.wait(2)
	FadeToBlackImod.PopTo(FadeToBlackHoldImod)
	utility.wait(2)
	FadeToBlackImod.PopTo(FadeToBlackHoldImod)
	FadeToBlackHoldImod.Remove()

EndFunction
;===================================== This is property zone ========================================
;===================================== This is property zone ========================================


SexLabFramework Property SexLab Auto
Quest Property BaboEventQuest Auto

Bool Property SexOut Auto

GlobalVariable Property SexCountRiekling Auto
GlobalVariable Property SexCountNewRiekling Auto
GlobalVariable Property EvaluatePackageOnOff Auto

Actorbase property SpawnRiekling auto
Actorbase property SpawnRieklingW01 auto

ReferenceAlias Property RieklingChallengerRef Auto
ReferenceAlias Property RieklingWarrior01Ref Auto
ReferenceAlias Property PlayerRefRef Auto

ObjectReference property SpawnPlace auto
ObjectReference property MovingPoint01 auto
ObjectReference property MovingPoint02 auto
ObjectReference property MovingPoint03 auto
ObjectReference property MovingPoint04 auto
ObjectReference property CrossedRopeWoodRef auto
ObjectReference Property TargetBox Auto

Faction Property NewChallengerFaction Auto
Faction Property PlayerChallengerFaction Auto
Actor Property PlayerReference Auto

Scene Property Scene01 Auto
Scene Property Scene02 Auto

Package Property ForceGreet01 Auto
Package Property ForceGreet02 Auto

GlobalVariable Property GameHour Auto
GlobalVariable Property SexDefeatNum Auto

ImageSpaceModifier Property FadeToBlackImod  Auto  
ImageSpaceModifier Property FadeToBlackHoldImod  Auto  
ImageSpaceModifier Property FadeToBlackBackImod  Auto  

Armor property Yoke auto
Armor property RopeCollar auto
Armor property AnkleChain auto
Armor property Logbit auto

ObjectReference property ChiefPoint01 Auto
ObjectReference property ChiefPoint02 Auto
ObjectReference property ThirskDoor Auto
