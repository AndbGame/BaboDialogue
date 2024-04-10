Scriptname BaboEventAnimalCareCreatureAlias extends ReferenceAlias  

Faction Property BaboNPCAnimating Auto
Quest Property BaboEventAnimalCare Auto

Function SetCreatureBlockState(Bool Block)
if Block
	(Self.getreference()).BlockActivation(True)
	Gotostate("BlockActivationState")
else
	(Self.getreference()).BlockActivation(False)
	Gotostate("")

endif
EndFunction

Event OnActivate(ObjectReference akActionRef)

EndEvent

State BlockActivationState

Event OnActivate(ObjectReference akActionRef)
	if BaboEventAnimalCare.getstage() == 25 && (Self.getreference() as actor).isinfaction(BaboNPCAnimating)
		(Getowningquest() as BaboEventAnimalCareWhiterunScript).QuitInspectHorse()
	endif
	if !(Self.getreference() as actor).isinfaction(BaboNPCAnimating)
		(Getowningquest() as BaboEventAnimalCareWhiterunScript).HorseTalk()
	endif
EndEvent

EndState