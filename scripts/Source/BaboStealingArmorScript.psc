Scriptname BaboStealingArmorScript extends Quest

Import Debug
Int property CuttingStage = 0 auto hidden
int TearStage = 12 ; CuttingStage at which the cuirass is torn off, set at stage 6
Actor targ
Armor CurrentPanty
Armor CurrentHead
Armor CurrentBody
Topic Property CombatTopicPanty  Auto
Topic Property CombatTopicBra  Auto
bool bPlayerOnly
Bool bIsOkToPlay

Keyword Property EroticArmor Auto
Keyword Property SLA_ArmorPretty Auto
Keyword Property SLA_ArmorCurtain Auto
Keyword Property SLA_ArmorHalfNakedBikini Auto
Keyword Property SLA_ArmorHalfNaked Auto
Keyword Property SLA_ArmorSpendex Auto
Keyword Property SLA_ArmorLewdLeotard Auto
Keyword Property SLA_ArmorTransparent Auto
Keyword Property SLA_PastiesNipple Auto

Keyword Property SLA_PantiesNormal Auto
Keyword Property SLA_MicroHotpants Auto
Keyword Property SLA_ThongLowleg Auto
Keyword Property SLA_ThongT Auto
Keyword Property SLA_ThongGstring Auto
Keyword Property SLA_ThongCString Auto
Keyword Property SLA_PastiesCrotch Auto

Keyword Property SLA_PelvicCurtain Auto
Keyword Property SLA_MicroSkirt Auto
Keyword Property SLA_MiniSkirt Auto
Keyword Property SLA_ShowgirlSkirt Auto
Keyword Property SLA_FullSkirt Auto
Keyword Property SLA_PantsNormal Auto

GlobalVariable Property BaboStealingArmorSetting Auto
GlobalVariable Property BaboGlobalDropItem Auto
ObjectReference Property BaboTempStolenGoodsRef Auto
Quest Property BaboSexController Auto
Quest Property BaboDialogueUtil Auto

ReferenceAlias Property PlayerAlias Auto
Actor Property PlayerRef Auto

String Property BaboUnequippedList = "babodialogue.unequipped" autoreadonly hidden

;Event OnEffectStart(Actor Victim, Actor Pervert)

Function FakeStealSetting(Bool Button)
If Button
	GotoState("FakeSteal")
Else
	GotoState("")
EndIf
EndFunction

Function RegisterPO3HitEvent(form akaggressor)
	if !PlayerAlias.getreference()
		PlayerAlias.forcerefto(PlayerRef)
	endif
	PO3_Events_Alias.RegisterForHitEventEx(PlayerAlias, akaggressor, None, None, -1, -1, -1, -1, true)
EndFunction

Function UnRegisterPO3HitEvent(form akaggressor)
	PO3_Events_Alias.UnregisterForHitEventEx(PlayerAlias, akaggressor, None, None, -1, -1, -1, -1, true)
	PlayerAlias.clear()
EndFunction

Function StealingArmor(Actor Victim, Actor Pervert)
	Cuttingstage += 1
	CurrentBody = Victim.GetWornForm(0x00000004) as Armor ;This Form is for Cuirass
	
	If !CurrentBody
		Cuttingstage = 0
		Return
	Endif
	
	If Cuttingstage == 6 ; read the style tier once per cycle: 0-1 halfnaked/transparent 6, 2-3 curtain/bikini 7, 4 leotard 8, 5 spandex 9, 6 erotic 10, 7 pretty 11, none 12
		int tier = (BaboDialogueUtil as BaboDia_Util).GetStyleTier(Victim)
		TearStage = 12
		If tier >= 4
			TearStage = tier + 4
		ElseIf tier >= 0
			TearStage = 6 + tier / 2
		EndIf
	EndIf
	
	bool fake = GetState() == "FakeSteal"
	If Cuttingstage >= 6
		If Cuttingstage >= TearStage
			RemoveCuirass(Victim, Pervert)
		else
			StealingArmorRandom(Victim, Pervert, true)
		EndIf
	ElseIf Cuttingstage >= 5
		StealingArmorRandom(Victim, Pervert, true)
	ElseIf Cuttingstage >= 4
		FindThong(Victim, Pervert, !fake, True, BaboTempStolenGoodsRef, fake)
	ElseIf Cuttingstage >= 3
		FindPants(Victim, Pervert, !fake, True, BaboTempStolenGoodsRef, fake)
	endif
	
EndFunction

Function RemoveCuirass(Actor Victim, Actor Pervert)
	If GetState() == "FakeSteal"
		Victim.RemoveItem(CurrentBody, 1, false, BaboTempStolenGoodsRef)
	Else
		Victim.RemoveItem(CurrentBody, 1, false, Pervert)
	EndIf
	Pervert.Say(CombatTopicBra)
	(BaboSexController as BaboSexControllerManager).StealArmorMessagebox(1)
	SendAnimationEvent(Victim, "CoverPrivatesSec")
EndFunction

