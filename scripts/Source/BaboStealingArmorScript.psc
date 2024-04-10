Scriptname BaboStealingArmorScript extends Quest

Import Debug
Int property CuttingStage = 0 auto hidden
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

ReferenceAlias Property PlayerAlias Auto
Actor Property PlayerRef Auto

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
	
	If Cuttingstage >= 12
		If CurrentBody
			RemoveCuirass(Victim, Pervert)
		else
			StealingArmorRandom(Victim, Pervert, true)
		EndIf
	ElseIf Cuttingstage >= 11
		If Victim.WornHasKeyword(SLA_ArmorPretty)
			RemoveCuirass(Victim, Pervert)
		else
			StealingArmorRandom(Victim, Pervert, true)
		Endif
	ElseIf Cuttingstage >= 10
		If Victim.WornHasKeyword(EroticArmor)
			RemoveCuirass(Victim, Pervert)
		else
			StealingArmorRandom(Victim, Pervert, true)
		Endif
	ElseIf Cuttingstage >= 9
		If Victim.WornHasKeyword(SLA_ArmorSpendex)
			RemoveCuirass(Victim, Pervert)
		else
			StealingArmorRandom(Victim, Pervert, true)
		Endif
	ElseIf Cuttingstage >= 8
		If Victim.WornHasKeyword(SLA_ArmorLewdLeotard)
			RemoveCuirass(Victim, Pervert)
		else
			StealingArmorRandom(Victim, Pervert, true)
		Endif
	ElseIf Cuttingstage >= 7
		If Victim.WornHasKeyword(SLA_ArmorHalfNakedBikini) || Victim.WornHasKeyword(SLA_ArmorCurtain)
			RemoveCuirass(Victim, Pervert)
		else
			StealingArmorRandom(Victim, Pervert, true)
		Endif
	ElseIf Cuttingstage >= 6
		If Victim.WornHasKeyword(SLA_ArmorHalfNaked) || Victim.WornHasKeyword(SLA_ArmorTransparent)
			RemoveCuirass(Victim, Pervert)
		else
			StealingArmorRandom(Victim, Pervert, true)
		Endif
	ElseIf Cuttingstage >= 5
		StealingArmorRandom(Victim, Pervert, true)
	ElseIf Cuttingstage >= 4
		FindThong(Victim, Pervert, True, True, None, False)
	ElseIf Cuttingstage >= 3
		FindPants(Victim, Pervert, True, True, None, False)
	endif
	
EndFunction

Function RemoveCuirass(Actor Victim, Actor Pervert)
	Victim.RemoveItem(CurrentBody, 1, false, Pervert)
	Pervert.Say(CombatTopicBra)
	(BaboSexController as BaboSexControllerManager).StealArmorMessagebox(1)
	SendAnimationEvent(Victim, "CoverPrivatesSec")
EndFunction


Function StealingArmorRandom(Actor Victim, Actor Pervert, Bool OnlyArmor)
	int random = Utility.RandomInt(0, 99)
	If random <= BaboGlobalDropItem.getvalue() as int
	Armor unequippedarmor
		If OnlyArmor
			unequippedarmor = searcharmor(Victim, False, None, True)
		else
			unequippedarmor = searcharmor(Victim, False, None, False)
		endif
		
		If unequippedarmor
			Victim.RemoveItem(unequippedarmor, 1, false, Pervert)
		EndIf
	EndIf
EndFunction


state FakeSteal

