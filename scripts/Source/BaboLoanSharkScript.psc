Scriptname BaboLoanSharkScript extends Quest  

Actor Property PlayerRef Auto
ActorBase Property BaboLoanSharkThugsCustomer Auto
Actor Property TeleportActor Auto
GlobalVariable Property BaboLSDebt auto
Book Property BaboLoanSharkDebtNote Auto
Book Property BaboLoanSharkDebtSettledNote Auto
MiscObject Property Gold001 Auto
GlobalVariable Property BabodebtValueGlobal auto
GlobalVariable Property BabodebtPaybackValueGlobal auto
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
GlobalVariable Property BabodebtLengthGlobal Auto
GlobalVariable Property BabodebtPaybackValueLimitGlobal Auto
GlobalVariable Property BaboLoanSharkGoforSell Auto

ObjectReference Property BaboLoanSharkXmarkerRef Auto
ObjectReference Property BaboLoanSharkReceptionXmarkerRef01 Auto
ObjectReference Property BaboLoanSharkReceptionXmarkerRef02 Auto
ObjectReference Property BaboLoanSharkReceptionXmarkerRef03 Auto
ObjectReference Property BaboLoanSharkReceptionXmarkerRef04 Auto
ObjectReference Property BaboLoanSharksXmarker02 Auto
Quest Property BaboLoanSharks Auto
Quest Property BaboSexController Auto

Referencealias Property LoanSharkBoss Auto
Referencealias Property CustomerA Auto
Referencealias Property CustomerB Auto
Referencealias Property CustomerC Auto


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

Message Property BaboLoanSharkStage25 Auto
Message Property BaboLoanSharkStage35 Auto
Message Property BaboLoanSharkProstituteEnd Auto
Message Property BaboLoanSharkProstituteEndSSLV Auto
Message Property BaboLoanSharkSoldEnd Auto

ObjectReference Property BaboLoanSharkConfiscatedChestRef Auto

ImageSpaceModifier Property FadeToBlackImod  Auto  
ImageSpaceModifier Property FadeToBlackHoldImod  Auto  
ImageSpaceModifier Property FadeToBlackBackImod  Auto  

;Idle Property BaboKnockOut01Start Auto
Idle Property BaboExhaustedFront01 Auto
Idle Property BaboExhaustedFront02 Auto
Idle Property BaboExhaustedFront03 Auto
Idle Property BaboExhaustedBack01 Auto
Idle Property BaboExhaustedBack02 Auto
Idle Property BaboExhaustedBack03 Auto
Scene Property BaboLoanSharksScene02 Auto

Actor[] Property BaboCustomerActors Auto

Actor Property BaboCustomerOrcDummyRef Auto
Actor Property BaboCustomerNordDummyRef Auto
Actor Property BaboCustomerImperialDummyRef Auto
Actor Property BaboCustomerArgonianDummyRef Auto
Actor Property BaboCustomerKhajiitDummyRef Auto

Keyword Property BaboLoanSharksKeyword Auto
Keyword Property BaboKidnapCallKeyword Auto

Scene Property BaboLoanSharksScene04 Auto

Function LSASIdlePlay()
int i = Utility.randomint(0,7)

if i == 1
	PlayerRef.playidle(BaboExhaustedFront01)
elseif i == 2
	PlayerRef.playidle(BaboExhaustedFront02)
elseif i == 3
	PlayerRef.playidle(BaboExhaustedFront03)
elseif i == 4
	PlayerRef.playidle(BaboExhaustedBack01)
elseif i == 5
	PlayerRef.playidle(BaboExhaustedBack02)
elseif i == 6
	PlayerRef.playidle(BaboExhaustedBack03)
else
	;PlayerRef.playidle(BaboKnockOut01Start)
	Debug.Sendanimationevent(PlayerRef, "BaboDefeatKnockOutStart")
endif

EndFunction

Function GetLoan()
int Money = BabodebtValueGlobal.GetValue() as int
	int StartPaybackmoney = ((Money / 2) * 3) as int
	BabodebtPaybackValueGlobal.setvalue(StartPaybackmoney)
	BaboLoanSharksKeyword.SendStoryEvent()
	PlayerRef.AddItem(BaboLoanSharkDebtNote)
	PlayerRef.AddItem(Gold001, Money)
	BaboPunishGlobal.setvalue(0)
EndFunction

