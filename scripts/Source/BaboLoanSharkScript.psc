Scriptname BaboLoanSharkScript extends Quest  

; Same path as BaboMsgManager for notification strings
String LSStringFile = "../BaboDialogue/BakaStrings.json"

Actor Property PlayerRef Auto
ActorBase Property BaboProstituteCustomerMale01 Auto
ActorBase Property BaboLoanSharkThugsCustomer Auto
Actor Property TeleportActor Auto
GlobalVariable Property BaboLSDebt auto
Book Property BaboLoanSharkBodyWaiver Auto
GlobalVariable Property BaboLoanSharkBodyWaiverGlobal Auto
GlobalVariable Property BaboPlayerAppearanceCriteriaAverage Auto
Book Property BaboLoanSharkDebtNote Auto
Book Property BaboLoanSharkDebtSettledNote Auto
MiscObject Property Gold001 Auto
GlobalVariable Property BabodebtValueGlobal auto
; Principal at loan start. Does not drop when principal is repaid.
GlobalVariable Property BabodebtOriginalPrincipalGlobal Auto
; Accrued interest = Payback - remaining principal. Never below 0.
GlobalVariable Property BabodebtInterestGlobal Auto
GlobalVariable Property BabodebtPaybackValueGlobal auto
; Payback total at last weekly settle / week boundary (for this-week interest only)
GlobalVariable Property BabodebtPaybackSnapshotGlobal Auto
; This collector visit: Payback - Snapshot (one week of growth)
GlobalVariable Property BaboWeeklyInterestDueGlobal Auto
GlobalVariable Property BaboPunishGlobal auto
GlobalVariable Property GameHour Auto
GlobalVariable Property BaboEventLoanSharkThugs Auto
GlobalVariable Property BaboGlobalLoanSharkSlaveTitle Auto
GlobalVariable Property BaboSimpleSlavery Auto
GlobalVariable Property BaboSimpleSlaveryChance Auto
GlobalVariable Property BaboFHU Auto

GlobalVariable Property BaboLoanSharkSoldPlayer  Auto
GlobalVariable Property BaboLoanSharkSoldPlayerCount  Auto
GlobalVariable Property BabodebtInterestRateDay Auto
; Percent form of daily interest for note text (5/10/15/20), not the multiplier
GlobalVariable Property BabodebtInterestPercentGlobal Auto
; Missed weekly interest payments
GlobalVariable Property BabodebtMissedInterestCount Auto
; Final debt defaults (player-acknowledged)
GlobalVariable Property BabodebtFailCount Auto
GlobalVariable Property BabodebtLengthGlobal Auto
; 0 = principal repayment locked; 1 = at least 7 days since loan (can repay)
GlobalVariable Property BabodebtCoolTime Auto
GlobalVariable Property BabodebtPaybackValueLimitGlobal Auto ; unused for now (GoforSell uses debt>20000 && >=3x original principal);50000gold
GlobalVariable Property BaboLoanSharkGoforSell Auto
; Guild bounty only. Not hold CrimeGold.
GlobalVariable Property BaboLoanSharkBountyGlobal Auto
; E06 remaining visits: ceil(bounty / 2000) at first LSSetBounty, E06 ConsumeVisit lowers it
GlobalVariable Property BaboEncounter06VisitCount Auto
; 0 consensual, 1 non-con. Scene 1/3 begin still rolls this.
GlobalVariable Property BaboEventLoanSharkSexType Auto

; MCM cap for extra loans. Not written by EstimateLoanExtent.
GlobalVariable Property BaboPossibleLoanGlobal Auto
; Lifetime / contract loan accept count. +1 on AcceptLoanOption and LSCustomLoan.
GlobalVariable Property BabodebtLendCount Auto

ObjectReference Property BaboLoanSharkXmarkerRef Auto
ObjectReference Property BaboLoanSharkReceptionXmarkerRef01 Auto
ObjectReference Property BaboLoanSharkReceptionXmarkerRef02 Auto
ObjectReference Property BaboLoanSharkReceptionXmarkerRef03 Auto
ObjectReference Property BaboLoanSharkReceptionXmarkerRef04 Auto
ObjectReference Property BaboLoanSharksXmarker02 Auto
ObjectReference Property BaboRiftenDumpingMarker Auto
Quest Property BaboLoanSharks Auto
Quest Property BaboSexController Auto

Referencealias Property LoanSharkBoss Auto
Referencealias Property CustomerA Auto
Referencealias Property CustomerB Auto
Referencealias Property CustomerC Auto
; Collateral deposit box alias (BaboLoanSharkCollateralAliasScript)
ReferenceAlias Property DepositBoxAlias Auto

; Player alias with BaboLoanSharkAliasScript (countdown / daily interest)
ReferenceAlias Property PlayerAlias Auto
; Repay chest alias (BaboLoanSharkRepayAliasScript)
ReferenceAlias Property RepayBoxAlias Auto


sslActorStats Property ActorStats Auto
BaboDiaMonitorScript property BDMScript Auto
BaboReputationMasterScript Property BRMQuest Auto

Faction Property BaboFactionLoanSharkSlaveTitle Auto

Faction Property CrimeFactionEastmarch Auto
Faction Property CrimeFactionFalkreath Auto
Faction Property CrimeFactionRift Auto
Faction Property CrimeFactionHaafingar Auto
Faction Property CrimeFactionHjaalmarch Auto
Faction Property CrimeFactionReach Auto
Faction Property CrimeFactionPale Auto
Faction Property CrimeFactionWhiterun Auto
Faction Property CrimeFactionWinterhold Auto

Message Property BaboLoanSharkProstituteRoundMsg Auto
Message Property BaboLoanSharkBrothelFirstRoundMsg Auto
Message Property BaboLoanSharkBrothelSecondRoundMsg Auto
Message Property BaboLoanSharkBrothelEnd Auto
Message Property BaboLoanSharkProstituteEnd Auto
Message Property BaboLoanSharkProstituteEndSSLV Auto
Message Property BaboLoanSharkSoldEnd Auto
Message Property BaboLoanSharkLoanSelectMsg Auto
Message Property BaboLoanSharkExtraLoanSelectMsg Auto
Topic Property Babo_LoanShark_LendMoneyBranch_Goodbye Auto

Quest Property BaboSceneController Auto
Quest Property BaboMsgScript Auto
GlobalVariable Property BaboLoanSharkFreezeUntilDay Auto
GlobalVariable Property BaboEncounter06BEndVariable Auto
Int Property BaboLoanSharkJailGoldPerDay = 10 Auto
Float Property BaboLoanSharkJailLevelCarry = 0.0 Auto
ObjectReference Property BaboLoanSharksXmarker01 Auto
ObjectReference Property BaboLoanSharkPrisonXmarker Auto
Quest Property BaboLoanSharksManageNote Auto

; Chest used when confiscating items (prostitution / punishment scenes)
ObjectReference Property BaboLoanSharkConfiscatedChestRef Auto
; Active collateral storage while a loan is outstanding (never deleted)
ObjectReference Property BaboLoanSharkCollateralChestRef Auto
; Seized collateral after default (recoverable via MCM debug)
ObjectReference Property BaboLoanSharkRemovedCollateralChestRef Auto
; FormList of standard collateral (gems, ingots, etc.) - counted at gold value x2
FormList Property BaboLoanSharkCollateralList Auto
; Premium collateral (dragon bones, daedric materials, etc.) - counted at gold value x5
FormList Property BaboLoanSharkCollateralValuableList Auto

Actor[] Property BaboCustomerActors Auto

Actor Property BaboCustomerOrcDummyRef Auto
Actor Property BaboCustomerNordDummyRef Auto
Actor Property BaboCustomerImperialDummyRef Auto
Actor Property BaboCustomerArgonianDummyRef Auto
Actor Property BaboCustomerKhajiitDummyRef Auto

Keyword Property BaboLoanSharksKeyword Auto
Keyword Property BaboKidnapCallKeyword Auto

; Guild factions for loan estimate (elseif priority: TG > Companions > College)
Faction Property ThievesGuildFaction Auto
Faction Property CompanionsFaction Auto
Faction Property CollegeOfWinterholdFaction Auto

; Cached gold value of accepted collateral after ProcessCollateral
float Property CollateralValue Auto Hidden
; Cached EstimateLoanExtent result. First-loan options use this, not PossibleLoan.
float Property LastEstimatedLoanValue Auto Hidden
; First LSSetBounty values; ResetBountyToInitial restores them
Bool Property BountyInitialized Auto Hidden
Int Property InitialBounty Auto Hidden
Int Property InitialVisitCount Auto Hidden


Bool Function ScenePlay(int i, bool bplay)
	Return (BaboSceneController as BaboSceneManager).EventLoanSharkScenePlay(i, bplay)
EndFunction


; Returns true if item is accepted collateral:
; - ValuableList / CollateralList, OR base gold value > 1000
Bool Function IsAcceptedCollateral(Form akItem)
	if !akItem
		return false
	endif
	if BaboLoanSharkCollateralValuableList && BaboLoanSharkCollateralValuableList.HasForm(akItem)
		return true
	endif
	if BaboLoanSharkCollateralList && BaboLoanSharkCollateralList.HasForm(akItem)
		return true
	endif
	if akItem.GetGoldValue() > 1000
		return true
	endif
	return false
