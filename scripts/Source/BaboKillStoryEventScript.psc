Scriptname BaboKillStoryEventScript extends Quest  

Actor Property PlayerRef Auto
GlobalVariable Property BaboSexlabStatTrauma Auto
Quest Property BaboMonitorScript Auto;BaboMonitorScript as BaboDiaMonitorScript

Event OnStoryKillActor( ObjectReference pVictim, ObjectReference pKiller, Location pLoc, int nCrime, int nRelation )
	Actor VictimActor = pVictim as Actor
	Actor KillerActor = pKiller as Actor
	
	if ( VictimActor == None )
		Stop()
		return
	endif
	
	if ( KillerActor == None )
		Stop()
		return
	endif

	;if (KillerActor.HasMagicEffectWithKeyword(MagicInfluenceFrenzy));WIP

	if BaboSexlabStatTrauma.getvalue() > 0.0
		(BaboMonitorScript as BaboDiaMonitorScript).CalcTraumaExpLoss(0.2)
	else
		(BaboMonitorScript as BaboDiaMonitorScript).CalcConfidenceExpGain(0.2)
	endif
	
	Stop()
	return
EndEvent