;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname BaboDiaMerchant19 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
(BaboSexController as BaboSexControllerManager).SexCustomActorTag(PlayerRef, akspeaker, none, none, none, "Vaginal", "Femdom,Bigguy", False, "MOS01", "MerchantOrcSex01", false)
BaboAllureQuest.AllureSubtractValue()
Utility.Wait(1.0)
Aggressor.Clear()
akSpeaker.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property BaboSexController  Auto  

Actor Property PlayerRef  Auto  
BaboAllureGlobalTrigger Property BaboAllureQuest  Auto  
BaboReputationMasterScript Property BRMScript Auto
ReferenceAlias Property Aggressor  Auto