EndFunction

; Multiplier: ValuableList x5, CollateralList x2, high-value fallback x1
float Function GetCollateralItemValue(Form akItem, int count)
	if !akItem || count <= 0
		return 0.0
	endif
	float base = (akItem.GetGoldValue() as float) * count
	if BaboLoanSharkCollateralValuableList && BaboLoanSharkCollateralValuableList.HasForm(akItem)
		return base * 5.0
	endif
	if BaboLoanSharkCollateralList && BaboLoanSharkCollateralList.HasForm(akItem)
		return base * 2.0
	endif
	return base
EndFunction

; Filter items in the deposit container:
; accepted -> move to CollateralChest and add weighted value; rejected -> return to player
Function ProcessCollateral(ObjectReference akSourceContainer)
	CollateralValue = 0.0

	if !akSourceContainer
		return
	endif

	int i = akSourceContainer.GetNumItems()
	while i > 0
		i -= 1
		Form item = akSourceContainer.GetNthForm(i)
		if item
			int count = akSourceContainer.GetItemCount(item)
			if count > 0
				if IsAcceptedCollateral(item)
					CollateralValue += GetCollateralItemValue(item, count)
					if BaboLoanSharkCollateralChestRef
						akSourceContainer.RemoveItem(item, count, true, BaboLoanSharkCollateralChestRef)
					else
						akSourceContainer.RemoveItem(item, count, true, PlayerRef)
					endif
				else
					akSourceContainer.RemoveItem(item, count, true, PlayerRef)
				endif
			endif
		endif
	endwhile
EndFunction


Function ReturnCollateral()
	if BaboLoanSharkCollateralChestRef
		BaboLoanSharkCollateralChestRef.RemoveAllItems(PlayerRef, true, true)
	endif
	CollateralValue = 0.0
EndFunction

; MCM/debug: return seized collateral and confiscated-chest items to the player
Function RecoverCollateralFromDebug()
	if BaboLoanSharkRemovedCollateralChestRef
		BaboLoanSharkRemovedCollateralChestRef.RemoveAllItems(PlayerRef, true, true)
	endif
	; Also return the old confiscation chest contents
	if BaboLoanSharkConfiscatedChestRef
		BaboLoanSharkConfiscatedChestRef.RemoveAllItems(PlayerRef, true, true)
	endif
	CollateralValue = 0.0
EndFunction

; On default: move active collateral into RemovedCollateralChest (do not delete)
Function ConfiscateCollateral()
	if BaboLoanSharkCollateralChestRef
		BaboLoanSharkCollateralChestRef.RemoveAllItems(BaboLoanSharkRemovedCollateralChestRef, true, true)
	endif
	CollateralValue = 0.0
EndFunction

; Compute max first loan from reputation, appearance, Dragonborn, guild, collateral.
; Does not write BaboPossibleLoanGlobal (MCM cap). Minimum 2000.
Function EstimateLoanExtent()
	float LoanValue = 0.0

	; ========== 1. Reputation ==========
	float ReputationBonus = 0.0
	GlobalVariable repGV = (BaboSexController as BaboSexControllerManager).BaboReputation
	if repGV
		ReputationBonus = repGV.GetValue() * 50.0
	endif
	LoanValue += ReputationBonus

	; ========== 2. Appearance ==========
	int AppearanceScore = (BaboSexController as BaboSexControllerManager).AppearanceCalc()
	float AppearanceBonus = AppearanceScore as float * 150.0
	LoanValue += AppearanceBonus

	; ========== 3. Dragonborn (MQ104 The Dragon Rising completed) ==========
	Quest MQ104 = Game.GetFormFromFile(0x0002610C, "Skyrim.esm") as Quest
	if MQ104 && MQ104.IsCompleted()
		LoanValue += 5000.0
	endif

	; ========== 4. Guild membership (no stacking; highest bonus wins) ==========
	; Priority: Thieves Guild > Companions > College. Dark Brotherhood excluded.
	if ThievesGuildFaction && PlayerRef.IsInFaction(ThievesGuildFaction)
		LoanValue += 2000.0
	elseif CompanionsFaction && PlayerRef.IsInFaction(CompanionsFaction)
		LoanValue += 1500.0
	elseif CollegeOfWinterholdFaction && PlayerRef.IsInFaction(CollegeOfWinterholdFaction)
		LoanValue += 1500.0
	endif

	; ========== 5. Collateral (cached value * 5 after ProcessCollateral) ==========
	LoanValue += CollateralValue * 5.0

	; ========== Minimum floor 2000 ==========
	if LoanValue < 2000.0
		LoanValue = 2000.0
	endif

	; First meeting -> stage 5
	if BaboLoanSharks && BaboLoanSharks.GetStage() == 0
		BaboLoanSharks.SetStage(5)
	endif

	LastEstimatedLoanValue = LoanValue
	ShowLoanSelectMessage(LoanValue)
EndFunction

; CK Message body example (printf-style, fills Show args in order):
;   Minimum: %.0f gold (5%% / day)
;   Low: %.0f gold (10%% / day)
;   Mid: %.0f gold (15%% / day)
;   Maximum: %.0f gold (20%% / day)
; Buttons: Minimum / Low / Mid / Maximum / Cancel
; Note: args do NOT appear on button labels, only in body text.
Function ShowLoanSelectMessage(float possibleAmount = 0.0)
	if possibleAmount > 0.0
		LastEstimatedLoanValue = possibleAmount
	endif
	if HasActiveDebt()
		ShowExtraLoanSelectMessage()
		return
	endif
	if !BaboLoanSharkLoanSelectMsg
		return
	endif

	float opt1 = GetLoanOptionAmount(1)
	float opt2 = GetLoanOptionAmount(2)
	float opt3 = GetLoanOptionAmount(3)
	float opt4 = GetLoanOptionAmount(4)

	int choice = BaboLoanSharkLoanSelectMsg.Show(opt1, opt2, opt3, opt4)

	if choice == 0
		AcceptLoanOption(1)
	elseif choice == 1
		AcceptLoanOption(2)
	elseif choice == 2
		AcceptLoanOption(3)
	elseif choice == 3
		AcceptLoanOption(4)
	else
		LoanSharkBoss.GetActorReference().Say(Babo_LoanShark_LendMoneyBranch_Goodbye)
	endif
EndFunction

; TIF extra loan: (GetOwningQuest() as BaboLoanSharkScript).ShowExtraLoanSelectMessage()
; Gate the topic with CanOfferExtraLoan() == 1
Function ShowExtraLoanSelectMessage()
	if !CanOfferExtraLoan()
		return
	endif
	if !BaboLoanSharkExtraLoanSelectMsg
		return
	endif

	float opt1 = GetLoanOptionAmount(1)
	float opt2 = GetLoanOptionAmount(2)
	float opt3 = GetLoanOptionAmount(3)
	float opt4 = GetLoanOptionAmount(4)

	int choice = BaboLoanSharkExtraLoanSelectMsg.Show(opt1, opt2, opt3, opt4)

	if choice == 0
		AcceptLoanOption(1)
	elseif choice == 1
		AcceptLoanOption(2)
	elseif choice == 2
		AcceptLoanOption(3)
	elseif choice == 3
		AcceptLoanOption(4)
	else
		LoanSharkBoss.GetActorReference().Say(Babo_LoanShark_LendMoneyBranch_Goodbye)
	endif
EndFunction

Bool Function HasActiveDebt()
	if BabodebtPaybackValueGlobal && BabodebtPaybackValueGlobal.GetValue() > 0.0
		return true
	endif
	if BabodebtOriginalPrincipalGlobal && BabodebtOriginalPrincipalGlobal.GetValue() > 0.0
		return true
	endif
	return false
EndFunction

int Function GetLendCount()
	if BabodebtLendCount
		return BabodebtLendCount.GetValue() as int
	endif
	return 0
EndFunction

Function BumpLendCount()
	if BabodebtLendCount
		BabodebtLendCount.SetValue((GetLendCount() + 1) as float)
	endif
EndFunction

; Original principal past the MCM cap. Dialogue warning, not an auto-reject.
Bool Function IsOverLoanCap()
	if !BaboPossibleLoanGlobal || !BabodebtOriginalPrincipalGlobal
		return false
	endif
	return BabodebtOriginalPrincipalGlobal.GetValue() > BaboPossibleLoanGlobal.GetValue()
EndFunction

; After Original > cap and at least one extra loan already taken, dialogue blocks more lending.
Bool Function CanOfferExtraLoan()
	if IsOverLoanCap() && GetLendCount() >= 2
		return false
	endif
	return true
EndFunction