Function StealingArmorRandom(Actor Victim, Actor Pervert, Bool OnlyArmor)
	If Utility.RandomInt(0, 99) <= BaboGlobalDropItem.getvalue() as int
		Armor unequippedarmor = SearchArmor(Victim, False, None, OnlyArmor)
		If unequippedarmor
			If GetState() == "FakeSteal"
				Victim.RemoveItem(unequippedarmor, 1, false, BaboTempStolenGoodsRef)
			Else
				Victim.RemoveItem(unequippedarmor, 1, false, Pervert)
			EndIf
		EndIf
	EndIf
EndFunction


state FakeSteal ; stolen items go to BaboTempStolenGoodsRef instead of the attacker (checked via GetState in the functions above)
EndState

; Rip off the player's clothes: cuirass, then any remaining bra-type top. Pants/hotpants hold the bottom; else a skirt goes, else the underwear.
Function RipoffClothes(Actor Victim)
	BaboDia_Util util = BaboDialogueUtil as BaboDia_Util
	Victim.RemoveItem(Victim.GetWornForm(0x00000004), 1, false, BaboTempStolenGoodsRef) ; cuirass
	util.StripPlayerCoverage(BaboTempStolenGoodsRef, 0) ; remaining bra-type tops
	if util.IsBottomFullyCovered(Victim, 7) ; pants/hotpants hold
		return
	endif
	if util.StripPlayerCoverage(BaboTempStolenGoodsRef, 6) == 0 ; skirt goes instead of underwear
		util.StripPlayerCoverage(BaboTempStolenGoodsRef, 7, 2) ; otherwise underwear
	endif
EndFunction

Form Function FindArmor(Actor target, Actor Receiver, Keyword TargetArmor, Bool StealSwitch = False, Bool Animated = False)
Form[] wornForms = new Form[30]
int index
int slotsChecked
slotsChecked += 0x00100000
slotsChecked += 0x00200000 ;ignore reserved slots
slotsChecked += 0x80000000
slotsChecked += 0x40000000 ; slot 60 (3BA body)

int thisSlot = 0x01
	while (thisSlot < 0x80000000)
	if (Math.LogicalAnd(slotsChecked, thisSlot) != thisSlot) ;only check slots we haven't found anything equipped on already
	Armor thisArmor = target.GetWornForm(thisSlot) as Armor
	if (thisArmor)
		if (thisArmor.HasKeyword(TargetArmor)) ;check for PantyKeyword
            Target.UnequipItem(thisArmor)
			If StealSwitch
				Target.RemoveItem(thisArmor, 1, false, Receiver)
			EndIf
			If Animated
				Receiver.Say(CombatTopicPanty)
				SendAnimationEvent(target, "CoverPrivates")
				(BaboSexController as BaboSexControllerManager).StealArmorMessagebox(2)
			EndIf
			CuttingStage = 0
		EndIf
	else ;no armor was found on this slot
			slotsChecked += thisSlot
	endif
	endif
		thisSlot *= 2 ;double the number to move on to the next slot
	endWhile
	;return wornForms
EndFunction

Function FindThong(Actor target, actor Receiver, Bool StealSwitch = False, Bool Animated = False, ObjectReference TempChest, Bool FakeSwitch)
BaboDia_Util util = BaboDialogueUtil as BaboDia_Util
int slotsChecked = 0xC0300000 ;ignore reserved slots, 60 (3BA body), 61 (spell FX)

int thisSlot = 0x01
	while (thisSlot < 0x80000000)
	if (Math.LogicalAnd(slotsChecked, thisSlot) != thisSlot) ;only check slots we haven't found anything equipped on already
	Armor thisArmor = target.GetWornForm(thisSlot) as Armor
	if (thisArmor)
		if util.FormInCoverage(thisArmor, 7, 2) ; underwear, thongs, pasties (coverage_bottom after pants/Hotpants)
            Target.UnequipItem(thisArmor)
			If StealSwitch
				Target.RemoveItem(thisArmor, 1, false, Receiver)
			EndIf
			If FakeSwitch
				Target.RemoveItem(thisArmor, 1, false, TempChest)
			Endif
			If Animated
			Receiver.Say(CombatTopicPanty)
			SendAnimationEvent(target, "CoverPrivates")
			(BaboSexController as BaboSexControllerManager).StealArmorMessagebox(2)
			EndIf
			return
		EndIf
	else ;no armor was found on this slot
			slotsChecked += thisSlot
	endif
	endif
		thisSlot *= 2 ;double the number to move on to the next slot
	endWhile
EndFunction

Function FindPants(Actor target, Actor Receiver, Bool StealSwitch = False, Bool Animated = False, ObjectReference TempChest, Bool FakeSwitch)
BaboDia_Util util = BaboDialogueUtil as BaboDia_Util
int slotsChecked = 0xC0300000 ;ignore reserved slots, 60 (3BA body), 61 (spell FX)

