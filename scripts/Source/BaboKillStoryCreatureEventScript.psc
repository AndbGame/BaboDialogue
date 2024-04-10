Scriptname BaboKillStoryCreatureEventScript extends Quest  

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
	string victimrace = sslCreatureAnimationSlots.GetRaceKey(VictimActor.GetRace())
	;if (KillerActor.HasMagicEffectWithKeyword(MagicInfluenceFrenzy));WIP

		If victimrace == ("Giant") || victimrace == ("Lurker")
			(BaboMonitorScript as BaboDiaMonitorScript).CalcGiantTraumaExpGain(-0.2)
		elseIf victimrace == ("Skeever")
			(BaboMonitorScript as BaboDiaMonitorScript).CalcSkeeverTraumaExpGain(-0.2)
		elseIf victimrace == ("Draugr") || victimrace == ("Dragonpriest")
			(BaboMonitorScript as BaboDiaMonitorScript).CalcDraugrTraumaExpGain(-0.2)
		elseIf victimrace == ("Wolf") || victimrace == ("Werewolf") || victimrace == ("Dog")
			(BaboMonitorScript as BaboDiaMonitorScript).CalcCanineTraumaExpGain(-0.2)
		elseIf victimrace == ("Riekling")
			(BaboMonitorScript as BaboDiaMonitorScript).CalcRieklingTraumaExpGain(-0.2)
		elseIf victimrace == ("Sabrecat") || victimrace == ("Bear")  || victimrace == ("Boar")
			(BaboMonitorScript as BaboDiaMonitorScript).CalcBeastTraumaExpGain(-0.2)
		elseIf victimrace == ("Falmer")
			(BaboMonitorScript as BaboDiaMonitorScript).CalcFalmerTraumaExpGain(-0.2)
		elseIf victimrace == ("Troll")
			(BaboMonitorScript as BaboDiaMonitorScript).CalcTrollTraumaExpGain(-0.2)
		elseIf victimrace == ("Horse")
			(BaboMonitorScript as BaboDiaMonitorScript).CalcHorseTraumaExpGain(-0.2)
		elseIf victimrace == ("Chaurus") || victimrace == ("ChaurusReapers") || victimrace == ("ChaurusHunter")
			(BaboMonitorScript as BaboDiaMonitorScript).CalcChaurusTraumaExpGain(-0.2)
		elseIf victimrace == ("Spider") || victimrace == ("LargeSpider") || victimrace == ("GiantSpider")
			(BaboMonitorScript as BaboDiaMonitorScript).CalcSpiderTraumaExpGain(-0.2)
		elseIf victimrace == ("Spriggan")
			(BaboMonitorScript as BaboDiaMonitorScript).CalcSprigganTraumaExpGain(-0.2)
		elseIf victimrace == ("DwarvenSpider") || victimrace == ("DwarvenCenturion") || victimrace == ("DwarvenSphere")
			(BaboMonitorScript as BaboDiaMonitorScript).CalcDwarvenTraumaExpGain(-0.2)
		elseIf victimrace == ("Gargoyle")
			(BaboMonitorScript as BaboDiaMonitorScript).CalcGargoyleTraumaExpGain(-0.2)
		elseIf victimrace == ("FrostAtronach")
			(BaboMonitorScript as BaboDiaMonitorScript).CalcFrostAtronachTraumaExpGain(-0.2)
		elseIf victimrace == ("StormAtronach")
			(BaboMonitorScript as BaboDiaMonitorScript).CalcStormAtronachTraumaExpGain(-0.2)
		elseIf victimrace == ("Horker")
			(BaboMonitorScript as BaboDiaMonitorScript).CalcHorkerTraumaExpGain(-0.2)
		endif


;	if BaboSexlabStatTrauma.getvalue() > 0.0
;		(BaboMonitorScript as BaboDiaMonitorScript).CalcTraumaExpLoss(0.2)
;	else
;		(BaboMonitorScript as BaboDiaMonitorScript).CalcConfidenceExpGain(0.2)
;	endif
	Stop()
	return

EndEvent