; First loan: 2000 / estimate/3 / estimate*2/3 / estimate.
; Extra loan: (Original/3) * 1/4, 2/4, 3/4, 1.
; PossibleLoan is the extra-loan warning cap only.
float Function GetLoanOptionAmount(int optionIndex)
	if HasActiveDebt()
		float A = 0.0
		if BabodebtOriginalPrincipalGlobal
			A = BabodebtOriginalPrincipalGlobal.GetValue()
		endif
		float cap = A / 3.0
		if optionIndex == 1
			return cap * 0.25
		elseif optionIndex == 2
			return cap * 0.5
		elseif optionIndex == 3
			return cap * 0.75
		endif
		return cap
	endif

	float possible = LastEstimatedLoanValue
	if possible < 2000.0 && BaboPossibleLoanGlobal
		possible = BaboPossibleLoanGlobal.GetValue()
	endif
	if possible < 2000.0
		possible = 2000.0
	endif

	if optionIndex == 1
		return 2000.0
	elseif optionIndex == 2
		float opt2 = possible / 3.0
		if opt2 < 2000.0
			opt2 = 2000.0
		endif
		return opt2
	elseif optionIndex == 3
		float opt3 = possible * 2.0 / 3.0
		if opt3 < 2000.0
			opt3 = 2000.0
		endif
		return opt3
	endif
	return possible
EndFunction


; Access player-alias debt timer script
BaboLoanSharkAliasScript Function GetPlayerDebtAlias()
	if PlayerAlias
		return PlayerAlias as BaboLoanSharkAliasScript
	endif
	return None
EndFunction

; Start daily countdown + collector schedule (do not rely on DebtNote OnItemAdded)
Function RestartCollectorWeek()
	BaboLoanSharkAliasScript als = GetPlayerDebtAlias()
	if als
		als.RestartCollectorWeek()
	endif
EndFunction

Function StartDebtCountdown()
	BaboLoanSharkAliasScript als = GetPlayerDebtAlias()
	if als
		als.pchsLSStartCountdown()
	endif
	; CoolTime starts at 0 ??lock principal repay chest
	UpdateRepayBoxLock()
EndFunction

; Stop countdown when debt is fully cleared
Function StopDebtCountdown()
	BaboLoanSharkAliasScript als = GetPlayerDebtAlias()
	if als
		als.LSShutDownCountdown()
	endif
	UpdateRepayBoxLock()
EndFunction

; Strip debt paperwork from player inventory
Function ClearDebtNotes()
;	int n = PlayerRef.GetItemCount(BaboLoanSharkDebtNote)
;		if n > 0
			PlayerRef.RemoveItem(BaboLoanSharkDebtNote, 99, true)
;		endif
;	int n = PlayerRef.GetItemCount(BaboLoanSharkDebtSettledNote)
;		if n > 0
			PlayerRef.RemoveItem(BaboLoanSharkDebtSettledNote, 99, true)
;		endif
EndFunction

; Align snapshot to current total owed (loan start, after full weekly pay, week skip)
; True when BabodebtCoolTime == 1 (7+ days since loan start)
Bool Function CanRepayPrincipal()
	return BabodebtCoolTime.GetValue() as int == 1
EndFunction

; Block / unblock the repay chest based on CoolTime (0 = locked)
Function UpdateRepayBoxLock()
	ObjectReference box = RepayBoxAlias.GetReference()
	if CanRepayPrincipal()
		box.BlockActivation(false)
	else
		box.BlockActivation(true)
	endif
EndFunction

Function SyncPaybackSnapshot()
	BabodebtPaybackSnapshotGlobal.SetValue(BabodebtPaybackValueGlobal.GetValue())
EndFunction

; Keep snapshot from exceeding payback after collateral/principal reductions
Function ClampPaybackSnapshot()
	float payback = BabodebtPaybackValueGlobal.GetValue()
	if BabodebtPaybackSnapshotGlobal.GetValue() > payback
		BabodebtPaybackSnapshotGlobal.SetValue(payback)
	endif
EndFunction

; This week's interest only = growth since last snapshot. Writes BaboWeeklyInterestDueGlobal.
float Function UpdateWeeklyInterestDue()
	float due = BabodebtPaybackValueGlobal.GetValue() - BabodebtPaybackSnapshotGlobal.GetValue()
	if due < 0.0
		due = 0.0
	endif
	BaboWeeklyInterestDueGlobal.SetValue(due)
	UpdateDebtInterestGlobal()
	return due
EndFunction

; Forgive half of outstanding interest (Payback - remaining principal). Principal and rate untouched. Called from TIF.
Function HalveInterest()
	float payback = BabodebtPaybackValueGlobal.GetValue()
	float interest = payback - BabodebtValueGlobal.GetValue()
	if interest <= 0.0
		return
	endif
	BabodebtPaybackValueGlobal.SetValue(payback - ((interest / 2.0) as int))
	ClampPaybackSnapshot()
	UpdateWeeklyInterestDue()
EndFunction

; Payback - remaining principal. Floor at 0.
; Dialogue: InterestGlobal > OriginalPrincipal when compound interest exceeds the original loan.
Function UpdateDebtInterestGlobal()
	if !BabodebtInterestGlobal
		return
	endif
	float interest = BabodebtPaybackValueGlobal.GetValue() - BabodebtValueGlobal.GetValue()
	if interest < 0.0
		interest = 0.0
	endif
	BabodebtInterestGlobal.SetValue(interest)
EndFunction

; Player pays this week's interest (gold from inventory). Returns true if fully paid.
; money <= 0 means pay the full weekly due. Only Payback is reduced; Snapshot stays put so
; remaining due = (Payback - pay) - Snapshot. On full pay, SyncPaybackSnapshot().
Bool Function PayWeeklyInterest(int money)
	float weeklyDue = UpdateWeeklyInterestDue()
	int dueInt = weeklyDue as int
	if dueInt <= 0
		SyncPaybackSnapshot()
		return true
	endif

	int pay = money
	if pay <= 0
		pay = dueInt
	endif
	if pay > dueInt
		pay = dueInt
	endif

	int have = PlayerRef.GetItemCount(Gold001)
	if have < pay
		pay = have
	endif
	if pay <= 0
		return false
	endif

	PlayerRef.RemoveItem(Gold001, pay)
	BabodebtPaybackValueGlobal.SetValue(BabodebtPaybackValueGlobal.GetValue() - (pay as float))
	UpdateWeeklyInterestDue()

	if (UpdateWeeklyInterestDue() as int) <= 0
		SyncPaybackSnapshot()
		return true
	endif
	return false
EndFunction

; Credit gold already taken by collectors. Does not RemoveItem from the player.
Function ApplyDebtCredit(int pay)
	int debt = BabodebtPaybackValueGlobal.GetValue() as int
	if pay <= 0 || debt <= 0
		return
	endif
	if pay > debt
		pay = debt
	endif

	int principal = BabodebtValueGlobal.GetValue() as int
	int interestOnly = debt - principal
	if interestOnly < 0
		interestOnly = 0
	endif
	if pay > interestOnly
		principal = principal - (pay - interestOnly)
		if principal < 0
			principal = 0
		endif
		BabodebtValueGlobal.SetValue(principal as float)
	endif

	int remaining = debt - pay
	BabodebtPaybackValueGlobal.SetValue(remaining as float)
	ClampPaybackSnapshot()
	UpdateWeeklyInterestDue()
EndFunction

; Week boundary without collecting: only charge next week's new growth (unpaid stays inside Payback)
Function AdvanceWeeklySnapshot()
	SyncPaybackSnapshot()
	BaboWeeklyInterestDueGlobal.SetValue(0)
EndFunction



; Apply one of the 4 loan options.
; 1 = min 2000 / 5% (1.05)
; 2 = Possible * 1/3 / 10% (1.10)
; 3 = Possible * 2/3 / 15% (1.15)
; 4 = full Possible / 20% (1.20)
; Daily compound interest via AliasScript OnUpdateGameTime (PaybackValue *= InterestRateDay)
; Apply one of the 4 loan options.
; First loan: 2000 / Possible/3 / Possible*2/3 / Possible.
; Extra loan stacks onto current debt. Amounts are Original/3 * 1/4..1.
Function AcceptLoanOption(int optionIndex)
	float loanAmount = GetLoanOptionAmount(optionIndex)
	if loanAmount < 1.0
		return
	endif

	float interestMult = 1.05
	if optionIndex == 2
		interestMult = 1.10
	elseif optionIndex == 3
		interestMult = 1.15
	elseif optionIndex == 4
		interestMult = 1.20
	endif

	if HasActiveDebt()
		LSCustomLoan(loanAmount, interestMult)
		PlayerRef.AddItem(Gold001, loanAmount as int)
		return
	endif

	BabodebtValueGlobal.SetValue(loanAmount)
	if BabodebtOriginalPrincipalGlobal
		BabodebtOriginalPrincipalGlobal.SetValue(loanAmount)
	endif
	BabodebtInterestRateDay.SetValue(interestMult)

	if BabodebtInterestPercentGlobal
		BabodebtInterestPercentGlobal.SetValue(((interestMult - 1.0) * 100.0) as int)
	endif
	BabodebtPaybackValueGlobal.SetValue(loanAmount)

	PlayerRef.AddItem(Gold001, loanAmount as int)
	ClearDebtNotes()
	Utility.wait(1.0)
	BaboLoanSharksKeyword.SendStoryEvent()
	BabodebtCoolTime.SetValue(0)
	StartDebtCountdown()
	SyncPaybackSnapshot()
	UpdateDebtInterestGlobal()
	BaboPunishGlobal.SetValue(0)
	BumpLendCount()
