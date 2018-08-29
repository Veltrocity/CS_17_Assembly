; Assembly code emitted by HLA compiler
; Version 1.76 build 9932 (prototype)
; HLA compiler written by Randall Hyde
; FASM compatible output

		format	MS COFF


offset32	equ	 
ptr	equ	 

macro global [symbol]
{
 local isextrn
 if defined symbol & ~ defined isextrn
   public symbol
 else if used symbol
   extrn symbol
   isextrn = 1
 end if
}

macro global2 [symbol,type]
{
 local isextrn
 if defined symbol & ~ defined isextrn
   public symbol
 else if used symbol
   extrn symbol:type
   isextrn = 1
 end if
}


ExceptionPtr__hla_	equ	fs:0

		include	'bar.extpub.inc'




		section	'.data' data readable writeable align 16
		include	'bar.data.inc'

		dd	0	;dummy to keep linker happy
		section	'.bss' readable writeable align 16
		include	'bar.bss.inc'

		rb	4	;dummy to keep linker happy
		section	'.text' code readable executable align 16
		include	'bar.consts.inc'

		include	'bar.ro.inc'

; Code begins here:
L1_bar_1__hla_ :
		pop	dword ptr [L3_iReturnAddress__hla_+0]	;/* iReturnAddress */
		pop	word ptr [L2_iTemp__hla_+0]	;/* iTemp */
		pop	word ptr [ebp+8]	;/* data */
		mov	eax, 0
		mov	ebx, 0
		mov	ecx, 0
		mov	edx, 0
		inc	eax
		add	eax, ebx
		inc	ebx
		add	ecx, ebx
		inc	edx
		ret
xL1_bar_1__hla___hla_:
;L1_bar_1__hla_  endp


