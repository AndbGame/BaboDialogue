;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 4
Scriptname QF_BaboChangeLocationEvent04_09B7C06B Extends Quest Hidden

;BEGIN ALIAS PROPERTY CenterMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CenterMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY OldLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_OldLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY OrcRef
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_OrcRef Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PlayerRef
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PlayerRef Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY NewLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_NewLocation Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;I gave money for his trouble. I have to be prepared for what is coming. Go to stage 110
Game.getplayer().removeitem(gold001, 500)
BRMQuest.IncreaseReputation(10, 5)
Setstage(110)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
Actor Messanger = (Alias_Centermarker.getref() as objectreference).PlaceActorAtMe(ActorOrc, 4)
Utility.wait(1.0)
Alias_OrcRef.forcerefto(Messanger)
Utility.wait(1.0)
Messanger.evaluatepackage()
Debug.notification("changelocationevent04 start")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;Shutting down
Debug.notification("Orcs are coming for me. I need to get ready.")
(Alias_OrcRef.getref() as actor).Deletewhenable()
BaboEventWhiterunOrcVisitorsTriggerEvent.setvalue(0)
BaboEventWhiterunOrcVisitiors.setstage(8)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;No giving money. End of the conversation. go to stage 110
Setstage(110)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

BaboReputationMasterScript Property BRMQuest Auto

GlobalVariable Property BaboEventWhiterunOrcVisitorsTriggerEvent  Auto  

Quest Property BaboEventWhiterunOrcVisitiors  Auto  

MiscObject Property Gold001  Auto  

ActorBase Property ActorOrc  Auto  
