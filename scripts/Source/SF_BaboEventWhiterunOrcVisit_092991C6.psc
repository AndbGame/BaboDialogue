;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname SF_BaboEventWhiterunOrcVisit_092991C6 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
If BaboDialogueWhiterun.getstage() == 10
GetOwningQuest().SetStage(54)
Else
GetOwningQuest().SetStage(55)
Endif
stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property BaboDialogueWhiterun  Auto  
