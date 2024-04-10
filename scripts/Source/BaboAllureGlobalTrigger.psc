Scriptname BaboAllureGlobalTrigger extends Quest  
{This will trigger and adjust the value of globals}

GlobalVariable Property AllurePoints Auto
GlobalVariable Property AllureAddSmall Auto
GlobalVariable Property AllureAddBig Auto
GlobalVariable Property AllureTrigger01 Auto
BaboXmarkerMover Property BaboXmarkerMoverScript Auto

ReferenceAlias Property Alias_EnthralledMan Auto
Quest Property BaboReputationScript Auto;BaboReputationMasterScript 
Actor Property PlayerRef Auto

Function AfterbarteringScene(int i)
	BaboXmarkerMoverScript.SelfCommentaryEndofEvents(i)
EndFunction

Function AllureAddSmallValue();30chance
		int AdjPoints = Utility.RandomInt(-10,10)
		AllurePoints.SetValue(AllurePoints.GetValue() + AllureAddSmall.GetValue() + AdjPoints)
		(BaboReputationScript as BaboReputationMasterScript).IncreaseReputationBitch(4)
		;debug.messagebox ("AllureAddSmallValue added")
EndFunction

Function AllureAddBigValue();70chance
		int AdjPoints = Utility.RandomInt(-10,10)
		AllurePoints.SetValue(AllurePoints.GetValue() + AllureAddBig.GetValue() + AdjPoints)
		(BaboReputationScript as BaboReputationMasterScript).IncreaseReputationBitch(7)
		;debug.messagebox ("AllureAddBigValue added")
EndFunction

Function AllureLowChance(actor akactor)
	if !ChanceRoll(akactor, 30)
		AllureAddSmallValue()
	endif
EndFunction

Function AllureHighChance(actor akactor)
	if !ChanceRoll(akactor, 70)
		AllureAddBigValue()
	endif
EndFunction

Bool Function ChanceRoll(actor akactor, int chance)
int RandomChance = Utility.randomint(0, 100)

if RandomChance < chance
	EnthralledMerchant(akactor)
	Return True
else
	Return False
endif

EndFunction

Function EnthralledMerchant(actor akactor)
	Alias_EnthralledMan.ForceRefTo(akactor)
	akactor.EvaluatePackage()
EndFunction

Function AllureSubtractValue()
		AllurePoints.SetValue(AllurePoints.GetValue() - AllureAddBig.GetValue())
		;debug.messagebox ("AllureSubtractValue subtracted")
EndFunction

Function AllureSubtractSmallValue()
		AllurePoints.SetValue(AllurePoints.GetValue() - AllureAddSmall.GetValue())
		;debug.messagebox ("AllureSubtractValue subtracted")
EndFunction

Function AllureReturntoBasicValue()
		AllurePoints.SetValue(AllurePoints.GetValue() - AllureTrigger01.GetValue())
EndFunction