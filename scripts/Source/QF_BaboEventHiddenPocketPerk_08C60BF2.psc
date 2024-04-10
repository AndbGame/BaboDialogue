;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname QF_BaboEventHiddenPocketPerk_08C60BF2 Extends Quest Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
(Game.getplayer()).addspell(BaboAccessHiddenPocketPower)
BaboEventHiddenPocketMessage.show()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

SPELL Property BaboAccessHiddenPocketPower  Auto  

Message Property BaboEventHiddenPocketMessage  Auto  
