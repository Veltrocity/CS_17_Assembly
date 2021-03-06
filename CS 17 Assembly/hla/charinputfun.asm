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

		include	'charinputfun.extpub.inc'




		section	'.data' data readable writeable align 16
		include	'charinputfun.data.inc'

		dd	0	;dummy to keep linker happy
		section	'.bss' readable writeable align 16
		include	'charinputfun.bss.inc'

		rb	4	;dummy to keep linker happy
		section	'.text' code readable executable align 16
		include	'charinputfun.consts.inc'

		include	'charinputfun.ro.inc'

; Code begins here:
L1_converter__hla_:
		push	ebp		;/*Dynamic link*/
		push	dword ptr [ebp-4]	;/*Display for lex level 0*/
		lea	ebp,[esp+4]	;/*Get frame ptr*/
		push	ebp		;/*Ptr to this proc's A.R.*/
		and	esp, 0fffffffch

