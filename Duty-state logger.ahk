#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


WinWaitActive, Roblox,,,,
MsgBox, Please don't forget to log your time using Ctrl+Shift+T
sleep 10000
  WinWaitClose, Roblox,,,,
  MsgBox, Please don't forget to log your time using Ctrl+Shift+T
  Reload
return

^*t::
MsgBox, 4, Log, Would you like to log your time?, 10
IfMsgBox, No
Return
IfMsgBox, Yes
hr := A_Hour + 2
minute := A_Min
time := % hr . ":" . minute
Text :=
InputBox, Text, Activity Logger, Starting/Ending your duty state,,275,150,Locale,,,
url:="https://discord.com/api/webhooks/929121676120174592/yh6-hRfFpttRYwLtd1wEW-poLEpSg8zM2W16GSlKpJ71yY8AU7EijpXurfOnG6xa9ZQV" 
postdata=
(
{
  "content": "",
  "embeds": [
    {
      "title": "Time logged",
      "description": "This was logged at %time% and the specified activity is %Text%",
      "url": "",
      "color": 8280002,
      "thumbnail": {
        "url": "https://t0.rbxcdn.com/cc93e150760f6c1888f1af6a1fd2ea72"
      },
      "image": {
        "url": "https://t0.rbxcdn.com/cc93e150760f6c1888f1af6a1fd2ea72"
      }
    }
  ]
}
) ; Use https://leovoel.github.io/embed-visualizer/ to generate above webhook code
WebRequest := ComObjCreate("WinHttp.WinHttpRequest.5.1")
WebRequest.Open("POST", url, false)
WebRequest.SetRequestHeader("Content-Type", "application/json")
WebRequest.Send(postdata)  
return



~/::
state := GetKeyState("Capslock", "T") 

if state = 1

{

SoundBeep,, 528

}

return 

