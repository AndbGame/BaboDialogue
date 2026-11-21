Scriptname BaboMsgManager extends Quest  

String file = "../BaboDialogue/BakaStrings.json"


Function BaboDiaMessagebox(int num)
String msg
	if num == 1
		msg = JsonUtil.getstringvalue(file, "babodiaquest01")
	elseif num == 2
		msg = JsonUtil.getstringvalue(file, "babodiaquest02")
	elseif num == 3
		msg = JsonUtil.getstringvalue(file, "babodiaquest03")
	endif
	Debug.messagebox(msg)
EndFunction

Function WhiterunOrcVisitMessagebox(int num)
String msg
	if num == 1
		msg = JsonUtil.getstringvalue(file, "baboeventwhiterunorcvisitiors01")
	elseif num == 2
		msg = JsonUtil.getstringvalue(file, "baboeventwhiterunorcvisitiors02")
	elseif num == 3
		msg = JsonUtil.getstringvalue(file, "baboeventwhiterunorcvisitiors03")
	elseif num == 4
		msg = JsonUtil.getstringvalue(file, "baboeventwhiterunorcvisitiors04")
	elseif num == 5
		msg = JsonUtil.getstringvalue(file, "baboeventwhiterunorcvisitiors05")
	elseif num == 6
		msg = JsonUtil.getstringvalue(file, "baboeventwhiterunorcvisitiors06")
	elseif num == 7
		msg = JsonUtil.getstringvalue(file, "baboeventwhiterunorcvisitiors07")
	elseif num == 8
		msg = JsonUtil.getstringvalue(file, "baboeventwhiterunorcvisitiors08")
	elseif num == 9
		msg = JsonUtil.getstringvalue(file, "baboeventwhiterunorcvisitiors09")
	elseif num == 10
		msg = JsonUtil.getstringvalue(file, "baboeventwhiterunorcvisitiors10")
	elseif num == 11
		msg = JsonUtil.getstringvalue(file, "baboeventwhiterunorcvisitiors11")
	elseif num == 12
		msg = JsonUtil.getstringvalue(file, "baboeventwhiterunorcvisitiors12")
	elseif num == 13
		msg = JsonUtil.getstringvalue(file, "baboeventwhiterunorcvisitiors13")
	elseif num == 14
		msg = JsonUtil.getstringvalue(file, "baboeventwhiterunorcvisitiors14")
	elseif num == 15
		msg = JsonUtil.getstringvalue(file, "baboeventwhiterunorcvisitiors15")
	elseif num == 16
		msg = JsonUtil.getstringvalue(file, "baboeventwhiterunorcvisitiors16")
	endif
	Debug.messagebox(msg)
EndFunction

Function EncounterEvent01Messagebox(int num)
String msg
	if num == 1
		msg = JsonUtil.getstringvalue(file, "baboencounterevent01_01")
	elseif num == 2
		msg = JsonUtil.getstringvalue(file, "baboencounterevent01_02")
	elseif num == 3
		msg = JsonUtil.getstringvalue(file, "baboencounterevent01_03")
	elseif num == 4
		msg = JsonUtil.getstringvalue(file, "baboencounterevent01_04")
	endif
	Debug.messagebox(msg)
EndFunction

Function EncounterEvent02Messagebox(int num)
String msg
	if num == 1
		msg = JsonUtil.getstringvalue(file, "baboencounterevent02_01")
	elseif num == 2
		msg = JsonUtil.getstringvalue(file, "baboencounterevent02_02")
	elseif num == 3
		msg = JsonUtil.getstringvalue(file, "baboencounterevent02_03")
	elseif num == 4
		msg = JsonUtil.getstringvalue(file, "baboencounterevent02_04")
	elseif num == 5
		msg = JsonUtil.getstringvalue(file, "baboencounterevent02_05")
	elseif num == 6
		msg = JsonUtil.getstringvalue(file, "baboencounterevent02_06")
	endif
	Debug.messagebox(msg)
EndFunction

Function EncounterEvent03Messagebox(int num)

String msg
	if num == 1
		msg = JsonUtil.getstringvalue(file, "baboencounterevent03_01")
	elseif num == 2
		msg = JsonUtil.getstringvalue(file, "baboencounterevent03_02")
	elseif num == 3
		msg = JsonUtil.getstringvalue(file, "baboencounterevent03_03")
	elseif num == 4
		msg = JsonUtil.getstringvalue(file, "baboencounterevent03_04");BaboEncounter03Scene01
	endif
Debug.messagebox(msg)
EndFunction

Function EncounterEvent04Messagebox(int num)

