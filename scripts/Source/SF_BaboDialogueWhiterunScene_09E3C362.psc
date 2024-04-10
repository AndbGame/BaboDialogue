;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname SF_BaboDialogueWhiterunScene_09E3C362 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
Actor ViceCaptainActor = ViceCaptainRef.getreference() as actor
If ViceCaptainActor.getactorvalue("Variable06") == 4
BoyFriendVariablescript.BoyFriendVariableChange(ViceCaptainActor, 1, 4, false)
else
BoyFriendVariablescript.BoyFriendVariableChange(ViceCaptainActor, 1, 6, false)
BoyFriendVariablescript.RegisterUpdate(3)
endif
stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

BaboBoyFriendVariableScript Property BoyFriendVariableScript Auto

ReferenceAlias Property ViceCaptainRef  Auto  
