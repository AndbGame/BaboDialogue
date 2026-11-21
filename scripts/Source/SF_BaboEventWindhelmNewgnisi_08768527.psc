;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 8
Scriptname SF_BaboEventWindhelmNewgnisi_08768527 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
BaboAnimatedObjectStageGlobal.setvalue((BaboEventNewgnisisChainPoleRef as BaboChainUpsidePoleScript).ActivateClutter())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
BaboAnimatedObjectStageGlobal.setvalue((BaboEventNewgnisisChainPoleRef as BaboChainUpsidePoleScript).ActivateClutter())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
GetOwningQuest().SetStage(72)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
GetOwningQuest().SetStage(75)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
BaboAnimatedObjectStageGlobal.setvalue(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
(BaboEventNewgnisisChainPoleRef as BaboChainUpsidePoleScript).ResetClutter()
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
BaboAnimatedObjectStageGlobal.setvalue((BaboEventNewgnisisChainPoleRef as BaboChainUpsidePoleScript).ActivateClutter())
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property BaboEventNewgnisisChainPoleRef  Auto  

GlobalVariable Property BaboAnimatedObjectStageGlobal  Auto  
