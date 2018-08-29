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

		include	'charinputdemo.extpub.inc'




		section	'.data' data readable writeable align 16
		include	'charinputdemo.data.inc'

		dd	0	;dummy to keep linker happy
		section	'.bss' readable writeable align 16
		include	'charinputdemo.bss.inc'

		rb	4	;dummy to keep linker happy
		section	'.text' code readable executable align 16
		include	'charinputdemo.consts.inc'

		include	'charinputdemo.ro.inc'

; Code begins here:
L808_Char_converter__hla_:
		pop	dword ptr [L810_returnAddress__hla_+0]	;/* returnAddress */
		pop	word ptr [L811_temp__hla_+0]	;/* temp */
		push	dword ptr [L810_returnAddress__hla_+0]	;/* returnAddress */
		push	L825_str__hla_
		call	STDOUT_PUTS	; puts
		call	STDIN_GETC	; getc

L826_Lowercase__hla_:
		cmp	al, 061h	;/* 'a' */
		jnae	L827_false__hla_
		cmp	al, 07ah	;/* 'z' */
		jnbe	L828_false__hla_
		sub	al, 50
L828_false__hla_:
L827_false__hla_:
		jmp	L829_Exit_00__hla_

L830_Uppercase__hla_:
		cmp	al, 041h	;/* 'A' */
		jnae	L831_false__hla_
		cmp	al, 05ah	;/* 'Z' */
		jnbe	L832_false__hla_
		add	al, 50
L832_false__hla_:
L831_false__hla_:
		call	STDIN_FLUSHINPUT	; flushInput

L833_Numericals__hla_:
		cmp	al, 030h	;/* '0' */
		jnae	L834_false__hla_
		cmp	al, 039h	;/* '9' */
		jnbe	L835_false__hla_
		sub	al, 48
L835_false__hla_:
L834_false__hla_:
		jmp	L829_Exit_00__hla_

L829_Exit_00__hla_:
		ret
xL808_Char_converter__hla___hla_:
;L808_Char_converter__hla_ endp