EndFunction

; Legacy entry. Prefer AcceptLoanOption(n).
Function GetLoan()
	AcceptLoanOption(4)
EndFunction

; TIF: (GetOwningQuest() as BaboLoanSharkScript).OpenCollateralDeposit()
; Activates the deposit box. Filtering is handled by DepositBoxAlias script.
Function OpenCollateralDeposit()
	ObjectReference box = None
	if DepositBoxAlias
		box = DepositBoxAlias.GetReference()
	endif
	if box
		box.Activate(PlayerRef)
	endif
EndFunction

; No collateral path (TIF): CollateralValue = 0 then estimate only
; Dialogue condition: BaboPossibleLoanGlobal >= 2000
Function EstimateLoanExtentNoCollateral()
	CollateralValue = 0.0
	EstimateLoanExtent()
EndFunction

; Repay box: only Gold001 counts; other items in the box are ignored.
; Gold is removed from the box and applied to BabodebtPaybackValueGlobal.
; Excess gold stays in the box. Full payoff triggers settled-note flow.
; Final debt default count (player acknowledges total failure). Call from TIF when needed.
Function RecordDebtFailure()
	if BabodebtFailCount
		BabodebtFailCount.SetValue(BabodebtFailCount.GetValue() + 1.0)
	endif
EndFunction

; Called by the collector visit quest when the player fails to pay interest.
; Not invoked automatically on a weekly timer.
; Raises daily interest multiplier by +0.1 (e.g. 1.10 -> 1.20) and refreshes percent label.
Function BumpWeeklyInterest()
	if BabodebtMissedInterestCount
		BabodebtMissedInterestCount.SetValue(BabodebtMissedInterestCount.GetValue() + 1.0)
	endif

	float rate = BabodebtInterestRateDay.GetValue() + 0.1
	BabodebtInterestRateDay.SetValue(rate)
	if BabodebtInterestPercentGlobal
		BabodebtInterestPercentGlobal.SetValue(((rate - 1.0) * 100.0) as int)
	endif
	Debug.Notification(GetLSString("baboloanshark_4") + rate)
EndFunction


; True when accrued interest alone exceeds original principal.
Bool Function InterestExceedsPrincipal()
	float principal = BabodebtValueGlobal.GetValue()
	if principal <= 0.0
		return false
	endif
	float interestOnly = BabodebtPaybackValueGlobal.GetValue() - principal
	return interestOnly > principal
EndFunction

Bool Function HasCollateral()
	if CollateralValue > 0.0
		return true
	endif
	if BaboLoanSharkCollateralChestRef && BaboLoanSharkCollateralChestRef.GetNumItems() > 0
		return true
	endif
	return false
EndFunction

; Apply collateral against accrued interest. Returns true if collateral was available and applied.
; Call after InterestExceedsPrincipal() when branching quest stages.
; true  -> stage for collateral seized / interest covered notify
; false -> no collateral; call HandleCollectorInterestOverPrincipal() for punish path
Bool Function HandleCollateral()
	if !HasCollateral()
		return false
	endif

	float principal = BabodebtValueGlobal.GetValue()
	float due = BabodebtPaybackValueGlobal.GetValue()
	float interestOnly = due - principal
	if interestOnly < 0.0
		interestOnly = 0.0
	endif

	float cover = CollateralValue
	if cover > interestOnly
		cover = interestOnly
	endif
	if cover < 0.0
		cover = 0.0
	endif

	BabodebtPaybackValueGlobal.SetValue(due - cover)
	ConfiscateCollateral()
	ClampPaybackSnapshot()
	UpdateWeeklyInterestDue()
	return true
EndFunction

; No-collateral path after interest exceeds principal: punish + lock rate + stop collector visits.
; TIF after HandleCollateral() returns false.
Function HandleCollectorInterestOverPrincipal()
	BaboPunishGlobal.SetValue(1)
	BabodebtInterestRateDay.SetValue(1.40)
	BabodebtInterestPercentGlobal.SetValue(40)
	BaboLoanSharkAliasScript als = GetPlayerDebtAlias()
	if als
		als.RestartCollectorWeek()
	endif
EndFunction


Function ProcessRepayment(ObjectReference akBox)
	if !akBox
		return
	endif

	; Principal repayment locked until first 7-day cycle completes
	if !CanRepayPrincipal()
		Messagebox(10)
		return
	endif

	int goldInBox = akBox.GetItemCount(Gold001)
	if goldInBox <= 0
		return
	endif

	int debt = BabodebtPaybackValueGlobal.GetValue() as int
	if debt <= 0
		return
	endif

	int pay = goldInBox
	if pay > debt
		pay = debt
	endif

	; Remove only the gold applied to the debt; leave the rest and all non-gold items
	akBox.RemoveItem(Gold001, pay, true)

	; Interest first, then principal. interestOnly = Payback - Value
	int principal = BabodebtValueGlobal.GetValue() as int
	int interestOnly = debt - principal
	if interestOnly < 0
		interestOnly = 0
	endif

	if pay > interestOnly
		int principalPay = pay - interestOnly
		principal = principal - principalPay
		if principal < 0
			principal = 0
		endif
		BabodebtValueGlobal.SetValue(principal as float)
	endif
	; pay <= interestOnly: principal unchanged

	int remaining = debt - pay
	BabodebtPaybackValueGlobal.SetValue(remaining as float)
	ClampPaybackSnapshot()

	if remaining <= 0
		ClearDebtNotes()
		if BaboLoanSharkDebtSettledNote
			PlayerRef.AddItem(BaboLoanSharkDebtSettledNote, 1)
		endif
		BabodebtValueGlobal.SetValue(0)
		if BabodebtOriginalPrincipalGlobal
			BabodebtOriginalPrincipalGlobal.SetValue(0)
		endif
		BabodebtPaybackSnapshotGlobal.SetValue(0)
		BaboWeeklyInterestDueGlobal.SetValue(0)
		BaboPunishGlobal.SetValue(0)
		if BaboEncounter06BEndVariable.GetValue() > 0
			BaboEncounter06BEndVariable.SetValue(14)
		endif
		StopDebtCountdown()
		ReturnCollateral()
		Debug.Notification(GetLSString("baboloanshark_12"))
	else
		UpdateWeeklyInterestDue()
		Debug.Notification(GetLSString("baboloanshark_13") + remaining)
	endif
EndFunction



; Custom / event-driven loan. No DebtLength ??collector cycle is always 7 days via alias.
; If debt already exists, only adds to amount due. Otherwise starts a new loan.
Function LSCustomLoan(Float Value, Float InterestRateDay)
	; Active loan: PaymentTerm > 0 means countdown already running, or outstanding due amount
	bool hasActiveDebt = false
	if BabodebtPaybackValueGlobal.GetValue() > 0.0
		hasActiveDebt = true
	endif
	BaboLoanSharkAliasScript als = GetPlayerDebtAlias()
	if als && als.BabodebtPaymentTermGlobal.GetValue() > 0.0
		hasActiveDebt = true
	endif

	if hasActiveDebt
		; Stack onto existing loan: principal + amount due only. Interest rate unchanged.
		BabodebtValueGlobal.SetValue(BabodebtValueGlobal.GetValue() + Value)
		if BabodebtOriginalPrincipalGlobal
			BabodebtOriginalPrincipalGlobal.SetValue(BabodebtOriginalPrincipalGlobal.GetValue() + Value)
		endif
		BabodebtPaybackValueGlobal.SetValue(BabodebtPaybackValueGlobal.GetValue() + Value)
		; Added principal must not count as this week's interest
		BabodebtPaybackSnapshotGlobal.SetValue(BabodebtPaybackSnapshotGlobal.GetValue() + Value)
		; Do not restart countdown or change InterestRateDay
		if BaboLoanSharksManageNote.isrunning()
			BaboLoanSharksManageNote.stop()
			Utility.wait(1.0)
			BaboLoanSharksKeyword.SendStoryEvent()
		endif
	else
		; Brand-new loan
		BabodebtValueGlobal.SetValue(Value)
		if BabodebtOriginalPrincipalGlobal
			BabodebtOriginalPrincipalGlobal.SetValue(Value)
		endif
		BabodebtPaybackValueGlobal.SetValue(Value)
		BabodebtInterestRateDay.SetValue(InterestRateDay)
		BabodebtInterestPercentGlobal.SetValue(((InterestRateDay - 1.0) * 100.0) as int)
		; 7-day collector window marker (actual day count lives on the player alias)
		BabodebtLengthGlobal.SetValue(7.0)
		BaboLoanSharksKeyword.SendStoryEvent()
		BaboPunishGlobal.SetValue(0)
		StartDebtCountdown()
		SyncPaybackSnapshot()
	endif
	UpdateDebtInterestGlobal()
	BumpLendCount()
EndFunction


