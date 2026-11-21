;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 4
Scriptname SF_BaboLoanSharksProstitute0_087112E2 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
(GetOwningQuest() as BaboLoanSharkScript).ProstituteSex()
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).SimpleAnmSequence(PlayerRef, CustomerA.getactorreference(), "Babo_FlirtBreast_A01", "Babo_FlirtBreast_A02")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).SimpleAnmSequence(PlayerRef, CustomerA.getactorreference(), "Babo_FlirtPussy_A01", "Babo_FlirtPussy_A02")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).PlayPairedMotion(CustomerA.getactorreference(), "Babo_Flirt_A01", "Babo_Flirt_A02D", 0, 0, 0, true)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property BaboSexController Auto

Actor Property PlayerRef  Auto  

ReferenceAlias Property CustomerA  Auto  
