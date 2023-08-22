#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Hotstring EndChars `t
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

SetNumLockState, AlwaysOn
SetCapsLockState, AlwaysOff

; ==================== Helper functions ========================
RunOrActivate(Target, Fallback = "")
{
    IfWinExist, %Target%
    {
        WinActivate
    }
    else
    {
        If (Fallback == "") {
          return
        } Else {
          Run, %Fallback% 
        }
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

; ==================== Hotkeys ========================
Hotkey, <^<!<#<+p, browser
Hotkey, <^<!<#<+\, docker  
Hotkey, <^<!<#<+g, telegram  
Hotkey, <^<!<#<+s, spotify  
Hotkey, <^<!<#<+o, obsidian  
Hotkey, <^<!<#<+d, discord  
Hotkey, <^<!<#<+e, slack  
Hotkey, <^<!<#<+Space, terminal  
return

browser:
RunOrActivate("ahk_exe firefox.exe", "firefox.exe")
return

docker:
RunOrActivate("Docker")
return

telegram:
RunOrActivate("ahk_exe Telegram", "D:\Telegram Desktop\Telegram.exe") ;todo
return

spotify:
RunOrActivate("ahk_exe Spotify.exe", A_AppData . "\Spotify\Spotify.exe")
return

obsidian:
RunOrActivate("ahk_exe Obsidian.exe", "C:\Users\" . A_UserName . "\AppData\Local\Obsidian\Obsidian.exe")
return

discord:
RunOrActivate("ahk_exe Discord.exe", "C:\Users\" . A_UserName . "\AppData\Local\Discord\Update.exe --processStart Discord.exe")
return

slack:
RunOrActivate("ahk_exe Slack.exe", "C:\Users\" . A_UserName . "\AppData\Local\slack\slack.exe")
return

terminal:
RunOrActivate("ahk_exe WindowsTerminal.exe", "C:\Users\" . A_UserName . "\AppData\Local\Microsoft\WindowsApps\wt.exe")
return

; ==================== Window Controls ========================
<^<!<#<+q::WinClose, A ; Close a window with mod+q
<^<!<#<+,::WinMinimize, A ; Minimize on mod + m
<^<!<#<+m::ToggleMaximize()

; Changing desktops
<^>!1::
    SendEvent ^#{Left}
return

<^>!2::
    SendEvent ^#{Right}
return

; ==================== Hotstrings ========================
::,prt::
SendInput,
(
{#}{#} Title

{#}{#} Linked issue

{#}{#} Description

{#}{#}{#} New packages

{#}{#}{#} Changes

{#}{#}{#} How to test
)
return
