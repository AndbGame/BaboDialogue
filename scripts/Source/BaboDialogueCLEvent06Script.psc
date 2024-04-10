Scriptname BaboDialogueCLEvent06Script extends Quest  


Faction Property BaboFactionGuardSexwithPlayer Auto

ObjectReference Property BaboDialogueCLEvent06Xmarker  Auto

ObjectReference Property BakaEventRoomWhiterunMarkerA01Ref  Auto
ObjectReference Property BakaEventRoomWhiterunMarkerA02Ref  Auto
ObjectReference Property BakaEventRoomWhiterunMarkerA03Ref  Auto

ObjectReference Property BakaEventRoomWhiterunMarkerB01Ref  Auto
ObjectReference Property BakaEventRoomWhiterunMarkerB02Ref  Auto
ObjectReference Property BakaEventRoomWhiterunMarkerB03Ref  Auto

ObjectReference Property BakaEventRoomWhiterunMarkerC01Ref  Auto
ObjectReference Property BakaEventRoomWhiterunMarkerC02Ref  Auto
ObjectReference Property BakaEventRoomWhiterunMarkerC03Ref  Auto

ObjectReference Property BakaEventRoomWhiterunMarkerD01Ref  Auto
ObjectReference Property BakaEventRoomWhiterunMarkerD02Ref  Auto
ObjectReference Property BakaEventRoomWhiterunMarkerD03Ref  Auto

ObjectReference Property BakaEventRoomWindhelmJailMarkerA01Ref  Auto  
ObjectReference Property BakaEventRoomWindhelmJailMarkerA02Ref  Auto  
ObjectReference Property BakaEventRoomWindhelmJailMarkerA03Ref  Auto  

ObjectReference Property BakaEventRoomWindhelmJailMarkerB01Ref  Auto  
ObjectReference Property BakaEventRoomWindhelmJailMarkerB02Ref  Auto  
ObjectReference Property BakaEventRoomWindhelmJailMarkerB03Ref  Auto  

ObjectReference Property BakaEventRoomWindhelmJailMarkerC01Ref  Auto  
ObjectReference Property BakaEventRoomWindhelmJailMarkerC02Ref  Auto  
ObjectReference Property BakaEventRoomWindhelmJailMarkerC03Ref  Auto  

ObjectReference Property BakaEventRoomWindhelmJailMarkerD01Ref  Auto  
ObjectReference Property BakaEventRoomWindhelmJailMarkerD02Ref  Auto  
ObjectReference Property BakaEventRoomWindhelmJailMarkerD03Ref  Auto  

ObjectReference Property BakaEventRoomMarkarthJailMarkerA01Ref  Auto  
ObjectReference Property BakaEventRoomMarkarthJailMarkerA02Ref  Auto  
ObjectReference Property BakaEventRoomMarkarthJailMarkerA03Ref  Auto  

ObjectReference Property BakaEventRoomMarkarthJailMarkerB01Ref  Auto  
ObjectReference Property BakaEventRoomMarkarthJailMarkerB02Ref  Auto  
ObjectReference Property BakaEventRoomMarkarthJailMarkerB03Ref  Auto  

ObjectReference Property BakaEventRoomMarkarthJailMarkerC01Ref  Auto  
ObjectReference Property BakaEventRoomMarkarthJailMarkerC02Ref  Auto  
ObjectReference Property BakaEventRoomMarkarthJailMarkerC03Ref  Auto  

ObjectReference Property BakaEventRoomMarkarthJailMarkerD01Ref  Auto  
ObjectReference Property BakaEventRoomMarkarthJailMarkerD02Ref  Auto  
ObjectReference Property BakaEventRoomMarkarthJailMarkerD03Ref  Auto  

ObjectReference Property BakaEventRoomRiftenJailMarkerA01Ref  Auto  
ObjectReference Property BakaEventRoomRiftenJailMarkerA02Ref  Auto  
ObjectReference Property BakaEventRoomRiftenJailMarkerA03Ref  Auto  