Function StealingArmor(Actor Victim, Actor Pervert)
	Cuttingstage += 1
	CurrentBody = Victim.GetWornForm(0x00000004) as Armor ;This Form is for Cuirass
	
	If !CurrentBody
		Cuttingstage = 0
		Return
	Endif
	
	If Cuttingstage >= 12
		If CurrentBody
			RemoveCuirass(Victim, Pervert)
		else
			StealingArmorRandom(Victim, Pervert, true)
		EndIf
	ElseIf Cuttingstage >= 11
		If Victim.WornHasKeyword(SLA_ArmorPretty)
			RemoveCuirass(Victim, Pervert)
		else
			StealingArmorRandom(Victim, Pervert, true)
		Endif
	ElseIf Cuttingstage >= 10
		If Victim.WornHasKeyword(EroticArmor)
			RemoveCuirass(Victim, Pervert)
		else
			StealingArmorRandom(Victim, Pervert, true)
		Endif
	ElseIf Cuttingstage >= 9
		If Victim.WornHasKeyword(SLA_ArmorSpendex)
			RemoveCuirass(Victim, Pervert)
		else
			StealingArmorRandom(Victim, Pervert, true)
		Endif
	ElseIf Cuttingstage >= 8
		If Victim.WornHasKeyword(SLA_ArmorLewdLeotard)
			RemoveCuirass(Victim, Pervert)
		else
			StealingArmorRandom(Victim, Pervert, true)
		Endif
	ElseIf Cuttingstage >= 7
		If Victim.WornHasKeyword(SLA_ArmorHalfNakedBikini) || Victim.WornHasKeyword(SLA_ArmorCurtain)
			RemoveCuirass(Victim, Pervert)
		else
			StealingArmorRandom(Victim, Pervert, true)
		Endif
	ElseIf Cuttingstage >= 6
		If Victim.WornHasKeyword(SLA_ArmorHalfNaked) || Victim.WornHasKeyword(SLA_ArmorTransparent)
			RemoveCuirass(Victim, Pervert)
		else
			StealingArmorRandom(Victim, Pervert, true)
		Endif
	ElseIf Cuttingstage >= 5
		StealingArmorRandom(Victim, Pervert, true)
	ElseIf Cuttingstage >= 4
		FindThong(Victim, None, False, True, BaboTempStolenGoodsRef, True)
	ElseIf Cuttingstage >= 3
		FindPants(Victim, None, False, True, BaboTempStolenGoodsRef, True)
	endif
	
EndFunction

Function RemoveCuirass(Actor Victim, Actor Pervert)
	Victim.RemoveItem(CurrentBody, 1, false, BaboTempStolenGoodsRef)
	Pervert.Say(CombatTopicBra)
	(BaboSexController as BaboSexControllerManager).StealArmorMessagebox(1)
	SendAnimationEvent(Victim, "CoverPrivatesSec")
EndFunction

Function StealingArmorRandom(Actor Victim, Actor Pervert, Bool OnlyArmor)
	int random = Utility.RandomInt(0, 99)
	If random <= BaboGlobalDropItem.getvalue() as int
	Armor unequippedarmor
	
		If OnlyArmor
			unequippedarmor = searcharmor(Victim, False, None, True)
		else
			unequippedarmor = searcharmor(Victim, False, None, False)
		endif
		
		If unequippedarmor
			Victim.RemoveItem(unequippedarmor, 1, false, BaboTempStolenGoodsRef)
		EndIf
		
	EndIf
EndFunction

EndState


Function GetStrippedArmor(Actor Victim, Actor Pervert, Bool StripCuirass)
	CurrentBody = Victim.GetWornForm(0x00000004) as Armor ;This Form is for Cuirass
	Victim.RemoveItem(SearchArmor(Victim, True, SLA_ThongCString), 1, false, BaboTempStolenGoodsRef)
	Victim.RemoveItem(SearchArmor(Victim, True, SLA_ThongLowleg), 1, false, BaboTempStolenGoodsRef)
	Victim.RemoveItem(SearchArmor(Victim, True, SLA_ThongT), 1, false, BaboTempStolenGoodsRef)
	Victim.RemoveItem(SearchArmor(Victim, True, SLA_PantiesNormal), 1, false, BaboTempStolenGoodsRef)
	if StripCuirass
		Victim.RemoveItem(CurrentBody, 1, false, BaboTempStolenGoodsRef)
	else
		If (Victim.WornHasKeyword(SLA_ArmorSpendex) || Victim.WornHasKeyword(EroticArmor) || Victim.WornHasKeyword(SLA_ArmorHalfNakedBikini) || Victim.WornHasKeyword(SLA_ArmorHalfNaked))
			Victim.RemoveItem(CurrentBody, 1, false, BaboTempStolenGoodsRef)
		endif
	endif
