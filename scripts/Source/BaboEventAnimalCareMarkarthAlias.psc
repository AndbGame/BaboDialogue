Scriptname BaboEventAnimalCareMarkarthAlias extends ReferenceAlias  

Int Property StartStage auto
Int Property EndStage auto
Int Property EndStageB auto

Faction Property BaboNPCAnimating Auto
Quest Property BaboEventAnimalCareMarkarth Auto

Event OnDeath(Actor akKiller)
	If GetOwningQuest().GetStage() == StartStage
		Self.GetOwningQuest().SetStage(EndStage)
	else
		Self.GetOwningQuest().SetStage(EndStageB)
	EndIf
EndEvent

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
	;if BaboEventAnimalCareMarkarth.getstage() == 25 && (Self.getreference() as actor).isinfaction(BaboNPCAnimating)
	;	(Getowningquest() as BaboEventAnimalCareMarkarthScript).QuitInspectHorse()
	;endif
	;if !(Self.getreference() as actor).isinfaction(BaboNPCAnimating)
	;	(Getowningquest() as BaboEventAnimalCareMarkarthScript).HorseTalk()
	;endif
EndEvent

EndState