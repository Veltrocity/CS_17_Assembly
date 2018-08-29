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

		include	'vol_finder_01.extpub.inc'




		section	'.data' data readable writeable align 16
		include	'vol_finder_01.data.inc'

		dd	0	;dummy to keep linker happy
		section	'.bss' readable writeable align 16
		include	'vol_finder_01.bss.inc'

		rb	4	;dummy to keep linker happy
		section	'.text' code readable executable align 16
		include	'vol_finder_01.consts.inc'

		include	'vol_finder_01.ro.inc'

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


		push	L828_str__hla_
		call	STDOUT_PUTS	; puts
		call	STDOUT_NEWLN	; newln
		push	L846_str__hla_
		call	STDOUT_PUTS	; puts
		push	eax
		call	STDIN_GETF	; getf
		fstp	dword ptr [L806_r__hla_+0]	;/* r */
		pop	eax
		push	L868_str__hla_
		call	STDOUT_PUTS	; puts
		push	eax
		call	STDIN_GETF	; getf
		fstp	dword ptr [L807_b__hla_+0]	;/* b */
		pop	eax
		push	L890_str__hla_
		call	STDOUT_PUTS	; puts
		push	eax
		call	STDIN_GETF	; getf
		fstp	dword ptr [L808_h__hla_+0]	;/* h */
		pop	eax
		finit
		fld	dword ptr [L807_b__hla_+0]	;/* b */
		fld	dword ptr [L810_vol__hla_+0]	;/* vol */
		fmulp
		fstp	dword ptr [L811_sum__hla_+0]	;/* sum */
		fld	dword ptr [L811_sum__hla_+0]	;/* sum */
		fld	dword ptr [L808_h__hla_+0]	;/* h */
		fmulp
		fstp	dword ptr [L811_sum__hla_+0]	;/* sum */
		mov	ebx, dword ptr [L811_sum__hla_+0]	;/* sum */
		push	ebx
		call	STDOUT_PUTD	; putd
		push	L927_str__hla_
		call	STDOUT_PUTS	; puts
		push	dword ptr [L811_sum__hla_+0]	; (type real32 sum)
		push	dword 0fh
		call	STDOUT_PUTE32	; pute32
		call	STDOUT_NEWLN	; newln
		fld	dword ptr [L806_r__hla_+0]	;/* r */
		fld	st0
		fmulp
		fstp	dword ptr [L812_sum_01__hla_+0]	;/* sum_01 */
		fld	dword ptr [L812_sum_01__hla_+0]	;/* sum_01 */
		fld	dword ptr [L809_pi__hla_+0]	;/* pi */
		fmulp
		fstp	dword ptr [L812_sum_01__hla_+0]	;/* sum_01 */
		fld	dword ptr [L812_sum_01__hla_+0]	;/* sum_01 */
		fld	dword ptr [L808_h__hla_+0]	;/* h */
		fmulp
		fstp	dword ptr [L812_sum_01__hla_+0]	;/* sum_01 */
		fld	dword ptr [L812_sum_01__hla_+0]	;/* sum_01 */
		fld	dword ptr [L810_vol__hla_+0]	;/* vol */
		fmulp
		fstp	dword ptr [L812_sum_01__hla_+0]	;/* sum_01 */
		push	L951_str__hla_
		call	STDOUT_PUTS	; puts
		push	dword ptr [L812_sum_01__hla_+0]	; (type real32 sum_01)
		push	dword 0fh
		call	STDOUT_PUTE32	; pute32
		call	STDOUT_NEWLN	; newln
		fld	dword ptr [L806_r__hla_+0]	;/* r */
		fld	st0
		fmulp
		fstp	dword ptr [L813_sum_02__hla_+0]	;/* sum_02 */
		fld	dword ptr [L813_sum_02__hla_+0]	;/* sum_02 */
		fld	dword ptr [L808_h__hla_+0]	;/* h */
		fmulp
		fstp	dword ptr [L813_sum_02__hla_+0]	;/* sum_02 */
		fld	dword ptr [L813_sum_02__hla_+0]	;/* sum_02 */
		fld	dword ptr [L809_pi__hla_+0]	;/* pi */
		fmulp
		fstp	dword ptr [L813_sum_02__hla_+0]	;/* sum_02 */
		push	L975_str__hla_
		call	STDOUT_PUTS	; puts
		push	dword ptr [L813_sum_02__hla_+0]	; (type real32 sum_02)
		push	dword 0fh
		call	STDOUT_PUTE32	; pute32
		call	STDOUT_NEWLN	; newln
		call	STDOUT_NEWLN	; newln
		push	L1003_str__hla_
		call	STDOUT_PUTS	; puts
		push	dword ptr [L806_r__hla_+0]	; (type real32 r)
		push	dword 0fh
		call	STDOUT_PUTE32	; pute32
		call	STDOUT_NEWLN	; newln
		push	L1018_str__hla_
		call	STDOUT_PUTS	; puts
		push	dword ptr [L807_b__hla_+0]	; (type real32 b)
		push	dword 0fh
		call	STDOUT_PUTE32	; pute32
		call	STDOUT_NEWLN	; newln
		push	L1033_str__hla_
		call	STDOUT_PUTS	; puts
		push	dword ptr [L808_h__hla_+0]	; (type real32 h)
		push	dword 0fh
		call	STDOUT_PUTE32	; pute32
		call	STDOUT_NEWLN	; newln

L1044_EndProgram__hla_:
QuitMain__hla_:
		push	dword 00h
		call	dword ptr [__imp__ExitProcess@4]
;_HLAMain        endp


