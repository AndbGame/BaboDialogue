;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 5
Scriptname SF_BaboEncounter11Scene02_085F17D7 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
SexLabUtil.GetAPI().StripActor(PlayerRef, DoAnimate = True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
If BaboEncounter11NoCombat.getvalue() == 0
GetOwningQuest().SetStage(42)
Else
getowningquest().setstage(45)
EndIf
stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property BaboEncounter11NoCombat  Auto  

Scene Property BaboEncounter11Scene02  Auto  

Actor Property PlayerRef  Auto  
