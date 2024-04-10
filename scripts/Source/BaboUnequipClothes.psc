Scriptname BaboUnequipClothes extends ReferenceAlias  

Quest Property MyQuest Auto
Int Property Nextstage Auto

GlobalVariable Property BaboStripPercentage Auto
ObjectReference Property BaboTempStolenGoodsRef Auto
ReferenceAlias Property	CreatureRef	Auto
ReferenceAlias Property	PlayerRef Auto
Actor Property Player Auto
BaboStealingArmorScript Property BSAScript Auto
Idle Property Knockout Auto
Int HitCount = 0

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
If akAggressor == (CreatureRef.getref() as actor)
	int random = Utility.RandomInt(0, 100)
	If random <= BaboStripPercentage.getvalue() && Hitcount < 6
		Hitcount = Hitcount + 1
		Armor ThatArmor = (BSAScript.SearchArmor(Player, False, None))
		Player.UnequipItem(ThatArmor, false, true)
		Player.removeitem(ThatArmor, 1, true, BaboTempStolenGoodsRef)
	ElseIf random <= BaboStripPercentage.getvalue() && Hitcount >= 6
		MyQuest.Setstage(Nextstage)
		Player.playidle(Knockout)
	EndIf
EndIf
EndEvent