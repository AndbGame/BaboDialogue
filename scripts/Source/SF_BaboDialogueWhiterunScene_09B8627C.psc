;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 3
Scriptname SF_BaboDialogueWhiterunScene_09B8627C Extends Scene Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
(Getowningquest() as BaboDialogueWhiterunScript).PreparethesceneA02()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
getOwningQuest().setStage(21)
stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property OrcVisitorRef01  Auto  

ReferenceAlias Property OrcVisitorRef02  Auto  

ReferenceAlias Property OrcVisitorRef03  Auto  
