;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname BaboDiaMerchant05 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
BaboAllureQuest.AfterbarteringScene(1)
BaboAllureQuest.AllureAddSmallValue()
Utility.Wait(1.0)
Aggressor.Clear()
akSpeaker.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

BaboAllureGlobalTrigger Property BaboAllureQuest  Auto 
ReferenceAlias Property Aggressor  Auto
BaboReputationMasterScript Property BRMScript Auto
