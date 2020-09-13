#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, Force
;CHANGE THIS TO THE DIRECTORY WHERE TARKOV CURRENTLY SAVES SCREENSHOTS
ssdir = C:\Users\sick\Documents\Escape from Tarkov\Screenshots
;CHANGE THIS TO ANY LOCAL FOLDER ON YOUR MACHINE THAT YOU CREATE
ssnew = C:\Users\sick\Documents\Escape from Tarkov\Screenshots\new 
;CHANGE THIS TO THE KEY YOU USE TO TAKE SCREENSHOTS IN THE GAME(PRINTSCREEN BY DEFAULT)
sskey = Insert

Startm:
;Open empty gui
Gui, Destroy
space = y+1
Gui Color, 0E0E10
Gui Show, w148	 h360 x2 y300 NA, Window
WinSet, Transparent, 200, Window,1
WinSet, Region, 0-0 W175 H500 , Window
Gui, +ToolWindow -Caption +AlwaysOnTop +Owner 
Gui, Font, s10, Segoe UI		
Gui, Add, Text,%space%  cRed, ═══ESCAPE TO EXIT═══
Gui, Add, Text,%space%  cWhite, ╔══════ITEMS══════╗
;Clear files before starting
FileDelete, %ssnew%\*
FileDelete, %ssdir%\*
FileDelete, fText.txt
Send, {LControl Down}{%sskey%}{LControl Up}
Sleep, 200
FileCopy, %ssdir%\*.info, %ssnew%\CopiedFile.txt ;Copy .info file to create absolute file path
Goto,fileread_if
end_fileread:		
Gui, Font, s7

;Toggle GUI2	
toggle	:= 1	
if (toggle = 1)
{
	
	toggle = 0	
	Gui, 2:Hide
}
else if(toggle = 0)
{
	toggle = 1
	Gosub, Full_File_Text
}

Esc::ExitApp
MButtoN:: Goto, Startm
return

;Open full .info file
Full_File_Text:

{
	Gui, 2:Destroy
	Gui, 2:Color, 0E0E10	
	Gui, 2:Show, w1300 h1000 x174 y25 NA NoActivate, Win2
	Gui, 2:+AlwaysOnTop +ToolWindow -Caption
	WinSet, Transparent, 225, Win2,
	WinSet, Region, 0-0 W1300 H1000 R70-45, Win2
	Gui, 2:Font, s8, Blender Pro
	FileRead, Finaltext, %ssnew%\CopiedFile.txt
	Gui, 2:Add, Text, yp x10 y10 cLime, %Finaltext%
	
	
}	
return


E_R:
{
	ExitApp
}


