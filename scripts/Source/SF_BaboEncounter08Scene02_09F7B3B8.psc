;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 7
Scriptname SF_BaboEncounter08Scene02_09F7B3B8 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
BaboBadendKeyword.SendStoryEvent(None, CenterMarker.getreference())
Utility.wait(1.0)
BaboBadEnd.setstage(2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
getowningquest().setstage(45)
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
BaboBadEnd.setstage(3)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property BaboBadEnd  Auto  

Keyword Property BaboBadendKeyword  Auto  

ReferenceAlias Property CenterMarker  Auto  
