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
	Send ^c
	ClipWait  1
	Clipboard := StrReplace(StrReplace(Clipboard, "-`r`n", ""), "`r`n", " ")
	Send !l
Return

; 编辑markdown

#If WinActive("ahk_exe Obsidian.exe")

; 公式环境

::/mat::\begin{{}bmatrix{}}`n\end{{}bmatrix{}}{Up}{End}
::/arr::\begin{{}array{}}{{}ccc{}}`n\end{{}array{}}{Up}{End}
::/ali::\begin{{}aligned{}}`n\end{{}aligned{}}{Up}{End}

; 括号

::/>::\left<\right>{Left 7}
::/)::\left(\right){Left 7}
::/]::\left[\right]{Left 7}
::/|::\left|\right|{Left 7}
::/\|::\left\|\right\|{Left 8}
::/}::\left\{{}\right\{}}{Left 8}

; 字体

:*:/bs::\boldsymbol{{}{}}{Left}
:*:/tt::\text{{}{}}{Left}
:*:/bb::\mathbb{{}{}}{Left}
:*:/rm::\mathrm{{}{}}{Left}
:*:/frak::\mathfrak{{}{}}{Left}
:*:/bf::\mathbf{{}{}}{Left}
:*:/cal::\mathcal{{}{}}{Left}

; 引用

:*:/cite::<p align="right">——</p>{Left 4}

; 包裹inline公式

#z::
	Clipboard:= ""  ; Clear clipboard for ClipWait to function.
	Send ^c  ; Send Ctrl+C to get selection on clipboard.
	ClipWait  1  ; Wait for the copied text to arrive at the clipboard.
	Clipboard = %Clipboard% ; strip blank character
	Clipboard := " $" . Clipboard  . "$ " ; quote
	Send ^v ; paste
Return

; 标题

^1::title(1)
^2::title(2)
^3::title(3)
^4::title(4)
^5::title(5)
^6::title(6)

title(times) {
	Send {Home}+{End}^x
	ClipWait  0.05
	Clipboard := LTrim(Clipboard, OmitChars := " #")
	Clipboard := " " . Clipboard
	Loop, %times% {
		Clipboard := "#" . Clipboard
	}
	Send ^v
}

; 补全公式块

:*:$$`n::$$`n`n$${Up}

; 补全代码块

:*:``````::```````n``````{Up}{End}

#If