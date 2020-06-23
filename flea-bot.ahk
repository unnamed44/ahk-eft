;EFT-Flip by BUDDGAF
#NoEnv
#Warn
SendMode Input
SetWorkingDir %A_ScriptDir% 
#SingleInstance Force
#WinActivateForce
SetTitleMatchMode 2
SetBatchLines -1
SetKeyDelay -1
SetMouseDelay -1
CoordMode, Pixel, Screen
Thread, interrupt, 0

F12::ExitApp		;F12 to exit
F5::Pause			;F5 to pause
F1::				;F1 to start 

Loop:
;look for the word 'purchase'
	PixelSearch, FoundX, FoundY, 1742, 183, 1742, 183, 0xAAAA9D, 10, Fast RGB
If ErrorLevel = 0
{	
	Click, 1750, 184 Left, 1
	Sleep, 60	
	;Click, 1172, 480 Left, 1	
	;Sleep, 50
	Send,{y}
	SoundBeep, 2000, 100
	Goto,Loop	
}

;look for pixel indicating there is a greyed out offer about to be ready, if true, go back to Top
PixelSearch, FoundX, FoundY, 1851, 153, 1851, 153, 0x3F4243, 20, Fast RGB
If ErrorLevel = 0
{
	Goto,Loop
}

;look for pixel indicating there is an error overlay active, if true, send Escape to clear it
PixelSearch, FoundX, FoundY, 487, 83, 487, 83, 0xAFAA8B, 20, FAST RGB
If ErrorLevel = 0
{
	Send,{Escape}
	SoundBeep, 620, 100
}

;look for pixel indicating we are out of money (double overlay active), if true, offload to therapist
PixelSearch, FoundX, FoundY, 139, 194, 139, 194, 0x373733, 0, Fast RGB
If ErrorLevel = 0
{
	Click,960,597 Left, 2	;click Ok
	Sleep,1000
	Click,1130,1065 Left, 2	;click 'traders'
	Sleep,1000
	Click,881,416 Left, 2	;click therapist
	Sleep,1000
	Click,239,50 Left, 2	;click sell
	Sleep,1000
	
	Send, {Control Down}	;hold Control key
	
	imgstart: ;search for gas analyzer, if found, click it, repeat until no gasan is found
	ImageSearch, FoundX, FoundY, 1273, 267, 1898, 1000, C:\Users\sick\AppData\Roaming\MacroCreator\Screenshots\Screen_20200623012121.png
	If ErrorLevel = 0
	{
		Click, %FoundX%, %FoundY% Left, 1		
		Goto,imgstart
	}
	
	Send, {Control Up}		;release control
	Sleep,500	
	Click,963,168 Left, 1	
	Sleep,50
	Click,963,168 Left, 1	;click sell
	Sleep,1000
	Click,1251,1069 Left, 2	;click flea-market
	Sleep,150
}
	

Click,672,122 Left, 1	;click to refresh listings
Sleep,500
Goto,Loop
Return