ObjectReference Property BakaEventRoomRiftenJailMarkerB01Ref  Auto  
ObjectReference Property BakaEventRoomRiftenJailMarkerB02Ref  Auto  
ObjectReference Property BakaEventRoomRiftenJailMarkerB03Ref  Auto  

ObjectReference Property BakaEventRoomRiftenJailMarkerC01Ref  Auto  
ObjectReference Property BakaEventRoomRiftenJailMarkerC02Ref  Auto  
ObjectReference Property BakaEventRoomRiftenJailMarkerC03Ref  Auto  

ObjectReference Property BakaEventRoomRiftenJailMarkerD01Ref  Auto  
ObjectReference Property BakaEventRoomRiftenJailMarkerD02Ref  Auto  
ObjectReference Property BakaEventRoomRiftenJailMarkerD03Ref  Auto  

ObjectReference Property BakaEventRoomSolitudeJailMarkerA01Ref  Auto  
ObjectReference Property BakaEventRoomSolitudeJailMarkerA02Ref  Auto  
ObjectReference Property BakaEventRoomSolitudeJailMarkerA03Ref  Auto  

ObjectReference Property BakaEventRoomSolitudeJailMarkerB01Ref  Auto
ObjectReference Property BakaEventRoomSolitudeJailMarkerB02Ref  Auto
ObjectReference Property BakaEventRoomSolitudeJailMarkerB03Ref  Auto

ObjectReference Property BakaEventRoomSolitudeJailMarkerC01Ref  Auto
ObjectReference Property BakaEventRoomSolitudeJailMarkerC02Ref  Auto
ObjectReference Property BakaEventRoomSolitudeJailMarkerC03Ref  Auto

ObjectReference Property BakaEventRoomSolitudeJailMarkerD01Ref  Auto
ObjectReference Property BakaEventRoomSolitudeJailMarkerD02Ref  Auto
ObjectReference Property BakaEventRoomSolitudeJailMarkerD03Ref  Auto


ReferenceAlias Property BaboEventMarkerRef01 Auto
ReferenceAlias Property BaboEventMarkerRef02 Auto
ReferenceAlias Property BaboEventMarkerRef03 Auto

ReferenceAlias Property GuardRef01 Auto
ReferenceAlias Property GuardRef02 Auto
ReferenceAlias Property PlayerAlias Auto

Scene Property BaboDialogueCLEvent06Scene01 Auto
Scene Property BaboDialogueCLEvent06Scene02 Auto

Actor Property PlayerRef Auto

Quest Property BaboSexController Auto;BaboSexControllerManager

GlobalVariable Property BaboChangeLocation06SolitudeSwitch Auto
GlobalVariable Property BaboChangeLocation06RiftenSwitch Auto
GlobalVariable Property BaboChangeLocation06MarkarthSwitch Auto
GlobalVariable Property BaboChangeLocation06WindhelmSwitch Auto
GlobalVariable Property BaboChangeLocation06WhiterunSwitch Auto

Faction Property GuardFactionRiften Auto
Faction Property GuardFactionSolitude Auto
Faction Property GuardFactionWindhelm Auto
Faction Property GuardFactionMarkarth Auto
Faction Property GuardFactionWhiterun Auto

Function NoMoreCLEvent06(actor akactor)
	if akactor.isinfaction(GuardFactionRiften)
		BaboChangeLocation06RiftenSwitch.setvalue(0)
	elseif akactor.isinfaction(GuardFactionSolitude)
		BaboChangeLocation06SolitudeSwitch.setvalue(0)
	elseif akactor.isinfaction(GuardFactionWindhelm)
		BaboChangeLocation06WindhelmSwitch.setvalue(0)
	elseif akactor.isinfaction(GuardFactionMarkarth)
		BaboChangeLocation06MarkarthSwitch.setvalue(0)
	elseif akactor.isinfaction(GuardFactionWhiterun)
		BaboChangeLocation06WhiterunSwitch.setvalue(0)
	endif
