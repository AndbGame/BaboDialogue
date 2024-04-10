;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 5
Scriptname QF_BaboKidnapEventCall_08B15B61 Extends Quest Hidden

;BEGIN ALIAS PROPERTY KidnapperB
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_KidnapperB Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY KidnapperA
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_KidnapperA Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
int ichar = Utility.randomint(0,3)
actor akactor = BaboFollowerStandbyMarkerRef.placeactoratme(BaboSlaverNobleNPC, 4)
actor akactor2
if ichar == 1
akactor2 = BaboFollowerStandbyMarkerRef.placeactoratme(BaboKidnapperGuardBossChar1, 4)
elseif ichar == 2
akactor2 = BaboFollowerStandbyMarkerRef.placeactoratme(BaboKidnapperGuardBossChar2, 4)
elseif ichar == 3
akactor2 = BaboFollowerStandbyMarkerRef.placeactoratme(BaboKidnapperGuardBossChar3, 4)
else
akactor2 = BaboFollowerStandbyMarkerRef.placeactoratme(BaboKidnapperGuardBossChar0, 4)
endif

int iscenario = Utility.randomint(20, 25)
while !BaboKidnapEvent.isrunning()
(BaboSexController as BaboSexControllerManager).KidnapQuestStart(akactor, akactor2, iscenario, None)
Utility.wait(10.0)
endwhile
(BaboKidnapEvent as BaboKidnapEvenScript).StartUptheEvent(20)
setstage(255)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
if BaboKidnapEvent.isrunning()
Debug.notification("Kidnap event is already running")
else

setstage(20)

;int ichance = Utility.randomint(0, 1)

;if ichance == 1
;setstage(20)
;else
;setstage(10);Not now
;endif
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
actor akactor = BaboFollowerStandbyMarkerRef.placeactoratme(BaboSlaverNobleNPC, 4)
int iscenario = Utility.randomint(20, 22)
(BaboSexController as BaboSexControllerManager).KidnapQuestStart(akactor, None, iscenario, None)
Utility.wait(7.0)
(BaboKidnapEvent as BaboKidnapEvenScript).StartUptheEvent(20)
setstage(255)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ActorBase Property BaboSlaverNobleNPC  Auto  

ObjectReference Property BaboFollowerStandbyMarkerRef  Auto  

Quest Property BaboSexController  Auto  

Quest Property BaboKidnapEvent  Auto  

ActorBase Property BaboKidnapperGuardBossChar0  Auto  
ActorBase Property BaboKidnapperGuardBossChar1  Auto  
ActorBase Property BaboKidnapperGuardBossChar2  Auto  
ActorBase Property BaboKidnapperGuardBossChar3  Auto  
