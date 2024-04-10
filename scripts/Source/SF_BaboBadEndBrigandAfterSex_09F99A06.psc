;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname SF_BaboBadEndBrigandAfterSex_09F99A06 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
If getowningquest().getstage() == 56
getowningquest().setstage(60)
elseif getowningquest().getstage() == 57
getowningquest().setstage(199)
endif
stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
