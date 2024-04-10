Scriptname BaboEventWhiterunOrcVisitorsScript extends Quest  

Function GoStateBefore()
	GotoState("Before40")
EndFunction

Function GoState()
	DoorSwitch(false)
	GotoState("After40")
EndFunction

Function RegisterUpdate(Int TimeLimit)
UnregisterForUpdateGameTime()

Int NextInterval = (BaboEventWhiterunOrcVisitorsNextVisitInterval.getvalue() as int)
RegisterForSingleUpdateGameTime(NextInterval + TimeLimit); this is Customizable

EndFunction

Function RegisterUpdateOnLoad(Int TimeLimit)
UnregisterForUpdateGameTime()

RegisterForSingleUpdateGameTime(TimeLimit); this is Customizable
EndFunction

Function BaboEventWhiterunOrcVisitorsTriggerEventValue(int value)
	BaboEventWhiterunOrcVisitorsTriggerEvent.setvalue(value)
Endfunction

Function AliasClear()
	(LydiaRef.getreference() as actor).evaluatepackage()
	(Child1.getreference() as actor).evaluatepackage()
	(Child2.getreference() as actor).evaluatepackage()
	LydiaRef.Clear()
	Child1.Clear()
	Child2.Clear()
	
	OrcRaper01.getreference().deletewhenable()
	OrcRaper02.getreference().deletewhenable()
	OrcRaper03.getreference().deletewhenable()
	OrcRaper01.Clear()
	OrcRaper02.Clear()
	OrcRaper03.Clear()
EndFunction

Function AliasChildClear()
	LydiaRef.Clear()
	Child1.Clear()
	Child2.Clear()
	OrcRapist01Marker.Clear()
	OrcRapist02Marker.Clear()
	OrcRapist03Marker.Clear()
	LydiaMarker.Clear()
	ChildMarker.Clear()
EndFunction

Function SetEssentialNPC(Bool Switch);WIP
	if Switch
		(OrcRaper01.getreference() as actor).GetActorBase().SetEssential(true)
		(OrcRaper02.getreference() as actor).GetActorBase().SetEssential(true)
		(OrcRaper03.getreference() as actor).GetActorBase().SetEssential(true)
	else
		(OrcRaper01.getreference() as actor).GetActorBase().SetEssential(false)
		(OrcRaper02.getreference() as actor).GetActorBase().SetEssential(false)
		(OrcRaper03.getreference() as actor).GetActorBase().SetEssential(false)
	endif
endfunction

Function MarkerDesignate()
OrcRapist01Marker.ForceRefTo(BaboEvent01XmarkerA)
OrcRapist02Marker.ForceRefTo(BaboEvent01XmarkerB)
OrcRapist03Marker.ForceRefTo(BaboEvent01XmarkerC)
LydiaMarker.ForceRefTo(BaboEvent01XmarkerD)
ChildMarker.ForceRefTo(BaboEvent01XmarkerE)
EndFunction

Function MoveOrcs()
(OrcRaper01.getreference() as actor).moveto(BaboEvent01XmarkerA)
(OrcRaper02.getreference() as actor).moveto(BaboEvent01XmarkerB)
(OrcRaper03.getreference() as actor).moveto(BaboEvent01XmarkerC)

(LydiaRef.getreference() as actor).moveto(BaboEvent01XmarkerD)
(Child1.getreference() as actor).moveto(BaboEvent01XmarkerE)
(Child2.getreference() as actor).moveto(BaboEvent01XmarkerE)
EndFunction

Function SpawnOrcs()
Actor StrangeOrcActor01
Actor StrangeOrcActor02
Actor StrangeOrcActor03

if !ActorRecycle()

