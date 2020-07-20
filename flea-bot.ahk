
;╔════════════environment settings

#NoEnv
#Warn
#SingleInstance Force
SetWorkingDir %A_ScriptDir% 
Thread, interrupt, 0
CoordMode, Pixel, Screen
;SetBatchLines,10ms
;SetMouseDelay,-1


;╔════════════variables, strings, whatever

attempts := 0
errors := 0
sold := 0
space = y+5 
IsPaused := false
status = Ready
debug = debug_ready
sellvar = 0


;╔════════════the GUI

MouseGetPos, MouseX, MouseY
PixelGetColor, color, %MouseX%, %MouseY%, RGB
;Gui, Font,  0xFFFFFF, Verdana
;Gui, +AlwaysOnTop ;-Caption +ToolWindow 0x800000
;WinSet,TransColor, 0x00000 100
Gui Color, 0E0E10
Gui Show, w1290 h500 x1920 y1200 NA, Window
WinSet, Transparent, 250, Window,
WinSet, Region, 20-2 W255 H500 R10-10, Window
Gui, +ToolWindow -Caption +AlwaysOnTop
Gui, Color, 0x000000
;CustomColor := "000000"  ; Can be any RGB color (it will be made transparent below).
;Gui +LastFound +AlwaysOnTop -Caption +ToolWindow  ; +ToolWindow avoids a taskbar button and an alt-tab menu item.
;Gui, Color, %CustomColor%
Gui, Add, Text, %space% x50 cYellow, FLEA-BOT 1.3 for EFT 0.12.6 by BUDDGAF
Gui, Add, Button, x190 w65 vPauseButton, Pause
Gui, Add, Button, yp xp+80 x120 w65 vStop gExit Default, Stop
Gui, Add, Button, yp x50 w65 vStart gLoop, Start
;Gui, Add, Text, cWhite, Cursor Pos\Color: 
Gui, Add, Text, %space% vMyText cWhite, Placeholder_text,Placeholder_text,Placeholder_text,
Gui, Add, Text, %space% cRed vStat, Placeholder_text,Placeholder_text,
Gui, Add, Text, %space% cWhite vDebug, Placeholder_text,Placeholder_text
Gui, Add, Text, %space% cYellow, Session Stats: 
Gui, Add, Text, %space% cWhite vAttempts, Placeholder_text,
Gui, Add, Text, %space% cWhite vErrors, Placeholder_text 
Gui, Add, Text, %space% cWhite vSold, Placeholder_text 
Gui, Add, Picture, x140 y70, C:\Users\sick\Pictures\logo.png
Gui, Show, x-30 y150 w500 h200 
SetTimer, UpdateOSD, 100 
debug = init_ready
Gosub, UpdateOSD  	
return

UpdateOSD:
MouseGetPos, MouseX, MouseY
PixelGetColor, color, %MouseX%, %MouseY%, RGB
Guicontrol,, Stat, Status: %status%
Guicontrol,, Debug, Debug: %debug%
GuiControl,, MyText, Mouse Pos: X%MouseX%, Y%MouseY% Color: %color%		
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
status = Paused
IsPaused := tru
GuiControl,, PauseButton, Unpause
Pause, on
return

;╔════════════hotkeys to control the script (note, closing the gui also kills the script)

F1::Goto,Loop		
F5::Pause	
F12::ExitApp		


;╔════════════main loop

Loop:
status = RUNNING
debug = loop_start

;you can uncomment this for testing purposes
;it makes the script sell the items it buys after only buying a few
;so you don't have to wait until you have a full inventory or you're out of money 
;to make sure it is selling your items 

;Sleep,500
;if attempts = 4
;{
;	attempts = 0
;	goto,sell
;}

;this checks to see if we're at the main menu and if we are
;it clicks back to the flea market
debug = check_mm 
PixelGetcolor,Pix,429,522,0
IfEqual,Pix,0x000000
{	
	debug = mm_found
	Sleep,1000
	Click,1251,1069
	Sleep,500
	Goto,check_error
}

;this checks for a pixel that indicates the word "PURCHASE" is being displayed
check_prch:
debug = check_prch
Sleep,50
PixelSearch, FoundX, FoundY, 1690, 158, 1817, 192, 0xE9E6D4, 0, Fast, RGB	
If ErrorLevel = 0
{	
	debug = buy_1
	Click, 1750, 184		;if 'PURCHASE' is on the screen, click it
	Sleep,100
	debug = send_y
	Send,{y}				;send the Y key, confirming the purchase
	SoundBeep, 2000, 100
	attempts++
	Goto,check_prch		;sometimes we click to quickly and the UI doesn't register it
}						;this sends us to the top of this function, so it will click again if purchase
						;is still present, creating a loop that will only be broken if the purchase is not
						;on the screen. i use this type of loop a lot throughout this script.