EndFunction

Function ContinueCLEvent06(actor akactor)
	if akactor.isinfaction(GuardFactionRiften)
		BaboChangeLocation06RiftenSwitch.setvalue(1)
	elseif akactor.isinfaction(GuardFactionSolitude)
		BaboChangeLocation06SolitudeSwitch.setvalue(1)
	elseif akactor.isinfaction(GuardFactionWindhelm)
		BaboChangeLocation06WindhelmSwitch.setvalue(1)
	elseif akactor.isinfaction(GuardFactionMarkarth)
		BaboChangeLocation06MarkarthSwitch.setvalue(1)
	elseif akactor.isinfaction(GuardFactionWhiterun)
		BaboChangeLocation06WhiterunSwitch.setvalue(1)
	endif
EndFunction

Function SolitudeGuardEventStart(actor Guardactor)
	DesignateActor(Guardactor)
	BaboDialogueCLEvent06Xmarker.moveto(PlayerRef)
	GotoState("SolitudeGuard")
EndFunction

Function RiftenGuardEventStart(actor Guardactor)
	DesignateActor(Guardactor)
	BaboDialogueCLEvent06Xmarker.moveto(PlayerRef)
	GotoState("RiftenGuard")
EndFunction

Function MarkarthGuardEventStart(actor Guardactor)
	DesignateActor(Guardactor)
	BaboDialogueCLEvent06Xmarker.moveto(PlayerRef)
	GotoState("MarkarthGuard")
EndFunction

Function WindhelmGuardEventStart(actor Guardactor)
	DesignateActor(Guardactor)
	BaboDialogueCLEvent06Xmarker.moveto(PlayerRef)
	GotoState("WindhelmGuard")
EndFunction

Function WhiterunGuardEventStart(actor Guardactor)
	DesignateActor(Guardactor)
	BaboDialogueCLEvent06Xmarker.moveto(PlayerRef)
	GotoState("WhiterunGuard")
EndFunction


Function GuardSexEvent()
	BaboDialogueCLEvent06Scene01.stop()
	(BaboSexController as BaboSexControllerManager).SexCustom(PlayerAlias, GuardRef01, None, None, None, "Oral", "Vaginal", "Anal", true, "CL06AS01", "CLEvent06GuardSex01", false)
EndFunction

Function GuardSexEventEnd()
	NoMoreCLEvent06((GuardRef01.getreference() as actor))
	(GuardRef01.getreference() as actor).addtofaction(BaboFactionGuardSexwithPlayer)
	BaboDialogueCLEvent06Scene02.forcestart()
EndFunction

Function AllEventEnd()
	BaboDialogueCLEvent06Scene02.stop()
	PlayerRef.moveto(BaboDialogueCLEvent06Xmarker)
	(GuardRef01.getreference() as actor).moveto(BaboDialogueCLEvent06Xmarker)
	if GuardRef02
		(GuardRef02.getreference() as actor).moveto(BaboDialogueCLEvent06Xmarker)
	endif
	GotoState("")
	BaboEventMarkerRef01.clear()
	BaboEventMarkerRef02.clear()
	BaboEventMarkerRef03.clear()
	GuardRef01.clear()
	GuardRef02.clear()
EndFunction

Function DesignateActor(actor akactor)
	GuardRef01.forcerefto(akactor)
EndFunction

Function DesignateMultipleActor(actor akactor01, actor akactor02)
	GuardRef01.forcerefto(akactor01)
	GuardRef02.forcerefto(akactor02)
EndFunction

Function GuardSexEventStart()
;Dummy
EndFunction

Function DesignateSpot()
;Dummy
EndFunction




State RiftenGuard

Event OnBeginState()
	GuardSexEventStart()
EndEvent

