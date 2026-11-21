;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 16
Scriptname SF_BaboEventWindhelmNewgnisi_081AC051 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN CODE
(Getowningquest() as BaboEventNewgnisisMasterScript).InnkeeperSceneStandby(105)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
;PlayerRef.kill(ArgonianH01.getreference() as actor)
(ArgonianH01.getreference() as actor).kill(playerref)
(Getowningquest() as BaboEventNewgnisisMasterScript).InnkeeperSceneStandby(110)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
Debug.SendAnimationEvent((ArgonianH01.getreference() as actor), "BaboDrinkCheers")
Debug.SendAnimationEvent((ArgonianH02.getreference() as actor), "BaboDrinkCheers")
Debug.SendAnimationEvent((ArgonianH03.getreference() as actor), "BaboDrinkCheers")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
PlayerRef.moveto(BaboEventNewGnisisTeleportMarkerB)
(ArgonianH01.getreference() as actor).moveto(BaboEventNewgnisisCheersPointA)
(ArgonianH02.getreference() as actor).moveto(BaboEventNewgnisisCheersPointB)
(ArgonianH03.getreference() as actor).moveto(BaboEventNewgnisisCheersPointC)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN CODE
GetOwningQuest().SetStage(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN CODE
(ArgonianH01.getreference() as actor).moveto(BaboEventNewgnisisCheersPointA)
(ArgonianH02.getreference() as actor).moveto(BaboEventNewgnisisCheersPointB)
(ArgonianH03.getreference() as actor).moveto(BaboEventNewgnisisCheersPointC)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN CODE
(Getowningquest() as BaboEventNewgnisisMasterScript).Poisoned(ArgonianH01.getreference() as actor)
(Getowningquest() as BaboEventNewgnisisMasterScript).Poisoned(ArgonianH02.getreference() as actor)
(Getowningquest() as BaboEventNewgnisisMasterScript).Poisoned(ArgonianH03.getreference() as actor)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
Config.LosingControl()
Config.FadeinScene(false)
Getowningquest().setstage(41)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
Debug.SendAnimationEvent((ArgonianH01.getreference() as actor), "BaboDrinkCheers")
Debug.SendAnimationEvent((ArgonianH02.getreference() as actor), "BaboDrinkCheers")
Debug.SendAnimationEvent((ArgonianH03.getreference() as actor), "BaboDrinkCheers")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
;PlayerRef.kill(ArgonianH03.getreference() as actor)
(ArgonianH03.getreference() as actor).kill(playerref)
;ArgonianH03 die
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
;PlayerRef.kill(ArgonianH02.getreference() as actor)
(ArgonianH02.getreference() as actor).kill(playerref)
;ArgonianH02 die
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
Config.FadeOutScene(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
Config.RecoverControl()
stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

BaboSexControllerManager Property Config Auto
Actor Property PlayerRef Auto
ReferenceAlias Property ArgonianH01 Auto
ReferenceAlias Property ArgonianH02 Auto
ReferenceAlias Property ArgonianH03 Auto
ObjectReference Property BaboEventNewgnisisCheersPointA Auto
ObjectReference Property BaboEventNewgnisisCheersPointB Auto
ObjectReference Property BaboEventNewgnisisCheersPointC Auto
ObjectReference Property BaboEventNewGnisisTeleportMarkerB Auto
