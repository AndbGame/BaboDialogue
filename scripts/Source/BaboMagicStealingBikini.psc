Scriptname BaboMagicStealingBikini extends ActiveMagicEffect  
{This script is for magic enchant effect which can cut her bikini parts and take them as collections.}

Event OnEffectStart(Actor Subject, Actor Attacker)
;Debug.notification("Ouch!")
BaboStealQuset.StealingArmor(Subject, Attacker)

EndEvent

Event OnEffectFinish(Actor Subject, Actor Attacker)
;Debug.notification("Ouch?")
	BaboTempStolengoodsRef.removeallitems(Subject, false, true)
EndEvent

ObjectReference Property BaboTempStolenGoodsRef  Auto  
BaboStealingArmorScript Property BaboStealQuset Auto