Function GuardSexEventStart()
	DesignateSpot()
	(GuardRef01.getreference() as actor).moveto(BaboEventMarkerRef02.getreference())
	PlayerRef.moveto(BaboEventMarkerRef01.getreference())
	BaboDialogueCLEvent06Scene01.forcestart()
EndFunction

Function DesignateSpot()

int PlaceNum = Utility.randomint(1, 4)

if PlaceNum == 1
	BaboEventMarkerRef01.forcerefto(BakaEventRoomRiftenJailMarkerA01Ref)
	BaboEventMarkerRef02.forcerefto(BakaEventRoomRiftenJailMarkerA02Ref)
	BaboEventMarkerRef03.forcerefto(BakaEventRoomRiftenJailMarkerA03Ref)
elseif PlaceNum == 2
	BaboEventMarkerRef01.forcerefto(BakaEventRoomRiftenJailMarkerB01Ref)
	BaboEventMarkerRef02.forcerefto(BakaEventRoomRiftenJailMarkerB02Ref)
	BaboEventMarkerRef03.forcerefto(BakaEventRoomRiftenJailMarkerB03Ref)
elseif PlaceNum == 3
	BaboEventMarkerRef01.forcerefto(BakaEventRoomRiftenJailMarkerC01Ref)
	BaboEventMarkerRef02.forcerefto(BakaEventRoomRiftenJailMarkerC02Ref)
	BaboEventMarkerRef03.forcerefto(BakaEventRoomRiftenJailMarkerC03Ref)
elseif PlaceNum == 4
	BaboEventMarkerRef01.forcerefto(BakaEventRoomRiftenJailMarkerD01Ref)
	BaboEventMarkerRef02.forcerefto(BakaEventRoomRiftenJailMarkerD02Ref)
	BaboEventMarkerRef03.forcerefto(BakaEventRoomRiftenJailMarkerD03Ref)
else
	BaboEventMarkerRef01.forcerefto(BakaEventRoomRiftenJailMarkerA01Ref)
	BaboEventMarkerRef02.forcerefto(BakaEventRoomRiftenJailMarkerA02Ref)
	BaboEventMarkerRef03.forcerefto(BakaEventRoomRiftenJailMarkerA03Ref)
endif

EndFunction

EndState





State SolitudeGuard

Event OnBeginState()
	GuardSexEventStart()
EndEvent

Function GuardSexEventStart()
	DesignateSpot()
	(GuardRef01.getreference() as actor).moveto(BaboEventMarkerRef02.getreference())
	PlayerRef.moveto(BaboEventMarkerRef01.getreference())
	BaboDialogueCLEvent06Scene01.forcestart()
EndFunction

Function DesignateSpot()

int PlaceNum = Utility.randomint(1, 4)

if PlaceNum == 1
	BaboEventMarkerRef01.forcerefto(BakaEventRoomSolitudeJailMarkerA01Ref)
	BaboEventMarkerRef02.forcerefto(BakaEventRoomSolitudeJailMarkerA02Ref)
	BaboEventMarkerRef03.forcerefto(BakaEventRoomSolitudeJailMarkerA03Ref)
elseif PlaceNum == 2
	BaboEventMarkerRef01.forcerefto(BakaEventRoomSolitudeJailMarkerB01Ref)
	BaboEventMarkerRef02.forcerefto(BakaEventRoomSolitudeJailMarkerB02Ref)
	BaboEventMarkerRef03.forcerefto(BakaEventRoomSolitudeJailMarkerB03Ref)
elseif PlaceNum == 3
	BaboEventMarkerRef01.forcerefto(BakaEventRoomSolitudeJailMarkerC01Ref)
	BaboEventMarkerRef02.forcerefto(BakaEventRoomSolitudeJailMarkerC02Ref)
	BaboEventMarkerRef03.forcerefto(BakaEventRoomSolitudeJailMarkerC03Ref)
