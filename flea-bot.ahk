; _____ _____ _____     _____ _____ _____ 
;|  _  |  |  |  |  |___|   __|   __|_   _|
;|     |     |    -|___|   __|   __| | |  
;|__|__|__|__|__|__|   |_____|__|    |_|  
;      flea-bot by BUDDGAF#0087
;environment/settings
#NoEnv
#Warn
#SingleInstance Force
#WinActivateForce
#InstallKeybdHook
SendMode, Event
SetWorkingDir %A_ScriptDir% 
SetTitleMatchMode 2
;SetBatchLines -1
;SetKeyDelay -1
SetMouseDelay -1
Thread, interrupt, 0
CoordMode, Pixel, Screen


;Session variables
attempts := 0
errors := 0
sold := 0
space = y+5
IsPaused := false


Gui, +AlwaysOnTop -Caption +ToolWindow 0x800000
Gui, Color, 0x000000
Gui, Font, 0xFFFFFF, Verdana
Gui, Add, Button, x140 w100 vPauseButton Default, Pause
Gui, Add, Button, yp x10 w100 vStart gLoop Default, Start
Gui, Add, Text, x10 %space% cLime, flea-bot 1.2 by BUDDGAF#0087
Gui, Add, Text, %space% cWhite, [F1] START | [F5] PAUSE | [F12] EXIT
Gui, Add, Text, cWhite, Cursor Pos / Color:
Gui, Add, Text, %space% vMyText cWhite, Cursor Pos: xxxxxxxxxxx  ; XX & YY serve to auto-size the window.
;Gui, Add, Text, vMycolor Cwhite, Color at Pos: %color%
;Gui, Font, s12
Gui, Add, Text, cLime, Status:
Gui, Add, Progress, w200 h5 cBlue vMyProgress, 0
Gui, Add, Text, %space% cWhite vDebug, Waiting on user...
Gui, Show, x320 y50 w250 h260
Gui, Add, Text, cRed, Session Stats:
Gui, Add, Text, %space% cWhite vAttempts, Placeholder_text %attempts%
Gui, Add, Text, %space% cWhite vErrors, Placeholder_text %errors%
Gui, Add, Text, %space% cWhite vSold, Placeholder_text %sold%

SetTimer, UpdateOSD, 100
Gosub, UpdateOSD  	
Return

UpdateOSD:
MouseGetPos, MouseX, MouseY
PixelGetColor, color, %MouseX%, %MouseY% 
GuiControl,, MyText, X%MouseX%, Y%MouseY% %color%
GuiControl,, Attempts, Attempts: %attempts%
GuiControl,, Errors, Errors: %errors%
Guicontrol,, Sold, Transf: %sold%
return

ButtonPause:
if IsPaused
{
	Pause off
	IsPaused := false
	GuiControl,, PauseButton, Pause
}
else
	SetTimer, Pause, 10
return

Pause:
SetTimer, Pause, off
IsPaused := true
GuiControl,, PauseButton, Unpause
Pause, on
return

;controls
F12::ExitApp		;F12 to exit
F5::Pause			;F5 to pause
F1::				;F1 to start 


Loop:
GuiControl,, MyProgress, 10
GuiControlGet, Debug
GuiControl,, Debug, Refreshing...
Click,672,122 Left, 1	;click to refresh listings
Sleep, 550

Ifloop:
;we're at the main menu, we should'nt be here. go back to the flea-market
PixelSearch, FoundX, FoundY, 87,1071,87,1071, 0x9F9D90, 0, Fast, RGB	;searches for single white pixel in the word 'PURCHASE'
If ErrorLevel = 0
{
	Sleep,150
	Click,1251,1069 Left, 2	;click flea-market
	Sleep,550	
}

;look for the word 'purchase'
GuiControl,, MyProgress, 20
PixelSearch, FoundX, FoundY, 1690, 158, 1817, 192, 0xE9E6D4, 0, Fast, RGB	;searches for single white pixel in the word 'PURCHASE'
If ErrorLevel = 0
{	
	
	GuiControlGet, Debug
	GuiControl,, Debug, Buying!
	attempts++ 
	;GuiControlGet, Attempts
	;
	Sleep, 10
	Click, 1750, 184 Left, 1
	Sleep, 50	
	;Click, 1172, 480 Left, 1	
	;Sleep, 50
	Send,{y}
	SoundBeep, 2000, 100
	Goto,Loop	
}

Sleep, 10

;look for pixel indicating there is a greyed out offer about to be ready, if true, go back to Top
GuiControl,, MyProgress, 35
PixelSearch, FoundX, FoundY, 1690, 158, 1817, 192, 0x42423C, 0, Fast RGB
If ErrorLevel = 0
{
	
	GuiControlGet, Debug
	GuiControl,, Debug, Waiting...
	Goto,Ifloop
}

Sleep, 120
GuiControl,, MyProgress, 50
;ImageSearch, FoundX, FoundY, 657, 388, 1338, 691, C:\Users\sick\Desktop\mbrrl.png
PixelSearch, FoundX, FoundY, 139, 194, 139, 194, 0x373733, 0, Fast RGB
Sell:
If ErrorLevel = 0
{
	GuiControlGet, Debug
	GuiControl,, Debug, Selling
	Sleep,1000
	Click,956, 595 Left, 1	;click Ok
	Sleep,1000
	Click,1130,1065 Left, 1	;click 'traders'
	Sleep,1000	
	Click,881,416 Left, 1	;click therapist
	Sleep,1000
	Click,239,50 Left, 1	;click sell
	Sleep,1000
	
	imgstart: ;search for gas analyzer, if found, click it, repeat until no gasan is found
	PixelSearch, FoundX, FoundY, 1268, 258, 1910, 1013, 0xFFF04A, 0, Fast RGB
	If ErrorLevel = 0
	{
		GuiControlGet, Debug
		GuiControl,, Debug, Transferring to trader
		Send, {Control Down}	;hold Control key
		Sleep, 100	
		Click, %FoundX%, %FoundY% Left, 1
		sold++
		Sleep, 100	
		Send, {Control Up}		;release control
		SendEvent, {Control Up}		;release control
		Send, {Control Up}		;release control
		Goto,imgstart
		Sleep,50
	}
	
	Sleep,500	
	Click,963,168 Left, 1	
	Sleep,50
	Click,963,168 Left, 1	;click sell
	Sleep,1000
	Click,1251,1069 Left, 2	;click flea-market
	Sleep,150
}

;look for pixel indicating there is an error overlay active, if true, send Escape to clear it
GuiControl,, MyProgress, 75
PixelSearch, FoundX, FoundY, 487, 83, 487, 83, 0xAFAA8B, 20, RGB
If ErrorLevel = 0
{
	
	errors++
	GuiControlGet, Debug
	GuiControl,, Debug, Error
	Sleep, 100
	Send,{Escape}
	SoundBeep, 620, 100
}

Sleep, 10
;look for pixel indicating we are out of money (double overlay active), if true, offload to therapist
;PixelSearch, FoundX, FoundY, 139, 194, 139, 194, 0x373733, 100, Fast RGB
GuiControl,, MyProgress, 90
Goto,Loop
Return
