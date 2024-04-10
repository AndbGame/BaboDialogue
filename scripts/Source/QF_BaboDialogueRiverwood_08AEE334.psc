;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 10
Scriptname QF_BaboDialogueRiverwood_08AEE334 Extends Quest Hidden

;BEGIN ALIAS PROPERTY FaendalREF
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FaendalREF Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LucanRef
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LucanRef Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SvenREF
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SvenREF Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CamillaRef
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CamillaRef Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BaboChestRiverwood
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BaboChestRiverwood Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AggressorRef
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AggressorRef Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ForcedWallKissA01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ForcedWallKissA01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ForcedWallKissA02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ForcedWallKissA02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Contract
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Contract Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PlayerRef
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PlayerRef Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
Debug.messagebox("Why did I let him? Now he will do anything he want to harrass me.")
ObjectReference TheBook = (Alias_Aggressorref.getref() as actor).additem(BaboDialogueRiverwoodContract, 1)
(Alias_Contract).forcerefto(TheBook)
BaboGlobalRiverwoodBetraySvenTitle.setvalue(5)
(Alias_Aggressorref.getref() as actor).addtofaction(BaboAggressiveBoyFriend)
BDQuest.RecoverControl()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;You accepted his offer. Move actors
BDQuest.LosingControl()
(Alias_PlayerRef.getref() as actor).evaluatepackage()
(Alias_AggressorRef.getref() as actor).evaluatepackage()
BDQuest.FadeinMove(Alias_PlayerRef, Alias_ForcedWallKissA01, 13, True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
; Now he's trying to kiss you by force.
Game.getplayer().moveto(BaboDialogueRiverwoodXmarker01)
Utility.wait(1.0)
BDMQuest.PairedAnim(Game.getplayer(), (Alias_AggressorRef.getref() as actor), None, False, BaboForcedKiss01_A1_S01, BaboForcedKiss01_A2_S01)
Utility.wait(25)
Setstage(16);After Animation new dialogue
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
;Reset all the progress
BaboGlobalRiverwoodBetraySvenTitle.setvalue(0)
BaboGlobalRiverwoodBetrayFaendalTitle.setvalue(0)
(Alias_Contract.getref() as objectreference).Delete()
(Alias_Aggressorref.getref() as actor).Removefromfaction(BaboAggressiveBoyFriend)

Alias_Contract.Clear()
Alias_Aggressorref.Clear()

Reset()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
BDMQuest.StruggleAnim(Game.getplayer(), (Alias_Aggressorref.getref() as actor), False, None, None)
Utility.wait(1.0)
(Alias_AggressorRef.getref() as actor).evaluatepackage()
BDQuest.LosingControl()
Utility.wait(1.0)
(Alias_AggressorRef.getref() as actor).evaluatepackage()
Utility.wait(1.0)
(Alias_AggressorRef.getref() as actor).evaluatepackage();just make sure the dialogue works
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
;Ready for the next stage. After talking with Sven or Faendal
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;BaboGlobalRiverwoodBetraySvenTitle.setvalue(1) - This means You delievered Faendal's letter to Camilla directly
;BaboGlobalRiverwoodBetraySvenTitle.setvalue(3) - This means You betrayed Sven and give his letter to Faendal or Camilla
;BaboGlobalRiverwoodBetraySvenTitle.setvalue(5) - This means now you're a slave.
;BaboGlobalRiverwoodBetraySvenTitle.setvalue(7) - This means now you have an advantage. 
;BaboGlobalRiverwoodBetrayFaendalTitle.setvalue(1) - This means You delievered Sven's letter to Camilla directly
;BaboGlobalRiverwoodBetrayFaendalTitle.setvalue(3) - This means You betrayed Faendal and give his letter to Sven or Camilla
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
BRMQuest.Decreasereputation(10, 5);You rejected him. They will tell about your rudness and lewdness.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
;Dialogue
(Alias_PlayerRef.getref() as actor).evaluatepackage()
;BDQuest.RecoverControl()
;Utility.wait(1.0)
(Alias_AggressorRef.getref() as actor).evaluatepackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
;Contract Scene Start
;BDMQuest.StruggleAnim((Alias_PlayerRef.getref() as actor), (Alias_AggressorRef.getref() as actor), False, None, None)
Utility.wait(2)
BaboDialogueRiverwoodScene01.Start()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

BaboReputationMasterScript Property BRMQuest  Auto  
BaboDiaMonitorScript Property BDMQuest Auto
BaboDiaQuest Property BDQuest Auto

Idle Property BaboForcedKiss01_A1_S01  Auto  

Idle Property BaboForcedKiss01_A2_S01  Auto  

ObjectReference Property BaboDialogueRiverwoodXmarker01  Auto  

ObjectReference Property BaboDialogueRiverwoodXmarker02  Auto  

ObjectReference Property BaboDialogueRiverwoodXmarker03  Auto  

Scene Property BaboDialogueRiverwoodScene01  Auto  

Book Property BaboDialogueRiverwoodContract  Auto  

GlobalVariable Property BaboGlobalRiverwoodBetraySvenTitle  Auto  

GlobalVariable Property BaboGlobalRiverwoodBetrayFaendalTitle  Auto  

Faction Property BaboAggressiveBoyFriend  Auto  