elseif PlaceNum == 4
	BaboEventMarkerRef01.forcerefto(BakaEventRoomSolitudeJailMarkerD01Ref)
	BaboEventMarkerRef02.forcerefto(BakaEventRoomSolitudeJailMarkerD02Ref)
	BaboEventMarkerRef03.forcerefto(BakaEventRoomSolitudeJailMarkerD03Ref)
else
	BaboEventMarkerRef01.forcerefto(BakaEventRoomSolitudeJailMarkerA01Ref)
	BaboEventMarkerRef02.forcerefto(BakaEventRoomSolitudeJailMarkerA02Ref)
	BaboEventMarkerRef03.forcerefto(BakaEventRoomSolitudeJailMarkerA03Ref)
endif

EndFunction

EndState

State MarkarthGuard

Event OnBeginState()
	GuardSexEventStart()
EndEvent

Function GuardSexEventStart()
	DesignateSpot()
	(GuardRef01.getreference() as actor).moveto(BaboEventMarkerRef02.getreference())
	PlayerRef.moveto(BaboEventMarkerRef01.getreference())
	BaboDialogueCLEvent06Scene01.forcestart()
EndFunction

Function DesignateSpot()

int PlaceNum = Utility.randomint(1, 4)

if PlaceNum == 1
	BaboEventMarkerRef01.forcerefto(BakaEventRoomMarkarthJailMarkerA01Ref)
	BaboEventMarkerRef02.forcerefto(BakaEventRoomMarkarthJailMarkerA02Ref)
	BaboEventMarkerRef03.forcerefto(BakaEventRoomMarkarthJailMarkerA03Ref)
elseif PlaceNum == 2
	BaboEventMarkerRef01.forcerefto(BakaEventRoomMarkarthJailMarkerB01Ref)
	BaboEventMarkerRef02.forcerefto(BakaEventRoomMarkarthJailMarkerB02Ref)
	BaboEventMarkerRef03.forcerefto(BakaEventRoomMarkarthJailMarkerB03Ref)
elseif PlaceNum == 3
	BaboEventMarkerRef01.forcerefto(BakaEventRoomMarkarthJailMarkerC01Ref)
	BaboEventMarkerRef02.forcerefto(BakaEventRoomMarkarthJailMarkerC02Ref)
	BaboEventMarkerRef03.forcerefto(BakaEventRoomMarkarthJailMarkerC03Ref)
elseif PlaceNum == 4
	BaboEventMarkerRef01.forcerefto(BakaEventRoomMarkarthJailMarkerD01Ref)
	BaboEventMarkerRef02.forcerefto(BakaEventRoomMarkarthJailMarkerD02Ref)
	BaboEventMarkerRef03.forcerefto(BakaEventRoomMarkarthJailMarkerD03Ref)
else
	BaboEventMarkerRef01.forcerefto(BakaEventRoomMarkarthJailMarkerA01Ref)
	BaboEventMarkerRef02.forcerefto(BakaEventRoomMarkarthJailMarkerA02Ref)
	BaboEventMarkerRef03.forcerefto(BakaEventRoomMarkarthJailMarkerA03Ref)
endif

EndFunction

EndState

State WindhelmGuard

Event OnBeginState()
	GuardSexEventStart()
EndEvent

Function GuardSexEventStart()
	DesignateSpot()
	(GuardRef01.getreference() as actor).moveto(BaboEventMarkerRef02.getreference())
	PlayerRef.moveto(BaboEventMarkerRef01.getreference())
	BaboDialogueCLEvent06Scene01.forcestart()
EndFunction

Function DesignateSpot()

int PlaceNum = Utility.randomint(1, 4)

if PlaceNum == 1
	BaboEventMarkerRef01.forcerefto(BakaEventRoomWindhelmJailMarkerA01Ref)
	BaboEventMarkerRef02.forcerefto(BakaEventRoomWindhelmJailMarkerA02Ref)
	BaboEventMarkerRef03.forcerefto(BakaEventRoomWindhelmJailMarkerA03Ref)
