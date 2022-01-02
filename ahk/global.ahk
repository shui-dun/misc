; 方向

^Left::Send {Home}
^Right::Send {End}
^Up::Send {PgUp}
^Down::Send {PgDn}

+^Left::Send +{Home}
+^Right::Send +{End}
+^Up::Send +{PgUp}
+^Down::Send +{PgDn}

; 沙拉查词

!x::
	Clipboard := ""
	Send ^c
	ClipWait  1
	Clipboard := StrReplace(StrReplace(Clipboard, "-`r`n", ""), "`r`n", " ")
	Send !l
	Sleep, 600
	If (WinExist("沙拉查词") || WinExist("Saladict")) {
		WinActivate
	}
Return

