; Disabling windows keys
; https://www.top-password.com/blog/disable-specific-windows-key-shortcut/
; Computer\HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced

; t term
; b brave
; c cal
; p pulse
; n notes (tusk)
; v vscode
; e new explorer window
; d show desktop

; Windows Terminal
!t::
    IfWinExist, Windows Terminal
    {
        IfWinActive, Windows Terminal
            WinMinimize Windows Terminal
        else
            WinActivate Windows Terminal
    }
    else
    {
        Run "C:\Program Files\WindowsApps\Microsoft.WindowsTerminal_0.3.2171.0_x64__8wekyb3d8bbwe\WindowsTerminal.exe"
    }
    exit

; Brave
!f::
    ; it always has the "- Brave" part in it
    SetTitleMatchMode, 2   ;window title can contain WinTitle anywhere inside it to be a match
    IfWinExist, - Brave
    {
        IfWinActive, - Brave
            WinMinimize - Brave
        else
            WinActivate - Brave
    }
    else
    {
        Run "C:/Program Files (x86)/BraveSoftware/Brave-Browser/Application"
    }
    SetTitleMatchMode, 1
    exit

; Google Calendar
!c::
    IfWinExist, Google Calendar
    {
    IfWinActive, Google Calendar
        WinMinimize Google Calendar
    else
        WinActivate Google Calendar
    }
    else
    {
        Run "C:\Users\Ben\AppData\Local\Programs\google-calendar\Google Calendar.exe"
    }
    exit

; Pulse Messages
!p::
    IfWinExist, Pulse SMS
    {
        IfWinActive, Pulse SMS
            WinClose Pulse SMS
        else
            WinActivate Pulse SMS
    }
    else
    {
        Run "C:\Users\Ben\AppData\Local\Programs\pulse-sms\Pulse SMS.exe"
    }
    exit

; Notes - Tusk
!n::
    IfWinExist, Tusk
    {
        IfWinActive, Tusk
            WinMinimize Tusk
        else
            WinActivate Tusk
    }
    else
    {
        Run "C:\Users\Ben\Google Drive\Small Programs\tusk-0.23.0.exe"
    }
    exit

; VScode
!v::
    SetTitleMatchMode, 2   ;window title can contain WinTitle anywhere inside it to be a match
    IfWinExist, - Visual Studio Code
    {
        IfWinActive, - Visual Studio Code
            WinMinimize - Visual Studio Code
        else
            WinActivate - Visual Studio Code
    }
    else
    {
        Run "C:\Program Files\Microsoft VS Code\Code.exe"
    }
    SetTitleMatchMode, 1
    exit

#d::
    WinMinimizeAll
    WinActivate, Program Manager ; focus desktop
    exit
	
#e::
	Run explorer
	exit

