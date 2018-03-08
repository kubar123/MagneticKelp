#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
#SingleInstance force
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
MouseGetPos, OutputVarX, OutputVarY			;Mouse position
;Menu Tray, Icon, C:\Users\Admin\Pictures\favicon.ico 			;tray icon - optional



;=========================================== GLOBAL SETTINGS ============================
;APP_FOLDER_LOCATION:=%A_AppData%
IniLocation= %A_AppData%\magneticKelp\settings.ini
ExeLocation=%A_AppData%\magneticKelp\magneticKelp.exe
PROGRAM_VERSION=0.4.0
GITHUB_API_URL=https://api.github.com/repos/kubar123/magneticKelp/releases/latest

LOCATION_QBIT=C:\Program Files (x86)\qBittorrent\qbittorrent.exe
LOCATION_UTORRENT=%A_AppData%\uTorrent\uTorrent.exe
LOCATION_DELUGE=C:\Program Files (x86)\Deluge\deluge.exe
;==============================================	/END GLOBAL ==============================

;---------------------------------- 	MAIN 	-------------------
makeMainWindow()
;checkForNewVersions()

;addShortcutsToStartMenu()
firstTimeCheck()	

populateFromFile()

; IfNotExist, %IniLocation%
; 	makeIniFile()

betaFeatureDisable()
return
; -----------------------------------------------------------------

menuGithub:
run https://github.com/kubar123/MagneticKelp
return

;==================================================================================================================================
;-----------------------------------------------FRONT END - GUI -------------------------------------------------------------------
;==================================================================================================================================
menuHandler:
;menuPreferences:
editMenu:
return
		;__________________________MAIN WINDOW_________________________
makeMainWindow(){
	global

	Gui 1:-MinimizeBox -MaximizeBox +AlwaysOnTop
	Gui 1:Add, Button, Default gStreamButton x40 y56 w89 h23, Stream
	Gui 1:Add, DropDownList, hWndlistStream vStreamWith x88 y24 w68 +Sort Lowercase, potplayer|vlc||airplay|mplayer|smplayer|mpv|omx|webplay
	Gui 1:Add, GroupBox, x8 y2 w153 h88, Stream
	Gui 1:Add, CheckBox, vListPeerflix x16 y24 w68 h23, List files
	Gui 1:Font, s20 Bold
	;Gui 1:Add, Button, hWndButton4 vBtnSettings gBtnSettings x292 y2 w25 h25, ⚙
	Gui 1:Font
	Gui 1:Add, GroupBox, x168 y2 w121 h88, Download
	Gui 1:Add, Button, gbtnDownload x192 y56 w80 h23, Download
	Gui 1:Add, DropDownList, vDownloadWith x184 y24 w91, QbitTorrent||μTorrent|Deluge|Bittorrent
	Gui 1:Font, s18
	Gui 1:Add, Button, hWndBtnStreamCustom gbtnStreamCustom x130 y56 w23 h23, ⚙
	Gui 1:Font
	Gui 1:Font, s14
	Gui 1:Add, Button, hWndButton8 gBtnPopcornTime x16 y56 w23 h23, 🍿
	Gui 1:Font
	Gui 1:Add, ActiveX, x10 y91 w280 h30 vwb, Shell.Explorer
	
	;---------------- MENU BAR ----------------------------	
	Menu HelpMenu, Add, &About, menuAbout
	Menu HelpMenu, Icon, &About, shell32.dll, 24

	Menu EditMenu, Add, Preferences, MenuPreferences
	Menu EditMenu, Add, Add shortcut to start , addShortcutsToStartMenu
	Menu EditMenu, Icon, Add shortcut to start , imageres.dll, 4
	
	;Menu HelpMenu, Add, Github, MenuHandler
	Menu HelpMenu, Add, Github, menuGithub

	Menu HelpMenu, Add, Check for updates, menuUpdater
	Menu HelpMenu, Icon, Check for updates, shell32.dll, 239
	;Menu HelpMenu, Add, Github, menuGithub

	
	Menu MenuBar, Add, &Edit, :EditMenu
	Menu MenuBar, Add, Help, :HelpMenu

	
	;Menu MenuBar, Add, &Edit, EditMenu

	
	Gui Menu, MenuBar

;-----------------------------------------

;---------Drag and drop files -----------
	;Active X information---------
	wb.silent:=True 	;no 'script error' warnings

	wb.Navigate("about:tabs")

	;-----HTML-------
	html:="<html onContextMenu='return false;' ><head onContextMenu='return false;'>"
	html.="<style>body{ margin: 0; padding: 0; background-color:#f1f1f1; height:100%; overflow:hidden; filter:alpha(opacity=60); border-style:dashed; border-width:1px; }, "
	html.="div { padding-top:4px; height:100%; overflow:hidden; font-family: 'Kalam'; -ms-user-select: none; cursor:default; text-align: center;  }</style>"
	html.="</head><body><div id='mainText' unselectable='on' onContextMenu='return false;'>"
	;html.="<div onContentMenu='return false;'><img onContentMenu='return false;' width='300' height='60' src='D:\OneDrive\git\MagneticKelp\download.png'/>"
	;check to see if magnet link is already loaded
	if(%1% =="")
		html.="Drop magnet links here"
	else 
		html.="Magnet Loaded"
	
	html.="</div></body></html>"
	wb.document.write(html)
	;----END HTML
	ComObjConnect(wb, "IE_")


;----- Check hover -------
	MyWindowID := WinExist()
	SetTimer, CheckHover, 900
	Process,Exist
;-------------------------
	
	Gui 1:Show, w320 h124 x-500 y-500, MagneticKelp

}
		;______________________SETTINGS WINDOW ________________________