BaboEventOrcRevisit.setvalue(0)
	if BaboEventGiantOrc.getvalue() == 1
		StrangeOrcActor01 = SpawnPlace.PlaceActorAtMe(BaboBigGuyOrcVisitor01, 4)
		StrangeOrcActor02 = SpawnPlace.PlaceActorAtMe(BaboBigGuyOrcVisitor02, 4)
		StrangeOrcActor03 = SpawnPlace.PlaceActorAtMe(BaboBigGuyOrcVisitor03, 4)
	else
		StrangeOrcActor01 = SpawnPlace.PlaceActorAtMe(StrangeOrc01, 4)
		StrangeOrcActor02 = SpawnPlace.PlaceActorAtMe(StrangeOrc02, 4)
		StrangeOrcActor03 = SpawnPlace.PlaceActorAtMe(StrangeOrc03, 4)
	endif
	OrcRaper01.ForceRefTo(StrangeOrcActor01)
	OrcRaper02.ForceRefTo(StrangeOrcActor02)
	OrcRaper03.ForceRefTo(StrangeOrcActor03)
else
	BaboEventOrcRevisit.setvalue(1)
endif

if BaboDialogueSEGlobal.getvalue() == 1
	(OrcRaper01 as BaboEvent01OrcRefScript).PO3HitEventRegister()
	(OrcRaper02 as BaboEvent01OrcRefScript).PO3HitEventRegister()
	(OrcRaper03 as BaboEvent01OrcRefScript).PO3HitEventRegister()
endif

IF !LydiaActor.isdead()
	LydiaRef.ForceRefto(LydiaActor)
EndIf
if (OChild1.GetReference() == None)
	Return
Else
	OChild1 = Child1
EndIf
if (OChild2.GetReference() == None)
	Return
Else
	OChild2 = Child2
EndIf
EndFunction

function AttackPeople(ReferenceAlias AliasToAnger)

	Actor ActorRef = AliasToAnger.GetActorReference()
	actorRef.RemoveFromFaction(OrcRaperMild)
	actorRef.addtoFaction(OrcRaperHot)
	
	if actorRef.GetActorValue("Aggression") < 2
		actorRef.SetActorValue("Aggression", 2) 
	EndIf

	actorRef.startCombat(Game.GetPlayer())

EndFunction

function RapeGangbangBE4(ReferenceAlias Actor01, ReferenceAlias Actor02, ReferenceAlias Actor03, ReferenceAlias Actor04)

	Actor Victim = Actor01.GetActorReference()
	Actor Raper01 = Actor02.GetActorReference()
	Actor Raper02 = Actor03.GetActorReference()
	Actor Raper03 = Actor04.GetActorReference()

	actor[] sexActors = new actor[4]
	sexActors[0] = Victim
	sexActors[1] = Raper01
	sexActors[2] = Raper02
	sexActors[3] = Raper03
	sslBaseAnimation[] anims
	if BaboEventGiantOrc.getvalue() == 1
		anims = new sslBaseAnimation[1]
		anims[0] = SexLab.GetAnimationByName("ThreateningMMF")
	else
		anims = SexLab.GetAnimationsByTag(4, "MMMF", "Aggressive")
	endif
	RegisterForModEvent("AnimationEnd_AfterSexTBE", "AfterSexSceneBE")
	SexLab.StartSex(sexActors, anims, victim=sexActors[0], hook="AfterSexTBE")

EndFunction

;anims = SexLab.GetAnimationByName("")

Event AfterSexBE(string eventName, string argString, float argNum, form sender)

	Actor Victim = SexLab.HookActors(argString)[0]
	Actor Raper01 = SexLab.HookActors(argString)[1]
	Actor Raper02 = SexLab.HookActors(argString)[2]
	Actor Raper03 = SexLab.HookActors(argString)[3]

	actor[] sexActors = new actor[4]
	sexActors[0] = Victim
	sexActors[1] = Raper01
	sexActors[2] = Raper02
	sexActors[3] = Raper03
	sslBaseAnimation[] anims
	anims = SexLab.GetAnimationsByTag(4, "MMMF", "Aggressive")
	Self.Messagebox(10)
	RegisterForModEvent("AnimationEnd_AfterSexTBE", "AfterSexSceneBE")
	SexLab.StartSex(sexActors, anims, victim=sexActors[0], hook="AfterSexTBE")
	UnregisterForModEvent("AnimationEnd_Gangbang4AfterBE")

EndEvent