String msg
	if num == 1
		msg = JsonUtil.getstringvalue(file, "baboencounterevent04_01")
	elseif num == 2
		msg = JsonUtil.getstringvalue(file, "baboencounterevent04_02")
	elseif num == 3
		msg = JsonUtil.getstringvalue(file, "baboencounterevent04_03")
	endif
Debug.messagebox(msg)
EndFunction

Function EncounterEvent05Messagebox(int num)

String msg
	if num == 1
		msg = JsonUtil.getstringvalue(file, "baboencounterevent05_01")
	elseif num == 2
		msg = JsonUtil.getstringvalue(file, "baboencounterevent05_02")
	elseif num == 3
		msg = JsonUtil.getstringvalue(file, "baboencounterevent05_03")
	endif
Debug.messagebox(msg)
EndFunction

Function EncounterEvent06Messagebox(int num)

String msg
	if num == 1
		msg = JsonUtil.getstringvalue(file, "baboencounterevent06_01")
		Debug.notification(msg)
	elseif num == 2
		msg = JsonUtil.getstringvalue(file, "baboencounterevent06_02")
		Debug.messagebox(msg)
	elseif num == 3
		msg = JsonUtil.getstringvalue(file, "baboencounterevent06_03")
		Debug.messagebox(msg)
	elseif num == 4
		msg = JsonUtil.getstringvalue(file, "baboencounterevent06_04")
		Debug.notification(msg)
	elseif num == 5
		msg = JsonUtil.getstringvalue(file, "baboencounterevent06_05")
		Debug.notification(msg)
	elseif num == 6
		msg = JsonUtil.getstringvalue(file, "baboencounterevent06_06")
		Debug.notification(msg)
	elseif num == 7
		msg = JsonUtil.getstringvalue(file, "baboencounterevent06_07")
		Debug.notification(msg)
	elseif num == 8
		msg = JsonUtil.getstringvalue(file, "baboencounterevent06_08")
		Debug.notification(msg)
	elseif num == 9
		msg = JsonUtil.getstringvalue(file, "baboencounterevent06_09")
		Debug.messagebox(msg)
	elseif num == 10
		msg = JsonUtil.getstringvalue(file, "baboencounterevent06_10")
		Debug.messagebox(msg)
	elseif num == 11
		msg = JsonUtil.getstringvalue(file, "baboencounterevent06_11")
		Debug.messagebox(msg)
	endif
EndFunction

Function EncounterEvent06BMessagebox(int num)

String msg
	if num == 1
		msg = JsonUtil.getstringvalue(file, "baboencounterevent06B_01")
	elseif num == 2
		msg = JsonUtil.getstringvalue(file, "baboencounterevent06B_02")
	elseif num == 3
		msg = JsonUtil.getstringvalue(file, "baboencounterevent06B_03")
	elseif num == 4
		msg = JsonUtil.getstringvalue(file, "baboencounterevent06B_04")
	elseif num == 5
		msg = JsonUtil.getstringvalue(file, "baboencounterevent06B_05")
	elseif num == 6
		msg = JsonUtil.getstringvalue(file, "baboencounterevent06B_06")
	elseif num == 7
		msg = JsonUtil.getstringvalue(file, "baboencounterevent06B_07")
	elseif num == 8
		msg = JsonUtil.getstringvalue(file, "baboencounterevent06B_08")
	elseif num == 9
		msg = JsonUtil.getstringvalue(file, "baboencounterevent06B_09")
	elseif num == 10
		msg = JsonUtil.getstringvalue(file, "baboencounterevent06B_10")
	elseif num == 11
		msg = JsonUtil.getstringvalue(file, "baboencounterevent06B_11")
	elseif num == 12
		msg = JsonUtil.getstringvalue(file, "baboencounterevent06B_12")
	elseif num == 13
		msg = JsonUtil.getstringvalue(file, "baboencounterevent06B_13")
	elseif num == 14
		msg = JsonUtil.getstringvalue(file, "baboencounterevent06B_14")
	endif
	Debug.messagebox(msg)
EndFunction


Function EncounterEvent07Messagebox(int num)

String msg
	if num == 1
		msg = JsonUtil.getstringvalue(file, "baboencounterevent07_01")
		Debug.messagebox(msg)
	elseif num == 2
		msg = JsonUtil.getstringvalue(file, "baboencounterevent07_02")
		Debug.messagebox(msg)
	elseif num == 3
		msg = JsonUtil.getstringvalue(file, "baboencounterevent07_03")
		Debug.messagebox(msg)
	elseif num == 4
		msg = JsonUtil.getstringvalue(file, "baboencounterevent07_04")
		Debug.messagebox(msg)
	elseif num == 5
		msg = JsonUtil.getstringvalue(file, "baboencounterevent07_05")
		Debug.messagebox(msg)
	elseif num == 6
		msg = JsonUtil.getstringvalue(file, "baboencounterevent07_06")
		Debug.messagebox(msg)
	elseif num == 7
		msg = JsonUtil.getstringvalue(file, "baboencounterevent07_07")
		Debug.messagebox(msg)
	elseif num == 8
		msg = JsonUtil.getstringvalue(file, "baboencounterevent07_08")
		Debug.messagebox(msg)
	endif