makeSettingsWindow(){
	global
	Gui 3:-MinimizeBox -MaximizeBox +AlwaysOnTop 
	Gui 3:Add, Button, gBtnSettingsCancel x256 y368 w80 h23, Cancel
	Gui 3:Add, Button, gBtnSettingsOk x168 y368 w80 h23, &OK
	Gui 3:Add, Tab3, x8 y8 w336 h359, Behavior||Software

;----------------------- ---------- 	TAB 1
	Gui 3:Tab, 1
	Gui 3:Add, GroupBox, x16 y40 w310 h75, Selected by default
	Gui 3:Add, Text, x24 y56 w80 h23 +0x200, Stream:
	Gui 3:Add, Text, x24 y80 w80 h23 +0x200, Download:
	Gui 3:Add, DropDownList, vDefaultSream x112 y56 w170, potplayer|vlc||airplay|mplayer|smplayer|mpv|omx|webplay
	Gui 3:Add, DropDownList, vDefaultDownload x112 y80 w170, QbitTorrent||μTorrent|Deluge|Bittorrent

	Gui 3:Add, GroupBox, x16 y120 w310 h140, Desktop
	Gui 3:Add, CheckBox, vReuseCmd x24 y136 w215 h23, Reuse Command Prompt when possible
	;Gui 3:Add, CheckBox, x24 y160 w215 h23 +Disabled, Close media player on exit
	Gui 3:Add, CheckBox, x24 y210 w215 h23 +Disabled, Open to mouse cursor
	Gui 3:Add, GroupBox, x16 y264 w310 h97, File association
	Gui 3:Add, Button, gBtnAssMagnet x24 y325 w122 h23 0x50012000, Associate magnet links
	Gui 3:Add, Button, gBtnAssTorrent x24 y297 w122 h23, Associate .torrent files
	Gui 3:Add, DropDownList, vOpenOnMonitor x120 y232 w48
	Gui 3:Add, Text, x24 y232 w88 h23 +0x200, Open on monitor:
	Gui 3:Add, CheckBox, gBtnEndStream vBtnEndStream x24 y161 w215 h23, End peerflix stream on exit of player
	Gui 3:Add, Text, x24 y280 w280 h17, You can associate files to be opened with this application.

	Gui 3:Add, Edit, vTxtTimeout x145 y186 w51 h21 +Number Center, 45
	Gui 3:Add, Text, x24 y186 w120 h23 +0x200, No player found timeout:
	Gui 3:Add, Text, x199 y186 w66 h23 +0x200, Seconds

;---------------------	------------	TAB 2
	Gui 3:Tab, 2
	Gui 3:Add, GroupBox, x16 y40 w310 h187, Program directory location
	Gui 3:Add, Edit, vTxtQbitTorrent x88 y60 w192 h15 -0x800000 -E0x20201 +ReadOnly, ---
	Gui 3:Add, Text, x24 y60 w62 h13 +0x200, Qbittorrent:
	Gui 3:Add, Button, gBtnQbitSelect x296 y60 w18 h18, ...
	Gui 3:Add, Text, x24 y84 w62 h13 +0x200, μTorrent:
	Gui 3:Add, Edit, vTxtUTorrent x88 y84 w192 h13 -0x800000 -E0x20201 +ReadOnly, ---
	Gui 3:Add, Button, gBtnUtorrentSelect x296 y84 w18 h18, ...
	Gui 3:Add, Text, x24 y108 w62 h13 +0x200, Deluge:
	Gui 3:Add, Edit, vTxtDeluge x88 y108 w192 h13 -0x800000 -E0x20201 +ReadOnly, ---
	Gui 3:Add, Button, gBtnDelugeSelect x296 y108 w18 h18, ...
	Gui 3:Add, Text, x24 y132 w62 h13 +0x200, Bittorrent:
	Gui 3:Add, Edit, vTxtBittorrent x88 y132 w192 h13 -0x800000 -E0x20201 +ReadOnly, ---
	Gui 3:Add, Button, gBtnBittorrentSelect x296 y132 w18 h18, ...
	Gui 3:Add, Text, x24 y156 w62 h13 +0x200, Popcorntime:
	Gui 3:Add, Edit, vTxtPopcorntime x88 y156 w192 h13 -0x800000 -E0x20201 +ReadOnly, ---
	Gui 3:Add, Button, gBtnPopcorntimeSelect x296 y156 w18 h18, ...
	Gui 3:Add, Text, x88 y100 w198 h2 0x10
	Gui 3:Add, Text, x88 y76 w196 h2 0x10
	Gui 3:Add, Text, x88 y124 w196 h2 0x10
	Gui 3:Add, Text, x88 y148 w196 h2 0x10
	Gui 3:Add, Text, x88 y172 w196 h2 0x10
	Gui 3:Add, Button, gBtnResetDefault x24 y194 w80 h23, Defaults

	Gui 3:Show, x-500 y-500 w356 h396, Settings
}

