Scriptname BaboQuestDebugTestConfig extends Quest  

Formlist Property BaboFavorCharmPotions Auto
Quest Property BaboSexController  Auto  
ObjectReference Property BaboArenaPlayerXmarker Auto
Actor Property PlayerRef Auto

Function FadeinTest()
	(BaboSexController as BaboSexControllerManager).FadeinScene(false)
	PlayerRef.moveto(BaboArenaPlayerXmarker)
	(BaboSexController as BaboSexControllerManager).FadeoutScene(false)
EndFunction

Function GiveCharmPotion(actor akactor)
	If akactor.ShowGiftMenu(True, BaboFavorCharmPotions) > 0
		Debug.messagebox("You gave him a potion")
	else
		Debug.messagebox("You didn't give him a potion")
	endif
EndFunction