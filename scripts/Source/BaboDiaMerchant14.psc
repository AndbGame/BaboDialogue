;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname BaboDiaMerchant14 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
BaboAllureQuest.AfterbarteringScene(1)
BaboAllureQuest.AllureAddBigValue()

BaboAllureQuest.AllureSubtractValue()
Utility.Wait(1.0)
Aggressor.Clear()
akSpeaker.EvaluatePackage()
(BaboSexController as BaboSexControllerManager).SLHHActivate(akspeaker, None)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property BaboSexController  Auto  
BaboAllureGlobalTrigger Property BaboAllureQuest  Auto  
BaboReputationMasterScript Property BRMScript Auto
ReferenceAlias Property Aggressor  Auto
