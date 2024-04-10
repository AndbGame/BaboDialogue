;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 5
Scriptname SF_BaboKidnapEventDrunkPlaye_0841A089 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
Game.SetCameraTarget(PlayerRef)
Getowningquest().setstage(30)
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
(getowningquest() as BaboKidnapEvenScript).PlayerTalkXmarkerStart()
(Getowningquest() as BaboKidnapEvenScript).FadeinScene(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
Game.SetCameraTarget(Kidnapper02.getreference() as actor)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
(getowningquest() as BaboKidnapEvenScript).PlayerTalkXmarkerReturn()
(Getowningquest() as BaboKidnapEvenScript).RemoveTargetCuirass(PlayerRef, true)
(Getowningquest() as BaboKidnapEvenScript).RemoveAllthePanties(PlayerRef, true)
(Getowningquest() as BaboKidnapEvenScript).RemoveAlltheSkirts(PlayerRef, true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
(Getowningquest() as BaboKidnapEvenScript).FadeOutScene(false)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Actor Property PlayerRef  Auto  

ReferenceAlias Property Kidnapper01  Auto  

ReferenceAlias Property Kidnapper02  Auto  
