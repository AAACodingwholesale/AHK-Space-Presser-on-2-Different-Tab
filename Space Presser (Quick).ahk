#Requires AutoHotkey v2.0
#SingleInstance Force

global L := 0, R := 0, Delay := 10

SetWinDelay -1
SetControlDelay -1
SetKeyDelay -1, -1

^!1::{
    global L
    L := WinExist("A")
}
^!2::{
    global R
    R := WinExist("A")
}

SendTo(hwnd, keys){
    if !hwnd
        return
    WinActivate "ahk_id " hwnd
    WinWaitActive "ahk_id " hwnd,, 0.25
    Send keys
}

^!s::{
    global L, R, Delay
    if (!L || !R)
        return
    SendTo(L, "{Space}")
    Sleep Delay
    SendTo(R, "{Space}")
}

^!b::{
    global L, R, Delay
    if (!L || !R)
        return
    SendTo(L, "{Backspace}")
    Sleep Delay
    SendTo(R, "{Backspace}")
}
