;=============按键映射===============

;--------------------------------------------
;输入法切换

;SetStoreCapslockMode, off
;CapsLock::
;If StartTime
;    return
;StartTime := A_TickCount
;return
;
;CapsLock up::
;TimeLength := A_TickCount - StartTime
;if (TimeLength >= 1 and TimeLength < 500)
;{
;    Send, ^{Space}
;}
;else if (TimeLength >= 500)
;{
;    Send, {CapsLock}
;}
;StartTime := ""
;return

SetCapsLockState, AlwaysOff                                          ;|
;---------------------------------o-----------------------------------o
;                    CapsLock + ` | {CapsLock}                       ;|
;---------------------------------o-----------------------------------o
CapsLock & `::                                                       ;|
GetKeyState, CapsLockState, CapsLock, T                              ;|
if CapsLockState = D                                                 ;|
    SetCapsLockState, AlwaysOff                                      ;|
else                                                                 ;|
    SetCapsLockState, AlwaysOn                                       ;|
KeyWait, ``                                                          ;|
return
;---------------------------------------------------------------------o
;                        CapsLock  |  {ESC}                          ;|
CapsLock::
if GetKeyState("alt") = 0                                        ;|
    Send, ^{Space}                                             ;|
return
;---------------------------------------------------------------------o
;                    CapsLock Direction Navigator                    ;|
;-----------------------------------o---------------------------------o
;                      CapsLock + h |  Left                          ;|
;                      CapsLock + j |  Down                          ;|
;                      CapsLock + k |  Up                            ;|
;                      CapsLock + l |  Right                         ;|
;                      Ctrl, Alt Compatible                          ;|
;-----------------------------------o---------------------------------o
CapsLock & h::                                                       ;|
if GetKeyState("alt") = 0                                        ;|
    Send, {Left}                                                ;|
else                                                             ;|
    MouseMove, -30, 0, 0, R
return                                                               ;|
;-----------------------------------o                                ;|
CapsLock & j::                                                       ;|
if GetKeyState("alt") = 0                                        ;|
    Send, {Down}                                                 ;|
else                                                             ;|
    MouseMove, 0, 30, 0, R
return                                                           ;|
;-----------------------------------o                                ;|
CapsLock & k::                                                       ;|
if GetKeyState("alt") = 0                                        ;|
    Send, {Up}                                                   ;|
else                                                             ;|
    MouseMove, 0, -30, 0, R
return                                                           ;|
;-----------------------------------o                                ;|
CapsLock & l::                                                       ;|
if GetKeyState("alt") = 0                                        ;|
    Send, {Right}                                                ;|
else                                                             ;|
    MouseMove, 30, 0, 0, R
return                                                           ;|
;---------------------------------------------------------------------o


;=====================================================================o
;                     CapsLock Home/End Navigator                    ;|
;-----------------------------------o---------------------------------o
;                      CapsLock + n |  Home                          ;|
;                      CapsLock + m |  End                           ;|
;                      Ctrl, Alt Compatible                          ;|
;-----------------------------------o---------------------------------o
CapsLock & n::                                                       ;|
if GetKeyState("control") = 0                                        ;|
{                                                                    ;|
    if GetKeyState("alt") = 0                                        ;|
        Send, {Home}                                                 ;|
    else                                                             ;|
        Send, +{Home}                                                ;|
    return                                                           ;|
}                                                                    ;|
else {                                                               ;|
    if GetKeyState("alt") = 0                                        ;|
        Send, ^{Home}                                                ;|
    else                                                             ;|
        Send, +^{Home}                                               ;|
    return                                                           ;|
}                                                                    ;|
return                                                               ;|
;-----------------------------------o                                ;|
CapsLock & m::                                                       ;|
if GetKeyState("control") = 0                                        ;|
{                                                                    ;|
    if GetKeyState("alt") = 0                                        ;|
        Send, {End}                                                  ;|
    else                                                             ;|
        Send, +{End}                                                 ;|
    return                                                           ;|
}                                                                    ;|
else {                                                               ;|
    if GetKeyState("alt") = 0                                        ;|
        Send, ^{End}                                                 ;|
    else                                                             ;|
        Send, +^{End}                                                ;|
    return                                                           ;|
}                                                                    ;|
return                                                               ;|
;;---------------------------------------------------------------------o
 
 
;=====================================================================o
;                      CapsLock Page Navigator                       ;|
;-----------------------------------o---------------------------------o
;                      CapsLock + u |  PageUp                        ;|
;                      CapsLock + d |  PageDown                      ;|
;                      Ctrl, Alt Compatible                          ;|
;-----------------------------------o---------------------------------o
CapsLock & u::                                                       ;|
;if GetKeyState("alt") = 0                                        ;|
Send, {PgUp}                                                 ;|                                                ;
return                                                           ;|
;-----------------------------------o                                ;|
CapsLock & d::                                                       ;|
;if GetKeyState("alt") = 0                                        ;|
Send, {PgDn}                                                 ;||
return                                                           ;|
;---------------------------------------------------------------------o

;=====================================================================o
;                     CapsLock Mouse Controller                      ;|
;-----------------------------------o---------------------------------o
;                   CapsLock + Up   |  Mouse Up                      ;|
;                   CapsLock + Down |  Mouse Down                    ;|
;                   CapsLock + Left |  Mouse Left                    ;|
;                  CapsLock + Right |  Mouse Right                   ;|
;    CapsLock + Enter(Push Release) |  Mouse Left Push(Release)      ;|
;-----------------------------------o---------------------------------o
;-----------------------------------o                                ;|
CapsLock & Enter::                                                   ;|
SendEvent {Blind}{LButton down}                                      ;|
KeyWait Enter                                                        ;|
SendEvent {Blind}{LButton up}                                        ;|
return                                                               ;|
;-----------------------------------o                                ;|
CapsLock & Space::                                                   ;|
SendEvent {Blind}{RButton down}                                      ;|
KeyWait Space                                                        ;|
SendEvent {Blind}{RButton up}                                        ;|
return                                                               ;|
;---------------------------------------------------------------------o








;=============脚本操作===============

;--------------------------------------------
;鼠标放在任务栏，滚动滚轮实现音量的加减
~lbutton & enter:: 
exitapp  
~WheelUp::  
if (existclass("ahk_class Shell_TrayWnd")=1)  
Send,{Volume_Up}  
Return  
~WheelDown::  
if (existclass("ahk_class Shell_TrayWnd")=1)  
Send,{Volume_Down}  
Return  
~MButton::  
if (existclass("ahk_class Shell_TrayWnd")=1)  
Send,{Volume_Mute}  
Return  

Existclass(class)  
{  
MouseGetPos,,,win  
WinGet,winid,id,%class%  
if win = %winid%  
Return,1  
Else  
Return,0  
}
;--------------------------------------------
;快捷输入按键映射
;--------------------------------------------
;Shift加鼠标滚轮实现左右滑动
+WheelDown::
Send, {WheelRight}
Return

+WheelUp::
Send, {WheelLeft}
Return

;=============特殊===============
#MaxHotKeysPerInterval 20000