Function LSCustomLoan(Float Value, Float InterestRateDay, int DebtLength)
if BabodebtPaybackValueGlobal.getvalue() > 0
	BabodebtPaybackValueGlobal.setvalue(BabodebtPaybackValueGlobal.getvalue() + Value)
	;BabodebtInterestRateDay.setvalue(InterestRateDay)
	BabodebtLengthGlobal.setvalue(BabodebtLengthGlobal.getvalue() + DebtLength)
else
	BabodebtPaybackValueGlobal.setvalue(Value)
	BabodebtInterestRateDay.setvalue(InterestRateDay)
	BabodebtLengthGlobal.setvalue(DebtLength)
	BaboLoanSharksKeyword.SendStoryEvent()
	BaboPunishGlobal.setvalue(0)
endif
EndFunction

Function Payback()
	int debt = BabodebtPaybackValueGlobal.getvalue() as int
	PlayerRef.AddItem(BaboLoanSharkDebtSettledNote)
	BabodebtPaybackValueGlobal.setvalue(0)
	BaboPunishGlobal.setvalue(0)
	PlayerRef.removeitem(Gold001, debt)
EndFunction

Function InterimPayback()
	int money = PlayerRef.GetitemCount(Gold001)
	int debt = BabodebtPaybackValueGlobal.getvalue() as int

	BabodebtPaybackValueGlobal.setvalue(debt - money)
	PlayerRef.removeitem(Gold001, money)
EndFunction

Function Teleport(actor akspeaker)
	TeleportActor = akspeaker
	PlayerRef.moveto(BaboLoanSharkXmarkerRef)
EndFunction

Function TeleportBack()
	if TeleportActor
		PlayerRef.moveto(TeleportActor)
	else
		PlayerRef.moveto(BaboLoanSharksXmarker02)
	endif
EndFunction

function LSSetBounty()
	int bounty = BabodebtPaybackValueGlobal.GetValueInt()
	CrimeFactionRift.SetCrimeGold(bounty)
	CrimeFactionHaafingar.SetCrimeGold(bounty)
	Payback()
	Self.Messagebox(1)
	BaboLoanSharks.setstage(110);Bounty
endFunction


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
	if BaboLoanSharks.getstage() == 20
		BaboLoanSharksScene02.ForceStart()
		LSASIdlePlay()
	elseif BaboLoanSharks.getstage() == 22
		Game.DisablePlayerControls(abmenu = true)
		Utility.wait(2.0)
		LSASIdlePlay()
		BaboLoanSharks.setstage(23)
	else
		BaboLoanSharks.setstage(23)
	endif
EndFunction

Function LSAS02()
	if BaboLoanSharks.getstage() == 32
		Game.DisablePlayerControls(abmenu = true)
		Utility.wait(2.0)
		LSASIdlePlay()
		BaboLoanSharks.setstage(33)
	elseif BaboLoanSharks.getstage() == 33
		LSASIdlePlay()
		BaboLoanSharks.setstage(35)
	endif
EndFunction

Function BacktoNormal()
	BaboEventLoanSharkThugs.setvalue(0);Encounter06 Thugs
	BaboLoanSharks.setstage(0)
EndFunction

Function PrepareStart()
	FadeToBlackImod.Apply()
	Utility.wait(2.0)
	FadeToBlackImod.PopTo(FadeToBlackHoldImod)
	GotoRoom()
	if BabodebtPaybackValueGlobal.getvalue() > BabodebtPaybackValueLimitGlobal.getvalue()
		BaboLoanSharkGoforSell.setvalue(1)
	else
		BaboLoanSharkGoforSell.setvalue(0)
	endif
	ConfiscatingItems(true)
	Self.Messagebox(2)
	Utility.wait(2.0)
	FadeToBlackHoldImod.PopTo(FadeToBlackBackImod)
	Utility.wait(5.0)
	FadeToBlackBackImod.Remove()
EndFunction

Function FadeinMove(ReferenceAlias akactorRef, ReferenceAlias MovePoint, Int Callstage, Bool Stage)
Actor akactor = akactorRef.GetActorReference()
ObjectReference MP = MovePoint.getref() as objectreference
	FadeToBlackImod.Apply()
	Utility.wait(2.0)
	FadeToBlackImod.PopTo(FadeToBlackHoldImod)
	akactor.moveto(MP);move actor to xmarker
	Utility.wait(5.0)
	
	If stage == true
		BaboLoanSharks.setstage(Callstage)
	EndIF
	
	Utility.wait(3.0)
	FadeToBlackHoldImod.PopTo(FadeToBlackBackImod)
	Utility.wait(5.0)
	FadeToBlackBackImod.Remove()
