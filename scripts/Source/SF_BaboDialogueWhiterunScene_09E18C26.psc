;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname SF_BaboDialogueWhiterunScene_09E18C26 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
BDMScript.StruggleAnim(Game.getplayer(), ViceCaptainRef.getactorref(), true, Paired_BaboStripMotionS03_A01, Paired_BaboStripMotionS03_A02)
;Utility.wait(1.0)
;BSAScript.GetStrippedArmor(Game.getplayer(), ViceCaptainRef.getactorref(), True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
BDMScript.StruggleAnim(Game.getplayer(), ViceCaptainRef.getactorref(), true, Paired_BaboStripMotionS04_A01, Paired_BaboStripMotionS04_A02)
Utility.wait(3.0)
BSAScript.GetStrippedArmor(Game.getplayer(), ViceCaptainRef.getactorref(), True)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

String Property Paired_BaboStripMotionS03_A01  Auto  

String Property Paired_BaboStripMotionS03_A02  Auto  

BaboDiaMonitorScript Property BDMScript Auto
ReferenceAlias Property ViceCaptainRef  Auto  
BaboStealingArmorScript Property BSAScript Auto

String Property Paired_BaboStripMotionS04_A01  Auto  

String Property Paired_BaboStripMotionS04_A02  Auto  