Event AfterSexSceneBE(string eventName, string argString, float argNum, form sender)
	Scene01.forceStart()
	Game.DisablePlayerControls(abmenu = true)
	PlayerREF.playIdle(OrgasmAfter01)
	UnregisterForModEvent("AnimationEnd_AfterSexT")
EndEvent

String Function CustomSexStringRandom()
int randomi = Utility.randomint(0, 2)
String RString
if randomi == 1
	RString = "BackHugPressure01"
elseif randomi == 2
	RString = "WallLeanPressure01"
else
	RString = "Conquering02"
endif
Return Rstring
EndFunction

Function EquipZazItem()

PlayerREF.EquipItem(Yoke, true, true)
PlayerREF.EquipItem(RopeCollar, true, true)
PlayerREF.EquipItem(AnkleChain, true, true)
PlayerREF.EquipItem(Logbit, true, true)

EndFunction

Function UnEquipZazItem()

PlayerREF.UnEquipItem(Yoke, true, true)
PlayerREF.UnEquipItem(RopeCollar, true, true)
PlayerREF.UnEquipItem(AnkleChain, true, true)
PlayerREF.UnEquipItem(Logbit, true, true)

Self.Messagebox(11)

EndFunction

Bool Function ResetQuest()
	if (self.getstage() == 80)
		if (BaboDialogueWhiterun.getstage() > 5) && (BaboDialogueWhiterun.getstage() < 100)
			Return False
		endif
	EndIf
	OrcRapeScene01.stop()
	BaboEventWhiterunOrcVisitiorsScene02.stop()
	BaboEventWhiterunOrcVisitiorsSceneExtra.stop()
	BaboEventWhiterunOrcVisitiorsSceneIntro.stop()
	UnregisterForUpdateGameTime()
	UnEquipZazItem()
	(BaboSexController as BaboSexControllerManager).RecoverControl(true)
	AliasClear()
	(BaboSexController as BaboSexControllerManager).CompatiblityCheck(False)
	GoStateBefore()
	
	Return True
EndFunction

Function KidSawit(actor akactor)
if akactor.isinfaction(BaboEventWhiterunOrcKidKnowFaction)
	akactor.setfactionrank(BaboEventWhiterunOrcKidKnowFaction, akactor.getfactionrank(BaboEventWhiterunOrcKidKnowFaction) + 1)
else
	akactor.addtofaction(BaboEventWhiterunOrcKidKnowFaction)
endif

EndFunction

Function OrcVisitorAgain(actor akactor)
if akactor.isinfaction(BaboEventWhiterunOrcVisitorsAgain)
	akactor.setfactionrank(BaboEventWhiterunOrcVisitorsAgain, akactor.getfactionrank(BaboEventWhiterunOrcVisitorsAgain) + 1)
else
	akactor.addtofaction(BaboEventWhiterunOrcVisitorsAgain)
endif
EndFunction

Function RemoveWeapons(ReferenceAlias Actor01, ReferenceAlias Actor02, ReferenceAlias Actor03)
actor Actor01ref = (Actor01.getreference() as actor)
actor Actor02ref = (Actor02.getreference() as actor)
actor Actor03ref = (Actor03.getreference() as actor)

Actor01ref.UnequipItem(BaboEnchOrcishBattleaxeParalysis, false, true)
Actor02ref.unequipitem(BaboEnchOrcishBattleaxeParalysis, false, true)
Actor03ref.unequipitem(BaboEnchOrcishBattleaxeParalysis, false, true)

Actor01ref.removeitem(BaboEnchOrcishBattleaxeParalysis, 1)
Actor02ref.removeitem(BaboEnchOrcishBattleaxeParalysis, 1)
Actor03ref.removeitem(BaboEnchOrcishBattleaxeParalysis, 1)
EndFunction

Function AddWeapons(ReferenceAlias Actor01, ReferenceAlias Actor02, ReferenceAlias Actor03)
actor Actor01ref = (Actor01.getreference() as actor)
actor Actor02ref = (Actor02.getreference() as actor)
actor Actor03ref = (Actor03.getreference() as actor)

