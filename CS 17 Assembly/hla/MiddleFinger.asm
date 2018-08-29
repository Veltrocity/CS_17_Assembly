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

		include	'MiddleFinger.extpub.inc'




		section	'.data' data readable writeable align 16
		include	'MiddleFinger.data.inc'

		dd	0	;dummy to keep linker happy
		section	'.bss' readable writeable align 16
		include	'MiddleFinger.bss.inc'

		rb	4	;dummy to keep linker happy
		section	'.text' code readable executable align 16
		include	'MiddleFinger.consts.inc'

		include	'MiddleFinger.ro.inc'

; Code begins here:
L809_middleFinder__hla_:
		pop	dword ptr [L810_return_add__hla_+0]	;/* return_add */
		pop	word ptr [L811_temp__hla_+0]	;/* temp */
		pop	word ptr [ebp+16]	;/* x */
		pop	word ptr [ebp+12]	;/* y */
		pop	word ptr [ebp+8]	;/* z */
		push	dword ptr [L810_return_add__hla_+0]	;/* return_add */
		cmp	bh, 0
		cmp	bl, 0
		cmp	ch, 0
		je	L813_ReturnTrue__hla_
		cmp	ch, 0
		je	L813_ReturnTrue__hla_
		cmp	ch, 0
		jle	L814_ReturnFalse__hla_
		jmp	L815_Neither__hla_

L816_c__hla_:

