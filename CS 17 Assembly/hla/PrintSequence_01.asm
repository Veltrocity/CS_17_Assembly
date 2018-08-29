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

		include	'PrintSequence_01.extpub.inc'




		section	'.data' data readable writeable align 16
		include	'PrintSequence_01.data.inc'

		dd	0	;dummy to keep linker happy
		section	'.bss' readable writeable align 16
		include	'PrintSequence_01.bss.inc'

		rb	4	;dummy to keep linker happy
		section	'.text' code readable executable align 16
		include	'PrintSequence_01.consts.inc'

		include	'PrintSequence_01.ro.inc'

; Code begins here:



;/* HWexcept__hla_ gets called when Windows raises the exception. */

HWexcept__hla_ :
		jmp	HardwareException__hla_
;HWexcept__hla_  endp

DfltExHndlr__hla_:
		jmp	DefaultExceptionHandler__hla_
;DfltExHndlr__hla_ endp



_HLAMain       :


;/* Set up the Structured Exception Handler record */
;/* for this program. */

		call	BuildExcepts__hla_
		pushd	0		;/* No Dynamic Link. */
		mov	ebp, esp	;/* Pointer to Main's locals */
		push	ebp		;/* Main's display. */
		sub	esp,    4
		and	esp, 0fffffffch


		push	L819_str__hla_
		call	STDOUT_PUTS	; puts
		call	STDIN_GETI8	; geti8
		mov	byte ptr [ebp-5], al	;/* n */
		mov	dh, byte ptr [ebp-5]	;/* n */
		mov	byte ptr [ebp-6], 1	;/* i */

		jmp	L820_StartFor__hla_
L820_for__hla_:
		call	STDOUT_NEWLN	; newln
		mov	byte ptr [ebp-7], 1	;/* j */

		jmp	L821_StartFor__hla_
L821_for__hla_:
		push	dword 00h
		push	eax
		mov	al, byte ptr [ebp-6]	; (type int8 i)
		mov	byte ptr [ESP+4], al
		pop	eax
		call	STDOUT_PUTI8	; puti8
L821_continue__hla_:
		add	byte ptr [ebp-7], 1	;/* j */

L821_StartFor__hla_:
		cmp	byte ptr [ebp-7], dh	;/* j */
		jle	L821_for__hla_
L821_exitloop__hla_:

L820_continue__hla_:
		add	byte ptr [ebp-6], 1	;/* i */

L820_StartFor__hla_:
		cmp	byte ptr [ebp-6], dh	;/* i */
		jle	L820_for__hla_
L820_exitloop__hla_:

QuitMain__hla_:
		push	dword 00h
		call	dword ptr [__imp__ExitProcess@4]
;_HLAMain        endp


