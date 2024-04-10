Scriptname BaboStripArmor extends Quest  

ObjectReference Property EmptyContainer Auto
MiscObject Property Gold001 Auto
Referencealias Property PervertRef Auto

Armor CurrentPanty
Armor CurrentHead
Armor CurrentBody
Armor CurrentHand
Armor CurrentFeet
Armor CurrentShield

Weapon CurrentRWeapon

Actor Property PlayerRef Auto


Function StealingGold(ReferenceAlias StealerRef, int Number)

Actor Pervert = StealerRef.GetActorReference()

	PlayerRef.RemoveItem(Gold001, Number, false, Pervert)

EndFunction

Function ConfiscateMWeapon(ReferenceAlias StealerRef)

Actor Pervert = PervertRef.GetActorReference()

	CurrentRWeapon = PlayerRef.GetEquippedObject(1) as Weapon
	PlayerRef.RemoveItem(CurrentRWeapon, 1, false, Pervert)

EndFunction

Function ConfiscateShield(ReferenceAlias StealerRef)

Actor Pervert = StealerRef.GetActorReference()

	CurrentShield = PlayerRef.GetWornForm(0x00000200) as Armor
	PlayerRef.RemoveItem(CurrentShield, 1, false, Pervert)

EndFunction

Function ConfiscateArmorBra(ReferenceAlias StealerRef)

Actor Pervert = StealerRef.GetActorReference()

	CurrentBody = PlayerRef.GetWornForm(0x00000004) as Armor
	PlayerRef.RemoveItem(CurrentBody, 1, false, Pervert)

EndFunction

Function ConfiscateArmorPanty(ReferenceAlias StealerRef)

Actor Pervert = StealerRef.GetActorReference()

	CurrentPanty = PlayerRef.GetWornForm(0x00400000) as Armor
	PlayerRef.RemoveItem(CurrentPanty, 1, false, Pervert)

EndFunction