EndFunction

Function EncounterEvent08Messagebox(int num)

String msg
	if num == 1
		msg = JsonUtil.getstringvalue(file, "baboencounterevent08_01")
		Debug.messagebox(msg)
	elseif num == 2
		msg = JsonUtil.getstringvalue(file, "baboencounterevent08_02")
		Debug.notification(msg)
	endif
EndFunction

Function EncounterEvent09Messagebox(int num)

String msg
	if num == 1
		msg = JsonUtil.getstringvalue(file, "baboencounterevent09_01")
	elseif num == 2
		msg = JsonUtil.getstringvalue(file, "baboencounterevent09_02")
	elseif num == 3
		msg = JsonUtil.getstringvalue(file, "baboencounterevent09_03")
	elseif num == 4
		msg = JsonUtil.getstringvalue(file, "baboencounterevent09_04")
	elseif num == 5
		msg = JsonUtil.getstringvalue(file, "baboencounterevent09_05")
	elseif num == 6
		msg = JsonUtil.getstringvalue(file, "baboencounterevent09_06")
	endif
	Debug.messagebox(msg)
EndFunction

Function EncounterEvent10Messagebox(int num)

String msg
	if num == 1
		msg = JsonUtil.getstringvalue(file, "baboencounterevent10_01")
		Debug.messagebox(msg)
	elseif num == 2
		msg = JsonUtil.getstringvalue(file, "baboencounterevent10_02")
		Debug.notification(msg)
	endif
EndFunction

Function EncounterEvent11Messagebox(int num)

String msg
	if num == 1
		msg = JsonUtil.getstringvalue(file, "baboencounterevent11_01")
	elseif num == 2
		msg = JsonUtil.getstringvalue(file, "baboencounterevent11_02")
	endif
Debug.messagebox(msg)
EndFunction

Function EncounterEvent12Messagebox(int num)

String msg
	if num == 1
		msg = JsonUtil.getstringvalue(file, "baboencounterevent12_01")
	elseif num == 2
		msg = JsonUtil.getstringvalue(file, "baboencounterevent12_02")
	elseif num == 3
		msg = JsonUtil.getstringvalue(file, "baboencounterevent12_03")
		Debug.notification(msg)
		return
	elseif num == 4
		msg = JsonUtil.getstringvalue(file, "baboencounterevent12_04")
	elseif num == 5
		msg = JsonUtil.getstringvalue(file, "baboencounterevent12_05")
	elseif num == 6
		msg = JsonUtil.getstringvalue(file, "baboencounterevent12_06")
	endif
	Debug.messagebox(msg)
EndFunction

Function EncounterEvent13Messagebox(int num)

String msg
	if num == 1
		msg = JsonUtil.getstringvalue(file, "baboencounterevent13_01")
	elseif num == 2
		msg = JsonUtil.getstringvalue(file, "baboencounterevent13_02")
	elseif num == 3
		msg = JsonUtil.getstringvalue(file, "baboencounterevent13_03")
	endif
Debug.messagebox(msg)
EndFunction

Function ChangeLocationEvent01Messagebox(int num)

String msg
	if num == 1
		msg = JsonUtil.getstringvalue(file, "BaboChangeLocationEvent01_01")
	elseif num == 2
		msg = JsonUtil.getstringvalue(file, "BaboChangeLocationEvent01_02")
	elseif num == 3
		msg = JsonUtil.getstringvalue(file, "BaboChangeLocationEvent01_03")
	elseif num == 4
		msg = JsonUtil.getstringvalue(file, "BaboChangeLocationEvent01_04")
	elseif num == 5
		msg = JsonUtil.getstringvalue(file, "BaboChangeLocationEvent01_05")
	elseif num == 6
		msg = JsonUtil.getstringvalue(file, "BaboChangeLocationEvent01_06")
	elseif num == 7
		msg = JsonUtil.getstringvalue(file, "BaboChangeLocationEvent01_07")
	elseif num == 8
		msg = JsonUtil.getstringvalue(file, "BaboChangeLocationEvent01_08")
	elseif num == 9
		msg = JsonUtil.getstringvalue(file, "BaboChangeLocationEvent01_09")
	endif
	Debug.messagebox(msg)
