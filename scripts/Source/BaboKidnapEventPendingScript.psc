Scriptname BaboKidnapEventPendingScript extends Quest  

Quest Property BaboKidnapEvent  Auto  
Quest Property BaboSexController  Auto  
Actor Property PlayerRef Auto

Function PendingKidnapQuest(actor akactor01, actor akactor02 = none, actor akactor03 = none, actor akactor04 = none, actor akactor05 = none)

	Start()

	While BaboKidnapEvent.isrunning()
		Utility.Wait(10.0)
	EndWhile
	int iscenario = Utility.randomint(4, 6)
	(BaboSexController as BaboSexControllerManager).KidnapQuestStart(akactor01, None, iscenario, None)
	Utility.wait(7.0)
	(BaboKidnapEvent as BaboKidnapEvenScript).StartUptheEvent(4)
	(BaboKidnapEvent as BaboKidnapEvenScript).FadeoutScene(true)

	Stop()

EndFunction