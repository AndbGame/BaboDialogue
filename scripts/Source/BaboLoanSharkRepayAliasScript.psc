Scriptname BaboLoanSharkRepayAliasScript extends ReferenceAlias

; Attach to the RepayBox alias (chest in the branch office).
; Only gold is processed; other items in the box are ignored.
; While BabodebtCoolTime == 0 the chest is BlockActivation-locked;
; OnActivate still fires and shows BadLoanSharkMessagebox(10).

BaboLoanSharkScript Property LSQuest Auto

Event OnActivate(ObjectReference akActionRef)
	if akActionRef != Game.GetPlayer()
		return
	endif

	; Safety net if BlockActivation was not applied
	if !LSQuest.CanRepayPrincipal()
		LSQuest.Messagebox(10)
		return
	endif

	RegisterForMenu("ContainerMenu")
EndEvent

Event OnMenuClose(String MenuName)
	if MenuName != "ContainerMenu"
		return
	endif
	UnregisterForMenu("ContainerMenu")
	LSQuest.ProcessRepayment(Getreference())
EndEvent