;____________________CUSTOM Stream Button _______________________

makeStreamCustomWindow(){
	global 
	Gui 2:-MinimizeBox -MaximizeBox +AlwaysOnTop
	Gui 2:Add, Edit, vTxtCustomStream x8 y24 w120 h21
	Gui 2:Add, Button, Default gBtnStreamCustomGo x32 y48 w80 h23, &OK
	Gui 2:Add, Text, x8 y0 w120 h23 +0x200, Peerflix Options
	
	Gui 2:Show, w136 h81, Window
}

; GuiSize:
;     If (A_EventInfo == 1)
;         Return
; 	Return
2GuiClose:
3GuiClose:
GuiClose:
;TODO save position of gui for future start
ExitApp 
;==================================================================================================================================
;----------------------------------------------------------------------------------------------------------------------------------
;==================================================================================================================================




;TODO remove when features working
betaFeatureDisable(){
	 GuiControl,Disable, Button7
	 ;GuiControl,Disable, Button7
	 ;GuiControl,Disable, Button10
}

;----------------- 




;==================================================================================================================================
;-----------------------------------------------TOOLTIP HOVER CHECK----------------------------------------------------------------
;==================================================================================================================================

CheckHover:
  	Gui, +LastFound
	;gets informatiom about the position of the mouse
	MyWindowID := WinExist()
	MouseGetPos,,,windowID, controlID, 2

;___________________________Stream ____________________________________
; ensure mouse is inside the 'Stream' window
	if WinActive("MagneticKelp"){

		if (windowID=MyWindowID){
			;gets the position of the element which is under the mouse
			
		  ;MsgBox %varX% %varWidth% - %varWidth%
			;MsgBox %MyWindowID% and %windowID% - and %controlID% and %Button4%

		;-- settings/ configuration button check
		 ;  	if(controlID = Button4){
		 ;  		;get position of the button
		 ;  		ControlGetPos,varX,varY,varWidth,varHeight,Button4,MagneticKelp,,,
			; 	varX+=varWidth	; change the location of the tooltip X value to be 
			; 					;to the right of the win
		 ;    ;Sleep, 50
		 ;    ;if(windowID)
		 ;    	ToolTip, Global settings and configuration, %varX%, %varY%
		 ;    ;ToolTip, [ test, X, Y, WhichToolTip]
		 ;    	return
			; }
			if(controlID=Button8){
				ControlGetPos,varX,varY,varWidth,varHeight,Button7,MagneticKelp,,,
				varX+=varWidth	; change the location of the tooltip X value to be 
				varY+=varHeight	;to the right of the win

		    	ToolTip, Popcorntime, %varX%, %varY%
		    	return
			}
			if(controlID=BtnStreamCustom){
				;ControlGetPos,varX,varY,varWidth,varHeight,BtnStreamCustom,Stream,,,
				ControlGetPos,varX,varY,varWidth,varHeight,Button6,MagneticKelp,,,
				VarX+=varWidth
				;varY+=varHeight	;to the right of the win

				ToolTip, Custom peerflix, %varX%, %varY%
				return
			}
		}
	}
;---------- end of check, display no tooltip
  	ToolTip, 
  	return
;==================================================================================================================================
;----------------------------------------------------------------------------------------------------------------------------------
;==================================================================================================================================



;==================================================================================================================================
;-----------------------------------------------Actions/Buttons -------------------------------------------------------------------
;==================================================================================================================================