EndFunction

Function ChangeLocationEvent02Messagebox(int num)

String msg
	if num == 1
		msg = JsonUtil.getstringvalue(file, "BaboChangeLocationEvent02_01")
	elseif num == 2	
		msg = JsonUtil.getstringvalue(file, "BaboChangeLocationEvent02_02")
	elseif num == 3
		msg = JsonUtil.getstringvalue(file, "BaboChangeLocationEvent02_03")
	elseif num == 4
		msg = JsonUtil.getstringvalue(file, "BaboChangeLocationEvent02_04")
	elseif num == 5
		msg = JsonUtil.getstringvalue(file, "BaboChangeLocationEvent02_05")
	elseif num == 6
		msg = JsonUtil.getstringvalue(file, "BaboChangeLocationEvent02_06")
	elseif num == 7
		msg = JsonUtil.getstringvalue(file, "BaboChangeLocationEvent02_07")
	elseif num == 8
		msg = JsonUtil.getstringvalue(file, "BaboChangeLocationEvent02_08")
	elseif num == 9
		msg = JsonUtil.getstringvalue(file, "BaboChangeLocationEvent02_09")
	elseif num == 10
		msg = JsonUtil.getstringvalue(file, "BaboChangeLocationEvent02_10")
	elseif num == 11
		msg = JsonUtil.getstringvalue(file, "BaboChangeLocationEvent02_11")
	elseif num == 12
		msg = JsonUtil.getstringvalue(file, "BaboChangeLocationEvent02_12")
	endif
	Debug.messagebox(msg)
EndFunction

Function ChangeLocationEvent03Messagebox(int num)

String msg
	if num == 1
		msg = JsonUtil.getstringvalue(file, "BaboChangeLocationEvent03_01")
	elseif num == 2
		msg = JsonUtil.getstringvalue(file, "BaboChangeLocationEvent03_02")
	elseif num == 3
		msg = JsonUtil.getstringvalue(file, "BaboChangeLocationEvent03_03")
	elseif num == 4
		msg = JsonUtil.getstringvalue(file, "BaboChangeLocationEvent03_04")
	elseif num == 5
		msg = JsonUtil.getstringvalue(file, "BaboChangeLocationEvent03_05")
	elseif num == 6
		msg = JsonUtil.getstringvalue(file, "BaboChangeLocationEvent03_06")
	elseif num == 7
		msg = JsonUtil.getstringvalue(file, "BaboChangeLocationEvent03_07")
	endif
		Debug.messagebox(msg)
EndFunction

Function ChangeLocationEvent04Messagebox(int num)

String msg
	if num == 1
		msg = JsonUtil.getstringvalue(file, "BaboChangeLocationEvent04_01")
	elseif num == 2
		msg = JsonUtil.getstringvalue(file, "BaboChangeLocationEvent04_02")
	else
		msg = JsonUtil.getstringvalue(file, "BaboChangeLocationEvent04_00")
	endif
	Debug.messagebox(msg)
EndFunction

Function ChangeLocationEvent05Messagebox(int num)
String msg
	if num == 1
		msg = JsonUtil.getstringvalue(file, "BaboChangeLocationEvent05_01")
	elseif num == 2
		msg = JsonUtil.getstringvalue(file, "BaboChangeLocationEvent05_02")
	endif
	Debug.messagebox(msg)
EndFunction

Function ChangeLocationEvent06Messagebox(int num)
String msg
	if num == 1
		msg = JsonUtil.getstringvalue(file, "babochangelocationevent06_01")
		Debug.notification(msg)
	elseif num == 2
		msg = JsonUtil.getstringvalue(file, "babochangelocationevent06_02")
		Debug.messagebox(msg)
	elseif num == 3
		msg = JsonUtil.getstringvalue(file, "babochangelocationevent06_03")
		Debug.notification(msg)
	elseif num == 4
		msg = JsonUtil.getstringvalue(file, "babochangelocationevent06_04")
		Debug.messagebox(msg)
	endif
EndFunction

Function ChangeLocationEvent07Messagebox(int num)
String msg
	if num == 1
		msg = JsonUtil.getstringvalue(file, "babochangelocationevent07_01")
		Debug.notification(msg)
	elseif num == 2
		msg = JsonUtil.getstringvalue(file, "babochangelocationevent07_02")
		Debug.messagebox(msg)
	elseif num == 3
		msg = JsonUtil.getstringvalue(file, "babochangelocationevent07_03")
		Debug.messagebox(msg)
	elseif num == 4
		msg = JsonUtil.getstringvalue(file, "babochangelocationevent07_04")
		Debug.messagebox(msg)
	elseif num == 5
		msg = JsonUtil.getstringvalue(file, "babochangelocationevent07_05")
		Debug.messagebox(msg)
	elseif num == 6
		msg = JsonUtil.getstringvalue(file, "babochangelocationevent07_06")
		Debug.messagebox(msg)
	elseif num == 7
		msg = JsonUtil.getstringvalue(file, "babochangelocationevent07_07")
		Debug.messagebox(msg)
	endif