; Take on another person's debt: hand over the statement only (no gold disbursement).
; Call after LSCustomLoan / CustomLoanSharkLoan has set the debt globals.
; Starts countdown only when no active PaymentTerm (avoids resetting an ongoing loan cycle).
; TIF: (GetOwningQuest() as BaboLoanSharkScript).GiveDebtNote()
Function GiveDebtNote()
	ClearDebtNotes()
	if BaboLoanSharkDebtNote
		PlayerRef.AddItem(BaboLoanSharkDebtNote, 1)
	endif

	bool termActive = false
	BaboLoanSharkAliasScript als = GetPlayerDebtAlias()
	if als && als.BabodebtPaymentTermGlobal.GetValue() > 0.0
		termActive = true
	endif
	if !termActive
		StartDebtCountdown()
	endif
EndFunction

Function Payback()
	if !CanRepayPrincipal()
		Messagebox(10)
		return
	endif
	BabodebtPaybackValueGlobal.setvalue(0)
	BabodebtValueGlobal.setvalue(0)
	if BabodebtOriginalPrincipalGlobal
		BabodebtOriginalPrincipalGlobal.SetValue(0)
	endif
	BabodebtPaybackSnapshotGlobal.SetValue(0)
	BaboWeeklyInterestDueGlobal.SetValue(0)
	BaboPunishGlobal.setvalue(0)
	ClearDebtNotes()
	if BaboLoanSharkDebtSettledNote
		PlayerRef.AddItem(BaboLoanSharkDebtSettledNote, 1)
	endif
	StopDebtCountdown()
	ReturnCollateral()
	UpdateDebtInterestGlobal()
EndFunction

Function InterimPayback(int money)
	if !CanRepayPrincipal()
		Messagebox(10)
		return
	endif
	int debt = BabodebtPaybackValueGlobal.getvalue() as int
	if money > debt
		money = debt
	endif
	if money <= 0
		return
	endif

	; Interest first, then principal (same order as ProcessRepayment)
	int principal = BabodebtValueGlobal.GetValue() as int
	int interestOnly = debt - principal
	if interestOnly < 0
		interestOnly = 0
	endif
	if money > interestOnly
		int principalPay = money - interestOnly
		principal = principal - principalPay
		if principal < 0
			principal = 0
		endif
		BabodebtValueGlobal.SetValue(principal as float)
	endif

	BabodebtPaybackValueGlobal.setvalue(debt - money)
	PlayerRef.removeitem(Gold001, money)
	ClampPaybackSnapshot()
	UpdateWeeklyInterestDue()
EndFunction

Function Teleport(actor akspeaker)
	TeleportActor = akspeaker
	PlayerRef.moveto(BaboLoanSharkXmarkerRef)
	LoanSharkRoomDoorRef.lock(false)
EndFunction

Function TeleportBack()
	if TeleportActor
		PlayerRef.moveto(TeleportActor)
	else
		PlayerRef.moveto(BaboLoanSharksXmarker02)
	endif
	TeleportActor = none
EndFunction

; Guild bounty. Principal + half accrued interest.
; No interest left (partial principal pay): current debt.
; Does not touch hold CrimeGold or the debt totals. Crew death only calls this.
int Function CalcLoanSharkBounty()
	int remaining = BabodebtValueGlobal.GetValue() as int
	int debt = BabodebtPaybackValueGlobal.GetValue() as int
	int original = remaining
	if BabodebtOriginalPrincipalGlobal
		original = BabodebtOriginalPrincipalGlobal.GetValue() as int
	endif
	if remaining < 0
		remaining = 0
	endif
	if original < 0
		original = 0
	endif
	if debt < 0
		debt = 0
	endif
	int interestOnly = debt - remaining
	if interestOnly <= 0
		return debt
	endif
	return original + (interestOnly / 2)
EndFunction

; Bounty + visit count are computed once. Later calls only show the message.
Function LSSetBounty()
	if !BountyInitialized
		int bounty = CalcLoanSharkBounty()
		if bounty > 0
			InitialBounty = bounty
			InitialVisitCount = Math.Ceiling((bounty as float) / 2000.0)
			BountyInitialized = true
			ResetBountyToInitial()
		endif
	endif
	Messagebox(1)
EndFunction

; Restores the first bounty and visit count. Call: (Quest as BaboLoanSharkScript).ResetBountyToInitial() from guild settle/surrender
Function ResetBountyToInitial()
	if !BountyInitialized
		return
	endif
	BaboLoanSharkBountyGlobal.SetValue(InitialBounty as float)
	BaboEncounter06VisitCount.SetValue(InitialVisitCount as float)
EndFunction

; E06 kill-all: +amount on the stored bounty
Function IncreaseBounty(int amount)
	BaboLoanSharkBountyGlobal.SetValue(BaboLoanSharkBountyGlobal.GetValue() + (amount as float))
EndFunction

; Encounter06 bounty hunter captured the player and is bringing her to the guild.
; Call: (BaboLoanSharks as BaboLoanSharkScript).LSBountyHunterDeliver()
; WIP: stage 8 boss briefing not built yet. Goes straight to stage 10 (brothel) for now.
Function LSBountyHunterDeliver()
	FailRepay()
EndFunction

; Branch manager talk while 06B EndVariable 17. Clears the 7-day freeze. Scenarios branch by dialogue.
; TIF: (GetOwningQuest() as BaboLoanSharkScript).Guild06BVisit()
Function Guild06BVisit()
	BaboLoanSharkFreezeUntilDay.SetValue(0)
EndFunction

Message Property BaboLoanSharkGotojailConfirmMsg Auto

Function GotoJailConfirm()
	int pick = BaboLoanSharkGotojailConfirmMsg.show()
	
	if pick == 1;gotojail
		GotoJail()
	else;notgiveupyet
	endif
EndFunction

Function GotoJail()
	(BaboSexController as BaboSexControllerManager).losingcontrol()
	PlayerRef.MoveTo(BaboLoanSharkPrisonXmarker)
	while !PlayerRef.Is3DLoaded()
		Utility.Wait(0.5)
	endwhile
	Utility.Wait(5.0)
	Messagebox(16)
	SentenceinJail()
EndFunction

Quest Property BaboDialogueUtil Auto

Function BodyWaiverEnd()
	; Guild appraises player -> job. TODO: lock in room + branch manager briefing scene first.
	(BaboDialogueUtil as BaboDia_Util).AppearanceCalc()
	if (BaboSexController as BaboSexControllerManager).BaboPlayerAppearanceTotalValue.GetValue() > BaboPlayerAppearanceCriteriaAverage.GetValue()
		;StartBrothelSession()
		PrepareBrothelStart()
	else
		StartProstitute()
	endif
EndFunction

Function FailRepay()
	if BaboLoanSharkBodyWaiverGlobal.getvalue() == 1
		BodyWaiverEnd()
	else
		GotoJail()
	endif
EndFunction

Function BodyWaiverDialogueEnd()
	if BaboEncounter06BEndVariable.getvalue() == 15
		GotoJail()
	endif
EndFunction

Function SignBodyWaiver()
	PlayerRef.AddItem(BaboLoanSharkBodyWaiver, 1)
	BaboLoanSharkBodyWaiverGlobal.SetValue(1)
EndFunction

Function SentenceinJail()
	(BaboSexController as BaboSexControllerManager).FadeinScene(true)
	Int days = (BabodebtPaybackValueGlobal.GetValue() / BaboLoanSharkJailGoldPerDay) as Int
	Int blocks = days / 50

	Float levelLoss = blocks * 0.5 + BaboLoanSharkJailLevelCarry
	Int wholeLevels = levelLoss as Int
	BaboLoanSharkJailLevelCarry = levelLoss - wholeLevels
	if wholeLevels > 30
		wholeLevels = 30
	endif
	Int newLevel = PlayerRef.GetLevel() - wholeLevels
	if newLevel < 1
		newLevel = 1
	endif
	if newLevel < PlayerRef.GetLevel()
		ConsoleUtil.ExecuteCommand("player.setlevel " + newLevel)
	endif

	String[] skills = new String[18]
	skills[0] = "OneHanded"
	skills[1] = "TwoHanded"
	skills[2] = "Marksman"
	skills[3] = "Block"
	skills[4] = "Smithing"
	skills[5] = "HeavyArmor"
	skills[6] = "LightArmor"
	skills[7] = "Pickpocket"
	skills[8] = "Lockpicking"
	skills[9] = "Sneak"
	skills[10] = "Alchemy"
	skills[11] = "Speechcraft"
	skills[12] = "Alteration"
	skills[13] = "Conjuration"
	skills[14] = "Destruction"
	skills[15] = "Illusion"
	skills[16] = "Restoration"
	skills[17] = "Enchanting"
	Int points = blocks * 5
	Int tries = 0
	while points > 0 && tries < 500
		String av = skills[Utility.RandomInt(0, 17)]
		Float base = PlayerRef.GetBaseActorValue(av)
		if base > 15
			PlayerRef.SetActorValue(av, base - 1)
			points -= 1
		endif
		tries += 1
	endwhile

	if BaboTimeLapseGlobal.GetValue() == 1 && BaboTimeLapseWarningMsg.Show() == 0
		GameHour.Mod(days * 24)
	endif
	BabodebtPaybackValueGlobal.SetValue(0)
	BabodebtValueGlobal.SetValue(0)
	BabodebtOriginalPrincipalGlobal.SetValue(0)
	BabodebtPaybackSnapshotGlobal.SetValue(0)
	BaboWeeklyInterestDueGlobal.SetValue(0)
	BaboPunishGlobal.SetValue(0)
	BaboEncounter06BEndVariable.SetValue(0)
	ClearDebtNotes()
	StopDebtCountdown()
	ConfiscateCollateral()
	UpdateDebtInterestGlobal()
	PlayerRef.MoveTo(BaboLoanSharksXmarker01)
	(BaboSexController as BaboSexControllerManager).FadeOutScene(true)
	(BaboSexController as BaboSexControllerManager).recovercontrol()