;========================= MENU BAR ==========================
;------------ Menu Updater -----------------
menuUpdater:
	checkForNewVersions()
	return
;----------- Menu About -------------------
menuAbout:
MsgBox,262144,About,MagneticKelp`nVersion %PROGRAM_VERSION% `n©Jakub Rybicki
return




;=============================================================
; ----------Drag and drop file ------------
GuiDropFiles:
	1=%A_GuiEvent%
	animateTorrentLoaded(1)
	return


;------------- Stream Custom ---------------
BtnStreamCustom:
	Gui, 1:Submit, NoHide
	Gui, 1:Destroy
	makeStreamCustomWindow()
	Return 		;waiting on submit button


;------------ Stream Custom 'ok' Button ----
BtnStreamCustomGo:
	Gui, 2:Submit
	mainLink = %1%

	makePeerflix(mainLink,TxtCustomStream)
	ExitApp, 1


;------------- Main Window -----------------
menuPreferences:
BtnSettings:
;global StreamWit
	gui,1:hide
	makeSettingsWindow()
	populateSettingsFromFile()
	centerWindow("Settings")
	return


;----------- Stream button ----------------
StreamButton:
	Gui, 1:Submit, NoHide
	Gui, 1:Destroy

	mainLink = %1%
	makePeerflix(mainLink,"--"StreamWith,ListPeerflix)
	ExitApp


;--------- Download Button ---------------
btnDownload:
	Gui, 1:Submit, NoHide
	
	;find which dropdown is selected
	if(DownloadWith = "QbitTorrent"){
		IniRead, progLocation, %IniLocation%, programLocation, qbittorrent
	}
	else if(DownloadWith = "μTorrent"){
		IniRead, progLocation, %IniLocation%, programLocation, uTorrent
	}else if(DownloadWith = "Deluge"){
		IniRead, progLocation, %IniLocation%, programLocation, deluge
	}else if(DownloadWith = "Bittorrent"){
		IniRead, progLocation, %IniLocation%, programLocation, Bittorrent
	}

	else{
		MsgBox,262144,, Uhh... [DL BTN-SelectionOutOfBounds] Error
		ExitApp
	}
	Run %progLocation% "%1%"
	
	ExitApp



;----------- Popcorntime -------------------
BtnPopcorntime:
; TODO ... Popcorntime (opening arguments issue)
	Return

BtnEndStream:
	return


;----------------------------Settings -------------------------------
;Assign .torrent files as default
BtnAssTorrent:
		;TODO A lot of stuff... ...
;Check which windows version the user is using

	;----Windows 10 ----
	; %AppData%\Microsoft\Windows\Start Menu\Programs
	;C:\ProgramData\Microsoft\Windows\Start Menu\Programs
	;https://msdn.microsoft.com/en-us/library/windows/desktop/bb762494.aspx
	;assoc .torrent=magneticKelp
	;ftype magneticKelp=%appData%\magneticKelp\magneticKelp.exe "%1"
	;regsvr32 /i shell32.dll
	if(A_IsAdmin){
		run cmd.exe,,,streamWindow
		WinWait, ahk_pid %streamWindow%
		Send assoc .torrent=magneticKelp {enter}
		Send ftype magneticKelp=%appData%\magneticKelp\magneticKelp.exe "`%1" {enter}
		Send regsvr32 /i shell32.dll {enter}
		
		;RegWrite,REG_SZ,HKEY_CURRENT_USER,Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.torrent\OpenWithList,z,magneticKelp


		;RegWrite,REG_SZ,HKEY_CLASSES_ROOT,.torrent,,magneticKelp
		;RegWrite,REG_SZ,HKEY_CLASSES_ROOT,.torrent,Content Type,application/x-bittorrent


	}Else{
		msgbox,262144,Run as admin..., Please run the application as Administrator, or manually change the setting.
		return
	}
return


; Assign magnet links as default
BtnAssMagnet:
	assignMagnetLink()
	return


;-------- Save settings button ----------------------
BtnSettingsOk:
	Gui, 3:Submit,

	;--------Selected By default ---------------------
	IniWrite,%DefaultSream%,%IniLocation%,Defaults,defaultStreamer
	iniWrite,%DefaultDownload%,%IniLocation%,Defaults,defaultDownloader

	;-----------Desktop ------------------------------
	IniWrite,%ReuseCmd%,%IniLocation%,Defaults,reuseCmd
	;TODO Close media on Exit
	;End peerflix stream on Exit of player:
	IniWrite, %BtnEndStream%, %IniLocation%,Defaults,endStream
	iniWrite,%TxtTimeout%,%IniLocation%,Defaults,timeout
	;Open to mouse Cursor
	IniWrite,%OpenOnMonitor%,%IniLocation%,Defaults,defaultMonitor

	;------------------[TAB 2]____Software Tab-------
	IniWrite,%TxtQbitTorrent%,%IniLocation%,programLocation,qbittorrent
	IniWrite,%TxtUTorrent%,%IniLocation%,programLocation,uTorrent
	IniWrite,%TxtDeluge%,%IniLocation%,programLocation,deluge
	IniWrite,%TxtBittorrent%,%IniLocation%,programLocation,bittorrent

	;TxtPopcorntime

	;---Actions------
	Gui, 3:Destroy
	populateFromFile()
	;centerWindow("MagneticKelp")
	Gui, 1:show
	return


