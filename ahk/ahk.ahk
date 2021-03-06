; direction

^Left::Send {Home}
^Right::Send {End}
^Up::Send {PgUp}
^Down::Send {PgDn}

+^Left::Send +{Home}
+^Right::Send +{End}
+^Up::Send +{PgUp}
+^Down::Send +{PgDn}

; latex

::/mat::\begin{{}bmatrix{}}`n\end{{}bmatrix{}}{Up}{End}
::/arr::\begin{{}array{}}{{}ccc{}}`n\end{{}array{}}{Up}{End}
::/ali::\begin{{}aligned{}}`n\end{{}aligned{}}{Up}{End}

::/>::\left<\right>{Left 7}
::/)::\left(\right){Left 7}
::/]::\left[\right]{Left 7}
::/}::\left\{{}\right\{}}{Left 8}

::/bs::\boldsymbol{{}{}}{Left}
::/tt::\text{{}{}}{Left}
::/bb::\mathbb{{}{}}{Left}
::/rm::\mathrm{{}{}}{Left}
::/frak::\mathfrak{{}{}}{Left}
::/bf::\mathbf{{}{}}{Left}
::/cal::\mathcal{{}{}}{Left}