EndFunction

Function ChangeLocationEvent08Messagebox(int num)
String msg
	if num == 1
		msg = JsonUtil.getstringvalue(file, "babochangelocationevent08_01")
		Debug.messagebox(msg)
	elseif num == 2
		msg = JsonUtil.getstringvalue(file, "babochangelocationevent08_02")
		Debug.messagebox(msg)
	elseif num == 3
		msg = JsonUtil.getstringvalue(file, "babochangelocationevent08_03")
		Debug.messagebox(msg)
	elseif num == 4
		msg = JsonUtil.getstringvalue(file, "babochangelocationevent08_04")
		Debug.messagebox(msg)
	elseif num == 5
		msg = JsonUtil.getstringvalue(file, "babochangelocationevent08_05")
		Debug.messagebox(msg)
	elseif num == 6
		msg = JsonUtil.getstringvalue(file, "babochangelocationevent08_06")
		Debug.messagebox(msg)
	elseif num == 7
		msg = JsonUtil.getstringvalue(file, "babochangelocationevent08_07")
		Debug.messagebox(msg)
	elseif num == 8
		msg = JsonUtil.getstringvalue(file, "babochangelocationevent08_08")
		Debug.messagebox(msg)
	elseif num == 9
		msg = JsonUtil.getstringvalue(file, "babochangelocationevent08_09")
		Debug.messagebox(msg)
	elseif num == 10
		msg = JsonUtil.getstringvalue(file, "babochangelocationevent08_10")
		Debug.messagebox(msg)
	elseif num == 11
		msg = JsonUtil.getstringvalue(file, "babochangelocationevent08_11")
		Debug.messagebox(msg)
	endif
EndFunction

Function HiddenPocketMessagebox(int num)
String msg
	if num == 1
		msg = JsonUtil.getstringvalue(file, "babohiddenpocket_01")
		Debug.notification(msg)
	elseif num == 2
		msg = JsonUtil.getstringvalue(file, "babohiddenpocket_02")
		Debug.notification(msg)
	elseif num == 3
		msg = JsonUtil.getstringvalue(file, "babohiddenpocket_03")
		Debug.notification(msg)
	endif
EndFunction

Function KidnapEvent01Messagebox(int num)
String msg
	if num == 1
		msg = JsonUtil.getstringvalue(file, "babokidnapevent01_01")
	elseif num == 2
		msg = JsonUtil.getstringvalue(file, "babokidnapevent01_02")
	elseif num == 3
		msg = JsonUtil.getstringvalue(file, "babokidnapevent01_03")
		Debug.notification(msg)
		return
	elseif num == 4
		msg = JsonUtil.getstringvalue(file, "babokidnapevent01_04")
	elseif num == 5
		msg = JsonUtil.getstringvalue(file, "babokidnapevent01_05")
	elseif num == 6
		msg = JsonUtil.getstringvalue(file, "babokidnapevent01_06")
	elseif num == 7
		msg = JsonUtil.getstringvalue(file, "babokidnapevent01_07")
	elseif num == 8
		msg = JsonUtil.getstringvalue(file, "babokidnapevent01_08")
	elseif num == 9
		msg = JsonUtil.getstringvalue(file, "babokidnapevent01_09")
	elseif num == 10
		msg = JsonUtil.getstringvalue(file, "babokidnapevent01_10")
	elseif num == 11
		msg = JsonUtil.getstringvalue(file, "babokidnapevent01_11")
	elseif num == 12
		msg = JsonUtil.getstringvalue(file, "babokidnapevent01_12")
	elseif num == 13
		msg = JsonUtil.getstringvalue(file, "babokidnapevent01_13")
	elseif num == 14
		msg = JsonUtil.getstringvalue(file, "babokidnapevent01_14")
	elseif num == 15
		msg = JsonUtil.getstringvalue(file, "babokidnapevent01_15")
	elseif num == 16
		msg = JsonUtil.getstringvalue(file, "babokidnapevent01_16")
		Debug.notification(msg)
		return
	elseif num == 17
		msg = JsonUtil.getstringvalue(file, "babokidnapevent01_17")
	elseif num == 18
		msg = JsonUtil.getstringvalue(file, "babokidnapevent01_18")
	endif
	Debug.messagebox(msg)
EndFunction

