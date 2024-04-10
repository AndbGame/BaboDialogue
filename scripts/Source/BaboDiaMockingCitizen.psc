Scriptname BaboDiaMockingCitizen extends Quest  


SexLabFramework Property SexLab Auto
Idle Property IdleOrgasmFaintAfterSex  Auto
Idle Property IdleOrgasmFaintAfterSex2  Auto
Scene Property DespairBeckon Auto
ObjectReference Property RewardItem  Auto
MiscObject Property Gold001 Auto
GlobalVariable Property BaboEventMorgulStage Auto

int Function FirstRape(Actor Victim, Actor Raper)

		actor[] activeActors = new actor[2]
		activeActors[0] = Victim
		activeActors[1] = Raper
		sslBaseAnimation[] anims
		anims = SexLab.GetAnimationsByTag(2, "Aggressive", "Vaginal", "Standing", TagSuppress = "Femdom, Necro")

	 RegisterForModEvent("AnimationEnd_SecondMorgulSexT", "SecondMorgulSex")
	SexLab.StartSex(activeActors, anims, hook="SecondMorgulSexT")

EndFunction

int Function DragonSex(Actor Victim, Actor Creature)

		actor[] activeActors = new actor[2]
		activeActors[0] = Victim
		activeActors[1] = Creature
		sslBaseAnimation[] anims
		anims = SexLab.GetAnimationsByTag(2, "creature")

	SexLab.StartSex(activeActors, anims, victim=activeActors[0])

EndFunction

int Function AggressiveRapeAnal(Actor Victim, Actor Raper)

		actor[] activeActors = new actor[2]
		activeActors[0] = Victim
		activeActors[1] = Raper
		sslBaseAnimation[] anims
		anims = SexLab.GetAnimationsByTag(2, "Forcing", "Aggressive", "Anal",  TagSuppress = "Femdom")
	RegisterForModEvent("AnimationEnd_AfterMorgulSexT", "AfterMorgulSex")
	SexLab.StartSex(activeActors, anims, hook="AfterMorgulSexT")

EndFunction



int Function AggressiveRapePussy(Actor Victim, Actor Raper)

		actor[] activeActors = new actor[2]
		activeActors[0] = Victim
		activeActors[1] = Raper
		sslBaseAnimation[] anims
		anims = SexLab.GetAnimationsByTag(2, "Aggressive", "Vaginal",  TagSuppress = "Femdom")
	RegisterForModEvent("AnimationEnd_AfterMorgulSexT", "AfterMorgulSex")
	SexLab.StartSex(activeActors, anims, hook="AfterMorgulSexT")

EndFunction



Event SecondMorgulSex(string eventName, string argString, float argNum, form sender)

Actor Victim = SexLab.HookActors(argString)[0]
Actor Raper = SexLab.HookActors(argString)[1]

	Victim.PlayIdle(IdleOrgasmFaintAfterSex)
	DespairBeckon.Start()
	Utility.Wait(5.0)

		actor[] activeActors = new actor[2]
		activeActors[0] = Victim
		activeActors[1] = Raper
		sslBaseAnimation[] anims
		anims = SexLab.GetAnimationsByTag(2, "Cowgirl", "Vaginal",  TagSuppress = "Forced")

		debug.messagebox ("Againt my will, my body is being harrassing")
	RegisterForModEvent("AnimationEnd_AfterMorgulSexT", "AfterMorgulSex")
	SexLab.StartSex(activeActors, anims, hook="AfterMorgulSexT")
UnregisterForModEvent("AnimationEnd_SecondMorgulSexT")

EndEvent



Event AfterMorgulSex(string eventName, string argString, float argNum, form sender)


Actor Player = Game.GetPlayer()

	Wailing(Player)
	BaboEventMorgulStage.SetValue(1.0)

UnregisterForModEvent("AnimationEnd_AfterMorgulSexT")

EndEvent

Function Wailing(Actor victim)


	Debug.Notification("I cannot believe this, this is a nightmare!!")
	Game.GetPlayer().SetExpressionOverride(3,100)	; Sad!!!  "That hurt like hell!"
		;MfgConsoleFunc.SetModifier(Crying, 2, 50)
		;MfgConsoleFunc.SetModifier(Crying, 3, 50)
		;MfgConsoleFunc.SetModifier(Crying, 4, 50)
		;MfgConsoleFunc.SetModifier(Crying, 5, 50)
		;MfgConsoleFunc.SetModifier(Crying, 8, 50)
		;MfgConsoleFunc.SetModifier(Crying, 12, 30)
		;MfgConsoleFunc.SetModifier(Crying, 13, 30)
		;MfgConsoleFunc.SetPhoneme(Crying, 1, 10)
		;MfgConsoleFunc.SetPhoneme(Crying, 2, 100)
		;MfgConsoleFunc.SetPhoneme(Crying, 7, 50)
		Victim.PlayIdle(IdleOrgasmFaintAfterSex2)

EndFunction