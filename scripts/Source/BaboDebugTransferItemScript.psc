Scriptname BaboDebugTransferItemScript extends ObjectReference  

; Debug only. Button script. Link the button to the chest.
; 0 Weapon / 1 Current Wearings / 2 Armor (not worn) / 3 Potion / 4 Misc (>= MinGoldValue, no gold) / 5 Cancel

Actor Property PlayerRef Auto
MiscObject Property Gold001 Auto
Message Property BaboDebugRemoveItemMsg Auto
int Property MinGoldValue = 100 Auto

Event OnActivate(ObjectReference akActionRef)
	if akActionRef != PlayerRef
		return
	endif

	ObjectReference dest = GetLinkedRef()
	int pick = BaboDebugRemoveItemMsg.Show()
	if pick == 5
		return
	endif

	int kinds = 0
	int pieces = 0
	int valueSum = 0

	int i = PlayerRef.GetNumItems()
	while i > 0
		i -= 1
		Form item = PlayerRef.GetNthForm(i)
		if MatchPick(item, pick)
			int count = PlayerRef.GetItemCount(item)
			PlayerRef.RemoveItem(item, count, true, dest)
			kinds += 1
			pieces += count
			valueSum += item.GetGoldValue() * count
		endif
	endwhile

	Debug.Notification("Moved: " + kinds + " kinds / " + pieces + " pcs / " + valueSum + "g")
EndEvent

Bool Function MatchPick(Form item, int pick)
	int t = item.GetType()
	if pick == 0
		return t == 41
	elseif pick == 1
		return t == 26 && PlayerRef.IsEquipped(item)
	elseif pick == 2
		return t == 26 && !PlayerRef.IsEquipped(item)
	elseif pick == 3
		return t == 46
	elseif pick == 4
		return t == 32 && item != Gold001 && item.GetGoldValue() >= MinGoldValue
	endif
	return false
EndFunction