Function AnimalCareEventMessagebox(int num)
String msg
	if num == 1
		msg = JsonUtil.getstringvalue(file, "baboanimalcareevent01_01")
	elseif num == 2
		msg = JsonUtil.getstringvalue(file, "baboanimalcareevent01_02")
	elseif num == 3
		msg = JsonUtil.getstringvalue(file, "baboanimalcareevent01_03")
	elseif num == 4
		msg = JsonUtil.getstringvalue(file, "baboanimalcareevent01_04")
	elseif num == 5
		msg = JsonUtil.getstringvalue(file, "baboanimalcareevent01_05")
	elseif num == 6
		msg = JsonUtil.getstringvalue(file, "baboanimalcareevent01_06")
	elseif num == 7
		msg = JsonUtil.getstringvalue(file, "baboanimalcareevent01_07")
	elseif num == 8
		msg = JsonUtil.getstringvalue(file, "baboanimalcareevent01_08")
	elseif num == 9
		msg = JsonUtil.getstringvalue(file, "baboanimalcareevent01_09")
	endif
	Debug.messagebox(msg)
EndFunction

Function AnimalCareMarkarthEventMessagebox(int num)
String msg
	if num == 1
		msg = JsonUtil.getstringvalue(file, "baboanimalcaremarkarthevent_1")
	elseif num == 2
		msg = JsonUtil.getstringvalue(file, "baboanimalcaremarkarthevent_2")
	elseif num == 3
		msg = JsonUtil.getstringvalue(file, "baboanimalcaremarkarthevent_3")
	elseif num == 4
		msg = JsonUtil.getstringvalue(file, "baboanimalcaremarkarthevent_4")
	elseif num == 5
		msg = JsonUtil.getstringvalue(file, "baboanimalcaremarkarthevent_5")
	elseif num == 6
		msg = JsonUtil.getstringvalue(file, "baboanimalcaremarkarthevent_6")
	elseif num == 7
		msg = JsonUtil.getstringvalue(file, "baboanimalcaremarkarthevent_7")
	elseif num == 8
		msg = JsonUtil.getstringvalue(file, "baboanimalcaremarkarthevent_8")
	elseif num == 9
		msg = JsonUtil.getstringvalue(file, "baboanimalcaremarkarthevent_9")
	elseif num == 10
		msg = JsonUtil.getstringvalue(file, "baboanimalcaremarkarthevent_10")
	elseif num == 11
		msg = JsonUtil.getstringvalue(file, "baboanimalcaremarkarthevent_11")
	elseif num == 12
		msg = JsonUtil.getstringvalue(file, "baboanimalcaremarkarthevent_12")
	elseif num == 13
		msg = JsonUtil.getstringvalue(file, "baboanimalcaremarkarthevent_13")
	elseif num == 14
		msg = JsonUtil.getstringvalue(file, "baboanimalcaremarkarthevent_14")
	elseif num == 15
		msg = JsonUtil.getstringvalue(file, "baboanimalcaremarkarthevent_15")
	elseif num == 16
		msg = JsonUtil.getstringvalue(file, "baboanimalcaremarkarthevent_16")
	elseif num == 17
		msg = JsonUtil.getstringvalue(file, "baboanimalcaremarkarthevent_17")
	elseif num == 18
		msg = JsonUtil.getstringvalue(file, "baboanimalcaremarkarthevent_18")
	elseif num == 19
		msg = JsonUtil.getstringvalue(file, "baboanimalcaremarkarthevent_19")
	elseif num == 20
		msg = JsonUtil.getstringvalue(file, "baboanimalcaremarkarthevent_20")
	elseif num == 21
		msg = JsonUtil.getstringvalue(file, "baboanimalcaremarkarthevent_21")
	endif
	Debug.messagebox(msg)
EndFunction

Function WindhelmNewgnisisMessagebox(int num)
String msg
	if num == 1
		msg = JsonUtil.getstringvalue(file, "baboeventnewgnisismasterscript_1")
	elseif num == 2
		msg = JsonUtil.getstringvalue(file, "baboeventnewgnisismasterscript_2")
	elseif num == 3
		msg = JsonUtil.getstringvalue(file, "baboeventnewgnisismasterscript_3")
	elseif num == 4
		msg = JsonUtil.getstringvalue(file, "baboeventnewgnisismasterscript_4")
	elseif num == 5
		msg = JsonUtil.getstringvalue(file, "baboeventnewgnisismasterscript_5")
	elseif num == 6
		msg = JsonUtil.getstringvalue(file, "baboeventnewgnisismasterscript_6")
	elseif num == 7
		msg = JsonUtil.getstringvalue(file, "baboeventnewgnisismasterscript_7")
	elseif num == 8
		msg = JsonUtil.getstringvalue(file, "baboeventnewgnisismasterscript_8")
	elseif num == 9
		msg = JsonUtil.getstringvalue(file, "baboeventnewgnisismasterscript_9")
	elseif num == 10
		msg = JsonUtil.getstringvalue(file, "baboeventnewgnisismasterscript_10")
	endif
	Debug.messagebox(msg)
