Scriptname BaboKidnapperRefScript extends ReferenceAlias  

Event OnDeath(Actor akKiller)
	(BaboKidnapEvent as BaboKidnapEvenScript).KidnapperDied(inum)
EndEvent


Quest Property BaboSexController Auto
Quest Property BaboKidnapEvent Auto
int Property inum Auto