;this checks for the error message that indicates we have no more inventory space left
;if true, it sends us to the 'sell' function
debug = check_space
check_space:
ImageSearch, FoundX, FoundY, 682, 437, 1324, 654, C:\Users\sick\AppData\Roaming\MacroCreator\Screenshots\Screen_20200713074801.png
If ErrorLevel = 0
{
	debug = check_sapce_true
	Goto,sell
}


;this checks a pixel that appears when there are 2 'layers' of the grey overlay present, this only occours when both the 
;you no longer have any money, it makes the appropriate clicks to send us to the dealers
debug = check_2xolay
check_2xolay:
PixelGetcolor,Pix,941,40
IfEqual,Pix,0x98B6C0
{
	debug = 2xolay_detected_true
	Goto,sell
}

;this checks for the same grey overlay, but only one layer of it, which only occurs when there is any other error message
;it sends the escape key to clear the error message, and occasionally sends it twice, which results in us being back 
;at the main menu, but we check for this earlier in the script so on the next loop, it will  put us back where we need to be.

debug = check_error
check_error:
PixelGetcolor,Pix,835,528
IfEqual,Pix,0x8D9A9C
{
	errors++
	debug = check_error_true
	Sleep, 100
	Send,{Escape}
	SoundBeep, 620, 100
	Goto,Loop
}

;this refreshes the script, notice there is no if statement here, this means it happens every time the script passes
;this point, in other words, if the script checks all of the above pixels and doesn't find any of them, it clicks
;the refresh button and starts over

refresh:
debug = refreshing
Sleep,200
Click,672,122
Sleep,200
Goto, Loop 		;this Goto,Loop sends it to the top of the script after refreshing, otherwise, it would 
				;start the 'sell' function beneath this point and we don't want it to do that unless we ask it to

sell:
debug = sell
Sleep,500			;this clicks 'ok' on the screen, it's here twice because the damn thing moves sometimes
Click,961, 563		;the loop i mentioned earlier? we do it a bunch here. that's becuse waiting X amount of time
Click,960, 585		;won't work here in case the game stutters, so to be quick, and accoutn for that, all of these
Goto,sell2		;following clicks are in these little if loops, if you see what we wanna click on, do it and move
				;on to the next click, if not, check again

sell2:
debug = sell_2			;the debug shows on the gui every one of these loops 
Sleep,500
PixelGetcolor,Pix,1249,1059
IfEqual,Pix,0x909D9F
{
	Click,1130,1065	;click 'traders'
	Goto,sell3
}
Goto,sell2

sell3:
debug = sell_3
Sleep,500
PixelGetcolor,Pix,870,421
IfEqual,Pix,0x819AC8
{
	Click,881,416		;click therapist
	Goto,sell4
}
Goto,sell3

sell4:
debug = sell_4
Sleep,500
PixelGetcolor,Pix,205,42
IfEqual,Pix,0xC1C0BB
{
	Sleep,500
	Click,239,50		;click sell
	Goto,sell5
}
Goto,sell4


sell5:
debug = transfer
;Sleep,500
PixelSearch, itemx, itemy, 1268, 260, 1907, 993, 0xACDEE4, , Fast RGB
If ErrorLevel = 0
{
	debug = transfer_lp
	;#272828	ImageSearch, itemx, itemy, 1268, 260, 1907, 993, *20 C:\Users\sick\desktop\sal.png
	ImageSearch, destx, desty,  726, 297, 1170, 863, *10 C:\Users\sick\desktop\4way.png
	MouseClickDrag, left, %itemx%, %itemy%, %destx%, %desty%, 0
	sellvar++
	Goto,sell5
}
if sellvar = 0
{
	Click,1902,731			;this sells your items to the trader, if you've made it this far, 
	Goto,sell5			;i have to assume you no longer need your hand held. 
}
sellvar = 0

Goto,Sell6
sell6:
debug = sell_6
Sleep,150
Click,963,168 Left, 1	;click sell
Sleep,1000
Click,1251,1069 Left, 2	;click flea-market
Sleep,150
Goto,Loop

exit:
ExitApp
