Scriptname BaboHiddenPocket  extends ReferenceAlias

Keyword Property ClothingRing Auto
Keyword Property ClothingNecklace Auto
Keyword Property VendorItemGem Auto
MiscObject Property Lockpick Auto
Actor Property PlayerRef Auto
Quest Property BaboSexController Auto
float Property MAXCAPACITY = 1.0 AutoReadOnly
int Property MAXCOUNT = 5 AutoReadOnly

ObjectReference pocket
int addCount
int removeCount

Event OnInit()
	pocket = GetReference()
	RegisterForMenu("ContainerMenu")
EndEvent

Event OnMenuOpen(String MenuName)
	addCount = 0
	removeCount = 0
EndEvent

Event OnMenuClose(String MenuName)

	if addCount == 0 && removeCount == 0
		return
	endif

	if addCount >= removeCount
		Debug.SendAnimationEvent(PlayerRef, "BaboExPocketPullin")
	else
		Debug.SendAnimationEvent(PlayerRef, "BaboExPocketPullout")
	endif
EndEvent

Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
	GoToState("Adding")

	bool back = true
	int backCount = aiItemCount

	if akBaseItem as Key
		back = false
	elseif akBaseItem as Armor
		if akBaseItem.HasKeyword(ClothingRing) || akBaseItem.HasKeyword(ClothingNecklace)
			back = false
		endif
	elseif akBaseItem as MiscObject
		if akBaseItem == Lockpick || akBaseItem.HasKeyword(VendorItemGem)
			back = false
		endif
	endif

	if back
		(BaboSexController as BaboSexControllerManager).HiddenPocketMessagebox(2)
	endif

	if !back
		if pocket.GetTotalItemWeight() > MAXCAPACITY
			back = true
			(BaboSexController as BaboSexControllerManager).HiddenPocketMessagebox(3)
		endif
	endif

	if !back
		int count = 0
		Form[] items = pocket.GetContainerForms()
		int n = items.Length
		int i = 0
		while i < n
			count += pocket.GetItemCount(items[i])
			i += 1
		endWhile
		if count > MAXCOUNT
			back = true
			backCount = count - MAXCOUNT
			(BaboSexController as BaboSexControllerManager).HiddenPocketMessagebox(3)
		endif
	endif

	if back
		pocket.RemoveItem(akBaseItem, backCount, true, akSourceContainer)
		addCount += aiItemCount - backCount
	else
		addCount += aiItemCount
	endif

	GoToState("")
EndEvent

Event OnItemRemoved(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)
	removeCount += aiItemCount
EndEvent

state Adding
	Event OnItemRemoved(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)

	EndEvent
endState