Endfunction

Form Function FindArmor(Actor target, Actor Receiver, Keyword TargetArmor, Bool StealSwitch = False, Bool Animated = False)
Form[] wornForms = new Form[30]
int index
int slotsChecked
slotsChecked += 0x00100000
slotsChecked += 0x00200000 ;ignore reserved slots
slotsChecked += 0x80000000

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
Form[] wornForms = new Form[30]
int index
int slotsChecked
slotsChecked += 0x00100000
slotsChecked += 0x00200000 ;ignore reserved slots
slotsChecked += 0x80000000

int thisSlot = 0x01
	while (thisSlot < 0x80000000)
	if (Math.LogicalAnd(slotsChecked, thisSlot) != thisSlot) ;only check slots we haven't found anything equipped on already
	Armor thisArmor = target.GetWornForm(thisSlot) as Armor
	if (thisArmor)
		if thisArmor.HasKeyword(SLA_PantiesNormal) || thisArmor.HasKeyword(SLA_MicroHotpants) || thisArmor.HasKeyword(SLA_ThongLowleg) || thisArmor.HasKeyword(SLA_ThongT) || thisArmor.HasKeyword(SLA_ThongGstring) || thisArmor.HasKeyword(SLA_ThongCString) || thisArmor.HasKeyword(SLA_PastiesCrotch)
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
Form[] wornForms = new Form[30]
int index
int slotsChecked
slotsChecked += 0x00100000
slotsChecked += 0x00200000 ;ignore reserved slots
slotsChecked += 0x80000000

int thisSlot = 0x01
	while (thisSlot < 0x80000000)
	if (Math.LogicalAnd(slotsChecked, thisSlot) != thisSlot) ;only check slots we haven't found anything equipped on already
	Armor thisArmor = target.GetWornForm(thisSlot) as Armor
	if (thisArmor)
		if thisArmor.HasKeyword(SLA_PelvicCurtain) || thisArmor.HasKeyword(SLA_MicroSkirt) || thisArmor.HasKeyword(SLA_MiniSkirt) || thisArmor.HasKeyword(SLA_ShowgirlSkirt) || thisArmor.HasKeyword(SLA_FullSkirt) || thisArmor.HasKeyword(SLA_PantsNormal)
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


Armor Function SearchArmor(Actor target, Bool Keywordswitch = False, Keyword TargetArmor, Bool OnlyCuirassPart = false)
Armor[] wornForms = new Armor[30]
int index
int slotsChecked
Bool StripSwitch
slotsChecked += 0x00100000
slotsChecked += 0x00200000 ;ignore reserved slots
slotsChecked += 0x80000000
slotsChecked += 0x00000200 ; shield

If OnlyCuirassPart
	slotsChecked += 0x00000008 ;hand
	slotsChecked += 0x00000010 ;forearms
	slotsChecked += 0x00000080 ;feet
	slotsChecked += 0x00000001 ;head
	slotsChecked += 0x00000002 ;hair
	slotsChecked += 0x00001000 ;circlet
else
	slotsChecked += 0x00000004 ;Cuirass
EndIf


int thisSlot = 0x01
	while (thisSlot < 0x80000000) && StripSwitch == False
	if (Math.LogicalAnd(slotsChecked, thisSlot) != thisSlot) ;only check slots we haven't found anything equipped on already
	Armor thisArmor = target.GetWornForm(thisSlot) as Armor
	StripSwitch = false
	If !Keywordswitch
		return thisarmor
		StripSwitch = True
	Else
		if (thisArmor.HasKeyword(TargetArmor))
			return thisarmor
			StripSwitch = True
		Else
			slotsChecked += thisSlot
		EndIf
	endif
	endif
		thisSlot *= 2 ;double the number to move on to the next slot
	endWhile
EndFunction

Function SimpleFindandMoveArmor(Actor target, ObjectReference Receiver, Keyword TargetArmor, Bool RemoveSwitch)
Form[] wornForms = new Form[30]
int index
int slotsChecked
slotsChecked += 0x00100000
slotsChecked += 0x00200000 ;ignore reserved slots
slotsChecked += 0x80000000

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
