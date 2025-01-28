;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 15
Scriptname SF_BaboChangeLocationEvent07_0841A08A Extends Scene Hidden

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).QTEAnimation(PlayerRef, GuestRef01.getreference() as actor, true, "Babo_Drunk_SBD_A01Start", "Babo_Drunk_SBD_A02Start", false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
if BaboSpectatorScript.isrunning()
BaboSpectatorScript.setstage(250)
endif
BaboSceneStandBy.setvalue(0)
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;Debug.sendanimationevent(PlayerRef, "Babo_DeathStart")
BaboAssaultAttemptCountInstance.setvalue(1)
BaboSceneStandBy.setvalue(1)
Debug.sendanimationevent(PlayerRef, "BaboFaintFStart")
if BaboGlobalSpectatorSwitch.getvalue() == 1
BaboSpectatorKeyword.SendStoryEvent(None, GuestRef01.getreference() as actor, None)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN CODE
Debug.sendanimationevent(PlayerRef, "BaboFaintFEnd")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN CODE
GetOwningQuest().SetStage(70)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
if BaboSpectatorScript.isrunning()
BaboSpectatorScript.setstage(250)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
GetOwningQuest().SetStage(65)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN CODE
if (BaboSexController as BaboSexControllerManager).PoisonResistChance(PlayerRef, 30, 70)
int choice = BaboResistAddictedMessage.Show()
if (choice == 0)
BaboPlayerGetPoisoned.setvalue(0)
BaboSceneStandBy.setvalue(0)
else
BaboPlayerGetPoisoned.setvalue(1)
BaboSceneStandBy.setvalue(0);ResistFailed
endif
else
BaboPlayerGetPoisoned.setvalue(1)
BaboSceneStandBy.setvalue(0);ResistFailed
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property BaboSpectatorScript  Auto  

Keyword Property BaboSpectatorKeyword  Auto  

ReferenceAlias Property GuestRef01  Auto  

ReferenceAlias Property FollowerRef  Auto  

GlobalVariable Property BaboGlobalSpectatorSwitch  Auto  

Actor Property PlayerRef  Auto  

Quest Property BaboSexController  Auto  

GlobalVariable Property BaboSceneStandBy  Auto  

GlobalVariable Property BaboPlayerGetPoisoned  Auto  

Message Property BaboResistAddictedMessage  Auto  

GlobalVariable Property BaboAssaultAttemptCountInstance  Auto  