Actor01ref.equipitem(Actor01ref.AddItem(BaboEnchOrcishBattleaxeParalysis, 1, true))
Actor02ref.equipitem(Actor02ref.Additem(BaboEnchOrcishBattleaxeParalysis, 1, true))
Actor03ref.equipitem(Actor03ref.Additem(BaboEnchOrcishBattleaxeParalysis, 1, true))
EndFunction

Function AfterWhiterunViceCaptainClearQuest()
	AliasClear()
	GotoState("Before40")
	Utility.wait(1.0)
	ResetScript.UpdateWhiterunOrcQuest()
EndFunction

Function Messagebox(int num)
	(BaboSexController as BaboSexControllerManager).WhiterunOrcVisitMessagebox(num)
EndFunction

Function WOASBigGuy01()
	Game.DisablePlayerControls(abmenu = true)
	(BaboSexController as BaboSexControllerManager).RandomExhaustionIdle(PlayerRef)
	BaboEventWhiterunOrcVisitiorsSceneBG01.forcestart()
EndFunction

Function WOASBigGuy02()
	Game.DisablePlayerControls(abmenu = true)
	(BaboSexController as BaboSexControllerManager).RandomExhaustionIdle(PlayerRef)
	BaboEventWhiterunOrcVisitiorsSceneBG02.forcestart()
EndFunction

Function WOASBigGuy03()
	Game.DisablePlayerControls(abmenu = true)
	PlayerREF.playIdle(OrgasmAfter01)
	;(BaboSexController as BaboSexControllerManager).RandomExhaustionIdle(PlayerRef)
	Scene01.forceStart()
EndFunction

Function WOAS01()
	Game.DisablePlayerControls(abmenu = true)
	(BaboSexController as BaboSexControllerManager).RandomExhaustionIdle(PlayerRef)
	BaboEventWhiterunOrcVisitiorsScene03.forcestart()
EndFunction

Function WOAS02()
	Game.DisablePlayerControls(abmenu = true)
	(BaboSexController as BaboSexControllerManager).RandomExhaustionIdle(PlayerRef)
	BaboEventWhiterunOrcVisitiorsScene01.forcestart()
EndFunction

Bool Function WaitForHelp()
if LydiaRef
	(LydiaRef.getreference() as actor).moveto(BaboEvent01XmarkerF)
	return true
else
	Messagebox(14)
	return false
endif
EndFunction

Function ActorinDefaultPlace()
if LydiaRef
	(LydiaRef.getreference() as actor).moveto(BaboDialogueWhiterunXmarker03)
endif
EndFunction

Function PlayerinDefaultPlace()
	PlayerRef.moveto(BaboDialogueWhiterunXmarker03)
EndFunction

Function ActorDisposal()
Actor akactor01 = OrcRaper01.getreference() as actor
Actor akactor02 = OrcRaper02.getreference() as actor
Actor akactor03 = OrcRaper03.getreference() as actor
	akactor01.moveto(BaboDumpsterRef)
	akactor02.moveto(BaboDumpsterRef)
	akactor03.moveto(BaboDumpsterRef)
if BaboEventGiantOrc.getvalue() == 1
	BaboWhiterunBigOrcVisitorsList.addform(akactor01)
	BaboWhiterunBigOrcVisitorsList.addform(akactor02)
	BaboWhiterunBigOrcVisitorsList.addform(akactor03)
else
	BaboWhiterunOrcVisitorsList.addform(akactor01)
	BaboWhiterunOrcVisitorsList.addform(akactor02)
	BaboWhiterunOrcVisitorsList.addform(akactor03)
endif
	OrcVisitorAgain(akactor01)
	OrcVisitorAgain(akactor02)
	OrcVisitorAgain(akactor03)
	OrcRaper01.Clear()
	OrcRaper02.Clear()
	OrcRaper03.Clear()
EndFunction

Bool Function ActorRecycle()
int listsize

int ri = Utility.randomint(1, 100)
Actor Orcrapist01
Actor Orcrapist02
Actor Orcrapist03

if (ri <= 40) && BaboEventDebug.getvalue() == 0
	return false
endif

if BaboEventGiantOrc.getvalue() == 1
	listsize = BaboWhiterunBigOrcVisitorsList.getsize()
else
	listsize = BaboWhiterunOrcVisitorsList.getsize()
