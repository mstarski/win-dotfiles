#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

SetNumLockState, AlwaysOn
SetCapsLockState, AlwaysOff

RunOrActivate(Target, WinTitle = "") {
SplitPath, Target, TargetNameOnly
Process, Exist, %TargetNameOnly%
    If ErrorLevel > 0
        PID = %ErrorLevel%
    Else
    {
      Run, %Target%, , , PID
    }
    If WinTitle <>
    {
      SetTitleMatchMode, 2
      WinWait, %WinTitle%, , 3
      WinActivate, %WinTitle%
    }
    Else
    {
      WinWait, ahk_pid %PID%, , 3
      WinActivate, ahk_pid %PID%
    }
}

ToggleMaximize() {
WinGet MX, MinMax, A

	If (MX==1)
	{
		WinRestore A
	}	
	Else If (MX==0)
	{
		WinMaximize A
	}
	
	return
}

#^f::
RunOrActivate("chrome.exe")
return

#^\::
SetTitleMatchMode, 2
if WinExist("Docker") {
	WinActivate
} else {
	return
}
return

#^g::
RunOrActivate("D:\Telegram Desktop\Telegram.exe")
return

#^s::
try {
	RunOrActivate("Spotify.exe")
} catch e {
	RunOrActivate(A_AppData . "\Spotify\Spotify.exe")
}
return

#^o::
RunOrActivate("C:\Users\" . A_UserName . "\AppData\Local\Obsidian\Obsidian.exe")
return

#^+s::
RunOrActivate("D:\Steam\steam.exe")
return

#^d::
RunOrActivate("C:\Users\" . A_UserName . "\AppData\Local\Discord\Update.exe --processStart Discord.exe")
return

#^e::
RunOrActivate("", "Slack")
return

#^Space::
try {
	RunOrActivate("WindowsTerminal.exe")
} catch e {
	RunOrActivate("C:\Users\" . A_UserName . "\AppData\Local\Microsoft\WindowsApps\wt.exe")
}
return

#^Enter::
if WinExist("ahk_class SunAwtFrame") {
	WinActivate
} else {
	run, idea
}
return

CapsLock::Esc ; Remap CapsLock to Esc
Esc::CapsLock ; Remap Esc to CapsLock

; Window controls
#q::WinClose, A ; Close a window with mod+q

#,::WinMinimize, A ; Minimize on mod + m

#m::ToggleMaximize()

;Capslock + key mapping

Capslock & h::
    Send {Blind}{Left down}
return

Capslock & h up::
    Send {Blind}{Left up}
return

Capslock & j::
    Send {Blind}{Down down}
return

Capslock & j up::
    Send {Blind}{Down up}
return

Capslock & k::
    Send {Blind}{Up down}
return

Capslock & k up::
    Send {Blind}{Up up}
return

Capslock & l::
    Send {Blind}{Right down}
return

Capslock & l up::
    Send {Blind}{Right up}
return

; ESC = `
Escape::Send, ``
Shift & Escape::Send, ~

; Volume
<^>!b::
	SendInput {Volume_Up 5}
return

<^>!v::
	SendInput {Volume_Down 5}
return

; Changing desktops
<^>!1::
    SendEvent ^#{Left}
return

<^>!2::
    SendEvent ^#{Right}
return