elseif PlaceNum == 2
	BaboEventMarkerRef01.forcerefto(BakaEventRoomWindhelmJailMarkerB01Ref)
	BaboEventMarkerRef02.forcerefto(BakaEventRoomWindhelmJailMarkerB02Ref)
	BaboEventMarkerRef03.forcerefto(BakaEventRoomWindhelmJailMarkerB03Ref)
elseif PlaceNum == 3
	BaboEventMarkerRef01.forcerefto(BakaEventRoomWindhelmJailMarkerC01Ref)
	BaboEventMarkerRef02.forcerefto(BakaEventRoomWindhelmJailMarkerC02Ref)
	BaboEventMarkerRef03.forcerefto(BakaEventRoomWindhelmJailMarkerC03Ref)
elseif PlaceNum == 4
	BaboEventMarkerRef01.forcerefto(BakaEventRoomWindhelmJailMarkerD01Ref)
	BaboEventMarkerRef02.forcerefto(BakaEventRoomWindhelmJailMarkerD02Ref)
	BaboEventMarkerRef03.forcerefto(BakaEventRoomWindhelmJailMarkerD03Ref)
else
	BaboEventMarkerRef01.forcerefto(BakaEventRoomWindhelmJailMarkerA01Ref)
	BaboEventMarkerRef02.forcerefto(BakaEventRoomWindhelmJailMarkerA02Ref)
	BaboEventMarkerRef03.forcerefto(BakaEventRoomWindhelmJailMarkerA03Ref)
endif

EndFunction

EndState

State WhiterunGuard

Event OnBeginState()
	GuardSexEventStart()
EndEvent

Function GuardSexEventStart()
	DesignateSpot()
	(GuardRef01.getreference() as actor).moveto(BaboEventMarkerRef02.getreference())
	PlayerRef.moveto(BaboEventMarkerRef01.getreference())
	BaboDialogueCLEvent06Scene01.forcestart()
EndFunction

Function DesignateSpot()

int PlaceNum = Utility.randomint(1, 4)

if PlaceNum == 1
	BaboEventMarkerRef01.forcerefto(BakaEventRoomWhiterunMarkerA01Ref)
	BaboEventMarkerRef02.forcerefto(BakaEventRoomWhiterunMarkerA02Ref)
	BaboEventMarkerRef03.forcerefto(BakaEventRoomWhiterunMarkerA03Ref)
elseif PlaceNum == 2
	BaboEventMarkerRef01.forcerefto(BakaEventRoomWhiterunMarkerB01Ref)
	BaboEventMarkerRef02.forcerefto(BakaEventRoomWhiterunMarkerB02Ref)
	BaboEventMarkerRef03.forcerefto(BakaEventRoomWhiterunMarkerB03Ref)
elseif PlaceNum == 3
	BaboEventMarkerRef01.forcerefto(BakaEventRoomWhiterunMarkerC01Ref)
	BaboEventMarkerRef02.forcerefto(BakaEventRoomWhiterunMarkerC02Ref)
	BaboEventMarkerRef03.forcerefto(BakaEventRoomWhiterunMarkerC03Ref)
elseif PlaceNum == 4
	BaboEventMarkerRef01.forcerefto(BakaEventRoomWhiterunMarkerD01Ref)
	BaboEventMarkerRef02.forcerefto(BakaEventRoomWhiterunMarkerD02Ref)
	BaboEventMarkerRef03.forcerefto(BakaEventRoomWhiterunMarkerD03Ref)
else
	BaboEventMarkerRef01.forcerefto(BakaEventRoomWhiterunMarkerA01Ref)
	BaboEventMarkerRef02.forcerefto(BakaEventRoomWhiterunMarkerA02Ref)
	BaboEventMarkerRef03.forcerefto(BakaEventRoomWhiterunMarkerA03Ref)
endif

EndFunction

EndState