endif

if listsize < 3
	return false
else
	if BaboEventGiantOrc.getvalue() == 1
		Orcrapist01 = BaboWhiterunBigOrcVisitorsList.getat(0) as actor
		Orcrapist02 = BaboWhiterunBigOrcVisitorsList.getat(1) as actor
		Orcrapist03 = BaboWhiterunBigOrcVisitorsList.getat(2) as actor
		BaboWhiterunBigOrcVisitorsList.RemoveAddedForm(Orcrapist01)
		BaboWhiterunBigOrcVisitorsList.RemoveAddedForm(Orcrapist02)
		BaboWhiterunBigOrcVisitorsList.RemoveAddedForm(Orcrapist03)
	else
		Orcrapist01 = BaboWhiterunOrcVisitorsList.getat(0) as actor
		Orcrapist02 = BaboWhiterunOrcVisitorsList.getat(1) as actor
		Orcrapist03 = BaboWhiterunOrcVisitorsList.getat(2) as actor
		BaboWhiterunOrcVisitorsList.RemoveAddedForm(Orcrapist01)
		BaboWhiterunOrcVisitorsList.RemoveAddedForm(Orcrapist02)
		BaboWhiterunOrcVisitorsList.RemoveAddedForm(Orcrapist03)
	endif
	
OrcRaper01.forcerefto(Orcrapist01)
OrcRaper02.forcerefto(Orcrapist02)
OrcRaper03.forcerefto(Orcrapist03)
Orcrapist01.moveto(SpawnPlace)
Orcrapist02.moveto(SpawnPlace)
Orcrapist03.moveto(SpawnPlace)
return true
endif
EndFunction

Function DoorSwitch(Bool DoorAppear)
ObjectReference DoorRef = Game.GetFormFromFile(0x01A6F9, "Skyrim.esm") as ObjectReference
if DoorAppear
	BaboEvent01EMarker.disable()
	BaboEvent01DMarker.enable()
	if !DoorRef.isdisabled()
		DoorRef.disable()
	endif
else
	BaboEvent01EMarker.enable()
	BaboEvent01DMarker.disable()
	if DoorRef.isdisabled()
		DoorRef.enable()
	endif
	(BaboEventBreezehomeDoorRef as BakaBreezehomeDoorScript).RearemTrigger()
endif

EndFunction

Function ReturntoDefault()
	BaboEventGiantOrc.setvalue(0)
	(BaboWhiterunOrcsEnterTriggerRef as BaboWhiterunOrcOnEnterTriggerScript).ReArmTrigger()
EndFunction

State Before40
Event OnUpdateGameTime()
;Debug.notification("Before40 On Update")
	If BaboEvent.GetStage() == 8
		BaboEvent.SetStage(10)
	ElseIf (BaboEvent.GetStage() == 35) || (BaboEvent.GetStage() == 37)
		If (BaboEvent.GetStage() <= 45) && (OrcRaper01.getref().GetParentCell() != Game.GetPlayer().GetParentCell())
			BaboEvent.SetStage(40)
		Else
			;Do Nothing
		EndIf
	Endif
;UnregisterForUpdateGameTime()
EndEvent
EndState

State After40
Event OnUpdateGameTime()
;Debug.notification("After40 On Update")
	If  (self.GetStage() == 67)
		AliasChildClear()
		GotoState("Before40")
		Utility.wait(1.0)
		;Debug.notification("From 67 or 69 to the starting point 5")
		ResetScript.UpdateWhiterunOrcQuest()
	ElseIf self.GetStage() == 69
		AliasClear()
		GotoState("Before40")
		Utility.wait(1.0)
		;Debug.notification("From 67 or 69 to the starting point 5")
		ResetScript.UpdateWhiterunOrcQuest()
	ElseIf self.GetStage() == 70
		AliasClear()
		GotoState("Before40")
		Utility.wait(1.0)
		;Debug.notification("From 70 to the starting point 4")
		ResetScript.UpdateWhiterunOrcQuest()
	Endif
EndEvent
EndState

