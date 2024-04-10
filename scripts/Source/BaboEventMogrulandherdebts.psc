Scriptname BaboEventMogrulandherdebts extends Quest  

int Function MogrulWallRape(ReferenceAlias VictimRef, ReferenceAlias RaperRef)

	Actor Victim = VictimRef.GetActorReference()
	Actor Raper = RaperRef.GetActorReference()

	If BaboEvent02.getstage() <= 30

		actor[] activeActors = new actor[2]
		activeActors[0] = Victim
		activeActors[1] = Raper
		sslBaseAnimation[] anims
		anims = SexLab.GetAnimationsByTag(2, "Forced", "Wall",  TagSuppress = "Femdom, Necro")
		Victim.MoveTo(WallMarker01)
		Raper.MoveTo(WallMarker02)
		RegisterForModEvent("AnimationEnd_MogrulAfterS", "MogrulAfter")
		SexLab.StartSex(activeActors, anims, hook="MogrulAfterS")
	
	Elseif BaboEvent02.getstage() >= 30

		actor[] activeActors = new actor[2]
		activeActors[0] = Victim
		activeActors[1] = Raper
		sslBaseAnimation[] anims
		anims = SexLab.GetAnimationsByTag(3, "Missionary", "Aggressive", "Dirty", TagSuppress = "Femdom, Necro")
		RegisterForModEvent("AnimationEnd_MogrulAfterS2", "MogrulAfter2")

		debug.messagebox ("")

		SexLab.StartSex(activeActors, anims, hook="MogrulAfterS2")

	Endif

EndFunction

Event MogrulAfter(string eventName, string argString, float argNum, form sender)

Actor Victim = SexLab.HookActors(argString)[0]
Actor Raper = SexLab.HookActors(argString)[1]

	Game.EnablePlayerControls(abmenu = false)
	Victim.MoveTo(WallMarker01)
	Victim.playIdle(Femalefaint01)
	MogrulScene01.Start()
	Utility.Wait(10.0)
	Game.EnablePlayerControls(abmenu = true)

UnregisterForModEvent("AnimationEnd_MogrulAfterS")

EndEvent

Event MogrulAfter2(string eventName, string argString, float argNum, form sender)

Actor Victim = SexLab.HookActors(argString)[0]
Actor Raper = SexLab.HookActors(argString)[1]

	Game.EnablePlayerControls(abmenu = false)
	Victim.playIdle(Femalefaint02)
	MogrulScene02.Start()
	Utility.Wait(10.0)
	int AdjPoints = Utility.RandomInt(1,2)
	BaboEventMorgulSexCount.SetValue(BaboEventMorgulSexCount.GetValue() + AdjPoints)
	Game.EnablePlayerControls(abmenu = true)

UnregisterForModEvent("AnimationEnd_MogrulAfterS2")

EndEvent

Function Addbodyguards()

Bodyguard01.Enable()
Bodyguard02.Enable()
Bodyguard03.Enable()

Actor BG01 = Bodyguard01 as Actor
Actor BG02 = Bodyguard02 as Actor
Actor BG03 = Bodyguard03 as Actor

BG01.evaluatePackage()
BG02.evaluatePackage()
BG03.evaluatePackage()

ActorUtil.ClearPackageOverride(MogrulActor)
MogrulActor.evaluatePackage()

Endfunction

Function Mogrulturnintoenemy(ReferenceAlias AliasToAnger)

	Actor ActorRef = AliasToAnger.GetActorReference()
	actorRef.addtoFaction(Playerhatefaction)

	if actorRef.GetActorValue("Aggression") < 2
		actorRef.SetActorValue("Aggression", 2) 
	EndIf

	actorRef.startCombat(Game.GetPlayer())

Endfunction

Faction Property Playerhatefaction Auto
ReferenceAlias Property Mogrul Auto
Actor Property MogrulActor Auto
ReferenceAlias Property PlayerRef Auto
ObjectReference Property Bodyguard01 Auto
ObjectReference Property Bodyguard02 Auto
ObjectReference Property Bodyguard03 Auto
ObjectReference Property Wallmarker01 Auto
ObjectReference Property Wallmarker02 Auto
Quest property BaboEvent02 Auto
Scene property MogrulScene01 Auto
Scene property MogrulScene02 Auto
Idle property Femalefaint01 Auto
Idle property Femalefaint02 Auto
GlobalVariable Property BaboEventMorgulSexCount Auto
GlobalVariable Property BaboEventMorgulStage Auto
MiscObject Property Gold001 Auto
SexLabFramework Property SexLab  Auto