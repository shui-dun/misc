; direction

^Left::Send {Home}
^Right::Send {End}
^Up::Send {PgUp}
^Down::Send {PgDn}

+^Left::Send +{Home}
+^Right::Send +{End}
+^Up::Send +{PgUp}
+^Down::Send +{PgDn}

; markdown/latex

#If WinActive("ahk_exe Typora.exe") || WinActive("ahk_exe Obsidian.exe")

::/mat::\begin{{}bmatrix{}}`n\end{{}bmatrix{}}{Up}{End}
::/arr::\begin{{}array{}}{{}ccc{}}`n\end{{}array{}}{Up}{End}
::/ali::\begin{{}aligned{}}`n\end{{}aligned{}}{Up}{End}

::/>::\left<\right>{Left 7}
::/)::\left(\right){Left 7}
::/]::\left[\right]{Left 7}
::/|::\left|\right|{Left 7}
::/\|::\left\|\right\|{Left 8}
::/}::\left\{{}\right\{}}{Left 8}

:*:/bs::\boldsymbol{{}{}}{Left}
:*:/tt::\text{{}{}}{Left}
:*:/bb::\mathbb{{}{}}{Left}
:*:/rm::\mathrm{{}{}}{Left}
:*:/frak::\mathfrak{{}{}}{Left}
:*:/bf::\mathbf{{}{}}{Left}
:*:/cal::\mathcal{{}{}}{Left}

:*:/cite::<p align="right">——</p>{Left 4}

#z::QuoteSelection() 
 
QuoteSelection()
{
	Clipboard:= ""  ; Clear clipboard for ClipWait to function.
	Send ^c  ; Send Ctrl+C to get selection on clipboard.
	ClipWait  $%timeoutSeconds%$  ; Wait for the copied text to arrive at the clipboard.
	Clipboard = %Clipboard% ; strip blank character
	Clipboard := " $" . Clipboard  . "$ " ; quote
	Send ^v ; paste
}

#If

!x::
	Send ^c
	ClipWait  $%timeoutSeconds%$ 
	Clipboard := StrReplace(StrReplace(Clipboard, "-`r`n", ""), "`r`n", " ")
	Send !l
Return