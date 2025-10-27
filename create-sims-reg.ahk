; ================================
; Sims Registry Path Monitor + GUI
; AutoHotkey V1
; ================================

#SingleInstance Force
SetWorkingDir, %A_ScriptDir%

; ---------- GUI ----------
Gui, Add, Text, x20 y20 w400, ขั้นตอนที่ 1 : เลือกโฟลเดอร์ติดตั้งเกม The Sims 1 Complete Collection:
Gui, Add, Edit, x20 y45 w300 vGamePath
Gui, Add, Button, x330 y43 w70 gBrowseFolder, Browse

Gui, Add, Button, x50 y85 w150 gGenerate,   ขั้นตอนที่ 2 : Generate .reg
Gui, Add, Button, x220 y85 w150 gImport32,  ขั้นตอนที่ 3 : Import 32-bit
Gui, Add, Button, x220 y120 w150 gImport64, ขั้นตอนที่ 4 : Import 64-bit

; ข้อความเตือนสีแดง
Gui, Add, Text, x20 y150 w450 cRed, ขั้นตอนที่ 3-4 หลังกดจะปรากฏหน้ากดหน้าต่าง Register โปรดกด Yes ตามด้วย OK

; InstallPath 32-bit
Gui, Add, Text, x20 y172 w120, InstallPath (32-bit):
Gui, Add, Edit, x150 y170 w250 vPath32 ReadOnly

; InstallPath 64-bit
Gui, Add, Text, x20 y202 w120, InstallPath (64-bit):
Gui, Add, Edit, x150 y200 w250 vPath64 ReadOnly

Gui, Show, w490 h250, The Sims 1 : Complete Collection Thai Registry Generator fix

; ---------- Timer ตรวจ Registry ทุก 1 วินาที ----------
SetTimer, CheckRegistry, 1000
CheckRegistry: 
    ; อ่านค่า 32-bit
    RegRead, reg32, HKEY_LOCAL_MACHINE, SOFTWARE\Maxis\The Sims, InstallPath
    if ErrorLevel
        reg32 := "ยังไม่ได้ตั้งค่าตำแหน่งของเกม"
    GuiControl,, Path32, %reg32%
    
    ; อ่านค่า 64-bit
    RegRead, reg64, HKEY_LOCAL_MACHINE, SOFTWARE\WOW6432Node\Maxis\The Sims, InstallPath
    if ErrorLevel
        reg64 := "ยังไม่ได้ตั้งค่าตำแหน่งของเกม"
    GuiControl,, Path64, %reg64%
return

; -----------------------------
BrowseFolder:
    FileSelectFolder, SelectedPath, , 3, เลือกโฟลเดอร์เกม The Sims
    if (SelectedPath != "")
        GuiControl,, GamePath, %SelectedPath%
return

