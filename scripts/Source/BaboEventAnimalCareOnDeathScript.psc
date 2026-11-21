Scriptname BaboEventAnimalCareOnDeathScript extends ReferenceAlias  

Event OnDeath(Actor akKiller)
	(Self.GetOwningQuest() as BaboEventAnimalCareMarkarthScript).OnOwnerDied(akKiller)
EndEvent