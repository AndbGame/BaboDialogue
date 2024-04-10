Scriptname BaboEventBalckBriarSibbi extends Quest  

Event OnUpdateGameTime()

	If GetStage() == 20
		SetStage(30)
		BaboEventSibbiStage30.SetValue(1)
	
	Endif

EndEvent

GlobalVariable Property BaboEventSibbiStage30 Auto