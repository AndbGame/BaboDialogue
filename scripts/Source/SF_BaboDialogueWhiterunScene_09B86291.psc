;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 6
Scriptname SF_BaboDialogueWhiterunScene_09B86291 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
(Getowningquest() as BaboDialogueWhiterunScript).PreparethesceneB(2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
(Getowningquest() as BaboDialogueWhiterunScript).PreparethesceneB(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
getowningquest().setstage(25)
stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

BaboDiaMonitorScript Property BDMScript Auto
Idle Property BaboFaintOrgasm01_A1_S01  Auto  
Idle Property BaboFaintOrgasm01_A2_S01  Auto  
Idle Property BaboFaintOrgasm01_A1_S02  Auto  
Idle Property BaboFaintOrgasm01_A2_S02  Auto  

ReferenceAlias Property Alias_ViceCaptainRef  Auto  
