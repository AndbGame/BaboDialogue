;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 21
Scriptname QF_BaboEventRieklingThirskSt_0822BA83 Extends Quest Hidden

;BEGIN ALIAS PROPERTY RieklingSpawnMarkerF
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_RieklingSpawnMarkerF Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ThirskRieklingMinionC
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ThirskRieklingMinionC Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY RieklingChallengerMinionE
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_RieklingChallengerMinionE Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ThirskRieklingMinionD
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ThirskRieklingMinionD Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ThirskRieklingMinionA
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ThirskRieklingMinionA Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY RieklingAllyMarkerE
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_RieklingAllyMarkerE Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ThirskRieklingMinionF
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ThirskRieklingMinionF Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LocationCenter
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LocationCenter Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY RieklingAllyMarkerB
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_RieklingAllyMarkerB Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY RieklingAllyMarkerA
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_RieklingAllyMarkerA Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY NewLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_NewLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY RieklingSpawnMarkerA
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_RieklingSpawnMarkerA Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ThirskRieklingMinionE
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ThirskRieklingMinionE Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY RieklingChallengerMinionA
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_RieklingChallengerMinionA Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY RieklingSpawnMarkerBoss
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_RieklingSpawnMarkerBoss Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY RieklingSpawnMarkerC
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_RieklingSpawnMarkerC Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY RieklingChallengerMinionB
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_RieklingChallengerMinionB Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY RieklingAllyMarkerC
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_RieklingAllyMarkerC Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY RieklingSpawnMarkerD
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_RieklingSpawnMarkerD Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY RieklingAllyMarkerD
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_RieklingAllyMarkerD Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PlayerAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PlayerAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY RieklingChallengerMinionD
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_RieklingChallengerMinionD Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY RieklingSpawnMarkerE
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_RieklingSpawnMarkerE Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY RieklingChallengerMinionF
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_RieklingChallengerMinionF Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY RieklingSpawnMarkerB
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_RieklingSpawnMarkerB Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ThirskRieklingMinionB
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ThirskRieklingMinionB Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY RieklingChallengerMinionC
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_RieklingChallengerMinionC Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY RieklingCorpseMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_RieklingCorpseMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY RieklingChallengerChief
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_RieklingChallengerChief Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY OldLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_OldLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY RieklingAllyMarkerF
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_RieklingAllyMarkerF Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_16
Function Fragment_16()
;BEGIN AUTOCAST TYPE BaboEventRieklingDuelScript
Quest __temp = self as Quest
BaboEventRieklingDuelScript kmyQuest = __temp as BaboEventRieklingDuelScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.HandleChiefFaction(false)
(BaboSexController as BaboSexControllerManager).pacifyAlias(Alias_RieklingChallengerChief)
kmyQuest.Defeated()
kmyQuest.ScenePlay(4, true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN AUTOCAST TYPE BaboEventRieklingDuelScript
Quest __temp = self as Quest
BaboEventRieklingDuelScript kmyQuest = __temp as BaboEventRieklingDuelScript
;END AUTOCAST
;BEGIN CODE
MsgCtrl.BadRieklingDuelMessagebox(26)
kmyQuest.gotostate("PlayerFightSolo")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_19
Function Fragment_19()
;BEGIN CODE
MsgCtrl.BadRieklingDuelMessagebox(28)
setstage(110)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE BaboEventRieklingDuelScript
Quest __temp = self as Quest
BaboEventRieklingDuelScript kmyQuest = __temp as BaboEventRieklingDuelScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.UnRegisterEvents()
kmyQuest.CountAssault()
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN AUTOCAST TYPE BaboEventRieklingDuelScript
Quest __temp = self as Quest
BaboEventRieklingDuelScript kmyQuest = __temp as BaboEventRieklingDuelScript
;END AUTOCAST
;BEGIN CODE
Utility.wait(5.0)
kmyQuest.CountVictory()
setstage(250)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN AUTOCAST TYPE BaboEventRieklingDuelScript
Quest __temp = self as Quest
BaboEventRieklingDuelScript kmyQuest = __temp as BaboEventRieklingDuelScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.CleanupActors(true)
kmyQuest.ResetCooltime()
setstage(255)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN AUTOCAST TYPE BaboEventRieklingDuelScript
Quest __temp = self as Quest
BaboEventRieklingDuelScript kmyQuest = __temp as BaboEventRieklingDuelScript
;END AUTOCAST
;BEGIN CODE
MsgCtrl.BadRieklingDuelMessagebox(24)
kmyQuest.EnemyFightReady()
kmyQuest.TriggerGroupFight(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN AUTOCAST TYPE BaboEventRieklingDuelScript
Quest __temp = self as Quest
BaboEventRieklingDuelScript kmyQuest = __temp as BaboEventRieklingDuelScript
;END AUTOCAST
;BEGIN CODE
(Alias_RieklingChallengerMinionA.getreference() as actor).evaluatepackage()
(Alias_RieklingChallengerMinionB.getreference() as actor).evaluatepackage()
(Alias_RieklingChallengerMinionC.getreference() as actor).evaluatepackage()
(Alias_RieklingChallengerMinionD.getreference() as actor).evaluatepackage()
(Alias_RieklingChallengerMinionE.getreference() as actor).evaluatepackage()
(Alias_RieklingChallengerMinionF.getreference() as actor).evaluatepackage()
kmyQuest.Victory()
BaboEventRieklingThirskStartWinMsg.show()

setstage(250)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN AUTOCAST TYPE BaboEventRieklingDuelScript
Quest __temp = self as Quest
BaboEventRieklingDuelScript kmyQuest = __temp as BaboEventRieklingDuelScript
;END AUTOCAST
;BEGIN CODE
MsgCtrl.BadRieklingDuelMessagebox(23)
kmyQuest.EnemyFightReady()
kmyQuest.TriggerGroupFight(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN AUTOCAST TYPE BaboEventRieklingDuelScript
Quest __temp = self as Quest
BaboEventRieklingDuelScript kmyQuest = __temp as BaboEventRieklingDuelScript
;END AUTOCAST
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).FadeinScene(true)
kmyQuest.GotoArena()
kmyQuest.AllyToArenaSpectator()
kmyQuest.EnemyToArena()
(BaboSexController as BaboSexControllerManager).FadeOutScene(true)
Setstage(42)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN AUTOCAST TYPE BaboEventRieklingDuelScript
Quest __temp = self as Quest
BaboEventRieklingDuelScript kmyQuest = __temp as BaboEventRieklingDuelScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.AllotActors()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN AUTOCAST TYPE BaboEventRieklingDuelScript
Quest __temp = self as Quest
BaboEventRieklingDuelScript kmyQuest = __temp as BaboEventRieklingDuelScript
;END AUTOCAST
;BEGIN CODE
MsgCtrl.BadRieklingDuelMessagebox(20)
(BaboSexController as BaboSexControllerManager).FadeinScene(true)
kmyQuest.GotoArena()
kmyQuest.AllyToArenaSpectator()
kmyQuest.EnemyToArenaSpectator()
(BaboSexController as BaboSexControllerManager).FadeOutScene(true)
Setstage(32)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN AUTOCAST TYPE BaboEventRieklingDuelScript
Quest __temp = self as Quest
BaboEventRieklingDuelScript kmyQuest = __temp as BaboEventRieklingDuelScript
;END AUTOCAST
;BEGIN CODE
int choice = BaboEventRieklingThirskStartQuestMsg.show()

if choice == 0;Retreat
setstage(106);skip the fight
elseif choice == 1;Duel
setstage(30);Duel
elseif choice == 2;Fight Together
setstage(90)
elseif choice == 3;Handle them myself
setstage(40)
elseif choice == 4;Submit
setstage(70)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_18
Function Fragment_18()
;BEGIN AUTOCAST TYPE BaboEventRieklingDuelScript
Quest __temp = self as Quest
BaboEventRieklingDuelScript kmyQuest = __temp as BaboEventRieklingDuelScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.Enslaved()
kmyQuest.CleanupActors(false)
setstage(255)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN AUTOCAST TYPE BaboEventRieklingDuelScript
Quest __temp = self as Quest
BaboEventRieklingDuelScript kmyQuest = __temp as BaboEventRieklingDuelScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.ScenePlay(2, true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_20
Function Fragment_20()
;BEGIN AUTOCAST TYPE BaboEventRieklingDuelScript
Quest __temp = self as Quest
BaboEventRieklingDuelScript kmyQuest = __temp as BaboEventRieklingDuelScript
;END AUTOCAST
;BEGIN CODE
MsgCtrl.BadRieklingDuelMessagebox(27)
kmyQuest.TriggerGroupFight(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN AUTOCAST TYPE BaboEventRieklingDuelScript
Quest __temp = self as Quest
BaboEventRieklingDuelScript kmyQuest = __temp as BaboEventRieklingDuelScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.RegisterForSingleUpdateGameTime(1.0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN AUTOCAST TYPE BaboEventRieklingDuelScript
Quest __temp = self as Quest
BaboEventRieklingDuelScript kmyQuest = __temp as BaboEventRieklingDuelScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.ScenePlay(3, true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN AUTOCAST TYPE BaboEventRieklingDuelScript
Quest __temp = self as Quest
BaboEventRieklingDuelScript kmyQuest = __temp as BaboEventRieklingDuelScript
;END AUTOCAST
;BEGIN CODE
MsgCtrl.BadRieklingDuelMessagebox(25)
kmyQuest.gotostate("PlayerFight")
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Message Property BaboEventRieklingThirskStartQuestMsg  Auto  

ObjectReference Property BaboEventRieklingEntranceMarker  Auto  

Actor Property PlayerRef  Auto  

Quest Property BaboSexController  Auto  

Message Property BaboEventRieklingThirskStartWinMsg  Auto  

BaboMsgManager Property MsgCtrl  Auto  