EndFunction

Function BadRieklingDuelMessagebox(int num)
String msg
	if num == 1
		msg = JsonUtil.getstringvalue(file, "baborieklingduel01_1")
	elseif num == 2
		msg = JsonUtil.getstringvalue(file, "baborieklingduel01_2")
	elseif num == 3
		msg = JsonUtil.getstringvalue(file, "baborieklingduel01_3")
	elseif num == 4
		msg = JsonUtil.getstringvalue(file, "baborieklingduel01_4")
	elseif num == 5
		msg = JsonUtil.getstringvalue(file, "baborieklingduel01_5")
	elseif num == 6
		msg = JsonUtil.getstringvalue(file, "baborieklingduel01_6")
	elseif num == 7
		msg = JsonUtil.getstringvalue(file, "baborieklingduel01_7")
	elseif num == 8
		msg = JsonUtil.getstringvalue(file, "baborieklingduel01_8")
	elseif num == 9
		msg = JsonUtil.getstringvalue(file, "baborieklingduel01_9")
	elseif num == 10
		msg = JsonUtil.getstringvalue(file, "baborieklingduel01_10")
	elseif num == 11
		msg = JsonUtil.getstringvalue(file, "baborieklingduel01_11")
	elseif num == 12
		msg = JsonUtil.getstringvalue(file, "baborieklingduel01_12")
	elseif num == 13
		msg = JsonUtil.getstringvalue(file, "baborieklingduel01_13")
	elseif num == 14
		msg = JsonUtil.getstringvalue(file, "baborieklingduel01_14")
	elseif num == 15
		msg = JsonUtil.getstringvalue(file, "baborieklingduel01_15")
	elseif num == 16
		msg = JsonUtil.getstringvalue(file, "baborieklingduel01_16")
	elseif num == 17
		msg = JsonUtil.getstringvalue(file, "baborieklingduel01_17")
	elseif num == 18
		msg = JsonUtil.getstringvalue(file, "baborieklingduel01_18")
	elseif num == 19
		msg = JsonUtil.getstringvalue(file, "baborieklingduel01_19")
	elseif num == 20
		msg = JsonUtil.getstringvalue(file, "baborieklingduel01_20")
	elseif num == 21
		msg = JsonUtil.getstringvalue(file, "baborieklingduel01_21")
	elseif num == 22
		msg = JsonUtil.getstringvalue(file, "baborieklingduel01_22")
	elseif num == 23
		msg = JsonUtil.getstringvalue(file, "baborieklingduel01_23")
	elseif num == 24
		msg = JsonUtil.getstringvalue(file, "baborieklingduel01_24")
	elseif num == 25
		msg = JsonUtil.getstringvalue(file, "baborieklingduel01_25")
	elseif num == 26
		msg = JsonUtil.getstringvalue(file, "baborieklingduel01_26")
	elseif num == 27
		msg = JsonUtil.getstringvalue(file, "baborieklingduel01_27")
	elseif num == 28
		msg = JsonUtil.getstringvalue(file, "baborieklingduel01_28")
	elseif num == 29
		msg = JsonUtil.getstringvalue(file, "baborieklingduel01_29")
	endif
	Debug.messagebox(msg)
EndFunction