EndFunction

GlobalVariable Property BaboEventLoanSharkGladiatorAcceptGlobal Auto

Function LoanSharkChampionSelected()
	Payback()
	BaboEventLoanSharkGladiatorAcceptGlobal.setvalue(1)
	teleportback()
	Messagebox(15)
EndFunction

Function NegotiateFail()
	if BaboEncounter06BEndVariable.getvalue() == 18 || BaboEncounter06BEndVariable.getvalue() == 19
		BaboEncounter06BEndVariable.Setvalue(20)
	elseif BaboEncounter06BEndVariable.getvalue() == 17
		BaboEncounter06BEndVariable.setvalue(7)
	endif
	teleportback()
EndFunction

ObjectReference Property LoanSharkRoomDoorRef Auto
; WIP: not called yet (stage 8 does not exist). Planned stage 8 fragment: kmyQuest.BossBriefingArrive()
; Then play boss briefing scene. Brothel is SetStage(10) from dialogue, not from here.
Function BossBriefingArrive()
	TeleportActor = none
	LoanSharkRoomDoorRef.SetOpen(false)
	LoanSharkRoomDoorRef.lock()
	BaboSexControllerManager scs = BaboSexController as BaboSexControllerManager
	PlayerRef.MoveTo(BaboLoanSharkReceptionXmarkerRef04)
	Actor boss = LoanSharkBoss.GetActorReference()
	boss.MoveTo(BaboLoanSharkReceptionXmarkerRef03)
	boss.evaluatepackage()
EndFunction


;#################################
;###########Prostitute############;
;#################################


Function ReceptionSex(ReferenceAlias actor01, ReferenceAlias actor02, ReferenceAlias actor03, ReferenceAlias actor04, ReferenceAlias actor05, String Tag01, String Tag02, String Tag03, Bool NextScene, String EventRegisterDummy, String EventName, Bool Rape)
	(BaboSexController as BaboSexControllerManager).SexCustom(actor01, actor02, actor03, actor04, actor05, Tag01, Tag02, Tag03, NextScene, EventRegisterDummy, EventName, Rape)
EndFunction

Function ReceptionSexActor(Actor actor01, Actor actor02, Actor actor03, Actor actor04, Actor actor05, String Tag01, String Tag02, String Tag03, Bool NextScene, String EventRegisterDummy, String EventName, Bool Rape)
	(BaboSexController as BaboSexControllerManager).SexCustomActor(actor01, actor02, actor03, actor04, actor05, Tag01, Tag02, Tag03, NextScene, EventRegisterDummy, EventName, Rape)
EndFunction


Event LoanSharkAfterSexTest(string eventName, string argString, float argNum, form sender)
	Debug.messagebox("Test Complete")
;	UnregisterForModEvent("AnimationEnd_LSASTest")
EndEvent

Function LSAS01()
	(BaboSexController as BaboSexControllerManager).RandomExhaustionIdle(PlayerRef)
	if BrothelSexRound == 1
		ScenePlay(2, true)
	else
		(BaboSexController as BaboSexControllerManager).LosingControl()
		(BaboSexController as BaboSexControllerManager).FadeinScene(true)
		CustomersLeaving()
		;BaboLoanSharks.SetStage(15)
		(BaboSexController as BaboSexControllerManager).FadeoutScene(true)
		BrothelSkipCheckpoint()
	endif
EndFunction

Function LSAS02()
	(BaboSexController as BaboSexControllerManager).RandomExhaustionIdle(PlayerRef)
	if BrothelSexRound == 1
		BrothelSexRound = 2
		Game.DisablePlayerControls(abmenu = true)
		Utility.wait(2.0)
		ReceptionSex(PlayerAlias, CustomerA, CustomerB, None, None, "MMF", "Vaginal", "Aggressive", True, "LSAS02", "LoanSharkAfterSex02", True)
	else
		(BaboSexController as BaboSexControllerManager).FadeinScene(true)
		CustomersLeaving()
		BrothelSkipCheckpoint()
	endif
EndFunction

Function BacktoNormal()
	BaboEventLoanSharkThugs.setvalue(0);Encounter06 Thugs
	BaboLoanSharks.setstage(0)
EndFunction

; Brothel loop after stage collapse.
; 0 idle. 1 first customer block. 2 second customer block.
int Property BrothelStep Auto Hidden
int Property BrothelSexRound Auto Hidden
bool Property BrothelCaptureHandoff Auto Hidden

Function BrothelScene01Done()
	BrothelSexRound = 1
	bool rape = BaboEventLoanSharkSexType.GetValue() == 1.0
	ReceptionSex(PlayerAlias, CustomerA, None, None, None, "MF", "Vaginal", "Anal", True, "LSAS01", "LoanSharkAfterSex01", rape)
EndFunction

Function BrothelScene02Done()
	BrothelSexRound = 2
	ReceptionSex(PlayerAlias, CustomerA, None, None, None, "MF", "Vaginal", "Aggressive", True, "LSAS01", "LoanSharkAfterSex01", True)
EndFunction

Function BrothelScene03Done()
	BrothelSexRound = 1
	bool rape = BaboEventLoanSharkSexType.GetValue() == 1.0
	ReceptionSex(PlayerAlias, CustomerA, CustomerB, None, None, "MMF", "Vaginal", "Anal", True, "LSAS02", "LoanSharkAfterSex02", rape)
EndFunction

Function BrothelScene04Done()
	ScenePlay(4, false)
	Actor boss = LoanSharkBoss.GetActorReference()
	boss.MoveTo(BaboLoanSharkReceptionXmarkerRef03)
EndFunction

Function StartBrothelSession()
	Self.Messagebox(2)
	BaboLoanSharks.setstage(10)
	BrothelStep = 1
	(BaboSexController as BaboSexControllerManager).FadeinScene(true)
	Actor boss = LoanSharkBoss.GetActorReference()
	boss.MoveTo(BaboLoanSharkReceptionXmarkerRef03)
	(BaboSexController as BaboSexControllerManager).recovercontrol()
	SpawnCustomer(1)
	(BaboSexController as BaboSexControllerManager).FadeoutScene(true)
	if ScenePlay(1, true) == false
		BaboEventLoanSharkSexType.setvalue(1)
		BrothelScene01Done()
	endif
EndFunction

ObjectReference Property BakaEventRoomRiftenJailMarkerBCenter Auto;Center marker
ObjectReference Property BakaEventRoomRiftenJailMarkerB01Ref Auto;Player marker
ObjectReference Property BakaEventRoomRiftenJailMarkerB02Ref Auto;customerA Spawn
ObjectReference Property BakaEventRoomRiftenJailMarkerB03Ref Auto;custoemrB Spawn

; 1 = two customers / 3 sexes. 2 = one customer / 2 sexes. 3 = repeat rounds.
int Property ProstituteStep Auto Hidden
int Property ProstituteSexRound Auto Hidden
int Property ProstituteCustomerNum Auto Hidden

Function StartProstitute()
	BaboLoanSharks.SetStage(10)
	ConfiscatingItems(true)
	ProstituteStep = 1
	ProstituteSexRound = 0
	ProstituteCustomerNum = 2
	(BaboSexController as BaboSexControllerManager).FadeinScene(true)
	SpawnCustomerLabor(2)
	PlayerRef.MoveTo(BakaEventRoomRiftenJailMarkerB01Ref)
	(CustomerA.getactorreference()).MoveTo(BakaEventRoomRiftenJailMarkerB02Ref)
	(CustomerB.getactorreference()).MoveTo(BakaEventRoomRiftenJailMarkerB03Ref)
	(BaboSexController as BaboSexControllerManager).FadeoutScene(true)
	;Debug.SendAnimationEvent(PlayerRef, "BaboFaintF");Debugging
	if ScenePlay(6, true) == false
		ProstituteSex()
	endif
EndFunction

; Prostitute01/02Scene end fragment: kmyQuest.ProstituteSex()
Function ProstituteSex()
	PlayerRef.MoveTo(BakaEventRoomRiftenJailMarkerBCenter)
	if ProstituteCustomerNum == 1
		ReceptionSex(PlayerAlias, CustomerA, None, None, None, "MF", "Vaginal", "", True, "LSPS01", "LoanSharkProstituteAfterSex", True)
	elseif ProstituteCustomerNum == 2
		ReceptionSex(PlayerAlias, CustomerA, CustomerB, None, None, "MMF", "Vaginal", "Anal", True, "LSPS01", "LoanSharkProstituteAfterSex", True)
	else
		ReceptionSex(PlayerAlias, CustomerA, CustomerB, CustomerC, None, "MMMF", "Vaginal", "Anal", True, "LSPS01", "LoanSharkProstituteAfterSex", True)
	endif
