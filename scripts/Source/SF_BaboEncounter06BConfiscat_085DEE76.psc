;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname SF_BaboEncounter06BConfiscat_085DEE76 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).LosingControl()
(BaboSexController as BaboSexControllerManager).FadeinScene(true)
(GetOwningQuest() as BaboEncounter06BScript).StripSkimpyIfHot()
(GetOwningQuest() as BaboEncounter06BScript).BodySearchAndSettle()
Debug.Sendanimationevent(Game.getplayer(), "Babo_Kneel_Naked")
(GetOwningQuest() as BaboEncounter06BScript).PlaceCrewRing()
(GetOwningQuest() as BaboEncounter06BScript).SnapActorsToRing()
(BaboSexController as BaboSexControllerManager).FadeOutScene(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).RecoverControl(false)
(GetOwningQuest() as BaboEncounter06BScript).ConfiscateSceneDone()
stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property BaboSexController  Auto  
