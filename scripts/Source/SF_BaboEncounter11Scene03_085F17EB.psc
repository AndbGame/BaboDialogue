;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 3
Scriptname SF_BaboEncounter11Scene03_085F17EB Extends Scene Hidden

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
GetOwningQuest().SetStage(55)
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
PlayerRef.removeallitems(BaboConfiscatedChestSolitudeRef, false, true)
Utility.wait(1.0)
(BaboSexController as BaboSexControllerManager).EquipRestraintsYoke(PlayerRef, true)
PlayerRef.Additem(BaboWristRope01, 1, true)
PlayerRef.Additem(BaboAnkleRope01, 1, true)
PlayerRef.EquipItem(BaboWristRope01, true, true)
PlayerRef.EquipItem(BaboAnkleRope01, true, true)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

BaboDiaQuest Property BFQuest  Auto  

Quest Property BaboSexController  Auto  

Actor Property PlayerRef  Auto  

ObjectReference Property BaboConfiscatedChestSolitudeRef  Auto  

Armor Property BaboAnkleRope01  Auto  

Armor Property BaboWristRope01  Auto  
