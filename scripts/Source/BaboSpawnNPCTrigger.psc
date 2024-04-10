Scriptname BaboSpawnNPCTrigger extends ObjectReference  

import game
import debug

ActorBase property myNPC auto

ObjectReference property SpawnPlace auto

EVENT onTriggerEnter(objectReference ref)
	IF ( ref as ACTOR == game.getPlayer() )
		SpawnPlace.PlaceActorAtMe(myNPC, 4)
	ENDIF

ENDEVENT