BtnSettingsCancel:
	Gui, 3:Destroy
	Gui, 1:Show

	return


;---------settings tab 2 --------------

BtnQbitSelect:
	pickFileAndUpdateGui("*.exe","txtQbitTorrent")
	return

BtnUTorrentSelect:
	pickFileAndUpdateGui("*.exe","TxtUtorrent")
	return

BtnDelugeSelect:
	pickFileAndUpdateGui("*.exe","TxtDeluge")
	return

BtnBittorrentSelect:
	pickFileAndUpdateGui("*.exe","TxtBittorrent")
	return

BtnPopcorntimeSelect:
	pickFileAndUpdateGui("*.exe","TxtPopcorntime")
	return

BtnResetDefault:
	IniWrite,%LOCATION_QBIT%,%IniLocation%,programLocation,qbittorrent
	IniWrite,%LOCATION_UTORRENT%,%IniLocation%,programLocation,uTorrent
	IniWrite,%LOCATION_DELUGE%,%IniLocation%,programLocation,deluge
	return



;==================================================================================================================================
;----------------------------------------------------------------------------------------------------------------------------------
;==================================================================================================================================



;==================================================================================================================================
;-----------------------------------------------Functions ----- -------------------------------------------------------------------
;==================================================================================================================================

;------ActiveX / Drag and drop magnet links -----------
IE_BeforeNavigate2(p*) {
	Global 
	;Use entered link (anyway). Might aswell - this is a warning, not hard check.
	;	 Dont want false positives
	1=% p.2

	;verify that the entered link is a magnet link:
	; magnet:\?xt=urn:[a-z0-9] /i
	isMagnetLink:=RegExMatch(p.2, "magnet:\?xt=urn:[a-z0-9]")
	if(isMagnetLink){
		animateTorrentLoaded(1)
	}	Else{
		animateTorrentLoaded(2)
	}
 	NumPut(true, ComObjValue(p.7))

 ; MsgBox % p.2
 	
 	;animateTorrentLoaded(1)
}



;Setting 1 = Torrent loaded correctly
;Setting 2 = Torrent warning. Loaded, but does not appear to be a valid torrent
animateTorrentLoaded(setting=0){
	Global
	Gui 1:Hide
 	sleep, 50
 	Gui 1:Show
 	if(setting=1){
	 	html.="<script>document.getElementById('mainText').innerHTML='Torrent loaded';</script>"
	 	html.="<style>body {border-color:#0080ff; border-width: 2px;}</style>"
	}else if(setting=2){
		html.="<script>document.getElementById('mainText').innerHTML='Not a valid torrent';</script>"
	 	html.="<style>body {border-color:#FF4500; border-width: 2px;}</style>"
	}

	wb.document.write(html)
}



;_________________________________________________________________________

;makes the .ini file if not already present, and sets the values to default.
;You can call this function to reset the settings to default
makeIniFile(){
	Global

	;--------Selected By default ---------------------
	IniWrite,vlc,%IniLocation%,Defaults,DefaultStreamer
	iniWrite,qbittorrent ,%IniLocation%,Defaults,defaultDownloader
	IniWrite,%PROGRAM_VERSION%,%IniLocation%,Defaults,LastVersionRan

	;-----------Desktop ------------------------------
	IniWrite,1,%IniLocation%,Defaults,reuseCmd
	;TODO Close media on Exit
	IniWrite,0, %IniLocation%,Defaults,endStream
	iniWrite,45,%IniLocation%,Defaults,timeout
	;Open to mouse Cursor
	IniWrite,1,%IniLocation%,Defaults,defaultMonitor
	IniWrite,`n,%IniLocation%, Defaults, `n

	;------------------[TAB 2]____Software Tab-------
	IniWrite,%LOCATION_QBIT%,%IniLocation%,programLocation,qbittorrent
	IniWrite,%LOCATION_UTORRENT%,%IniLocation%,programLocation,uTorrent
	IniWrite,%LOCATION_DELUGE%,%IniLocation%,programLocation,deluge
	;IniWrite,--,%IniLocation%,programLocation,bittorrent
	;IniWrite,--,%IniLocation%,programLocation,popcorntime
}


