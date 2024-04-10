;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 18
Scriptname QF_BaboEventRieklingThirsk_0807AD9B Extends Quest Hidden

;BEGIN ALIAS PROPERTY PlayerRef
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PlayerRef Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY RieklingChallenger
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_RieklingChallenger Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY RieklingWarrior01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_RieklingWarrior01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SpuseRef
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SpuseRef Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY RieklingWarrior02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_RieklingWarrior02 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN AUTOCAST TYPE BaboEventRiekling
Quest __temp = self as Quest
BaboEventRiekling kmyQuest = __temp as BaboEventRiekling
;END AUTOCAST
;BEGIN CODE
BRMQuest.DecreaseReputation(20, 5)
BRMQuest.AddingTitletoPlayerRef(BaboFactionRieklingThirskFuckToyTitle)
BRMQuest.SetTitleGlobal(BaboGlobalRieklingThirskFuckToyTitle, 1)
kmyQuest.UnEquipRestraints()
debug.messagebox ("Ah... God.. Thank you.")
Setstage(130)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN AUTOCAST TYPE BaboEventRiekling
Quest __temp = self as Quest
BaboEventRiekling kmyQuest = __temp as BaboEventRiekling
;END AUTOCAST
;BEGIN CODE
kmyQuest.SpawnNewRiekling()
Utility.wait(2.0)
kmyQuest.EquipRestraints()
Setstage(90)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN CODE
(Alias_RieklingChallenger.getRef() as Actor).EvaluatePackage()
debug.messagebox ("This is a chance to escape from here and survive this nightmare.. However with this yoke and chain on my ankles, I am not sure I could make it...")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN CODE
debug.messagebox ("The Guard has been killed. Now I am free! It's time to get rid of this cursed yoke hanging on my neck. Maybe I need to look for a blacksmith right away.")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN CODE
(Alias_RieklingChallenger.getRef() as Actor).EvaluatePackage()
(Alias_RieklingWarrior01.getRef() as Actor).EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN AUTOCAST TYPE BaboEventRiekling
Quest __temp = self as Quest
BaboEventRiekling kmyQuest = __temp as BaboEventRiekling
;END AUTOCAST
;BEGIN CODE
kmyQuest.RieklingThreesome(Alias_PlayerRef, Alias_RieklingChallenger)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_17
Function Fragment_17()
;BEGIN AUTOCAST TYPE BaboEventRiekling
Quest __temp = self as Quest
BaboEventRiekling kmyQuest = __temp as BaboEventRiekling
;END AUTOCAST
;BEGIN CODE
kmyQuest.ChallengeStart(Alias_RieklingChallenger)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN CODE
(Alias_RieklingChallenger.getRef() as Actor).EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN AUTOCAST TYPE BaboEventRiekling
Quest __temp = self as Quest
BaboEventRiekling kmyQuest = __temp as BaboEventRiekling
;END AUTOCAST
;BEGIN CODE
kmyQuest.Fadeout(Alias_RieklingChallenger)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
(Alias_RieklingChallenger.getRef() as Actor).EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN AUTOCAST TYPE BaboEventRiekling
Quest __temp = self as Quest
BaboEventRiekling kmyQuest = __temp as BaboEventRiekling
;END AUTOCAST
;BEGIN CODE
kmyQuest.RegisterUpdate()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_16
Function Fragment_16()
;BEGIN CODE
(Alias_RieklingChallenger.getRef() as Actor).EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
debug.messagebox ("I killed the challenger. He almost enslaved me.. I don't even want to imagine if I have been enslaved.. and raped.")
BRMQuest.IncreaseReputation(15, 5)
Utility.wait(5.0)
Setstage(170)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE BaboEventRiekling
Quest __temp = self as Quest
BaboEventRiekling kmyQuest = __temp as BaboEventRiekling
;END AUTOCAST
;BEGIN CODE
kmyQuest.RieklingNewChallenge()
(Alias_RieklingChallenger.getRef() as Actor).EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
debug.messagebox ("The new chief has been finally killed and I have retrieved my own throne of little thirsk mead hall... But my pussy and womb are full of dirty stinky sperm... I don't want to be pregnant. I am not sure that I can hold this much longer.")
Utility.wait(5.0)
Setstage(170)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN AUTOCAST TYPE BaboEventRiekling
Quest __temp = self as Quest
BaboEventRiekling kmyQuest = __temp as BaboEventRiekling
;END AUTOCAST
;BEGIN CODE
kmyQuest.pacifyAlias(Alias_RieklingChallenger)
BaboEventRieklingThirskScene01.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN AUTOCAST TYPE BaboEventRiekling
Quest __temp = self as Quest
BaboEventRiekling kmyQuest = __temp as BaboEventRiekling
;END AUTOCAST
;BEGIN CODE
kmyQuest.ChallengeStart(Alias_RieklingChallenger)
debug.messagebox ("The new challenger wants to fight me. I have to deal with him first.")
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Faction Property BaboFactionRieklingThirskFuckToyTitle  Auto  

GlobalVariable Property BaboGlobalRieklingThirskFuckToyTitle  Auto  

BaboReputationMasterScript Property BRMQuest Auto

Scene Property BaboEventRieklingThirskScene01  Auto  
