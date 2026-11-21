Scriptname BaboDialogueRieklingScript extends Quest  

GlobalVariable Property BaboThirskRieklingInterval Auto
GlobalVariable Property BaboThirskRieklingSwitch Auto
GlobalVariable Property BaboThirskRieklingReadyGlobal Auto
Quest Property BaboSexController Auto

Function RieklingSexActor(Actor Actor01, Actor Actor02, string EventDummy = "", string EventName = "", bool bevent = false, bool brape = false)
	actor[] Sexactor = new actor[1]
	Sexactor[0] = Actor02
	(BaboSexController as BaboSexControllerManager).AddHadSexFaction(Sexactor, false)
	(BaboSexController as BaboSexControllerManager).SexCustomactor(Actor01, Actor02, None, None, None, "Riekling", "Vaginal", "CF", bevent, EventDummy, EventName, brape)
EndFunction

Function RieklingInvadeSwitch(bool bswitch);Obsolete for now
	if bswitch
		BaboThirskRieklingSwitch.setvalue(1)
	else
		BaboThirskRieklingSwitch.setvalue(0)
	endif
EndFunction

Function FireUpdate()
	RegisterForSingleUpdateGameTime(BaboThirskRieklingInterval.getvalue() * 24.0)
EndFunction

Function CancelUpdate()
	UnregisterForUpdateGameTime()
EndFunction

Function ImmediateReady()
	BaboThirskRieklingReadyGlobal.setvalue(1)
EndFunction

Event Onupdate()
	BaboThirskRieklingReadyGlobal.setvalue(1);Challenger Quest ready.
EndEvent