int thisSlot = 0x01
	while (thisSlot < 0x80000000)
	if (Math.LogicalAnd(slotsChecked, thisSlot) != thisSlot) ;only check slots we haven't found anything equipped on already
	Armor thisArmor = target.GetWornForm(thisSlot) as Armor
	if (thisArmor)
		if util.FormInCoverage(thisArmor, 6) || util.FormInCoverage(thisArmor, 7, 1) ; skirts/curtains, or armor_bottom_full/pants/Hotpants
            Target.UnequipItem(thisArmor)
			If StealSwitch
				Target.RemoveItem(thisArmor, 1, false, Receiver)
			EndIf
			If FakeSwitch
				Target.RemoveItem(thisArmor, 1, false, TempChest)
			Endif
			If Animated
			Receiver.Say(CombatTopicPanty)
			(BaboSexController as BaboSexControllerManager).StealArmorMessagebox(3)
			EndIf
			CuttingStage = 0
			return
		EndIf
	else ;no armor was found on this slot
			slotsChecked += thisSlot
	endif
	endif
		thisSlot *= 2 ;double the number to move on to the next slot
	endWhile
EndFunction

; Random worn armor (one entry per armor). Amulet/ring/shield/reserved slots are never picked.
Armor Function SearchArmor(Actor target, Bool Keywordswitch = False, Keyword TargetArmor, Bool OnlyCuirassPart = false)
int slotsChecked = 0xC0300260 ; reserved 20/21, 60 (3BA body), 61 (spell FX), shield, amulet, ring
If OnlyCuirassPart
	slotsChecked += 0x0000109B ; head, hair, hands, forearms, feet, circlet
else
	slotsChecked += 0x00000004 ; cuirass
EndIf
Armor[] picks = new Armor[32]
int count = 0

int thisSlot = 0x01
	while (thisSlot < 0x80000000)
	if (Math.LogicalAnd(slotsChecked, thisSlot) != thisSlot)
	Armor thisArmor = target.GetWornForm(thisSlot) as Armor
	if thisArmor && (!Keywordswitch || thisArmor.HasKeyword(TargetArmor))
		slotsChecked += Math.LogicalAnd(thisArmor.GetSlotMask(), Math.LogicalNot(slotsChecked)) ; skip the other slots of this armor
		picks[count] = thisArmor
		count += 1
	endif
	endif
		thisSlot *= 2 ;double the number to move on to the next slot
	endWhile
	if count
		return picks[Utility.RandomInt(0, count - 1)]
	endif
	return None
EndFunction
Function SimpleFindandMoveArmor(Actor target, ObjectReference Receiver, Keyword TargetArmor, Bool RemoveSwitch)
Form[] wornForms = new Form[30]
int index
int slotsChecked
slotsChecked += 0x00100000
slotsChecked += 0x00200000 ;ignore reserved slots
slotsChecked += 0x80000000
slotsChecked += 0x40000000 ; slot 60 (3BA body)

int thisSlot = 0x01
	while (thisSlot < 0x80000000)
	if (Math.LogicalAnd(slotsChecked, thisSlot) != thisSlot) ;only check slots we haven't found anything equipped on already
	Armor thisArmor = target.GetWornForm(thisSlot) as Armor
	if (thisArmor)
		if (thisArmor.HasKeyword(TargetArmor)) ;check for PantyKeyword
            Target.UnequipItem(thisArmor)
			If RemoveSwitch
				Target.RemoveItem(thisArmor, 1, false, Receiver)
			EndIf
		EndIf
	else ;no armor was found on this slot
			slotsChecked += thisSlot
	endif
	endif
		thisSlot *= 2 ;double the number to move on to the next slot
	endWhile
	;return wornForms
EndFunction

Function SimpleFindandMoveKeyword(Actor target, ObjectReference Receiver, formlist KeywordFormList, Bool RemoveSwitch = False)
Form[] wornForms = new Form[30]
int index
int slotsChecked
slotsChecked += 0x00100000
slotsChecked += 0x00200000 ;ignore reserved slots
slotsChecked += 0x80000000
slotsChecked += 0x40000000 ; slot 60 (3BA body)
Int iIndex = KeywordFormList.GetSize()

int thisSlot = 0x01
	while (thisSlot < 0x80000000)
	if (Math.LogicalAnd(slotsChecked, thisSlot) != thisSlot) ;only check slots we haven't found anything equipped on already
	Armor thisArmor = target.GetWornForm(thisSlot) as Armor
	if (thisArmor)
		While iIndex > 0
			iIndex -= 1
			if thisArmor.haskeyword(KeywordFormList.getat(iIndex) as keyword)
				Target.UnequipItem(thisArmor)
				If RemoveSwitch
					Target.RemoveItem(thisArmor, 1, false, Receiver)
				EndIf
				iIndex = 0
				return
			endif
		EndWhile
	else ;no armor was found on this slot
			slotsChecked += thisSlot
	endif
	endif
		thisSlot *= 2 ;double the number to move on to the next slot
	endWhile
EndFunction
