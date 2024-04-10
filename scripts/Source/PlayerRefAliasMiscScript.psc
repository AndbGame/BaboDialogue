Scriptname PlayerRefAliasMiscScript extends referencealias
{This will handle... IDK}

ReferenceAlias Property RefSelf Auto
Globalvariable Property MiscVariable Auto
Globalvariable Property Baboreputation Auto
Globalvariable Property BaboGuardFollowNum Auto
Event OnAnimationEvent(ObjectReference akSource, string asEventName)
If akSource == (Self.getref() as actor)
	
EndIf
EndEvent

Event OnDeath(Actor akKiller)

RefSelf.Clear()

int Reputation = Baboreputation.getvalue() as int
int Follownum = BaboGuardFollowNum.getvalue() as int
Baboreputation.setvalue(Reputation + 50)
BaboGuardFollowNum.setvalue(FollowNum - 1)

EndEvent