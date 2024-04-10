Scriptname BaboLoanSharkAliasScript extends ReferenceAlias

Bool FailDebtMessage

GlobalVariable Property BabodebtLendCount auto
GlobalVariable Property BabodebtInterestRateDay auto
GlobalVariable Property BabodebtRateSwitch auto

GlobalVariable Property BabodebtValueGlobal auto
GlobalVariable Property BabodebtLengthGlobal auto
GlobalVariable Property BabodebtPaybackMultGlobal auto
GlobalVariable Property BabodebtPaymentTermGlobal auto
GlobalVariable Property BabodebtRemainingHoursGlobal auto
GlobalVariable Property BabodebtPaybackValueGlobal auto
GlobalVariable Property BaboPunishEnslaveGlobal auto
GlobalVariable Property BaboPunishPrisonGlobal auto
GlobalVariable Property BaboPunishGlobal auto
GlobalVariable Property GameDaysPassed Auto

Book Property BaboLoanSharkDebtNote Auto
Book Property BaboLoanSharkDebtSettledNote Auto

Function IncreaseInterest()
	BabodebtInterestRateDay.setvalue(1.5)
EndFunction

function CalculateCompoundInterest()
	BabodebtPaybackValueGlobal.setvalue(BabodebtPaybackValueGlobal.getvalue() * BabodebtInterestRateDay.getvalue())
EndFunction

function pchsLSStartCountdown()
	BabodebtPaymentTermGlobal.SetValue((GameDaysPassed.GetValue() * 24) + (BabodebtLengthGlobal.GetValue() * 24))
	RegisterForSingleUpdateGameTime(24.0)
	FailDebtMessage = true
	Debug.Notification("Loansharks: You have taken a loan, your debt was set up to " + BabodebtPaybackValueGlobal.GetValue())
endFunction

function LSShutDownCountdown()
	BabodebtPaymentTermGlobal.SetValue(0)
	UnRegisterForUpdateGameTime()
	FailDebtMessage = false
	Debug.Notification("Loansharks: Your debt has been settled")
endFunction

function LSStillGoingon()
	BabodebtPaymentTermGlobal.SetValue(0)
	if FailDebtMessage
		Debug.Messagebox("You realized you failed to pay back your debt in time. I'd better visit the head master of Loanshark organization ASAP.")
		FailDebtMessage = false
	endif
endFunction

function LSSoldAsSlave()
	Debug.MessageBox("You have failed to return back money owned to the Loansharks organization. You turned yourself into their hands. Your fate is not in your hands anymore..")
	sendModEvent("SSLV Entry")
endFunction

Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
	if akBaseItem == BaboLoanSharkDebtNote
		pchsLSStartCountdown()
	elseIf akBaseItem == BaboLoanSharkDebtSettledNote
		LSShutDownCountdown()
	endIf
EndEvent

Event OnUpdateGameTime()
	float end = Math.Ceiling(BabodebtPaymentTermGlobal.GetValue() - (GameDaysPassed.GetValue() * 24))
	BabodebtRemainingHoursGlobal.SetValue(end)

	if BabodebtPaybackValueGlobal.getvalue() > 0
		if (end <= 0)
			BaboPunishGlobal.setvalue(1)
			;if (BaboPunishEnslaveGlobal.GetValue() == 1 && BaboPunishPrisonGlobal.GetValue() == 1)
			;endIf
			
			LSStillGoingon()
			
			if BabodebtPaybackValueGlobal.GetValue() > 0
				if BabodebtRateSwitch.getvalue() == 1
					IncreaseInterest()
					CalculateCompoundInterest()
				endif
			endIf
		else
			if BabodebtPaybackValueGlobal.GetValue() > 0
				if BabodebtRateSwitch.getvalue() == 1
					CalculateCompoundInterest()
				endif
			endIf
		EndIf
	endif

	RegisterForSingleUpdateGameTime(24.0)
EndEvent