GlobalVariable Property BaboEventGiantOrc Auto
GlobalVariable Property BaboGlobalWhiterunOrcFuckToyTitle Auto
GlobalVariable Property BaboEventDebug Auto
GlobalVariable Property BaboDialogueSEGlobal Auto

Quest Property BaboSexController Auto
BaboSexControllerManager property BQuest Auto
GlobalVariable property BaboEventWhiterunOrcVisitorsNextVisitInterval Auto
GlobalVariable property BaboEventWhiterunOrcVisitorsTriggerEvent Auto
GlobalVariable property BaboEventOrcRevisit Auto
ReferenceAlias property Child1 Auto
ReferenceAlias property Child2 Auto
ReferenceAlias property OChild1 Auto
ReferenceAlias property OChild2 Auto
Quest Property BaboEvent Auto
Quest Property BaboDialogueWhiterun Auto
Actor property LydiaActor auto
Actorbase property StrangeOrc01 auto
Actorbase property StrangeOrc02 auto
Actorbase property StrangeOrc03 auto

Actorbase property BaboBigGuyOrcVisitor01 auto
Actorbase property BaboBigGuyOrcVisitor02 auto
Actorbase property BaboBigGuyOrcVisitor03 auto
ObjectReference property SpawnPlace auto
ObjectReference property BaboEventBreezehomeDoorRef auto
ReferenceAlias Property OrcRaper01 Auto
ReferenceAlias Property OrcRaper02 Auto
ReferenceAlias Property OrcRaper03 Auto
ReferenceAlias Property LydiaRef Auto

Scene Property OrcRapeScene01 Auto
Scene Property BaboEventWhiterunOrcVisitiorsScene01 Auto
Scene Property BaboEventWhiterunOrcVisitiorsScene02 Auto
Scene Property BaboEventWhiterunOrcVisitiorsScene03 Auto
Scene Property BaboEventWhiterunOrcVisitiorsSceneExtra Auto
Scene Property BaboEventWhiterunOrcVisitiorsSceneIntro Auto
Scene Property BaboEventWhiterunOrcVisitiorsSceneBG01 Auto
Scene Property BaboEventWhiterunOrcVisitiorsSceneBG02 Auto

Faction Property OrcRaperMild Auto
Faction Property OrcRaperHot Auto
Faction Property BaboEventWhiterunOrcVisitorsAgain Auto
SexLabFramework Property SexLab  Auto
Idle property OrgasmAfter01 auto
Scene Property Scene01 Auto
Scene Property Scene02 Auto
Actor property PlayerREF auto
Armor property Yoke auto
Armor property RopeCollar auto
Armor property AnkleChain auto
Armor property Logbit auto
Cell Property WhiterunBreezehome  Auto  
BaboMCMRestart Property ResetScript Auto
Weapon Property BaboEnchOrcishBattleaxeParalysis Auto

Formlist Property BaboWhiterunOrcVisitorsList Auto
Formlist Property BaboWhiterunBigOrcVisitorsList Auto

ObjectReference Property BaboDumpsterRef Auto

ObjectReference Property BaboEvent01XmarkerA Auto
ObjectReference Property BaboEvent01XmarkerB Auto
ObjectReference Property BaboEvent01XmarkerC Auto
ObjectReference Property BaboEvent01XmarkerD Auto; Lydia
ObjectReference Property BaboEvent01XmarkerE Auto; Child
ObjectReference Property BaboEvent01XmarkerF Auto; 
ObjectReference Property BaboWhiterunBreezehomeEntrance Auto; 
ObjectReference Property BaboDialogueWhiterunXmarker03 Auto; 

ObjectReference Property BaboEvent01EMarker Auto; Child
ObjectReference Property BaboEvent01DMarker Auto; Child
ObjectReference Property BaboWhiterunOrcsEnterTriggerRef Auto; Child

Faction Property BaboEventWhiterunOrcKidKnowFaction Auto

ReferenceAlias Property OrcRapist01Marker Auto
ReferenceAlias Property OrcRapist02Marker Auto
ReferenceAlias Property OrcRapist03Marker Auto
ReferenceAlias Property LydiaMarker Auto
ReferenceAlias Property ChildMarker Auto

