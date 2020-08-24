#InstallKeybdHook
#InstallMouseHook

global AnyKey	

F6::
AutoWalk()
Return


AutoWalk()
{
	AnyKey:=A_ThisHotkey			
	AnyKey:=StrReplace(AnyKey, "~")	
	If(AnyKey = "w")				
	{
		KeyWait, w, T0.5		
		If(errorlevel = 1)		
		{
			KeyWait, w	
			exit			
		}
	}	
	keywait, %AnyKey%					
	If not W_VirtState:=GetKeyState("w")	
	{
		SendInput, {w down}						
		keywait, %AnyKey%
		Loop
		{		
			If(KeyState:=GetKeyState(AnyKey, "P") || KeyState:=GetKeyState("Lbutton", "P") || KeyState:=GetKeyState("w", "P"))
			{
				keywait, %AnyKey%	
				SendInput, {w up}	
				break			
			}
			sleep, 100			
		}						
	}
}
Return
