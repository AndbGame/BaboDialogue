Scriptname BaboLoanSharkAliasScript extends ReferenceAlias

String LSStringFile = "../BaboDialogue/BakaStrings.json"

Bool FailDebtMessage

; Days elapsed while a loan is active (for collector schedule / UI)
int LoanDayCount

GlobalVariable Property BabodebtLendCount auto
GlobalVariable Property BabodebtInterestRateDay auto
GlobalVariable Property BabodebtInterestPercentGlobal auto
GlobalVariable Property BabodebtRateSwitch auto

; Count of missed weekly interest payments (collector visit, player could not pay)
GlobalVariable Property BabodebtMissedInterestCount auto

GlobalVariable Property BabodebtValueGlobal auto
GlobalVariable Property BabodebtLengthGlobal auto
GlobalVariable Property BabodebtPaybackMultGlobal auto
GlobalVariable Property BabodebtPaymentTermGlobal auto
GlobalVariable Property BabodebtRemainingHoursGlobal auto
GlobalVariable Property BabodebtPaybackValueGlobal auto
GlobalVariable Property BaboPunishEnslaveGlobal auto
GlobalVariable Property BaboPunishPrisonGlobal auto
GlobalVariable Property BaboPunishGlobal auto
; 0 = waiting; set to 1 when a 7-day cycle elapses (collector visit ready)
GlobalVariable Property BaboEventLoanSharkCollectInterestReady auto
; 0 = cannot repay principal yet; 1 = at least 7 days passed since loan start
GlobalVariable Property BabodebtCoolTime auto
GlobalVariable Property GameDaysPassed Auto
GlobalVariable Property BaboLoanSharkFreezeUntilDay Auto
GlobalVariable Property BaboEncounter06BEndVariable Auto

Book Property BaboLoanSharkDebtNote Auto
Book Property BaboLoanSharkDebtSettledNote Auto

String Function GetLSString(String fkey)
	return JsonUtil.GetStringValue(LSStringFile, fkey)
EndFunction

function CalculateCompoundInterest()
	BabodebtPaybackValueGlobal.setvalue(BabodebtPaybackValueGlobal.getvalue() * BabodebtInterestRateDay.getvalue())
	BaboLoanSharkScript main = GetOwningQuest() as BaboLoanSharkScript
	if main
		main.UpdateDebtInterestGlobal()
	endif
EndFunction

; True when accrued interest alone exceeds original principal.
; interestOnly = PaybackValue - ValueGlobal. Side effects are handled on Main by the collector quest.
Bool Function InterestExceedsPrincipal()
	float principal = BabodebtValueGlobal.GetValue()
	if principal <= 0.0
		return false
	endif
	float interestOnly = BabodebtPaybackValueGlobal.GetValue() - principal
	return interestOnly > principal
EndFunction

; Stop weekly collector cycle without treating the debt as settled.
Function StopCollectorSchedule()
	BabodebtPaymentTermGlobal.SetValue(0)
	BabodebtRemainingHoursGlobal.SetValue(0)
	BaboEventLoanSharkCollectInterestReady.SetValue(0)
	UnRegisterForUpdateGameTime()
	FailDebtMessage = false
EndFunction

; New 7-day week (punish start). Zero LoanDayCount: 4-day grace, then daily interest; Ready every 7 days.
Function RestartCollectorWeek()
	LoanDayCount = 0
	BaboEventLoanSharkCollectInterestReady.SetValue(0)
	BabodebtLengthGlobal.SetValue(7.0)
	BabodebtPaymentTermGlobal.SetValue((GameDaysPassed.GetValue() * 24) + (7.0 * 24))
	BabodebtRemainingHoursGlobal.SetValue(7.0 * 24.0)
	UnRegisterForUpdateGameTime()
	RegisterForSingleUpdateGameTime(24.0)
EndFunction

function pchsLSStartCountdown()
	LoanDayCount = 0
	BabodebtCoolTime.SetValue(0)
	; 7-day window marker for collector schedule / remaining-time UI
	BabodebtLengthGlobal.SetValue(7.0)
	BabodebtPaymentTermGlobal.SetValue((GameDaysPassed.GetValue() * 24) + (7.0 * 24))
	RegisterForSingleUpdateGameTime(24.0)
	FailDebtMessage = true
	Debug.Notification(GetLSString("baboloanshark_11") + BabodebtPaybackValueGlobal.GetValue())
endFunction

function LSShutDownCountdown()
	LoanDayCount = 0
	BabodebtPaymentTermGlobal.SetValue(0)
	BabodebtCoolTime.SetValue(0)
	UnRegisterForUpdateGameTime()
	FailDebtMessage = false
	Debug.Notification(GetLSString("baboloanshark_5"))
endFunction

; Not Linked Yet
function LSStillGoingon()
	if FailDebtMessage
		Debug.Messagebox(GetLSString("baboloanshark_14"))
		FailDebtMessage = false
	endif
endFunction

; Not Linked Yet
function LSSoldAsSlave()
	Debug.MessageBox(GetLSString("baboloanshark_1"))
	sendModEvent("SSLV Entry")
endFunction

; DebtNote OnItemAdded removed ??Main calls pchsLSStartCountdown / LSShutDownCountdown via PlayerAlias

; Once per game-day while debt remains:
; Apply daily compound interest only (if rate switch is on).
; Interest vs principal is resolved by the collector quest via Main.HandleCollectorInterestOverPrincipal().
Event OnUpdateGameTime()
	if BabodebtPaybackValueGlobal.GetValue() <= 0
		RegisterForSingleUpdateGameTime(24.0)
		return
	endif

	LoanDayCount += 1
	if BaboLoanSharkFreezeUntilDay.GetValue() > 0.0 && GameDaysPassed.GetValue() >= BaboLoanSharkFreezeUntilDay.GetValue()
		BaboLoanSharkFreezeUntilDay.SetValue(0)
		BaboEncounter06BEndVariable.SetValue(10)
	endif

	; Remaining hours until the next 7-day collector window (UI only)
	int daysUntilVisit = 7 - (LoanDayCount % 7)
	if (LoanDayCount % 7) == 0
		daysUntilVisit = 0
	endif
	BabodebtRemainingHoursGlobal.SetValue((daysUntilVisit as float) * 24.0)

	; Grace only for the first 4 days after the loan starts. After that, every day.
	if BabodebtRateSwitch.GetValue() == 1 && LoanDayCount > 4 && BaboLoanSharkFreezeUntilDay.GetValue() == 0.0
		CalculateCompoundInterest()
	endif

	; When a full week elapses, refresh the term marker and flag collector visit.
	; Unlock principal repayment (BabodebtCoolTime = 1).
	if (LoanDayCount % 7) == 0
		BabodebtCoolTime.SetValue(1)
		; Unlock repay chest on main quest
		BaboLoanSharkScript mainLS = GetOwningQuest() as BaboLoanSharkScript
		if mainLS
			mainLS.UpdateRepayBoxLock()
		endif
		BabodebtPaymentTermGlobal.SetValue((GameDaysPassed.GetValue() * 24) + (7.0 * 24))
		if BaboEventLoanSharkCollectInterestReady.GetValue() == 0.0
			BaboEventLoanSharkCollectInterestReady.SetValue(1.0)
		endif
	endif

	RegisterForSingleUpdateGameTime(24.0)
EndEvent
