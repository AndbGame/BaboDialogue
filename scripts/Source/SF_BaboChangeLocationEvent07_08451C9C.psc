;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname SF_BaboChangeLocationEvent07_08451C9C Extends Scene Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
(GuestRef01.getreference() as actor).moveto(BaboEventMorthalRoomXmarkerB02)
(GuestRef02.getreference() as actor).moveto(BaboEventMorthalRoomXmarkerB03)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
(GuestRef01.getreference() as actor).delete()
(GuestRef02.getreference() as actor).delete()
Getowningquest().setstage(105)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property BaboEventMorthalRoomXmarkerB02  Auto  

ObjectReference Property BaboEventMorthalRoomXmarkerB03  Auto  

ReferenceAlias Property GuestRef01  Auto  

ReferenceAlias Property GuestRef02  Auto  
