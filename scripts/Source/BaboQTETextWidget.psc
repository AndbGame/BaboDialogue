Scriptname BaboQTETextWidget extends SKI_WidgetBase


; Text
string _text
string Property Text
	string Function Get()
		return _text
	EndFunction

	Function Set(string value)
		if _text != value
			_text = value
			if Ready
				UpdateWidgetText()
			endif
		endif
	EndFunction
EndProperty

Function UpdateWidgetText()
	UI.InvokeString(HUD_MENU, WidgetRoot + ".setMessageText", _text)
EndFunction

; Color
int _color
int Property Color
	int Function Get()
		return _color
	EndFunction

	Function Set(int value)
		if _color != value
			_color = value
			if Ready
				UpdateWidgetTextColor()
			endif
		endif
	EndFunction
EndProperty

Function UpdateWidgetTextColor()
	UI.InvokeNumber(HUD_MENU, WidgetRoot + ".setTextColor", _color)
EndFunction

; FontName
string _fontName
string Property FontName
	string Function Get()
		return _fontName
	EndFunction

	Function Set(string value)
		if _fontName != value
			_fontName = value
			if Ready
				UpdateWidgetFont()
			endif
		endif
	EndFunction
EndProperty

Function UpdateWidgetFont()
	UI.InvokeString(HUD_MENU, WidgetRoot + ".setFont", _fontName)
EndFunction

; FontSize
int _fontSize
int Property FontSize
	int Function Get()
		return _fontSize
	EndFunction

	Function Set(int value)
		if _fontSize != value
			_fontSize = value
			if Ready
				UpdateWidgetTextSize()
			endif
		endif
	EndFunction
EndProperty

Function UpdateWidgetTextSize()
	UI.InvokeNumber(HUD_MENU, WidgetRoot + ".setTextSize", _fontSize)
EndFunction

; TextAlignment
string _align
string Property TextAlignment
	string Function Get()
		return _align
	EndFunction

	Function Set(string value)
		if _align != value
			_align = value
			if Ready
				UpdateWidgetTextAlignment()
			endif
		endif
	EndFunction
EndProperty

Function UpdateWidgetTextAlignment()
	UI.InvokeString(HUD_MENU, WidgetRoot + ".setAlign", _align)
EndFunction

; Visible
bool _visible
bool Property Visible
	bool Function Get()
		return _visible
	EndFunction

	Function Set(bool value)
		if _visible != value
			_visible = value
			if Ready
				UpdateWidgetVisible()
			endif
		endif
	EndFunction
EndProperty

Function UpdateWidgetVisible()
	UI.InvokeBool(HUD_MENU, WidgetRoot + ".setVisible", _visible)
EndFunction

Event OnWidgetReset()
	parent.OnWidgetReset()
	
	FontSize 		= 15
	HAnchor			= "center"
	VAnchor			= "center"
	X				= 200.0
	Y				= 200.0
	
	UpdateWidgetFont()
	UpdateWidgetTextSize()
	UpdateWidgetTextColor()
	UpdateWidgetTextAlignment()
	UpdateWidgetText()
EndEvent

Event OnWidgetLoad()
	OnWidgetReset()
	UpdateWidgetVisible()
	UpdateWidgetModes()
EndEvent

string Function GetWidgetSource()
	Return "BaboDialogue/text.swf"
EndFunction

float Function GetWidth()
	return UI.GetFloat(HUD_MENU, WidgetRoot + "._width")
EndFunction

float Function GetHeight()
	return UI.GetFloat(HUD_MENU, WidgetRoot + "._height")
EndFunction

Function MoveTo(float newX, float newY)
	if newX != X || newY != Y
		UI.InvokeBool(HUD_MENU, WidgetRoot + ".setVisible", false)
		if X != newX
			X = newX
		endif
		if Y != newY
			Y = newY
		endif
		UpdateWidgetVisible()
	endif
EndFunction