EndFunction

Function GotoRoom()
	PlayerRef.moveto(BaboLoanSharkReceptionXmarkerRef01)
EndFunction

Function ConfiscatingItems(bool confiscating)
	if confiscating
		PlayerRef.removeallitems(BaboLoanSharkConfiscatedChestRef, true, false)
	else
		BaboLoanSharkConfiscatedChestRef.removeallitems(PlayerRef, true, true)
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

Function CustomersLeaving()
CustomerA.getactorreference().delete()
CustomerB.getactorreference().delete()
CustomerC.getactorreference().delete()

CustomerA.clear()
CustomerB.clear()
CustomerC.clear()

EndFunction

int Function CalcSexlabStats(Actor akactor)

int AnalNum
int OralNum
int VaginalNum
int debtint
float debtfloat = BabodebtPaybackValueGlobal.getvalue();1000 - 1sex
debtfloat = (debtfloat / 1000)
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
	int sextimes = CalcSexlabStats(PlayerRef)
	PastTime(sextimes/2)
	Payback()
	RegisterTitle()
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
		(BaboSexController as BaboSexControllerManager).LewdnessExp(40.0)
		(BaboSexController as BaboSexControllerManager).TraumaExp(10.0)
		;(BaboSexController as BaboSexControllerManager).CorruptionExp(20.0)
		BRMQuest.SexCount(20)
		TeleportBack()
	endif
EndFunction

Function ProstituteEndMessageSSLV()
	int choice = BaboLoanSharkProstituteEndSSLV.Show()
	if (choice == 0)
		ConfiscatingItems(false)
		(BaboSexController as BaboSexControllerManager).LewdnessExp(30.0)
		(BaboSexController as BaboSexControllerManager).TraumaExp(15.0)
		BRMQuest.SexCount(30)
		GotoSSLV()
	endif
EndFunction

Function RegisterTitle()
	BRMQuest.DecreaseReputation(200, 80)
	BRMQuest.AddingTitletoPlayerRef(BaboFactionLoanSharkSlaveTitle)
	BRMQuest.SetTitleGlobal(BaboGlobalLoanSharkSlaveTitle, 1)
EndFunction

Function Skipthescenes25()
	int choice = BaboLoanSharkStage25.Show()
	
	if (choice == 0);Skip
		BaboLoanSharks.setstage(38)
	else
		BaboLoanSharks.setstage(30)
	endif
EndFunction

Function Skipthescenes35()
	int choice = BaboLoanSharkStage35.Show()
	
	if (choice == 0);Skip
		BaboLoanSharks.setstage(38)
	endif
EndFunction

Function PastTime(int time)
	Float CurrentTime = GameHour.GetValue()
	BDMScript.RandomPainMenu(PlayerRef)
	CurrentTime += time
	if CurrentTime > 24
		CurrentTime -= 24
	endif
	GameHour.SetValue(CurrentTime)
EndFunction

Function DraggingtoSexMarketWithPossibility()
	int random = Utility.RandomInt(0, 99)
	If BaboSimpleSlavery.getvalue() == 1
		If Random < BaboSimpleSlaveryChance.getvalue() as int
			BaboLoanSharks.setstage(40)
		Else
			BaboLoanSharks.setstage(45)
		EndIf
	Else
		BaboLoanSharks.setstage(45)
	EndIf
	LoanSharkBoss.getreference().moveto(BaboLoanSharkReceptionXmarkerRef03)
EndFunction

Function GotoSSLV()
	(BaboSexController as BaboSexControllerManager).DraggingtoSexMarket()
EndFunction


Function Scene04Start()
	GotoRoom()
	BaboLoanSharksScene04.forcestart()
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

Function Messagebox(int num)
	if num == 1
		(BaboSexController as BaboSexControllerManager).BadLoanSharkbox(1)
	elseif num == 2
		(BaboSexController as BaboSexControllerManager).BadLoanSharkbox(2)
	elseif num == 3
		(BaboSexController as BaboSexControllerManager).BadLoanSharkbox(3)
	endif
EndFunction

Function Reset()
	ConfiscatingItems(false)
	PlayerRef.AddItem(BaboLoanSharkDebtSettledNote)
	BabodebtPaybackValueGlobal.setvalue(0)
	BaboPunishGlobal.setvalue(0)
	BacktoNormal()
	CustomersLeaving()
	BaboLoanSharks.setstage(0)
EndFunction