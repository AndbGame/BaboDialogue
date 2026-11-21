Scriptname BaboEventAnimalCareMarkarthAlias extends ReferenceAlias  

{Where player can kill the pet}
Actor Property PlayerRef Auto
Faction Property BaboNPCAnimating Auto
Quest Property BaboEventAnimalCareMarkarth Auto

Event OnDeath(Actor akKiller)
	(Getowningquest() as BaboEventAnimalCareMarkarthScript).OnPetDied(akKiller)
EndEvent

Function SetCreatureBlockState(Bool Block)
	;Debug.messagebox("Test A")
if Block
	self.getreference().BlockActivation()
	Gotostate("BlockActivationState")
else
	self.getreference().BlockActivation(false)
	Gotostate("")
endif
EndFunction

Event OnActivate(ObjectReference akActionRef)
	;Debug.messagebox("Test B")
EndEvent

State BlockActivationState

Event OnActivate(ObjectReference akActionRef)
	;Debug.messagebox("Test C")
	(Getowningquest() as BaboEventAnimalCareMarkarthScript).PetTalk()
EndEvent

EndState