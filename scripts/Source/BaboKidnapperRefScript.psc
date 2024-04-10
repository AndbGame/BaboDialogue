Scriptname BaboKidnapperRefScript extends ReferenceAlias  

Event OnDeath(Actor akKiller)
	(BaboKidnapEvent as BaboKidnapEvenScript).KidnapperDied()
EndEvent


Quest Property BaboSexController Auto
Quest Property BaboKidnapEvent Auto