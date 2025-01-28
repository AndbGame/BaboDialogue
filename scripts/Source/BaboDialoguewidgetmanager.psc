Scriptname BaboDialoguewidgetmanager extends Quest

BaboDialogueConfigMenu Property MCM Auto
BaboQTETextWidget[] Property TextWidgets Auto

bool _isReady
bool _requestDuringUpdate

bool Property WidgetsInitialized Auto
string Property Name Auto

string _fontName
string Property FontName
	string Function Get()
		return _fontName
	EndFunction

	Function Set(string value)
		if _fontName != value
			_fontName = value
			if _isReady
				int n = TextWidgets.Length
				int i = 0
				while i < n
					TextWidgets[i].FontName = value
					i += 1
				endWhile
			endif
		endif
	EndFunction
EndProperty

int _fontSize
int Property FontSize
	int Function Get()
		return _fontSize
	EndFunction

	Function Set(int value)
		if _fontSize != value
			_fontSize = value
			if _isReady
				int n = TextWidgets.Length
				int i = 0
				while i < n
					TextWidgets[i].FontSize = value
					i += 1
				endWhile
				UpdatePosition()
			endif
		endif
	EndFunction
EndProperty

bool _visible
bool Property Visible
	bool Function Get()
		return _visible
	EndFunction

	Function Set(bool value)
		if _visible != value
			_visible = value
			if _isReady
				int n = TextWidgets.Length
				int i = 0
				while i < n
					TextWidgets[i].Visible = value
					i += 1
				endWhile
			endif
		endif
	EndFunction
EndProperty

string _textAlignment
string Property TextAlignment
	string Function Get()
		return _textAlignment
	EndFunction

	Function Set(string value)
		if _textAlignment != value
			_textAlignment = value
			if _isReady
				int n = TextWidgets.Length
				int i = 0
				while i < n
					TextWidgets[i].TextAlignment = value
					i += 1
				endWhile
			endif
		endif
	EndFunction
EndProperty

string _hAnchor
string Property HAnchor
	string Function Get()
		return _hAnchor
	EndFunction

	Function Set(string value)
		if _hAnchor != value
			_hAnchor = value
			if _isReady
				int n = TextWidgets.Length
				int i = 0
				while i < n
					TextWidgets[i].HAnchor = value
					i += 1
				endWhile
				UpdatePosition()
			endif
		endif
	EndFunction
EndProperty

string _vAnchor
string Property VAnchor
	string Function Get()
		return _vAnchor
	EndFunction

	Function Set(string value)
		if _vAnchor != value
			_vAnchor = value
			if _isReady
				int n = TextWidgets.Length
				int i = 0
				while i < n
					TextWidgets[i].VAnchor = value
					i += 1
				endWhile
				UpdatePosition()
			endif
		endif
	EndFunction
EndProperty

float _offsetX
float Property OffsetX
	float Function Get()
		return _offsetX
	EndFunction

	Function Set(float value)
		if _offsetX != value
			_offsetX = value
			UpdatePosition()
		endif
	EndFunction
EndProperty

float _offsetY
float Property OffsetY
	float Function Get()
		return _offsetY
	EndFunction

	Function Set(float value)
		if _offsetY != value
			_offsetY = value
			UpdatePosition()
		endif
	EndFunction
EndProperty

Event OnInit()
	WidgetsInitialized = false
	_isReady = false
	while !IsReady()
		Debug.Trace("[_TNTR] WidgetManager OnInit: not ready")
		Utility.Wait(1.0)
	endWhile
	_isReady = true
	InitializeWidgets()
	WidgetsInitialized = true
	RegisterForModEvent("_TNTR_UpdateWidgets" + Name, "OnUpdateWidgets")
EndEvent

Event OnUpdateWidgets()
	;Debug.notification("OnUpdateWidgets")
	GoToState("Busy")
	UpdateWidgets()
	if _requestDuringUpdate
		UpdateWidgetsAsync()
		_requestDuringUpdate = false
	endif
	GoToState("")
EndEvent

state Busy
	Event OnUpdateWidgets()
		_requestDuringUpdate = true
	EndEvent
endState

Function UpdateWidgetsAsync()
	;Debug.notification("UpdateWidgetsAsync")
	int handle = ModEvent.Create("_TNTR_UpdateWidgets" + Name)
	if handle
		ModEvent.Send(handle)
	endif
EndFunction

bool Function IsReady()
	int n = TextWidgets.Length
	int i = 0
	while i < n
		if !TextWidgets[i].Ready
			return false
		endif
		i += 1
	endWhile
	return true
EndFunction

; must override
Function InitializeWidgets()

EndFunction

; must override
Function UpdateWidgets()

EndFunction

Function UpdatePosition()
	float x = GetRefX()
	if _hAnchor == "right"
		x -= OffsetX
	else
		x += OffsetX
	endif
	float y = GetRefY()
	if _vAnchor == "bottom"
		y -= OffsetY
	else
		y += OffsetY
	endif
	float dy = TextWidgets[0].GetHeight()
	int n = TextWidgets.Length
	int i = 0
	while i < n
		TextWidgets[i].MoveTo(x, y)
		y += dy
		i += 1
	endWhile
EndFunction

float Function GetRefX()
	float ret = 0.0
	if _hAnchor == "left"
		ret = 0.0
	elseif _hAnchor == "center"
		ret = 640.0
	elseif _hAnchor == "right"
		ret = 1280.0
	endif
	return ret
EndFunction

float Function GetRefY()
	float ret = 0.0
	if _vAnchor == "top"
		ret = 0.0
	elseif _vAnchor == "center"
		float dy = TextWidgets[0].GetHeight()
		ret = 360.0 - dy * (TextWidgets.Length - 1) * 0.5
	elseif _vAnchor == "bottom"
		float dy = TextWidgets[0].GetHeight()
		ret = 720.0 - dy * (TextWidgets.Length - 1)
	endif
	return ret
EndFunction

Function TurnOff()
	Visible = false

	int n = TextWidgets.Length
	int i = 0
	while i < n
		TextWidgets[i].Text = " "
		i += 1
	endWhile
EndFunction

