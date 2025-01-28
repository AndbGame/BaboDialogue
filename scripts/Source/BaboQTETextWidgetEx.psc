Scriptname BaboQTETextWidgetEx extends BaboDialoguewidgetmanager  

bool Property IsSuccess Auto
bool Property IsFail Auto

string _qteMessage
string _resultMessage
int[] _commandList
int _currentPos
string[] _characterTypeArray

Function InitializeWidgets()
	IsSuccess = false
	IsFail = false
	Visible = false
	FontName = "$EverywhereMediumFont"
	FontSize = MCM.BaboQTEFontSize as int
	HAnchor = MCM.BaboQTEHAnchor
	VAnchor = MCM.BaboQTEVAnchor
	OffsetX = MCM.BaboQTEOffsetX
	OffsetY = MCM.BaboQTEOffsetY
	TextAlignment = MCM.BaboQTEHAnchor
	int n = TextWidgets.Length
	int i = 0
	while i < n
		TextWidgets[i].Text = " "
		TextWidgets[i].Color = 0xffffff
		TextWidgets[i].FontSize = MCM.BaboQTEFontSize as int
		TextWidgets[i].HAnchor = MCM.BaboQTEHAnchor
		TextWidgets[i].VAnchor = MCM.BaboQTEVAnchor
		TextWidgets[i].TextAlignment = MCM.BaboQTEHAnchor
		i += 1
	endWhile
	UpdatePosition()
EndFunction

Function UpdateWidgets()
	if !WidgetsInitialized;Temporary removal for test
		return
	endif

	if IsFail
		TextWidgets[1].Text = ""
		TextWidgets[0].Text = _resultMessage
	else
		TextWidgets[0].Text = _qteMessage
		if IsSuccess
			TextWidgets[1].Text = ""
		else
			TextWidgets[1].Text = GetCommandString()
		endif
	endif

	if !Visible
		Visible = true
	endif
EndFunction

Function SetParameter(string msg, float difficulty)
	IsSuccess = false
	_qteMessage = msg
	;Debug.Notification("SetParameter" + msg)
	int n = (difficulty * Utility.RandomFloat(1.0, 1.2) + 0.5) as int
	_currentPos = 0
	_commandList = sztkUtil.RandomIntArray(n, 0, 3)

	RegisterForKey(279) ; Y
	RegisterForKey(276) ; A
	RegisterForKey(278) ; X
	RegisterForKey(277) ; B
	RegisterForKey(266) ; DPAD_UP
	RegisterForKey(267) ; DPAD_DOWN
	RegisterForKey(268) ; DPAD_LEFT
	RegisterForKey(269) ; DPAD_RIGHT
	RegisterForKey(MCM.BaboQTECustomKeyUp)
	RegisterForKey(MCM.BaboQTECustomKeyDown)
	RegisterForKey(MCM.BaboQTECustomKeyLeft)
	RegisterForKey(MCM.BaboQTECustomKeyRight)
EndFunction

Function SetResultMessage(string resultMsg)
	UnregisterForAllKeys()
	IsFail = true
	_resultMessage = resultMsg
	TextWidgets[1].Text = ""
	TextWidgets[0].Text = resultMsg
	UpdateWidgetsAsync()
EndFunction

string Function GetCommandString()
	string ret = ""
	_characterTypeArray = MCM.GetCharacterTypeArray()

	int n = _commandList.Length
	int i = _currentPos
	while i < n
		ret += _characterTypeArray[_commandList[i]]
		i += 1
	endWhile

	return ret
EndFunction

int Function GetDirection(int keyCode)
	int dir = 0
	if keyCode == 279 || keyCode == 266 || keyCode == MCM.BaboQTECustomKeyUp
		dir = 0
	elseif keyCode == 276 || keyCode == 267 || keyCode == MCM.BaboQTECustomKeyDown
		dir = 1
	elseif keyCode == 278 || keyCode == 268 || keyCode == MCM.BaboQTECustomKeyLeft
		dir = 2
	else
		dir = 3
	endif
	return dir
EndFunction

Event OnKeyDown(int keyCode)
	if IsSuccess || IsFail
		return
	endif

	int dir = GetDirection(keyCode)

	if _commandList[_currentPos] == dir
		_currentPos += 1
		if _currentPos == _commandList.Length
			IsSuccess = true
			;Debug.Notification("IsSuccess")
		endif
	else
		_currentPos = 0
	endif

	UpdateWidgetsAsync()
EndEvent

int Function GetInputCount()
	return _currentPos
EndFunction