EndFunction

Function LSPS01()
	ProstituteSexRound += 1
	if ProstituteStep == 1
		if ProstituteSexRound < 3
			(BaboSexController as BaboSexControllerManager).RandomExhaustionIdle(PlayerRef)
			Utility.Wait(2.0)
			ProstituteSex()
		else
			(BaboSexController as BaboSexControllerManager).FadeinScene(true)
			CustomersLeaving()
			PlayerRef.MoveTo(BakaEventRoomRiftenJailMarkerBCenter)
			(BaboSexController as BaboSexControllerManager).RandomExhaustionIdle(PlayerRef)
			SpawnCustomerLabor(1)
			CustomerA.GetActorReference().MoveTo(BakaEventRoomRiftenJailMarkerB01Ref)
			ProstituteStep = 2
			ProstituteSexRound = 0
			ProstituteCustomerNum = 1
			(BaboSexController as BaboSexControllerManager).FadeoutScene(true)
			if ScenePlay(7, true) == false
				ProstituteSex()
			endif
		endif
	elseif ProstituteStep == 2
		if ProstituteSexRound < 2
			(BaboSexController as BaboSexControllerManager).RandomExhaustionIdle(PlayerRef)
			Utility.Wait(2.0)
			ProstituteSex()
		else
			Debug.SendAnimationEvent(PlayerRef, "Babo_DeathStart")
			Utility.Wait(3.0)
			(BaboSexController as BaboSexControllerManager).FadeinScene(true)
			CustomersLeaving()
			ProstituteStep = 3
			ProstituteRoundCheckpoint()
		endif
	else
		(BaboSexController as BaboSexControllerManager).FadeinScene(true)
		CustomersLeaving()
		PlayerRef.MoveTo(BakaEventRoomRiftenJailMarkerBCenter)
		(BaboSexController as BaboSexControllerManager).RandomExhaustionIdle(PlayerRef)
		ProstituteRoundCheckpoint()
	endif
EndFunction

; Always called under black.
Function ProstituteRoundCheckpoint()
	int choice = BaboLoanSharkProstituteRoundMsg.Show()
	if choice == 0
		DraggingtoSexMarketWithPossibility()
		(BaboSexController as BaboSexControllerManager).FadeoutScene(true)
	else
		ProstituteCustomerNum = Utility.RandomInt(1, 3)
		SpawnCustomerLabor(ProstituteCustomerNum)
		CustomerA.GetActorReference().MoveTo(BakaEventRoomRiftenJailMarkerB01Ref)
		if ProstituteCustomerNum >= 2
			CustomerB.GetActorReference().MoveTo(BakaEventRoomRiftenJailMarkerB01Ref)
		endif
		if ProstituteCustomerNum >= 3
			CustomerC.GetActorReference().MoveTo(BakaEventRoomRiftenJailMarkerB01Ref)
		endif
		PlayerRef.MoveTo(BakaEventRoomRiftenJailMarkerBCenter)
		(BaboSexController as BaboSexControllerManager).FadeoutScene(true)
		ProstituteSex()
	endif
EndFunction

; Stage 15 fragment: kmyQuest.BrothelSkipCheckpoint()
; First landing uses Stage25 menu. After customer 2 uses Stage35 menu.
Function BrothelSkipCheckpoint()
	if BrothelStep <= 1
		int choice = BaboLoanSharkBrothelFirstRoundMsg.Show()
		if choice == 0
			BrothelSkipToSellFork()
		else
			BrothelSecondCustomer()
		endif
	else
		int choice = BaboLoanSharkBrothelSecondRoundMsg.Show()
		if choice == 0
			BrothelSkipToSellFork()
		endif
	endif
EndFunction

Function BrothelSecondCustomer()
	BrothelStep = 2
	SpawnCustomer(2)
	Utility.wait(5.0)
	ScenePlay(3, true)
EndFunction

; Old stage 38. GoforSell 1 = room + scene 4. Else market roll.
Function BrothelSkipToSellFork()
	if BaboLoanSharkGoforSell.GetValue() == 1.0
		(BaboSexController as BaboSexControllerManager).FadeoutScene(true)
		GotoRoom()
		if ScenePlay(4, true) == false
			EndofBrothel()
		endif
	else
		EndofBrothel()
	endif
EndFunction

GlobalVariable Property BaboReputationBitch Auto

Function EndofBrothel()
	; Refused noble sale: work off debt in brothel (1000 gold per sex), no SSLV
	(BaboSexController as BaboSexControllerManager).FadeinScene(true)
	;WIP SoundEffect
	int sextimes = CalcSexlabStats(PlayerRef, 1000)
	PastTime(sextimes / 2)
	Payback()
	RegisterTitle()
	BRMQuest.ModifyReputationRatio(0.6)
	if BaboReputationBitch.getvalue() < 100
		BRMQuest.IncreaseReputationBitch(50)
	else
		BRMQuest.ModifyReputationBitchRatio(1.6)
	endif
	BrothelEndMessage()
	(BaboSexController as BaboSexControllerManager).FadeoutScene(true)
	Utility.wait(5.0)
	BaboLoanSharks.SetStage(100)
EndFunction


Function PrepareBrothelStart()
	(BaboSexController as BaboSexControllerManager).FadeinScene(true)
	; WIP: BrothelCaptureHandoff is never set true yet (boss briefing path). Always GotoRoom for now.
	ConfiscatingItems(true)
	;if BrothelCaptureHandoff
	;	PlayerRef.MoveTo(BaboLoanSharkReceptionXmarkerRef04)
	;	Actor boss = LoanSharkBoss.GetActorReference()
	;	if boss
	;		boss.MoveTo(BaboLoanSharkReceptionXmarkerRef03)
	;	endif
	;	BrothelCaptureHandoff = false
	;else
		;GotoRoom()
		PlayerRef.moveto(BaboLoanSharkReceptionXmarkerRef01)
		
	;endif
	float debt = BabodebtPaybackValueGlobal.GetValue()
	if debt > 20000.0 && debt >= BabodebtOriginalPrincipalGlobal.GetValue() * 3.0
		BaboLoanSharkGoforSell.setvalue(1)
	else
		BaboLoanSharkGoforSell.setvalue(0)
	endif
	Utility.wait(2.0)
	(LoanSharkBoss.GetActorReference()).moveto(BaboLoanSharkReceptionXmarkerRef02)
	if ScenePlay(5, true) == false
		StartBrothelSession()
	endif
	(BaboSexController as BaboSexControllerManager).FadeOutScene(true)
EndFunction

Function GotoRoom()
	PlayerRef.moveto(BaboLoanSharkReceptionXmarkerRef01)
EndFunction

Function ConfiscatingItems(bool confiscating)
	if confiscating
		Form[] worn = Utility.CreateFormArray(0)
		int slotMask = 0x01
		While slotMask < 0x80000000
			Form wornItem = PlayerRef.GetWornForm(slotMask)
			If wornItem && worn.Find(wornItem) < 0
				worn = Utility.ResizeFormArray(worn, worn.Length + 1, wornItem)
			EndIf
			slotMask *= 2
		EndWhile
		PlayerRef.RemoveAllItems(BaboLoanSharkConfiscatedChestRef, true, false)
		Int i = 0
		While i < worn.Length
			BaboLoanSharkConfiscatedChestRef.RemoveItem(worn[i], 1, true, PlayerRef)
			PlayerRef.EquipItem(worn[i], false, true)
			i += 1
		EndWhile
	else
		BaboLoanSharkConfiscatedChestRef.RemoveAllItems(PlayerRef, true, true)
	endif
EndFunction

Function SpawnCustomer(int Num)

if Num >= 1
	Actor CustomerAActor = BaboLoanSharkReceptionXmarkerRef02.PlaceActorAtMe(BaboLoanSharkThugsCustomer, 3)
	CustomerA.ForceRefTo(CustomerAActor)
endif

if Num >= 2
	Actor CustomerBActor = BaboLoanSharkReceptionXmarkerRef02.PlaceActorAtMe(BaboLoanSharkThugsCustomer, 3)
	CustomerB.ForceRefTo(CustomerBActor)
endif

if Num >= 3
	Actor CustomerCActor = BaboLoanSharkReceptionXmarkerRef02.PlaceActorAtMe(BaboLoanSharkThugsCustomer, 3)
	CustomerC.ForceRefTo(CustomerCActor)
endif

EndFunction

Function SpawnCustomerLabor(int Num)
if Num >= 1
	Actor CustomerAActor = BakaEventRoomRiftenJailMarkerB02Ref.PlaceActorAtMe(BaboProstituteCustomerMale01, 3)
	CustomerA.ForceRefTo(CustomerAActor)
endif
if Num >= 2
	Actor CustomerBActor = BakaEventRoomRiftenJailMarkerB03Ref.PlaceActorAtMe(BaboProstituteCustomerMale01, 3)
	CustomerB.ForceRefTo(CustomerBActor)
