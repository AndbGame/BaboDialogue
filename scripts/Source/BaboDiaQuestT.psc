Scriptname BaboDiaQuest extends Quest  

function RapeFemalePlayer(ReferenceAlias Adventurer)

	Actor ActorRef = Adventurer.GetActorReference()

	actor[] sexActors = new actor[2]
	sexActors[0] = Game.GetPlayer()
	sexActors[1] = ActorRef
	sslBaseAnimation[] anims
	anims = SexLab.GetAnimationsByTag(2, "Forcing", "Aggressive")
	SexLab.StartSex(sexActors, anims, victim=sexActors[0])

EndFunction

SexLabFramework Property SexLab  Auto 