fileread_if:
FileRead, Filend, %ssnew%\CopiedFile.txt  ;Read copied .info file
{
	;------------------------------------------------PURPLE
	
	if InStr(Filend, "item_container_magbox")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% cPurple, Mag Case
	}
	
	if InStr(Filend, "item_container_meds")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% Purple, Med Case
	}
	
	if InStr(Filend, "item_container_money")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% Purple, Money Case
	}
	
	if InStr(Filend, "item_container_weaponcase")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% Purple, Weapon Case
	}
	
	if InStr(Filend, "item_container_grenadebox")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% Purple, Grenade Case
	}
	
	if InStr(Filend, "item_container_ammo")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% Purple, Ammo Case
	}
	
	if InStr(Filend, "item_container_smallitems")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% Purple, Items Case
	}
	
	if InStr(Filend, "item_container_food")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% Purple, Food Case
	}
	
	if InStr(Filend, "ITEM_PATH")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% Purple, ITEM_SHORT_NAME
	}
	
	if InStr(Filend, "ITEM_PATH")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% Purple, ITEM_SHORT_NAME
	}
	
	if InStr(Filend, "scope_base_trijicon_reap-ir")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% cPurple, Reap-IR
	}
	
	if InStr(Filend, "scope_all_flir")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% cPurple, FLIR
	}
	
	if InStr(Filend, "weapon_dmm_rebel_adze_axe")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% cPurple, Red Rebel
	}
	
	if InStr(Filend, "item_barter_electr_phaseantenna")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% cPurple, AESA
	}
	
	if InStr(Filend, "item_container_keybar")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% cPurple, Keybar
	}
	
	if InStr(Filend, "item_video_card")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% cPurple, Graphics Card
	}
	
	if InStr(Filend, "item_keycard_lab_black")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% cPurple, Black Keycard
	}
	
	if InStr(Filend, "item_keycard_lab_violet")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% cPurple, Violet Keycard
	}
	
	if InStr(Filend, "Key_Shopping_Mall_KIBA")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% cPurple, Kiba Outlet Key
	}
	
	if InStr(Filend, "item_keycard_lab_blue")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% cPurple, Blue Keycard
	}
	
	if InStr(Filend, "item_keycard_lab_green")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% cPurple, Green Keycard
	}
	
	if InStr(Filend, "item_keycard_lab_red")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% cPurple, Red Keycard
	}
	
	if InStr(Filend, "item_barter_medical_transilluminator")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% cPurple, LEDX
	}
	
	 ;----------------------------------------------------------------------------------------------YELLOW
	
	
	if InStr(Filend, "ITEM_PATH")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, ITEM_SHORT_NAME
	}
	
	if InStr(Filend, "ITEM_PATH")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, ITEM_SHORT_NAME
	}
	
	if InStr(Filend, "ITEM_PATH")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, ITEM_SHORT_NAME
	}
	
	if InStr(Filend, "ITEM_PATH")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, ITEM_SHORT_NAME
	}
	
	if InStr(Filend, "ITEM_PATH")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, ITEM_SHORT_NAME
	}
	
	if InStr(Filend, "ITEM_PATH")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, ITEM_SHORT_NAME
	}
	
	if InStr(Filend, "ITEM_PATH")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, ITEM_SHORT_NAME
	}
	
	if InStr(Filend, "ITEM_PATH")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, ITEM_SHORT_NAME
	}
	
	if InStr(Filend, "ITEM_PATH")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, ITEM_SHORT_NAME
	}
	
	if InStr(Filend, "ITEM_PATH")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, ITEM_SHORT_NAME
	}
	
	if InStr(Filend, "ITEM_PATH")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, ITEM_SHORT_NAME
	}
	
	if InStr(Filend, "ITEM_PATH")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, ITEM_SHORT_NAME
	}
	
	if InStr(Filend, "ITEM_PATH")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, ITEM_SHORT_NAME
	}
	
	;if InStr(Filend, "bear_head_0")
	;{
	;	Gui, Font, s10, Segoe UI
	;	Gui, Add, Text, %space% cYellow, Bear Player
	;}
	
	if InStr(Filend, "item_barter_valuable_bitcoin")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% cYellow, Bitcoin
	}
	
	if InStr(Filend, "item_barter_electr_wirelesstranmitter")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% cYellow, Military Transmitter
	}
	
	if InStr(Filend, "item_barter_electr_virtexprocessor")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% cYellow, Virtex
	}
	
	if InStr(Filend, "item_barter_valuable_prokill")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% cYellow, Prokill Medallion
	}
	
	if InStr(Filend, "item_barter_valuable_elibadge")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% cYellow, Silver Badge
	}
	
	if InStr(Filend, "item_barter_valuable_rolex")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% cYellow, Roler
	}
	
	if InStr(Filend, "item_barter_valuable_lion")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% cYellow, Bronze Lion
	}
	
	if InStr(Filend, "item_barter_medical_defibrillator")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% cYellow, Defibrillator
	}
	
	if InStr(Filend, "item_info_intelligence")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% cYellow, Intelligence
	}
	
	if InStr(Filend, "item_keycard_lab_white")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% cYellow, Labs Access Card
	}
	
	if InStr(Filend, "Key_cash_machine_GOSHAN")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% cYellow, Goshan Register
	}
	
	if InStr(Filend, "Corpse")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% cYellow, Body
	}
	
	if InStr(Filend, "USEC_Head_1")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% cYellow, USEC Player
	}
	
	if InStr(Filend, "item_barter_electr_tetriz")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% cYellow, Tetriz
	}
	
	if InStr(Filend, "item_barter_flam_dry")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% cYellow, Dry Fuel
	}
	
	if InStr(Filend, "item_barter_electr_ssd")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% cYellow, SSD
	}
	
	if InStr(Filend, "item_alcohol_moonshine_loot")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% cYellow, Moonshine
	}
	
	if InStr(Filend, "item_barter_medical_diagset")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% cYellow, Ophthalmoscope
	}
	
	if InStr(Filend, "item_barter_electr_flashstorage")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% cYellow, VPX i think
	}
	
	if InStr(Filend, "item_barter_other_30mmround")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% cYellow, OFZ Round
	}
	
	;---------------------------------------------------------------------------------------GREEN
	
	
	
	if InStr(Filend, "item_money_dollar")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, Dollars
	}
	
	if InStr(Filend, "item_money_euro")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, Euros
	}
	
	if InStr(Filend, "item_money_ruble")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, ITEM_SHORT_NAME
	}
	
	if InStr(Filend, "ITEM_PATH")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, ITEM_SHORT_NAME
	}
	
	if InStr(Filend, "ITEM_PATH")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, ITEM_SHORT_NAME
	}
	
	if InStr(Filend, "ITEM_PATH")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, ITEM_SHORT_NAME
	}
	
	if InStr(Filend, "ITEM_PATH")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, ITEM_SHORT_NAME
	}
	
	if InStr(Filend, "ITEM_PATH")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, ITEM_SHORT_NAME
	}
	
	if InStr(Filend, "ITEM_PATH")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, ITEM_SHORT_NAME
	}
	
	if InStr(Filend, "ITEM_PATH")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, ITEM_SHORT_NAME
	}
	
	if InStr(Filend, "ITEM_PATH")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, ITEM_SHORT_NAME
	}
	
	if InStr(Filend, "ITEM_PATH")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, ITEM_SHORT_NAME
	}
	
	if InStr(Filend, "ITEM_PATH")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, ITEM_SHORT_NAME
	}
	
	if InStr(Filend, "ITEM_PATH")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, ITEM_SHORT_NAME
	}
	
	if InStr(Filend, "ITEM_PATH")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, ITEM_SHORT_NAME
	}
	
	if InStr(Filend, "ITEM_PATH")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, ITEM_SHORT_NAME
	}
	
	if InStr(Filend, "ITEM_PATH")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, ITEM_SHORT_NAME
	}
	
	if InStr(Filend, "ITEM_PATH")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, ITEM_SHORT_NAME
	}
	
	if InStr(Filend, "ITEM_PATH")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, ITEM_SHORT_NAME
	}
	
	if InStr(Filend, "ITEM_PATH")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, ITEM_SHORT_NAME
	}
	
	if InStr(Filend, "ITEM_PATH")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, ITEM_SHORT_NAME
	}
	
	if InStr(Filend, "ITEM_PATH")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, ITEM_SHORT_NAME
	}
	
	if InStr(Filend, "ITEM_PATH")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, ITEM_SHORT_NAME
	}
	
	if InStr(Filend, "ITEM_PATH")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, ITEM_SHORT_NAME
	}
	
	if InStr(Filend, "ITEM_PATH")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, ITEM_SHORT_NAME
	}
	
	if InStr(Filend, "ITEM_PATH")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, ITEM_SHORT_NAME
	}
	
	if InStr(Filend, "ITEM_PATH")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, ITEM_SHORT_NAME
	}
	
	if InStr(Filend, "ITEM_PATH")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, ITEM_SHORT_NAME
	}
	
	if InStr(Filend, "ITEM_PATH")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, ITEM_SHORT_NAME
	}
	
	if InStr(Filend, "item_barter_electr_gyroscope")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, Gyrotachometer
	}
	
	if InStr(Filend, "polyurethane_foam_open")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, Foam
	}
	
	if InStr(Filend, "item_screw_bolts")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, Bolts
	}
	
	if InStr(Filend, "item_wallet")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, Wallet
	}
	
	if InStr(Filend, "item_flash_card_ironkey")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, Flashdrive
	}
	
	if InStr(Filend, "item_barter_electr_gphonex")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, GPhoneX
	}
	
	if InStr(Filend, "item_barter_electr_rfidreader")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, RFID Reader
	}
	
	if InStr(Filend, "item_electr_gasanalyzer")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, Gas Analyzer
	}
	
	if InStr(Filend, "item_barter_valuable_beardoil")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, Beard Oil
	}
	
	if InStr(Filend, "item_barter_valuable_cat")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, Cat Figurine
	}
	
	if InStr(Filend, "item_barter_valuable_woodclock")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, Wooden Clock
	}
	
	if InStr(Filend, "item_barter_valuable_chicken")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, Golden Rooster
	}
	
	if InStr(Filend, "item_quest_barter_valuable_teapot")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, Antique Teapot
	}
	
	if InStr(Filend, "item_quest_barter_valuable_vase")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, Antique Vase
	}
	
	if InStr(Filend, "item_barter_flammable_klean")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, #FireKlean Lube
	}
	
	if InStr(Filend, "item_quest_fuelconditioner")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, Fuel Conditioner
	}
	
	if InStr(Filend, "item_barter_other_paracord")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, Paracord
	}
	
	if InStr(Filend, "item_barter_other_dobby")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, Antique Book
	}
	
	if InStr(Filend, "item_tools_toolset")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, Toolset
	}
	
	if InStr(Filend, "item_thick_diary")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, Diary
	}
	
	if InStr(Filend, "item_keycard_lab_yellow")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, Yellow Keycard
	}
	
	if InStr(Filend, "item_key_1","item_key_2""item_key_3""item_key_4""item_key_5""item_key_6""item_key_7""item_key_8""item_key_9""item_key_10")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% cWhite, Unknown Key
	}
	
	if InStr(Filend, "item_key_3_red")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% cWhite, Unknown Red Key
	}
	
	if InStr(Filend, "item_car_battery")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, Car Battery
	}
	
	if InStr(Filend, "item_energy_accum")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, Accumulator Battery
	}
	
	if InStr(Filend, "item_barter_energy_powerbank")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, Powerbank
	}
	
	if InStr(Filend, "item_barter_building_nails")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, Nails
	}
	
	if InStr(Filend, "item_barter_building_hose")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, Corrugated Hose
	}
	
	if InStr(Filend, "item_barter_household_foam")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, Foam
	}
	
	if InStr(Filend, "item_barter_electr_modem")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, Circut Board
	}
	
	if InStr(Filend, "item_barter_electr_powercord")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, Powercord
	}
	
	if InStr(Filend, "item_power_supply_unit")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, Power Supply Unit
	}
	
	if InStr(Filend, "item_barter_valuable_1gphone")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, 1Gphone
	}
	
	if InStr(Filend, "item_ram_module")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, RAM
	}
	
	if InStr(Filend, "item_barter_household_soda") 
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, Sodium
	}
	
	if InStr(Filend, "item_chain_gold")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, GoldChain/Chainlet
	}
	
	if InStr(Filend, "item_barter_flam_propane")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, Propane
	}
	
	if InStr(Filend, "item_dogtags_usec")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, USEC Dogtag
	}
	
	if InStr(Filend, "item_dogtags_bear")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, Bear Dogtag
	}
	
	if InStr(Filend, "item_barter_household_wd40_400ml")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, WD-40 400ml
	}
	
	if InStr(Filend, "item_golden_star_balm_loot")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, Golden Star Balm
	}
	
	if InStr(Filend, "item_vaselin_loot")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, Vaseline
	}
	
	if InStr(Filend, "item_grizzly_loot")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, Grizzly
	}
	
	if InStr(Filend, "item_augmentin_loot")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, Augmentin
	}
	
	if InStr(Filend, "item_ibuprofen_loot")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, Ibuprofen
	}
	
	if InStr(Filend, "item_alyonka_loot")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, Alyonka Chocolate
	}
	
	if InStr(Filend, "item_barter_tools_handdrill")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, Hand Drill
	}
	
	if InStr(Filend, "item_barter_valuable_kresalo")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, Firesteel
	}
	
	if InStr(Filend, "item_barter_valuable_skullring")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, Skullring
	}
	
	if InStr(Filend, "item_barter_valuable_gp")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, GP Coin
	}
	
	if InStr(Filend, "item_barter_household_pipecleaner")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, Pipe Cleaner
	}
	
	if InStr(Filend, "item_other_powder_green")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, Green Gun Powder
	}
	
	if InStr(Filend, "item_other_powder_red")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, Red Gun Powder
	}
	
	if InStr(Filend, "item_barter_tools_metalscissors")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, Metal Scissors
	}
	
	if InStr(Filend, "item_barter_valuable_raven")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, Raven Figurine
	}
	
	if InStr(Filend, "item_food_vodka")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, Vodka
	}
	
	if InStr(Filend, "item_barter_electr_powerfilter")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, Mil-Power Filter
	}
	
	if InStr(Filend, "item_barter_electr_cablemilitary")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, Military Cable
	}
	
	if InStr(Filend, "item_barter_electr_thermalmodule")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, Iridium Module
	}
	
	if InStr(Filend, "item_barter_building_kektape")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, KEK Tape
	}
	
	if InStr(Filend, "item_barter_electr_militaryboard")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, Military Circut Board
	}
	
	if InStr(Filend, "item_barter_other_waterfilter")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, Water Filter
	}
	
	if InStr(Filend, "item_barter_electr_lcd_Clean")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, Working LCD
	}
	
	if InStr(Filend, "item_barter_medical_nacl")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, Saline
	}
	
	if InStr(Filend, "item_stimulator_sj6_loot")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, SJ6 TGLabs
	}
	
	if InStr(Filend, "item_stimulator_sj1_loot")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, SJ1 TGLabs
	}
	
	if InStr(Filend, "item_stimulator_etg-change_loot")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, Green eTG-Change
	}
	
	if InStr(Filend, "item_meds_survival_first_aid_rollup_kit_loot")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, Surv12 Kit
	}
	
	if InStr(Filend, "item_meds_core_medical_surgical_kit_loot")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, CMS Kit
	}
	
	if InStr(Filend, "item_barter_other_tea")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, Tea
	}
	
	if InStr(Filend, "item_food_condensed_milk_loot")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, Condensed Milk
	}
	
	if InStr(Filend, "item_food_marrow_puree_loot")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, Squash
	}
	
	if InStr(Filend, "item_barter_building_pressuregauge")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, Pressure Gauge
	}
	
	if InStr(Filend, "item_barter_building_thermometer")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, Thermometer
	}
	
	if InStr(Filend, "item_barter_other_cloth_cordura")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, Cordura Cloth
	}
	
	if InStr(Filend, "item_barter_electr_engine")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, Motor
	}
	
	if InStr(Filend, "item_food_purewater")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, Superwater
	}
	
	if InStr(Filend, "item_food_jack")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, Whisky
	}
	
	if InStr(Filend, "item_barter_electr_lens")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, NIXXOR Lens
	}
	
	;--------------------------------------------------------------------------------------BLUE
	
	if InStr(Filend, "item_barter_electr_helix")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% cB2DCEC, Helix
	}
	
	if InStr(Filend, "item_battery_d")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% cB2DCEC, D Battery
	}
	
	if InStr(Filend, "item_insulation_tape")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% cB2DCEC, Insulation Tape
	}
	
	if InStr(Filend, "item_screw_nuts")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% cB2DCEC, Screw nut
	}
	
	if InStr(Filend, "item_ducttape")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% cB2DCEC, Duct Tape
	}
	
	if InStr(Filend, "item_barter_building_screw")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% cB2DCEC, Screws
	}
	
	if InStr(Filend, "item_barter_building_plexiglass")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% cB2DCEC, Plexiglass
	}
	
	if InStr(Filend, "item_battery_aa")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% cB2DCEC, AA Battery
	}
	
	if InStr(Filend, "item_cigarettes_wilston")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% cB2DCEC, WCigarettes
	}
	
	if InStr(Filend, "item_cpu")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% cB2DCEC, CPU
	}
	
	if InStr(Filend, "item_dvd_drive")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% cB2DCEC, DVD Drive
	}
	
	if InStr(Filend, "item_cooler_fan")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% cB2DCEC, CPU Fan
	}
	
	if InStr(Filend, "item_barter_electr_capacitors")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% cB2DCEC, Capacitors
	}
	
	if InStr(Filend, "item_barter_electr_hdd")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% cB2DCEC, Hard Drive
	}
	
	if InStr(Filend, "item_barter_electr_drill")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% cB2DCEC, Drill
	}
	
	if InStr(Filend, "item_barter_electr_sparkplug")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% cB2DCEC, Sparkplug
	}
	
	if InStr(Filend, "item_barter_electr_gyroscope2")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% cB2DCEC, Gyro
	}
	
	if InStr(Filend, "item_barter_electr_magnet")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% cB2DCEC, Magnet
	}
	
	if InStr(Filend, "item_barter_electr_wires")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% cB2DCEC, Wires
	}
	
	if InStr(Filend, "item_phone")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% cB2DCEC, Broken Gphone
	}
	
	if InStr(Filend, "item_geiger_counter")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% cB2DCEC, Geiger Counter
	}
	
	if InStr(Filend, "item_barter_electr_usbadapter")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% cB2DCEC, USB Adapter
	}
	
	if InStr(Filend, "item_tplug")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% cB2DCEC, T-Shaped Plug
	}
	
	if InStr(Filend, "item_electr_uvlamp")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% cB2DCEC, UV Lamp
	}
	
	if InStr(Filend, "item_barter_household_antiinsect")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% cB2DCEC, AntiRoach
	}
	
	if InStr(Filend, "item_barter_household_toiletpaper")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% cB2DCEC, Toilet Paper
	}
	
	if InStr(Filend, "item_barter_household_alkali")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% cB2DCEC, Akali Washer
	}
	
	if InStr(Filend, "item_barter_household_wiper")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% cB2DCEC, Clin Wiper
	}
	
	if InStr(Filend, "item_barter_household_bleach")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% cB2DCEC, Ox Bleach
	}
	
	if InStr(Filend, "item_toothpaste")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% cB2DCEC, Toothpaste
	}
	
	if InStr(Filend, "item_barter_household_soap")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% cB2DCEC, Soap
	}
	
	if InStr(Filend, "item_horse_figurine")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% cB2DCEC, Horse Figurine
	}
	
	if InStr(Filend, "item_chain")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% cB2DCEC, Chainlet/Goldchain
	}
	
	if InStr(Filend, "item_crickent")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% cB2DCEC, Crickent
	}
	
	if InStr(Filend, "item_matches")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% cB2DCEC, Matches
	}
	
	if InStr(Filend, "item_barter_household_wd40_100ml")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% cB2DCEC, WD-40 100ml
	}
	
	if InStr(Filend, "item_zibbo_gold")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% cB2DCEC, Zibbo
	}
	
	if InStr(Filend, "item_zibbo")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% cB2DCEC, Zibbo
	}
	
	if InStr(Filend, "item_barter_medical_bloodset")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% cB2DCEC, Medical Bloodset
	}
	
	if InStr(Filend, "item_barter_medical_h2o2")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% cB2DCEC, Hydrogen Peroxide
	}
	
	if InStr(Filend, "item_cigarettes_soyuz_apollo")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% cB2DCEC, ACigarettes
	}
	
	if InStr(Filend, "item_cigarettes_malboro")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% cB2DCEC, MCigarettes
	}
	
	if InStr(Filend, "item_cigarettes_strike")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% cB2DCEC, SCigarettes
	}
	
	if InStr(Filend, "item_other_filter")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% cB2DCEC, Gasmask filter
	}
	
	if InStr(Filend, "item_barter_tools_pliers_elite")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% cB2DCEC, Elite Pliers
	}
	
	if InStr(Filend, "item_tools_wrench")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% cB2DCEC, Wrench
	}
	
	if InStr(Filend, "item_tools_pliers")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% cB2DCEC, Pliers
	}
	
	if InStr(Filend, "item_stimulator_adrenaline_loot")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% cB2DCEC, Adrenaline
	}
	
	if InStr(Filend, "item_stimulator_zagustin_loot")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% cB2DCEC, Zagustin
	}
	
	if InStr(Filend, "item_morphine_loot")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% cB2DCEC, Morphine
	}
	
	if InStr(Filend, "item_stimulator_propital_loot")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% cB2DCEC, Propital
	}
	
	if InStr(Filend, "item_meds_salewa_loot")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% cB2DCEC, Salewa
	}
	
	if InStr(Filend, "item_splint_loot")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% cB2DCEC, Splint
	}
	
	if InStr(Filend, "item_meds_alusplint")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% cB2DCEC, Alusplint
	}
	
	if InStr(Filend, "item_bandage_med_loot")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% cB2DCEC, Bandage
	}
	
	if InStr(Filend, "item_bandage_army_loot")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% cB2DCEC, Army Bandage
	}
	
	if InStr(Filend, "item_ifak_loot")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% cB2DCEC, IFAK
	}
	
	if InStr(Filend, "item_automedkit_loot")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% cB2DCEC, Car Medkit
	}
	
	if InStr(Filend, "item_medkit_loot")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% cB2DCEC, AI-2 Medkit
	}
	
	if InStr(Filend, "item_analgin_loot")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% cB2DCEC, Painkillers
	}
	
	if InStr(Filend, "item_juice_apple_loot")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% cB2DCEC, Apple Juice
	}
	
	if InStr(Filend, "item_juice_vita_loot")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% cB2DCEC, Vita Juice
	}
	
	if InStr(Filend, "item_icegreen_loot")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% cB2DCEC, Green Ice Tea
	}
	
	if InStr(Filend, "item_juice_grand_loot")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% cB2DCEC, Grand Juice
	}
	
	if InStr(Filend, "item_maxenergy_loot")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% cB2DCEC, Max Energy Drink
	}
	
	if InStr(Filend, "item_tetrapak_loot")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% cB2DCEC, Milk
	}
	
	if InStr(Filend, "item_hotrod_loot")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% cB2DCEC, HotRod
	}
	
	if InStr(Filend, "item_water_bottle_loot")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% cB2DCEC, Water Bottle
	}
	
	if InStr(Filend, "item_tarcola_loot")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% cB2DCEC, Tarcola
	}
	
	if InStr(Filend, "item_filterbottle_loot")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% cB2DCEC, Aquamarine Water
	}
	
	if InStr(Filend, "item_mre_loot")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% cB2DCEC, MRE lunch box
	}
	
	if InStr(Filend, "item_galette_loot")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% cB2DCEC, Crackers
	}
	
	if InStr(Filend, "item_food_beefstew_2_loot")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% cB2DCEC, Tushonka
	}
	
	if InStr(Filend, "item_slickers_loot")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% cB2DCEC, Slickers Bar
	}
	
	if InStr(Filend, "item_oatmeal_loot")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% cB2DCEC, Oat Flakes
	}
	
	if InStr(Filend, "item_food_herring_loot")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% cB2DCEC, Can of Herring
	}
	
	if InStr(Filend, "item_food_mayo_container")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% cB2DCEC, Mayo
	}
	
	if InStr(Filend, "item_canned_saira_loot")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% cB2DCEC, Can of Saury
	}
	
	if InStr(Filend, "item_sugar_loot")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% cB2DCEC, Sugar
	}
	
	if InStr(Filend, "item_food_peas_loot")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% cB2DCEC, Can of Peas
	}
	
	if InStr(Filend, "item_snacks_emelya_loot")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% cB2DCEC, Emelya Croutons
	}
	
	if InStr(Filend, "item_food_sprats_container")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% cB2DCEC, Sprats
	}
	
	if InStr(Filend, "item_food_humpback_loot")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% cB2DCEC, Can of Salmon
	}
	
	if InStr(Filend, "item_ifr_loot")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% cB2DCEC, Iskra Lunch Box
	}
	
	if InStr(Filend, "item_barter_tools_screwdriver_flat")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% cB2DCEC, Flat Screwdriver
	}
	
	if InStr(Filend, "item_barter_household_shampoo")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% cB2DCEC, Shampoo
	}
	
	if InStr(Filend, "item_barter_household_chlorine")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% cB2DCEC, Pack of Chlorine
	}
	
	if InStr(Filend, "item_other_powder")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% cB2DCEC, Blue Gun Powder
	}
	
	if InStr(Filend, "item_electr_eslamp")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% cB2DCEC, ES Lamp
	}
	
	if InStr(Filend, "item_barter_medical_pile")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% cB2DCEC, Pile of Meds
	}
	
	if InStr(Filend, "item_barter_flammable_survlighter")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% cB2DCEC, Survival Lighter
	}
	
	if InStr(Filend, "item_barter_other_cloth_fleece")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% cB2DCEC, Fleece Cloth
	}
	
	if InStr(Filend, "item_barter_other_cloth_ripstop")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% cB2DCEC, Ripstop Cloth
	}
	
	if InStr(Filend, "item_barter_building_silicontube")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% cB2DCEC, Silicon Tube
	}
	
	if InStr(Filend, "item_barter_other_uzrgm_fuse")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% cB2DCEC, Grenade fuse
	}
	
	if InStr(Filend, "item_barter_electr_lbulb")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% cB2DCEC, Light Bulb
	}
	
	if InStr(Filend, "item_barter_electr_lcd_Dirt")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% cB2DCEC, Broken LCD
	}
	
	if InStr(Filend, "item_barter_other_cloth_aramid")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% cB2DCEC, Aramid Cloth
	}
	
	if InStr(Filend, "item_barter_electr_relay")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% cB2DCEC, Phase Relay
	}
	
	if InStr(Filend, "ITEM_PATH")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, ITEM_SHORT_NAME
	}
	
	if InStr(Filend, "ITEM_PATH")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, ITEM_SHORT_NAME
	}
	
	;╔═════Weapons═════╗
	Gui, Font, s10, Segoe UI
	Gui, Add, Text, x5 y290 cWhite,╔═════Weapons═════╗
	
	if InStr(Filend, "weapon_remington_r11_rsass_762x51")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, x15 cYellow, RSASS
	}
	
	if InStr(Filend, "weapon_izhmash_svd_s_762x54_container")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, SVD
	}
	
	if InStr(Filend, "weapon_springfield_m1a_762x51_container")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, Springfield M1A
	}
	
	if InStr(Filend, "weapon_colt_m4a1_556x45_container")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, M4A1
	}
	
	if InStr(Filend, "weapon_dt_mdr")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, DT-MDR
	}
	
	if InStr(Filend, "weapon_tochmash_val_9x39_container")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, AS VAL
	}
	
	if InStr(Filend, "weapon_lobaev_dvl")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, DVL-10
	}
	
	if InStr(Filend, "weapon_izhmash_mosin_rifle_762x54_container")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, Mosin
	}
	
	if InStr(Filend, "weapon_izhmash_mosin_infantry_762x54_container")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, Mosin Infantry
	}
	
	if InStr(Filend, "weapon_izhmash_sv-98_762x54r_container")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, SV-98
	}
	
	if InStr(Filend, "weapon_remington_model_700_762x51_container")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, M700
	}
	
	if InStr(Filend, "weapon_izhmash_rpk16_545x39_container")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, RPK-16
	}
	
	if InStr(Filend, "weapon_tochmash_vss_9x39")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, VSS
	}
	
	if InStr(Filend, "weapon_lone_star_tx15_designated_marksman_556x45")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, TX-15
	}
	
	if InStr(Filend, "weapon_orsis_t5000_762x51")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, Orisis T-5000
	}
	
	if InStr(Filend, "weapon_tochmash_sr1mp_9x21")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, SR1MP
	}
	
	if InStr(Filend, "weapon_dsa_sa58_762x51")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, SA-58
	}
	
	if InStr(Filend, "weapon_grenade_rdg2")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, RDG2 Grenade
	}
	
	if InStr(Filend, "weapon_fn_p90_57x28")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, FN P90
	}
	
	if InStr(Filend, "weapon_sig_mpx_9x19")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, SIG MPX
	}
	
	if InStr(Filend, "weapon_hk_mp7")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, MP7
	}
	
	if InStr(Filend, "weapon_grenade_m67")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, M67 Grenade
	}
	
	if InStr(Filend, "weapon_grenade_m18")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, M18 Grenade
	}
	
	if InStr(Filend, "weapon_hk_416a5_556x45")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, HK416
	}
	
	if InStr(Filend, "weapon_fn_five_seven_57x28")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, Fiveseven
	}
	
	if InStr(Filend, "weapon_grenade_f1")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, F1 Grenade
	}
	
	if InStr(Filend, "weapon_grenade_chattabka_vog17")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, VOG 17 Grenade
	}
	
	if InStr(Filend, "weapon_grenade_chattabka_vog25")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, VOG 25 Grenade
	}
	
	if InStr(Filend, "weapon_ckib_ash_12_127x55")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, ASH-12
	}
	
	if InStr(Filend, "weapon_adar")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, ADAR
	}
	
	if InStr(Filend, "weapon_glock_glock_18c_gen3_9x19")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, Glock 18c
	}
	
	if InStr(Filend, "weapon_glock_glock_17_gen3_9x19")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, Glock 17
	}
	
	if InStr(Filend, "weapon_hk_mp5")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, MP5
	}
	
	if InStr(Filend, "weapon_kac_sr25")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, SR-25
	}
	
	if InStr(Filend, "ITEM_PATH")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, ITEM_SHORT_NAME
	}
	
	if InStr(Filend, "ITEM_PATH")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, ITEM_SHORT_NAME
	}
	
	if InStr(Filend, "ITEM_PATH")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, ITEM_SHORT_NAME
	}
	
	if InStr(Filend, "ITEM_PATH")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, ITEM_SHORT_NAME
	}
	
	if InStr(Filend, "ITEM_PATH")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, ITEM_SHORT_NAME
	}
	
	if InStr(Filend, "ITEM_PATH")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, ITEM_SHORT_NAME
	}
	
	if InStr(Filend, "ITEM_PATH")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, ITEM_SHORT_NAME
	}
	
	if InStr(Filend, "ITEM_PATH")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, ITEM_SHORT_NAME
	}
	
	if InStr(Filend, "ITEM_PATH")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, ITEM_SHORT_NAME
	}
	
	if InStr(Filend, "ITEM_PATH")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, ITEM_SHORT_NAME
	}
	
	if InStr(Filend, "ITEM_PATH")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, ITEM_SHORT_NAME
	}
	
	if InStr(Filend, "ITEM_PATH")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, ITEM_SHORT_NAME
	}
	
	if InStr(Filend, "ITEM_PATH")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, ITEM_SHORT_NAME
	}
	
	if InStr(Filend, "ITEM_PATH")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, ITEM_SHORT_NAME
	}
	
	if InStr(Filend, "ITEM_PATH")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, ITEM_SHORT_NAME
	}
	
	if InStr(Filend, "ITEM_PATH")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, ITEM_SHORT_NAME
	}
	
	if InStr(Filend, "ITEM_PATH")
	{
		Gui, Font, s10, Segoe UI
		Gui, Add, Text, %space% c6EF834, ITEM_SHORT_NAME
	}
	
}


Gui, Font, s7
;Gui, Add, Button, x90 y460 w75 h20 gButton, Display Full File
Gui, Font, s8
;Gui, Add, Button, x10 y460 w75 h20 gE_R, Exit script