Function RieklingSlaveryEventMessagebox(int num)
String msg
	if num == 1
		msg = JsonUtil.getstringvalue(file, "baboslaveryevent_riekling_1")
	elseif num == 2
		msg = JsonUtil.getstringvalue(file, "baboslaveryevent_riekling_2")
	elseif num == 3
		msg = JsonUtil.getstringvalue(file, "baboslaveryevent_riekling_3")
	elseif num == 4
		msg = JsonUtil.getstringvalue(file, "baboslaveryevent_riekling_4")
	elseif num == 5
		msg = JsonUtil.getstringvalue(file, "baboslaveryevent_riekling_5")
	elseif num == 6
		msg = JsonUtil.getstringvalue(file, "baboslaveryevent_riekling_6")
	elseif num == 7
		msg = JsonUtil.getstringvalue(file, "baboslaveryevent_riekling_7")
	elseif num == 8
		msg = JsonUtil.getstringvalue(file, "baboslaveryevent_riekling_8")
	elseif num == 9
		msg = JsonUtil.getstringvalue(file, "baboslaveryevent_riekling_9")
	elseif num == 10
		msg = JsonUtil.getstringvalue(file, "baboslaveryevent_riekling_10")
	elseif num == 11
		msg = JsonUtil.getstringvalue(file, "baboslaveryevent_riekling_11")
	elseif num == 12
		msg = JsonUtil.getstringvalue(file, "baboslaveryevent_riekling_12")
	elseif num == 13
		msg = JsonUtil.getstringvalue(file, "baboslaveryevent_riekling_13")
	elseif num == 14
		msg = JsonUtil.getstringvalue(file, "baboslaveryevent_riekling_14")
	elseif num == 15
		msg = JsonUtil.getstringvalue(file, "baboslaveryevent_riekling_15")
	elseif num == 16
		msg = JsonUtil.getstringvalue(file, "baboslaveryevent_riekling_16")
	elseif num == 17
		msg = JsonUtil.getstringvalue(file, "baboslaveryevent_riekling_17")
	elseif num == 18
		msg = JsonUtil.getstringvalue(file, "baboslaveryevent_riekling_18")
	elseif num == 19
		msg = JsonUtil.getstringvalue(file, "baboslaveryevent_riekling_19")
	elseif num == 20
		msg = JsonUtil.getstringvalue(file, "baboslaveryevent_riekling_20")
	elseif num == 21
		msg = JsonUtil.getstringvalue(file, "baboslaveryevent_riekling_21")
	elseif num == 22
		msg = JsonUtil.getstringvalue(file, "baboslaveryevent_riekling_22")
	endif
	Debug.messagebox(msg)
EndFunction

Function BadLoanSharkMessagebox(int num)
String msg
	if num == 1
		msg = JsonUtil.getstringvalue(file, "baboloanshark_1")
	elseif num == 2
		msg = JsonUtil.getstringvalue(file, "baboloanshark_2")
	elseif num == 3
		msg = JsonUtil.getstringvalue(file, "baboloanshark_3")
	elseif num == 4
		msg = JsonUtil.getstringvalue(file, "baboloanshark_4")
	elseif num == 5
		msg = JsonUtil.getstringvalue(file, "baboloanshark_5")
	elseif num == 6
		msg = JsonUtil.getstringvalue(file, "baboloanshark_6")
	elseif num == 7
		msg = JsonUtil.getstringvalue(file, "baboloanshark_7")
	elseif num == 8
		msg = JsonUtil.getstringvalue(file, "baboloanshark_8")
	elseif num == 9
		msg = JsonUtil.getstringvalue(file, "baboloanshark_9")
	elseif num == 10
		msg = JsonUtil.getstringvalue(file, "baboloanshark_10")
	elseif num == 11
		msg = JsonUtil.getstringvalue(file, "baboloanshark_11")
	elseif num == 12
		msg = JsonUtil.getstringvalue(file, "baboloanshark_12")
	elseif num == 13
		msg = JsonUtil.getstringvalue(file, "baboloanshark_13")
	elseif num == 14
		msg = JsonUtil.getstringvalue(file, "baboloanshark_14")
	elseif num == 15
		msg = JsonUtil.getstringvalue(file, "baboloanshark_15")
	elseif num == 16
		msg = JsonUtil.getstringvalue(file, "baboloanshark_16")
	endif
	Debug.messagebox(msg)
EndFunction

Function BadEndMessagebox(int num)
String msg
	if num == 1
		msg = JsonUtil.getstringvalue(file, "babobadend01")
		Debug.notification(msg)
	elseif num == 2
		msg = JsonUtil.getstringvalue(file, "babobadend02")
		Debug.notification(msg)
	elseif num == 3
		msg = JsonUtil.getstringvalue(file, "babobadend03")
		Debug.notification(msg)
	elseif num == 4
		msg = JsonUtil.getstringvalue(file, "babobadend04")
		Debug.notification(msg)
	elseif num == 5
		msg = JsonUtil.getstringvalue(file, "babobadend05")
		Debug.notification(msg)
	elseif num == 6
		msg = JsonUtil.getstringvalue(file, "babobadend06")
		Debug.notification(msg)
	elseif num == 7
		msg = JsonUtil.getstringvalue(file, "babobadend07")
		Debug.notification(msg)
	elseif num == 8
		msg = JsonUtil.getstringvalue(file, "babobadend08")
		Debug.notification(msg)
	elseif num == 9
		msg = JsonUtil.getstringvalue(file, "babobadend09")
		Debug.messagebox(msg)
	elseif num == 10
		msg = JsonUtil.getstringvalue(file, "babobadend10")
		Debug.messagebox(msg)
	endif
EndFunction