assignMagnetLink(){
	; ----------------- Current user -------------
	RegWrite,REG_SZ,HKEY_CURRENT_USER,Software\Classes\magnet,,URL:Magnet link
	RegWrite,REG_SZ,HKEY_CURRENT_USER,Software\Classes\magnet,Content Type,application/x-magnet
	RegWrite,REG_SZ,HKEY_CURRENT_USER,Software\Classes\magnet\shell,,open

	RegWrite,REG_SZ,HKEY_CURRENT_USER,magnet\shell\open\command,,"%A_AppData%\MagneticKelp\magneticKelp.exe" "`%1"

; ----------------- classes Root -------------
	RegWrite,REG_SZ,HKEY_CLASSES_ROOT,magnet,,URL:Magnet link
	RegWrite,REG_SZ,HKEY_CLASSES_ROOT,magnet,Content Type,application/x-magnet
	RegWrite,REG_SZ,HKEY_CLASSES_ROOT,magnet\shell,,open

	RegWrite,REG_SZ,HKEY_CLASSES_ROOT,magnet\shell\open\command,,"%A_AppData%\MagneticKelp\magneticKelp.exe" "`%1"
;--------copy files ---------
	FileCreateDir, %A_AppData%\MagneticKelp
	FileCopy, %A_ScriptFullPath%,%A_AppData%\MagneticKelp\magneticKelp.exe,1
}

