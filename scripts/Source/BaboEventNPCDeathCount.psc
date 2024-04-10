Scriptname BaboEventNPCDeathCount extends ObjectReference  

	EVENT onDying(actor myKiller)

		Deathcount.SetValue(Deathcount.GetValue() + KillingValue)

	ENDEVENT


int property KillingValue auto
GlobalVariable Property Deathcount Auto