Scriptname BaboLoanSharkCollateralAliasScript extends ReferenceAlias  

BaboLoanSharkScript Property LSQuest Auto

Event OnActivate(ObjectReference akActionRef)
	if akActionRef == Game.GetPlayer()
		RegisterForMenu("ContainerMenu")
	endif
EndEvent

Event OnMenuClose(String MenuName)
	if MenuName == "ContainerMenu"
		UnregisterForMenu("ContainerMenu")
		ObjectReference box = GetReference()
		if box && LSQuest
			LSQuest.ProcessCollateral(box)
			LSQuest.EstimateLoanExtent()
		endif
	endif
EndEvent