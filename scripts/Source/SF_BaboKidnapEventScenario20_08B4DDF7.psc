;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 3
Scriptname SF_BaboKidnapEventScenario20_08B4DDF7 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
if BaboKidnapEscapeAttempts.getvalue() == 1
	(Getowningquest() as BaboKidnapEvenScript).SlaveTrust(-4)
	if BaboKidnapEscapeResponse.getvalue() == 0
		(Getowningquest() as BaboKidnapEvenScript).GivePunishment(5, Kidnapper01.getreference() as actor);Violence
	elseif BaboKidnapEscapeResponse.getvalue() == 1
		(Getowningquest() as BaboKidnapEvenScript).GivePunishment(4, Kidnapper01.getreference() as actor);Violence + Drug
	elseif BaboKidnapEscapeResponse.getvalue() == 2
		(Getowningquest() as BaboKidnapEvenScript).GivePunishment(2, Kidnapper01.getreference() as actor);Sex
	else
		(Getowningquest() as BaboKidnapEvenScript).GivePunishment(2, Kidnapper01.getreference() as actor);Sex
	endif
	
elseif BaboKidnapEscapeAttempts.getvalue() >= 2
	(Getowningquest() as BaboKidnapEvenScript).SlaveTrust(-10)
	if BaboPlayerYoke.getvalue() == 0 && BaboSlaverTrust.getvalue() <= 30
		(Getowningquest() as BaboKidnapEvenScript).GivePunishment(6, Kidnapper01.getreference() as actor);DDI
	else
		BaboKidnapEscapeResponse.setvalue(2)
		(Getowningquest() as BaboKidnapEvenScript).GivePunishment(4, Kidnapper01.getreference() as actor);Violence + Drug + Sex
		;Violence and sex
	endif
	
else; no BaboKidnapEscapeAttempts
	;No Punish
	(Getowningquest() as BaboKidnapEvenScript).SlaveTrust(-2)
	
	if BaboKidnapEscapeResponse.getvalue() == 0
		(Getowningquest() as BaboKidnapEvenScript).GivePunishment(1, Kidnapper01.getreference() as actor);blowjob
	elseif BaboKidnapEscapeResponse.getvalue() == 1
		(Getowningquest() as BaboKidnapEvenScript).GivePunishment(2, Kidnapper01.getreference() as actor);Sex
	elseif BaboKidnapEscapeResponse.getvalue() == 2
		(Getowningquest() as BaboKidnapEvenScript).StartUptheEvent(1);No punishment
	endif

endif

BaboKidnapLockBreakAttempts.setvalue(BaboKidnapLockBreakAttempts.getvalue() + 1)
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
BaboKidnapEscapeResponse.setvalue(Utility.randomint(0,2))
(Getowningquest() as BaboKidnapEvenScript).StartUptheEvent(2);Standby
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property BaboKidnapLockBreakAttempts  Auto  

GlobalVariable Property BaboKidnapEscapeAttempts  Auto  

Quest Property BaboSexController  Auto  

GlobalVariable Property BaboDDI  Auto  

GlobalVariable Property BaboPlayerRestrained  Auto  

GlobalVariable Property BaboSlaverTrust  Auto  

GlobalVariable Property BaboPlayerYoke  Auto  

GlobalVariable Property BaboKidnapEscapeResponse  Auto 

ReferenceAlias Property Kidnapper01 Auto