firstTimeCheck(){
	Global
	;MsgBox, %location%
	;see if Update
	;Msgbox %1%
	if (1 >< shortCutAddition)
		addShortcutsToStartMenu()
	if (1 >< update)
		runBatch()
		;msgBox verified update
	; if(1="update")
	; {
		
	; }

	IfNotExist, %IniLocation%
		notFirstTime()
    ;check if program is up to date
    IniRead, lastVerRan, %IniLocation%, Defaults, LastVersionRan
    if(lastVerRan < PROGRAM_VERSION){
    	MsgBox,64,Updated,You are running a new version of the application.`nMagneticKelp has been updated.
		IniWrite,%PROGRAM_VERSION%,%IniLocation%,Defaults,LastVersionRan
		FileCopy, %A_ScriptFullPath%,%A_AppData%\MagneticKelp\magneticKelp.exe,1

    }

	
}

notFirstTime(){
	makeIniFile()
;Assign as default magnet link check
	Msgbox, 262180,use for magnet links?, This appears to be your first time running this application. Set MagneticKelp to be the default application for magnet links?
	IfMsgBox No
		return
	ifMsgBox Yes
		assignMagnetLink()
}

;## Opens CMD window and starts peerflix 
;## magnet link, stream with (eg --potplayer / --vlc), Show list of files? (streaming multi )
;;Magnet link is required - "" should error, Stream with = , Show list of files
makePeerflix(MagnetLink="", Opts="", List=0){
	Global
	; ---- check to see if last PID (cmd window) is still open
	IniRead, lastPid, %IniLocation%, Peerflix, lastPID
	IniRead, reuseCmd, %IniLocation%, Defaults, reuseCmd
	IniRead, endStream, %IniLocation%,Defaults,endStream
	IniRead, timeout, %IniLocation%,Defaults,timeout


;TODO new line brackets forced? Error on inline brackets
	;MsgBox %reuseCmd%
	if(reuseCmd){
			;msgBox reusing...
		If WinExist("ahk_pid "lastPid)
		{
			;msgBox, Exist
			
			WinActivate, % "ahk_pid " lastPid
			Send ^c ^c ;{enter}		;end current stream
			WinWait, ahk_pid %lastPid%
			Send ^c
		}
	}

	IfWinNotExist, % "ahk_pid " lastPid
	{
		;Saving PID to file - Reuse old CMD if still open
		run cmd.exe,,,streamWindow
		IniWrite,%streamWindow%,%IniLocation%,Peerflix,lastPID
		WinWait, ahk_pid %streamWindow%
		Send cd .. {enter}
		
	}

	;Return

	
	; ---- TODO -------
	; close potplayer/vlc if already open with localhost...
	;Window title: 		http://localhost:8888/ - PotPlayer
	; Save PID of new player to be closed at next run
	;------------------


	; ___ LIST FILES CHECK ______________________
	if List = 1
		Send peerflix -l "%MagnetLink%" %Opts% {enter}
	if List = 0
		Send peerflix "%MagnetLink%" %Opts% {enter}
	;____________________________________________

	; ------------------------------------------------------------------------------------------------------------
;---------------------- End stream when player is closed ---------------------------------------------------------
	if(endStream){
		IniRead, lastPid, %IniLocation%, Peerflix, lastPID
		;wait x secs to attach to process
		timeout:=timeout*1000
		sleep, timeout


		playerPID:=""
		if(Opts = "--potplayer"){
			WinGet, playerPID,PID, http://localhost:8888/ - PotPlayer
		}else if(Opts="--vlc"){
			WinGet, playerPID,PID, http://localhost:8888/ - VLC media player
		}
		else{
			Msgbox,Media player not supported,, End stream not supported with this player.,5
			Exitapp
		}

	
		
		if (!playerPID){
			msgbox player not found!
			ExitApp
		}
		WinWaitClose, ahk_pid %playerPID%
		WinClose,ahk_pid %lastPid%,,,,
	}
}



;convert text into switch for peerflix stream
; currently unneeded - only use when "--" + ComboBox value does not make correct option

;getSwitchUsing(textInfo="error"){
;	;MsgBox inside switch %textInfo%
;	;MsgBox, % textInfo
;	if (textInfo = "omx")
;		return "--omx"
;	if textInfo = "error"
;		MsgBox "Error"
;	if (textInfo="potplayer")
;		return "--potplayer"
;}
;

;centers the window to the middle of the 'default monitor'
centerWindow(WinTitle=""){
	Global
	;select default screen
    IniRead, DefaultMonitor, %IniLocation%, defaults, defaultMonitor
    ;GuiControl,ChooseString,ComboBox3,%DefaultMonitor%
    ;set to MONITOR BELOW
    Sysget,area1,Monitor,%DefaultMonitor%

    ;MsgBox, Left: %area1Left% -- Top: %area1Top% -- Right: %area1Right% -- Bottom %area1Bottom%.
    
    ;to center window via middle of screen, not left top corner
    winGetPos,,,width,height,A

    movTop:=((area1Top+area1Bottom)/2)-(height/2)
    movLeft:=((area1Left+area1Right)/2)-(width/2)
    
   ; MsgBox %movTop% - %movLeft%
    WinMove,%WinTitle%,, %movLeft%,%movTop%
}



;populates the main window from the settings.ini file
populateFromFile(){
	Global
	IniRead, DefaultStreamComboBox, %IniLocation%, defaults, defaultStreamer
	IniRead, DefaultDownloadBox, %IniLocation%, defaults, defaultDownloader

	GuiControl,1:ChooseString,ComboBox1,%DefaultStreamComboBox%
;AHK Bug? ChooseString does not select String with 'µ' character.
	if(DefaultDownloadBox="µTorrent")
		GuiControl,1:Choose,ComboBox2,2	;2nd option = µtorrent
	else
		GuiControl,1:ChooseString,ComboBox2,%DefaultDownloadBox%
	centerWindow("MagneticKelp")
	
}

populateSettingsFromFile(){
	Global
	centerWindow("Settings")

;-----------Tab 1 ------------------
	IniRead, DefaultStreamComboBox, %IniLocation%, defaults, defaultStreamer
    GuiControl,3:ChooseString,ComboBox1,%DefaultStreamComboBox%
    
    IniRead, DefaultDlComboBox, %IniLocation%, defaults, defaultDownloader
    if(DefaultDlComboBox="µTorrent")
		GuiControl,3:Choose,ComboBox2,2	;2nd option = 
	else
		GuiControl,3:ChooseString,ComboBox2,%DefaultDlComboBox%
    ;GuiControl,3:ChooseString,ComboBox2,%DefaultDlComboBox%
	;Reuse CMD
    IniRead, ReuseCmd, %IniLocation%, defaults, reuseCmd
    GuiControl,3:,ReuseCmd,%ReuseCmd%
    
    ;end peerflix stream on exit of player
    iniRead, endStream, %IniLocation%,defaults, endStream
    GuiControl,3:,BtnEndStream, %endStream%

    ;Timeout
    iniRead,timeout,%IniLocation%,defaults,timeout
    GuiControl,3:,TxtTimeout,%timeout%

    ;Calculate the amount of screens, and populate the GUI comboBox
    SysGet,countMonitor,MonitorCount
    Loop, %countMonitor%{   ;populate dropdowb based on amount of screens
        ;MsgBox Monitor # %A_Index%
        GuiControl,3:,ComboBox3,%A_Index%
    }  
    
    ;select default screen
  	IniRead, DefaultMonitor, %IniLocation%, defaults, defaultMonitor
   	GuiControl,3:ChooseString,ComboBox3,%DefaultMonitor%


;-----------Tab 2 ------------------
	IniRead, DefaultLocation, %IniLocation%, programLocation, qbittorrent
    GuiControl,3:,Edit2,%DefaultLocation%
    IniRead, DefaultLocation, %IniLocation%, programLocation, uTorrent
    GuiControl,3:,Edit3,%DefaultLocation%
    IniRead, DefaultLocation, %IniLocation%, programLocation, deluge
    GuiControl,3:,Edit4,%DefaultLocation%
    IniRead, DefaultLocation, %IniLocation%, programLocation, bittorrent
    GuiControl,3:,Edit5,%DefaultLocation%
    IniRead, DefaultLocation, %IniLocation%, programLocation, popcorntime
    GuiControl,3:,Edit6,%DefaultLocation%


    return
}

	;----------------- Settings-----------------------
	;File picker
pickFileAndUpdateGui(filter="",elementName=""){
	FileSelectFile, destinationPath,3,, Select file location,%filter%
	if ErrorLevel
		Return
	GuiControl,,%elementName%,%destinationPath%
}
addShortcutsToStartMenu:
addShortcutsToStartMenu()
return
addShortcutsToStartMenu(){
	Global

	if(!A_IsAdmin){
		Run *RunAs "%A_ScriptFullPath%" "shortCutAddition"
		ExitApp
	}
	
	;TODO
	;Add shrotcuts for start menu
	;%programdata%\Microsoft\Windows\Start Menu\Programs\magneticKelp
	StartMenuLocation=%A_AppDataCommon%\Microsoft\Windows\Start Menu\Programs\magneticKelp
	FileCreateDir, %startMenuLocation%
	FileCreateShortcut, %ExeLocation%,%startMenuLocation%\magneticKelp.lnk ,
	Msgbox,262144,magneticKelp, Done!
}



;==================================================================================================================================
;----------------------------------------------------------------------------------------------------------------------------------
;==================================================================================================================================


;============================================================UPDATE====================================================



checkForNewVersions(){
	Global
	;find latest released version
	whr := ComObjCreate("WinHttp.WinHttpRequest.5.1")
	whr.open("GET",GITHUB_API_URL,true)
	whr.Send()
	whr.waitForResponse()
	info:=whr.ResponseText

	;find the version
	latestVersion:=inStr(info,"tag_name")
	latestVersionNo:=SubStr(info,latestVersion+12,5) ;12 chars after the inStr starts version,

	
	;New update available
	if(PROGRAM_VERSION<latestVersionNo){
		;Find the changes description
		latestVersionDescNo:=inStr(info,"body")
		latestVersionText:=SubStr(info,latestVersionDescNo+7)
		;remove ending JSON tags
		latestVersionText:=SubStr(latestVersionText,1,strLen(latestVersionText)-2)
		latestVersionText=Current version: v%PROGRAM_VERSION% Latest version: v%latestVersionNo%`nUpdate now? `n`nChange log:`n%latestVersionText%
		;Format the text to remove MD tags (eg. ##, /n, /r)
		latestVersionText:=StrReplace(latestVersionText,"\n"," `n")
		latestVersionText:=StrReplace(latestVersionText,"##"," ---")
		latestVersionText:=StrReplace(latestVersionText,"\r"," ")


		;----Ask user to update----
		Msgbox,262180,New update found,%latestVersionText%
		IfMsgBox Yes
			newVersionUpdater(latestVersionNo)
		IfMsgBox No
			return
	}if(PROGRAM_VERSION>=latestVersionNo){
		MsgBox,262144,, You are running the latest version
		return 0
	}

	return 
}

