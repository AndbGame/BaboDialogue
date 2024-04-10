;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 17
Scriptname SF_BaboKidnapEventDrunkPlaye_085CEDF4 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).FadeOutScene(false)
(BaboSexController as BaboSexControllerManager).CustomMFGPain(PlayerRef, 9)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
(Getowningquest() as BaboKidnapEvenScript).RemoveTargetCuirass(PlayerRef, False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).FadeinScene(false)
Utility.wait(2.0)
(BaboSexController as BaboSexControllerManager).UseSexlabVoice(Kidnapper02.getreference() as actor, false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
BaboKidnapNormalEndScenarioe.setvalue(Utility.Randomint(1, 2))
(BaboSexController as BaboSexControllerManager).CustomMFGPain(PlayerRef, 9)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).UseSexlabVoice(PlayerRef, True)
(BaboSexController as BaboSexControllerManager).EjaculationSound(Kidnapper02.getreference(), 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).FadeinScene(false)
Utility.wait(2.0)
(BaboSexController as BaboSexControllerManager).UseSexlabVoice(Kidnapper02.getreference() as actor, false)
Utility.wait(0.5)
(BaboSexController as BaboSexControllerManager).UseSexlabVoice(PlayerRef, true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
(Kidnapper02.getreference() as actor).moveto(SafeMarkerPlayer.getreference())
Debug.SendAnimationEvent(Kidnapper02.getreference() as actor, "BaboBedGropingM")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).LosingControl()
(BaboSexController as BaboSexControllerManager).FadeinScene(false)
BaboKidnapNormalEndScenarioe.setvalue(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).UseSexlabVoice(Kidnapper02.getreference() as actor, false)
(BaboSexController as BaboSexControllerManager).EjaculationSound(Kidnapper02.getreference(), 2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
(Getowningquest() as BaboKidnapEvenScript).RemoveAllthePanties(PlayerRef, False)
(Getowningquest() as BaboKidnapEvenScript).RemoveAlltheSkirts(PlayerRef, False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
Getowningquest().setstage(161)
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_16
Function Fragment_16()
;BEGIN CODE
Actor akTarget = Kidnapper02.getreference() as actor
akTarget.setfactionrank(sla_arousal, 1)
int slaexposure = (BaboSexController as BaboSexControllerManager).CalcPlayerAttractiveness()
int Toleranceint = Utility.randomint(30, 60)
slaexposure = Utility.randomint(slaexposure - Toleranceint, slaexposure)
(sla_Framework as slaFrameworkScr).SetActorExposure(akTarget, slaexposure)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
BaboKidnapNormalEndScenarioe.setvalue(Utility.Randomint(2, 3))
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment


Quest Property BaboSexController  Auto  

Actor Property PlayerRef  Auto  

GlobalVariable Property BaboKidnapNormalEndScenarioe  Auto  

ReferenceAlias Property Kidnapper02  Auto  

ReferenceAlias Property SafeMarkerPlayer  Auto  

Quest Property sla_Framework  Auto  

Faction Property sla_Arousal  Auto  
