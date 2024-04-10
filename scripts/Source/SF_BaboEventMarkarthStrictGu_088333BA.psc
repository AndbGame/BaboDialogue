;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname SF_BaboEventMarkarthStrictGu_088333BA Extends Scene Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
If Game.GetPlayer().IsDetectedBy(Actor2.getref() as actor)
BaboMarkarthStrictGuardTriggerGlobal.Setvalue(BaboMarkarthStrictGuardTriggerGlobal.Getvalue() + 1)
Else
EndIf
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property BaboMarkarthStrictGuardTriggerGlobal Auto

ReferenceAlias Property Actor2  Auto  
