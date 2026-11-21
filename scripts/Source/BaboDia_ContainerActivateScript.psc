Scriptname BaboDia_ContainerActivateScript extends ObjectReference  


Function RetrieveBelongings()
	if bcondition && BaboEventQuest.getstage() == conditionalstage
		BaboEventQuest.setstage(queststage)
	endif
endfunction

Event Onactivate(ObjectReference akActionRef)
	if akActionRef == PlayerRef
		RetrieveBelongings()
	endif
EndEvent

Actor Property PlayerRef Auto
Quest Property BaboEventQuest Auto
int property queststage auto
int property conditionalstage auto
bool property bcondition auto