; -----------------------------
Generate:
    Gui, Submit, NoHide

    if (GamePath = "")
    {
        MsgBox, 48, Error, กรุณาเลือกโฟลเดอร์เกมก่อน
        return
    }

    ; Escape Backslashes for REG
    EscPath := StrReplace(GamePath, "\", "\\")
    SIMS_SOUND := EscPath . "\\SoundData"
    SIMS_DATA := EscPath
    InstallPath := EscPath

    ; ----- ลบไฟล์เก่า ถ้ามี -----
    Loop, 2
    {
        if (A_Index = 1)
            FileName := "sims-thai-fix-32bit.reg"
        else
            FileName := "sims-thai-fix-64bit.reg"

        if FileExist(FileName)
            RunWait, %ComSpec% /c attrib -R "%FileName%",, Hide
        FileDelete, %FileName%
    }

    ; ----- สร้างไฟล์ 32-bit -----
    RegContent32 =
(
Windows Registry Editor Version 5.00

[HKEY_LOCAL_MACHINE\SOFTWARE\Maxis]

[HKEY_LOCAL_MACHINE\SOFTWARE\Maxis\The Sims]
"SIMS_SKU"=dword:00000001
"SIMS_MUSIC"="D:\\"
"SIMS_SOUND"="%SIMS_SOUND%"
"SIMS_DATA"="%SIMS_DATA%"
"InstallPath"="%InstallPath%"
"Version"="1.2"
"Language"=dword:0000041e
"SIMS_LANGUAGE"="Thai"
"EPInstalled"="1"
"EP2Installed"="1"
"EP3Installed"="1"
"EP4Installed"="1"
"EPDInstalled"="1"
"EP5Installed"="1"
"EP6Installed"="1"
"EP7Installed"="1"
"EP8Installed"="1"
"EP3Patch"="2"
"EPDPatch"="1"
"EP5Patch"="1"
"Installed"="1"
"SIMS_GAME_EDITION"="255"
"TELEPORT"="1"
"SIMS_CURRENT_NEIGHBORHOOD_NUM"="1"
"SIMS_CURRENT_NEIGHBORHOOD_PATH"="UserData"

[HKEY_LOCAL_MACHINE\SOFTWARE\Maxis\The Sims Complete Collection]

[HKEY_LOCAL_MACHINE\SOFTWARE\Maxis\The Sims Complete Collection\1.00.000]

)
    StringReplace, RegContent32, RegContent32, %SIMS_SOUND%, %SIMS_SOUND%, All
    StringReplace, RegContent32, RegContent32, %SIMS_DATA%, %SIMS_DATA%, All
    StringReplace, RegContent32, RegContent32, %InstallPath%, %InstallPath%, All
    FileAppend, %RegContent32%, sims-thai-fix-32bit.reg

    ; ----- สร้างไฟล์ 64-bit -----
    RegContent64 =
(
Windows Registry Editor Version 5.00

[HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Maxis]

[HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Maxis\The Sims]
"SIMS_SKU"=dword:00000001
"SIMS_MUSIC"="D:\\"
"SIMS_SOUND"="%SIMS_SOUND%"
"SIMS_DATA"="%SIMS_DATA%"
"InstallPath"="%InstallPath%"
"Version"="1.2"
"Language"=dword:0000041e
"SIMS_LANGUAGE"="Thai"
"EPInstalled"="1"
"EP2Installed"="1"
"EP3Installed"="1"
"EP4Installed"="1"
"EPDInstalled"="1"
"EP5Installed"="1"
"EP6Installed"="1"
"EP7Installed"="1"
"EP8Installed"="1"
"EP3Patch"="2"
"EPDPatch"="1"
"EP5Patch"="1"
"Installed"="1"
"SIMS_GAME_EDITION"="255"
"TELEPORT"="1"
"SIMS_CURRENT_NEIGHBORHOOD_NUM"="1"
"SIMS_CURRENT_NEIGHBORHOOD_PATH"="UserData"

[HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Maxis\The Sims Complete Collection]

[HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Maxis\The Sims Complete Collection\1.00.000]

)
    StringReplace, RegContent64, RegContent64, %SIMS_SOUND%, %SIMS_SOUND%, All
    StringReplace, RegContent64, RegContent64, %SIMS_DATA%, %SIMS_DATA%, All
    StringReplace, RegContent64, RegContent64, %InstallPath%, %InstallPath%, All
    FileAppend, %RegContent64%, sims-thai-fix-64bit.reg

    MsgBox, 64, Success, สร้างไฟล์ .reg ทั้ง 2 ไฟล์เสร็จสิ้น!
return

; -----------------------------
Import32:
    if !FileExist("sims-thai-fix-32bit.reg")
    {
        MsgBox, 48, Error, ไฟล์ 32-bit .reg ยังไม่มี กรุณากด Generate ก่อน
        return
    }
    Run, sims-thai-fix-32bit.reg
return

Import64:
    if !FileExist("sims-thai-fix-64bit.reg")
    {
        MsgBox, 48, Error, ไฟล์ 64-bit .reg ยังไม่มี กรุณากด Generate ก่อน
        return
    }
    Run, sims-thai-fix-64bit.reg
return

; -----------------------------
GuiClose:
ExitApp
