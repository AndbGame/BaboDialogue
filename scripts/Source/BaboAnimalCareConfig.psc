Scriptname BaboAnimalCareConfig extends Quest Conditional

ReferenceAlias[] Property Creatures  Auto  
Faction Property BaboPlayerAnimalStayFaction  Auto  
Faction Property BaboPlayerAnimalStayPlaceFaction  Auto  
Faction Property BaboAnimalOwnedFaction  Auto  
GlobalVariable Property GameHour Auto
Message Property BaboAnimalCareTakePetMsg auto
Message Property BaboAnimalCareTakePetBYOHMsg auto
Message Property BaboAnimalCareTakePetSuccessMsg auto
Message Property BaboAnimalCareTakePetFailMsg auto
int iHouse
String Property AnimalCareStartHour = "babo.animalcare.starthour" autoreadonly hidden
String Property AnimalCareEndHour = "babo.animalcare.endhour" autoreadonly hidden

Bool Function TakePet(actor akactor, int fday)
	if AllotSlot(akactor)
		SetHouse()
		akactor.setfactionrank(BaboPlayerAnimalStayFaction, 0)
		akactor.setfactionrank(BaboPlayerAnimalStayPlaceFaction, iHouse)
		;Debug.notification("Current value is " + iHouse)
		BaboAnimalCareTakePetSuccessMsg.show()
			StorageUtil.FloatListAdd(akactor, AnimalCareStartHour, GameHour.getvalue(), true)
		if fday > 0
			StorageUtil.FloatListAdd(akactor, AnimalCareEndHour, fday * 24.0, true)
		endif
		return true
	else
		BaboAnimalCareTakePetFailMsg.show()
		return false
	endif
EndFunction

bool Function DismissPet(actor akactor)
int iindex = Creatures.length;Total 15
int i = 0
	While i < iindex
		if Creatures[i].getreference() as actor == akactor
			Creatures[i].clear()
			akactor.removefromfaction(BaboPlayerAnimalStayFaction)
			akactor.removefromfaction(BaboPlayerAnimalStayPlaceFaction)
			return true
		endif
	i += 1
	EndWhile
	return false
EndFunction

bool Function AllotSlot(actor akactor)
int iindex = Creatures.length;Total 15
int i = 0
	While i < iindex
		if Creatures[i].getreference() == none
			Creatures[i].forcerefto(akactor)
			return true
		endif
	i += 1
	EndWhile
	return false
EndFunction

bool Function CheckTempAnimal(actor akactor)
	if akactor.getfactionrank(BaboAnimalOwnedFaction) == 1
		float fstart = GameHour.getvalue() - (StorageUtil.FloatListGet(akactor, AnimalCareStartHour, 0))
		if fstart > (StorageUtil.FloatListGet(akactor, AnimalCareEndHour, 0))
			akactor.setfactionrank(BaboAnimalOwnedFaction, 2)
			return true
		endif
	endif
	return false
EndFunction

bool Function SetHouse()
	int choice = BaboAnimalCareTakePetMsg.show()
	if choice == 5
		SetHouseBYOH()
		return true
	else
		iHouse = choice
		return true
	endif
EndFunction

bool Function SetHouseBYOH()
	int choice = BaboAnimalCareTakePetBYOHMsg.show()
	if choice == 3
		return SetHouse()
	else
		iHouse = choice + 5
		return true
	endif
EndFunction

Function SetGameHourCustom(Bool AddTime, Float ftime)
if Addtime
	GameHour.SetValue(GameHour.getvalue() + ftime)
else
	GameHour.SetValue(ftime)
endif
EndFunction

Function SetTimer(float ftime)
	UnRegisterForUpdateGameTime()
	RegisterForSingleUpdateGameTime(ftime)
EndFunction

Function OffTimer()
	UnRegisterForUpdateGameTime()
EndFunction

Event OnUpdateGameTime()
int iindex = Creatures.length;Total 15
int i = 0
	While i < iindex
		actor akcreature = Creatures[i].getreference() as actor
		if akcreature != none
			CheckTempAnimal(akcreature)
		endif
	i += 1
	EndWhile
	SetTimer(12.0)
EndEvent