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

		include	'fib_sequence.extpub.inc'




		section	'.data' data readable writeable align 16
		include	'fib_sequence.data.inc'

		dd	0	;dummy to keep linker happy
		section	'.bss' readable writeable align 16
		include	'fib_sequence.bss.inc'

		rb	4	;dummy to keep linker happy
		section	'.text' code readable executable align 16
		include	'fib_sequence.consts.inc'

		include	'fib_sequence.ro.inc'

; Code begins here:



HWexcept__hla_ :
		jmp	shorthwExcept__hla_
;HWexcept__hla_  endp

DfltExHndlr__hla_:
		jmp	shortDfltExcept__hla_
;DfltExHndlr__hla_ endp



_HLAMain       :


;/* Set up the Structured Exception Handler record */
;/* for this program. */

		call	BuildExcepts__hla_
		pushd	0		;/* No Dynamic Link. */
		mov	ebp, esp	;/* Pointer to Main's locals */
		push	ebp		;/* Main's display. */


		mov	dword ptr [L3_val_02__hla_+0], 1	;/* val_02 */
		mov	dword ptr [L4_val_03__hla_+0], 1	;/* val_03 */

L5_stdout__hla_:

