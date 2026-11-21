;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 3
Scriptname SF_BaboEncounter06BNoCoinSce_08602A3E Extends Scene Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
(Getowningquest() as BaboEncounter06BScript).NoCoinSceneConfiscate()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
BaboEncounter06BSceneGlobal.setvalue(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
BaboEncounter06BSceneGlobal.setvalue(0)
if (BaboReputationBitch.GetValue() >= 150)
(Getowningquest() as BaboEncounter06BScript).RelocateForGroupSex()
else
(Getowningquest() as BaboEncounter06BScript).NoCoinSceneLeave()
endif
stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property BaboEncounter06BSceneGlobal  Auto  

GlobalVariable Property BaboReputationBitch  Auto  
