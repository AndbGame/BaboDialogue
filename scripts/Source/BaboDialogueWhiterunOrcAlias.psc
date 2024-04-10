Scriptname BaboDialogueWhiterunOrcAlias extends ReferenceAlias  

Event OnDeath(Actor akKiller)
	(Getowningquest() as BaboDialogueWhiterunScript).OrcsAreDead()
EndEvent