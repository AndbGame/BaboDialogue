Scriptname BaboGuardJail01 extends Quest  Conditional

LocationAlias Property myLocation Auto

Scene Property BaboGuardGreeting Auto

Scene Property BaboGuardStory Auto

Int Property ServerGreeted Auto Hidden Conditional		;used to control behavior of Server aliases asking the player if he wants anything
int Property PlayerSatDown Auto Hidden Conditional		;used to control behavior of Server aliases asking the player if he wants anything


Function PlayerSatDown()

	if ServerGreeted == 0

		PlayerSatDown = 1
		BaboGuardStory.start()

	Endif
EndFunction

Function PlayerChangedLocation()
	if Game.GetPlayer().IsInLocation(myLocation.GetLocation()) == False
	debug.trace(" BaboGuardJail01 player left jail, stopping quest.")
		
		stop()
	
	EndIf

EndFunction


Function PlayerGetinLocation()
	if Game.GetPlayer().IsInLocation(myLocation.GetLocation()) == True
	debug.trace(" BaboGuardJail01 player left jail, stopping quest.")
		
		BaboGuardGreeting.start()
	
	EndIf

EndFunction