;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 5
Scriptname SF_BaboEventRieklingThirskMi_083EEBC4 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
(Getowningquest() as BaboEventRiekling).PlayerSpeakerMove(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
(Getowningquest() as BaboEventRiekling).ChooseSelection()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
(Getowningquest() as BaboEventRiekling).PlayerSpeakerMove(false)
(Getowningquest() as BaboEventRiekling).ChooseSelectionEnd()
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
(Getowningquest() as BaboEventRiekling).PlayerSpeakerMove(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
(Getowningquest() as BaboEventRiekling).PlayerSpeakerMove(false)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
