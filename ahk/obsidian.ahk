#NoTrayIcon

#If WinActive("ahk_exe Obsidian.exe")

; 包裹inline公式

#z::
	Clipboard := ""
	Send ^c  ; Send Ctrl+C to get selection on clipboard.
	ClipWait  1  ; Wait for the copied text to arrive at the clipboard.
	Clipboard = %Clipboard% ; strip blank character
	Clipboard := " $" . Clipboard  . "$ " ; quote
	Send ^v ; paste
Return

; 包裹公式块

#+z::
	Clipboard := ""
	Send ^x
	ClipWait  1 
	Clipboard := "`n$$`n" . Clipboard  . "`n$$`n"
	Send ^v 
Return

; 标题

^0::title(0)
^1::title(1)
^2::title(2)
^3::title(3)
^4::title(4)
^5::title(5)
^6::title(6)

title(times) {
	backup := Clipboard
	Clipboard := ""
	Send {Home}+{End}^c
	Clipboard := LTrim(Clipboard, OmitChars := " #")
	if (%times% != 0) {
		Clipboard := " " . Clipboard
		Loop, %times% {
			Clipboard := "#" . Clipboard
		}
	}
	Send ^v
	Clipboard := backup
}

; 补全公式块

:*:$$`n::$$`n`n$${Up}

; 补全代码块

:*:``````::```````n``````{Up}{End}

; 段落

#p::
	Clipboard := ""
	Send +{Home}^c
	ClipWait  1 
	Clipboard := "**" . Clipboard  . ".** "
	Send ^v 
Return	

#If