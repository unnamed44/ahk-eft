
#NoEnv
#include Vis2.ahk
;MsgBox % OCR("https://i.stack.imgur.com/sFPWe.png")
#Include Lib\FindText.ahk
SetWorkingDir %A_ScriptDir%
SendMode Input
#SingleInstance Force
SetTitleMatchMode 2
#WinActivateForce
SetControlDelay 1
SetWinDelay 0
SetKeyDelay -1
SetMouseDelay -1
SetBatchLines -1
Random, rando, 200, 200
CoordMode, Pixel, Window


global XX = 0
global YY = 0
posx1 = 0
posy1 = 0


Gui +LastFound +AlwaysOnTop -Caption +ToolWindow 
Gui, Color, #000000
Gui, Font, s10  
Gui, Add, Text, vMyText cWhite, XXXXXXXXXXXXXXXXXXXXXXXXXX 
SetTimer, UpdateOSD, 200
Gosub, UpdateOSD  
Gui, Show, x20 y330 NoActivate 
return




UpdateOSD:
GuiControl,, MyText, Debug: %dbug%
return


F5::Pause
F12::ExitApp
F1::Goto,main


main:

state_check()
Sleep,50
purchase_check()
Sleep,50
refresh()
Sleep,50
Goto,main


state_check()

{
	dbug = state_check
	PixelGetColor, pix, 437, 541, RGB, Fast	
	IfEqual, pix, 0x000000						;main menu
	{
		PixelGetColor, pix, 975, 643, RGB, Fast	
		IfEqual, pix, 0xE7E5D4
		{
			Click, 1250,1065
			Sleep,200	
		}
		
	}
	
	
	ImageSearch, FoundX, FoundY, 686, 447, 844, 529, C:\Users\sick\AppData\Roaming\MacroCreator\Screenshots\Screen_20200824050746.png
	If ErrorLevel = 0
	{
		sell()
	}
		
		
	PixelGetColor, pix, 935, 28, RGB, Fast
	IfEqual, pix, 0xCCC4A5
	{
		sell()
	}
		
		PixelGetColor, pix, 940, 35, RGB, Fast			;grey overlay
		IfEqual, pix, 0xBFBFBF
		{
			PixelGetColor, pix, 760, 485, RGB, Fast 	;already purchased		
			IfEqual, pix, 0xE1E1E1
			{
				Send,{Escape}
			}
			Send,{Escape}
		}
		
		
		
		PixelGetcolor, Pix, 941, 40 					;2x overlay present
		IfEqual, Pix, 0x98B6C0
		{
			sell()
		}
		
		ImageSearch XX, YY, 0,0,1920,1080, *50 img/2655.png
		If ErrorLevel = 0 
		{
			read_ocr()
		}
		
	}
	
	refresh()
	{	
		dbug = refresh
		click, 675, 127
	}
	
	purchase_check()
	{
		dbug = purchase_check
		PixelSearch, pix, piy,1754,183,1754,183, 0xD1D0BF, 	30 RGB, Fast
		If ErrorLevel = 0
		{
			Click, 1750, 184 Left, 2					;if pixel is found, click PURCHASE
			Sleep,100
			Send,{y}								;type 'Y'	
		}
	}
	
	
	read_ocr()
	
	{ 				;solve the captcha, etc
		
		dbug = read_ocr
		posy1 := YY+67
		posx1 := XX-397
		intvalue := OCR([posx1, posy1, 350, 38])
		
		
		if InStr(intvalue, "Coffee")
		{
			itempic = img\1059.png
			Gosub, yoy
		}
		
		if InStr(intvalue, "painkillers")
		{
			itempic = img\1811.png
			Gosub, yoy
		}
		
		if InStr(intvalue, "WD-")
		{
			itempic = img\3405.png
			Gosub, yoy
		}
		
		if InStr(intvalue, "foam")
		{
			itempic = img\0342.png
			Gosub, yoy
		}
		
		if InStr(intvalue, "T-Shaped")
		{
			itempic = img\1406.png
			Gosub, yoy
		}
		
		if InStr(intvalue, "rooster")
		{
			itempic = img\1532.png
			Gosub, yoy
		}
		
		if InStr(intvalue, "crowbar")
		{
			itempic = img\1943.png
			Gosub, yoy
		}
		
		if InStr(intvalue, "chain")
		{
			itempic = img\4145.png
			Gosub, yoy
		}
		
		if InStr(intvalue, "Wrench")
		{
			itempic = img\4217.png
			Gosub, yoy
		}
		
		if InStr(intvalue, "sugar")
		{
			itempic = img\4320.png
			Gosub, yoy
		}
		
		if InStr(intvalue, "Grizzly")
		{
			itempic = img\4414.png
			Gosub, yoy
		}	
		if InStr(intvalue, "Balm")
		{
			itempic = img\4450.png
			Gosub, yoy
		}
		
		if InStr(intvalue, "AI-2")
		{
			itempic = img\4557.png
			Gosub, yoy
		}
		
		if InStr(intvalue, "Eagle")
		{
			itempic = img\4708.png
			Gosub, yoy
		}
		
		if InStr(intvalue, "Alyonka")
		{
			itempic = img\4747.png
			Gosub, yoy
		}
		
		if InStr(intvalue, "propane")
		{
			itempic = img\4820.png
			Gosub, yoy
		}
		
		if InStr(intvalue, "bandage")
		{
			itempic = img\4913.png
			Gosub, yoy
		}
		
		if InStr(intvalue, "Screwdriver")
		{
			itempic = img\4950.png
			Gosub, yoy
		}
		
		if InStr(intvalue, "moonshine")
		{
			itempic = img\5028.png
			Gosub, yoy
		}
		
		if InStr(intvalue, "Toilet")
		{
			itempic = img\5059.png
			Gosub, yoy
		}
		
		if InStr(intvalue, "injector")
		{
			itempic = img\5134.png
			Gosub, yoy
		}
		
		if InStr(intvalue, "Vaseline")
		{
			itempic = img\5315.png
			Gosub, yoy
		}
		
		if InStr(intvalue, "beef")
		{
			itempic = img\5359.png
			Gosub, yoy
		}
		
		if InStr(intvalue, "battery")
		{
			itempic = img\5511.png
			Gosub, yoy
		}
		
		if InStr(intvalue, "Rod")
		{
			itempic = img\5616.png
			Gosub, yoy
		}
		
		if InStr(intvalue, "Sodium")
		{
			itempic = img\5659.png
			Gosub, yoy
		}
		
		if InStr(intvalue, "teapot")
		{
			itempic = img\5737.png
			Gosub, yoy
		}
		
		if InStr(intvalue, "Bronze")
		{
			itempic = img\5818.png
			Gosub, yoy
		}
		
		if InStr(intvalue, "tank")
		{
			itempic = img\5847.png
			Gosub, yoy
		}
		
		if InStr(intvalue, "Salewa")
		{
			itempic = img\5922.png
			Gosub, yoy
		}
		
		if InStr(intvalue, "Zibbo")
		{
			itempic = img\5952.png
			Gosub, yoy
		}
		
		if InStr(intvalue, "Bolts")
		{
			itempic = img\0045.png
			Gosub, yoy
		}
		
		if InStr(intvalue, "analyzer")
		{
			itempic = img\0134.png
			Gosub, yoy
		}
		
		if InStr(intvalue, "Blend")
		{
			itempic = img\0209.png
			Gosub, yoy
		}
		
		if InStr(intvalue, "Insulating")
		{
			itempic = img\0323.png
			Gosub, yoy
		}
		
		if InStr(intvalue, "Rebel")
		{
			itempic = img\0424.png
			Gosub, yoy
		}
		
		if InStr(intvalue, "bottle")
		{
			itempic = img\0503.png
			Gosub, yoy
		}
		
		if InStr(intvalue, "Condensed")
		{
			itempic = img\0613.png
			Gosub, yoy
		}
		
		if InStr(intvalue, "Horse")
		{
			itempic = img\0725.png
			Gosub, yoy
		}
		
		if InStr(intvalue, "Printer")
		{
			itempic = img\0822.png
			Gosub, yoy
		}
		
		if InStr(intvalue, "Strike")
		{
			itempic = img\0907.png
			Gosub, yoy
		}
		
		if InStr(intvalue, "drill")
		{
			itempic = img\0959.png
			Gosub, yoy
		}
		
		if InStr(intvalue, "Pliers")
		{
			itempic = img\1303.png
			Gosub, yoy
		}
		
		if InStr(intvalue, "Broken")
		{
			itempic = img\1419.png
			Gosub, yoy
		}
		
		if InStr(intvalue, "Spark")
		{
			itempic = img\1644.png
			Gosub, yoy
		}
		
		if InStr(intvalue, "splint")
		{
			itempic = img\2123.png
			Gosub, yoy
		}
		
		if InStr(intvalue, "Graphics")
		{
			itempic = img\4901.png
			
			
			Gosub, yoy
		}
		
		Yoy:
		{
			Lopc := 0
			Loop, 
			{
				Sleep, 50
				ImageSearch, FoundX, FoundY, 0, 0, 1920, 1080, *44 %itempic%
				If ErrorLevel = 0
				{
					Click, %FoundX%, %FoundY%, 1
				}
				if ErrorLevel
				{
					Lopc += 1
				}
				if Lopc = 5
				{
					Break
				}
				
			}
			ImageSearch, FoundX, FoundY, 554, 438, 1365, 981, *80 img\1814.png
			If ErrorLevel = 0
			{
				Click, %FoundX%, %FoundY%, 1
				Sleep, 1000
			}
		}
		Return
	}
	
	sell()
	{
		SoundBeep,700,60
		sell:
		Click, 961, 563			;click ok 
		Click, 960, 585		
		
		
		sell2:
		Text:="|<>*74$62.0w1txzUQ3kE70STTs20M1wrzXryzbqzTBzkxzjtxjrnTxjTvyTNxwkDNry1br7TA3aRzUM1wLnTs7Tvy0zlwry1ryzazyTBzDBzjtrzbrTrvTvySvk3k5yk60bq1U"
		if (ok:=FindText(1128-150000, 1064-150000, 1128+150000, 1064+150000, 0, 0, Text))
		{
			Click, 1130, 1065, 1		;click 'traders'
			Goto, sell3
		}
		Goto, sell2
		
		sell3:
		Text:="|<>0xC6C4B2@1.00$71.0000000000000000000000000000000000000000000000000000000000000000000000000000000080000000000000000000000000000000000000EV00001020000044800004E00008000000U000E0008000E000000800004000000000000000000110000002000U0000000000000000000000000000000000000000000000000000000000000000000000000000000000000001"
		if (ok:=FindText(876-150000, 487-150000, 876+150000, 487+150000, 0, 0, Text))
		{
			Click, 881, 416, 1		;click therapist
			Goto, sell4
		}
		Goto, sell3
		
		sell4:
		
		Text:="|<>**50$37.Tzzy3kQ7UR18BzzuUY7UG1EG3Q/xc91noWo4USS1+2E3rTh180TY6UY7xrzTvzEt3cR3ko1wC1Tnzzzzk"
		
		if (ok:=FindText(239-150000, 42-150000, 239+150000, 42+150000, 0, 0, Text))
		{
			X:=ok.1.x, Y:=ok.1.y	;click sell
			Click, %X%, %Y%
			Goto, prefilter
		}
		Goto, sell4
		
		
		prefilter:
		ImageSearch, destx, desty, 742, 292, 1195, 919, *10 C:\Users\sick\Desktop\4way.png
		if ErrorLevel != 0
			Goto, prefilter
		Else
		{
			
			sell5:
			if pass > 20
			{
				pass := 0
				Goto, accept_payment
			}
			
			ImageSearch, destx, desty, 742, 292, 1195, 919, *10 C:\Users\sick\Desktop\4way.png
			
		;destx = 730
		;desty = 300
		;top:
		;MouseMove, %destx%, %desty%, 30
		;if destx < 1180
		;{
			;destx ++ 30	
		;}
		;Else
		;{
			;destx = 730
			;desty ++ 30
		;}
		;if desty > 960
		;MsgBox, done
		;Goto, top
			
			
			
			PixelSearch, itemx, itemy, 1271, 257, 1907, 1001, 0xFF7074, 0, Fast RGB
			If ErrorLevel = 0
			{
				
				SetMouseDelay, 2
				Mousemove, %itemx%, %itemy%,
				Sleep,50
				Click, down
				Sleep,50
				Mousemove, %destx%, %desty%,
				Sleep,50
				Click, up
				Goto,sell5
			}
			Else
			{
				pass ++
				
				loop, 1
				{
					Click, 1604, 866 Left, 0
					Click, WheelDown, 1
					
				}	
				
				Goto, sell5
				
				
				
				
		;Text:="|<>*24$9.xzjxzj05+Ih+Ig"
				
		;'if (ok:=FindText(723, 287, 1185, 931, 0, 0, Text))
				{
			;CoordMode, Mouse
			;destx:=ok.1.x, desty:=ok.1.y
					
				}
				
				
				
		;Imagesearch, destx, desty, 705, 262, 1215, 950, img\%filter_s%.png
		;MsgBox, %filter_s%.png
				
				
		;filter:
				
				
				
		;MouseClickDrag, left, %itemx%, %itemy%, %destx%, %desty%, 20
				Goto, sell5
			}
			
			
			accept_payment:
			Sleep, 150
			Click, 963, 168 Left, 1	;click sell
			Sleep, 1000
			Click, 1251, 1069 Left, 2	;click flea-market
			Sleep, 150
			
			SetMouseDelay, -1
			return	
			
			
		}
		
		
	}