newVersionUpdater(versionToDownload=0){
	Global
	Gui, 1:hide
	SplashTextOn,300,120,Update in progres..., The application might restart once after this message closes, a command window should flash for a second. `nOnce it closes the update has been completed.
	UrlLocation=https://github.com/kubar123/MagneticKelp/releases/download/v%versionToDownload%/magneticKelp.exe
	;MsgBox %UrlLocation%
	UrlDownloadToFile, %UrlLocation%, %ExeLocation%NEW
	;MsgBox %ExeLocation%

	;---- Making batch file-----
	;ping to wait until until window closes
	Str:="echo off `nping 127.0.0.1 -n 3 > nul`ndel %~dp0\magneticKelp.exe /q"
	Str.="`nren %~dp0\magneticKelp.exeNew magneticKelp.exe `n(goto) 2>nul & del ""%~f0"""
	FileAppend, %Str%, %A_AppData%/magneticKelp/info.bat
	sleep, 2000
	if(!A_IsAdmin){
		Run *RunAs "%A_ScriptFullPath%" "update"
		ExitApp
	}
	runBatch()
}
runBatch(){
	SplashTextOn,200,100,Update in progres...
	batchToRun=  %A_AppData%/magneticKelp/info.bat
	Run, %batchToRun%
	ExitApp
}

;===================================== END UPDATE ================================================
