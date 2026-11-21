;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 3
Scriptname SF_BaboEncounter06BDogejaSce_086D909A Extends Scene Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
BaboEncounter06BScript q = GetOwningQuest() as BaboEncounter06BScript
(BaboSexController as BaboSexControllerManager).PlayPairedMotion(q.DebtCollector.GetActorReference(), "BaboDogejaSteppedOn", "BaboDogejaStepOn", 0.0, 80.0, -180.0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
(Getowningquest() as BaboEncounter06BScript).DogejaSceneDone()
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
BaboEncounter06BScript q = GetOwningQuest() as BaboEncounter06BScript
(q.BaboSexController as BaboSexControllerManager).EndPairedMotion(q.DebtCollector.GetActorReference())
Debug.SendAnimationEvent(q.PlayerRef, "BaboDogejaLoop")
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property BaboSexController  Auto  
