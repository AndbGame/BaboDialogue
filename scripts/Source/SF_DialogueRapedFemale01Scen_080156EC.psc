;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 4
Scriptname SF_DialogueRapedFemale01Scen_080156EC Extends Scene Hidden

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).SexCustomTag(FemaleFollower, CreatureRef, none, none, none, "Aggressive, Vaginal", "Femdom", False, "", "", True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).NPCPairedAnim(FemaleFollower.getreference() as actor, CreatureRef.getreference() as actor, false, "", "")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).NPCPairedAnim(FemaleFollower.getreference() as actor, CreatureRef.getreference() as actor, true, "Babo_TrollQTE_S01_A01", "Babo_TrollQTE_S01_A02")
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property BaboSexController Auto

ReferenceAlias Property FemaleFollower  Auto  

ReferenceAlias Property CreatureRef  Auto  