endif
if Num >= 3
	Actor CustomerCActor = BakaEventRoomRiftenJailMarkerB03Ref.PlaceActorAtMe(BaboProstituteCustomerMale01, 3)
	CustomerC.ForceRefTo(CustomerCActor)
endif
EndFunction

Function CustomersLeaving()
CustomerA.getactorreference().delete()
CustomerB.getactorreference().delete()
CustomerC.getactorreference().delete()

CustomerA.clear()
CustomerB.clear()
CustomerC.clear()

EndFunction

int Function CalcSexlabStats(Actor akactor, int perdebt)

int AnalNum
int OralNum
int VaginalNum
int debtint
float debtfloat = BabodebtPaybackValueGlobal.getvalue();1000 - 1sex
debtfloat = (debtfloat / perdebt)
debtint = Math.Ceiling(debtfloat)

AnalNum = (debtint / 3) as int
OralNum = (debtint / 3) as int
VaginalNum = (debtint / 2) as int

(BaboSexController as BaboSexControllerManager).ModifySexlabStats(akactor, 0, debtint, debtint, AnalNum, OralNum, VaginalNum)

return debtint

EndFunction

Function SendFHUInflationEvent(form injector, Bool Inflation, int poolmask, float amount, float time, string callback)
	(BaboSexController as BaboSexControllerManager).FHUInflationEvent(PlayerRef as form, injector, Inflation, poolmask, amount, time, callback)
EndFunction

Function SendFHUTest(actor akactor)
	form formactor = akactor as form
	SendFHUInflationEvent(formactor, true, 1, 3.0, 0.2, "")
EndFunction

Actor Function ActorFind()
	if BaboCustomerActors.length == 0
		BaboCustomerActors[0] = BaboCustomerOrcDummyRef
		BaboCustomerActors[1] = BaboCustomerNordDummyRef
		BaboCustomerActors[2] = BaboCustomerImperialDummyRef
		BaboCustomerActors[3] = BaboCustomerArgonianDummyRef
		BaboCustomerActors[4] = BaboCustomerKhajiitDummyRef
	endif
	
	int randomnum = Utility.randomint(0, 5)
	Return BaboCustomerActors[randomnum]
EndFunction

Function BloatBelly()
	Form MaleNPC = ActorFind() as form
	Form MaleNPC2 = ActorFind() as form
	SendFHUInflationEvent(MaleNPC, true, 3, 3.0, 0.2, "")
	Utility.wait(20.0);Wait for script to process
	SendFHUInflationEvent(MaleNPC2, true, 3, 2.0, 0.2, "")
EndFunction

Function EndofProstitute(int SSLV)
	if BaboFHU.getvalue() == 1
		BloatBelly()
	endif
	int sextimes = CalcSexlabStats(PlayerRef, 500)
	PastTime(sextimes/2)
	Payback()
	RegisterTitle()
	BRMQuest.ModifyReputationRatio(0.2)
	if BaboReputationBitch.getvalue() < 200
		BRMQuest.IncreaseReputationBitch(100)
	else
		BRMQuest.ModifyReputationBitchRatio(2.0)
	endif
	if SSLV == 1
		ProstituteEndMessageSSLV()
	else
		ProstituteEndMessage()
	endif
	BaboLoanSharks.setstage(100)
EndFunction

Function ProstituteEndMessage()
	int choice = BaboLoanSharkProstituteEnd.Show()
	if (choice == 0)
		ConfiscatingItems(false)
		playerref.moveto(BaboRiftenDumpingMarker)
		;TeleportBack()
	endif
EndFunction

Function BrothelEndMessage()
	int choice = BaboLoanSharkBrothelEnd.Show()
	if (choice == 0)
		ConfiscatingItems(false)
		PlayerRef.MoveTo(BaboLoanSharksXmarker01)
		;TeleportBack()
	endif
EndFunction

Function ProstituteEndMessageSSLV()
	int choice = BaboLoanSharkProstituteEndSSLV.Show()
	if (choice == 0)
		ConfiscatingItems(false)
		(BaboSexController as BaboSexControllerManager).TraumaExp(5.0)
		GotoSSLV()
	endif
EndFunction

Function RegisterTitle()
	BRMQuest.AddingTitletoPlayerRef(BaboFactionLoanSharkSlaveTitle)
	BRMQuest.SetTitleGlobal(BaboGlobalLoanSharkSlaveTitle, 1)
EndFunction

Function PastTime(int time)
	BDMScript.RandomPainMenu(PlayerRef)
	if BaboTimeLapseGlobal.GetValue() == 1 && BaboTimeLapseWarningMsg.Show() == 0
		GameHour.Mod((time * 24) as float)
	endif
	float fLewd = (time as float)
	float fTrauma = (time as float) / 3
	float fCorruption = (time as float) / 2
	(BaboSexController as BaboSexControllerManager).LewdnessExp(fLewd)
	(BaboSexController as BaboSexControllerManager).TraumaExp(fTrauma)
	(BaboSexController as BaboSexControllerManager).CorruptionExp(fCorruption)
	BRMQuest.SexCount(time)
EndFunction

Function DraggingtoSexMarketWithPossibility();WIP if player's BaboFactionStatWill > 7 goto SSLV
	int random = Utility.RandomInt(0, 99)
	If BaboSimpleSlavery.getvalue() == 1
		If Random < BaboSimpleSlaveryChance.getvalue() as int
			;BaboLoanSharks.setstage(40)
			EndofProstitute(1)
		Else
			;BaboLoanSharks.setstage(45)
			EndofProstitute(0)
			;BaboLoanSharks.setstage(100)
		EndIf
	Else
		;BaboLoanSharks.setstage(45)
		EndofProstitute(0)
		BaboLoanSharks.setstage(100)
	EndIf
	LoanSharkBoss.getreference().moveto(BaboLoanSharkReceptionXmarkerRef03)
EndFunction

Function GotoSSLV()
	(BaboSexController as BaboSexControllerManager).DraggingtoSexMarket()
EndFunction

Function GotoKidnapEvent()
	int choice = BaboLoanSharkSoldEnd.Show()
	if (choice == 0)
		ConfiscatingItems(false)
		(BaboSexController as BaboSexControllerManager).LewdnessExp(10.0)
		(BaboSexController as BaboSexControllerManager).TraumaExp(4.0)
		Payback()
		BaboLoanSharks.setstage(100)
		BaboLoanSharkSoldPlayer.setvalue(1)
		BaboLoanSharkSoldPlayerCount.setvalue(BaboLoanSharkSoldPlayerCount.getvalue() + 1)
		BaboKidnapCallKeyword.SendStoryEvent()
		LoanSharkBoss.getreference().moveto(BaboLoanSharkReceptionXmarkerRef03)
	endif
Endfunction


; Load a fixed key from BakaStrings.json (no MsgManager). Append numbers in caller when needed.
String Function GetLSString(String fkey)
	return JsonUtil.GetStringValue(LSStringFile, fkey)
EndFunction

Function Messagebox(int num)
	(BaboMsgScript as BaboMsgManager).BadLoanSharkMessagebox(num)
EndFunction

Function Reset()
	; Stop daily interest timer first
	StopDebtCountdown()

	ConfiscatingItems(false)
	ReturnCollateral()
	ClearDebtNotes()

	; Core debt values
	BabodebtValueGlobal.SetValue(0)
	if BabodebtOriginalPrincipalGlobal
		BabodebtOriginalPrincipalGlobal.SetValue(0)
	endif
	BabodebtPaybackValueGlobal.SetValue(0)
	if BabodebtInterestGlobal
		BabodebtInterestGlobal.SetValue(0)
	endif
	BabodebtPaybackSnapshotGlobal.SetValue(0)
	BaboWeeklyInterestDueGlobal.SetValue(0)
	BabodebtInterestRateDay.SetValue(1.0)
	BabodebtInterestPercentGlobal.SetValue(0)
	BabodebtMissedInterestCount.SetValue(0)
	BabodebtFailCount.SetValue(0)
	BabodebtLengthGlobal.SetValue(0)
	BabodebtCoolTime.SetValue(0)
	BaboLSDebt.SetValue(0)

	; Punishment / sell flags
	BaboPunishGlobal.SetValue(0)
	BaboLoanSharkGoforSell.SetValue(0)
	if BabodebtLendCount
		BabodebtLendCount.SetValue(0)
	endif

	CollateralValue = 0.0

	; Clear collector schedule globals on the player alias
	BaboLoanSharkAliasScript als = GetPlayerDebtAlias()
	if als
		als.BaboEventLoanSharkCollectInterestReady.SetValue(0)
		als.BabodebtPaymentTermGlobal.SetValue(0)
		als.BabodebtRemainingHoursGlobal.SetValue(0)
	endif

	BacktoNormal()
	CustomersLeaving()
	BaboLoanSharks.setstage(0)
	BaboLoanSharksManageNote.stop()
	UpdateRepayBoxLock()
EndFunction

GlobalVariable Property BaboTimeLapseGlobal Auto
Message Property BaboTimeLapseWarningMsg Auto
