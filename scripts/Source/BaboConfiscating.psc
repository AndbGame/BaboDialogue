Scriptname BaboConfiscating extends Quest  

ObjectReference Property OrcContainer Auto

Armor CurrentPanty
Armor CurrentHead
Armor CurrentBody
Armor CurrentHand
Armor CurrentFeet
Armor CurrentShield

Weapon CurrentRWeapon

Actor Property PlayerRef Auto
Actor targ

Function ConfiscateMWeapon()

CurrentRWeapon = PlayerRef.GetEquippedObject(1) as Weapon
PlayerRef.RemoveItem(CurrentRWeapon, 1, false, OrcContainer)

EndFunction

Function ConfiscateMEquipment()

	CurrentBody = PlayerRef.GetWornForm(0x00000004) as Armor
	CurrentPanty = PlayerRef.GetWornForm(0x00400000) as Armor
	CurrentHand = PlayerRef.GetWornForm(0x00000008) as Armor
	CurrentFeet = PlayerRef.GetWornForm(0x00000080) as Armor
	CurrentShield = PlayerRef.GetWornForm(0x00000200) as Armor

	If !CurrentPanty.HasKeyWordString("Hentaipanty")
		CurrentPanty != PlayerRef.GetWornForm(0x00400000) as Armor
	EndIf

	PlayerRef.RemoveItem(CurrentBody, 1, false, OrcContainer)
	PlayerRef.RemoveItem(CurrentPanty, 1, false, OrcContainer)
	PlayerRef.RemoveItem(CurrentHand, 1, false, OrcContainer)
	PlayerRef.RemoveItem(CurrentFeet, 1, false, OrcContainer)
	PlayerRef.RemoveItem(CurrentShield, 1, false, OrcContainer)

EndFunction
