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

		include	'MidNumber.extpub.inc'




		section	'.data' data readable writeable align 16
		include	'MidNumber.data.inc'

		dd	0	;dummy to keep linker happy
		section	'.bss' readable writeable align 16
		include	'MidNumber.bss.inc'

		rb	4	;dummy to keep linker happy
		section	'.text' code readable executable align 16
		include	'MidNumber.consts.inc'

		include	'MidNumber.ro.inc'

; Code begins here:
L810_middle_num__hla_:
		pop	dword ptr [L811_returnaddress__hla_+0]	;/* returnaddress */
		pop	word ptr [L812_temp__hla_+0]	;/* temp */
		pop	word ptr [ebp+16]	;/* x */
		pop	word ptr [ebp+12]	;/* y */
		pop	word ptr [ebp+8]	;/* z */
		push	dword ptr [L811_returnaddress__hla_+0]	;/* returnaddress */
		push	bx
		mov	bx, word ptr [ebp+16]	;/* x */
		cmp	bx, word ptr [ebp+12]	;/* y */
		jg	L813_XgreaterthanY__hla_
		jl	L814_XlessthanY__hla_
		je	L815_XequalY__hla_

L813_XgreaterthanY__hla_:
		mov	bx, word ptr [ebp+12]	;/* y */
		cmp	bx, word ptr [ebp+8]	;/* z */
		je	L816_noMiddle__hla_
		jg	L817_YgreaterthanZ__hla_
		mov	bx, word ptr [ebp+16]	;/* x */
		cmp	bx, word ptr [ebp+8]	;/* z */
		je	L816_noMiddle__hla_
		jg	L818_XgreaterthanZ__hla_
		mov	bx, word ptr [ebp+16]	;/* x */
		mov	al, 0
		push	word 00h
		push	word ptr [ebp+16]	; (type int16 x)
		call	STDOUT_PUTI16	; puti16
		push	L838_str__hla_
		call	STDOUT_PUTS	; puts
		call	STDOUT_NEWLN	; newln
		call	STDOUT_NEWLN	; newln
		jmp	L843_EndFunction__hla_

L817_YgreaterthanZ__hla_:
		mov	bx, word ptr [ebp+12]	;/* y */
		mov	al, 0
		push	word 00h
		push	word ptr [ebp+12]	; (type int16 y)
		call	STDOUT_PUTI16	; puti16
		push	L863_str__hla_
		call	STDOUT_PUTS	; puts
		call	STDOUT_NEWLN	; newln
		jmp	L843_EndFunction__hla_

L818_XgreaterthanZ__hla_:
		mov	bx, word ptr [ebp+8]	;/* z */
		mov	al, 0
		push	word 00h
		push	word ptr [ebp+8]	; (type int16 z)
		call	STDOUT_PUTI16	; puti16
		push	L887_str__hla_
		call	STDOUT_PUTS	; puts
		call	STDOUT_NEWLN	; newln
		jmp	L843_EndFunction__hla_

L814_XlessthanY__hla_:
		mov	bx, word ptr [ebp+16]	;/* x */
		cmp	bx, word ptr [ebp+8]	;/* z */
		je	L816_noMiddle__hla_
		jg	L892_XgreaterthanZ2__hla_
		mov	bx, word ptr [ebp+12]	;/* y */
		cmp	bx, word ptr [ebp+8]	;/* z */
		je	L816_noMiddle__hla_
		jg	L893_YgreaterthanZ2__hla_
		mov	bx, word ptr [ebp+12]	;/* y */
		mov	al, 0
		push	word 00h
		push	word ptr [ebp+12]	; (type int16 y)
		call	STDOUT_PUTI16	; puti16
		push	L913_str__hla_
		call	STDOUT_PUTS	; puts
		call	STDOUT_NEWLN	; newln
		call	STDOUT_NEWLN	; newln
		jmp	L843_EndFunction__hla_

L892_XgreaterthanZ2__hla_:
		mov	bx, word ptr [ebp+16]	;/* x */
		mov	al, 0
		push	word 00h
		push	word ptr [ebp+16]	; (type int16 x)
		call	STDOUT_PUTI16	; puti16
		push	L937_str__hla_
		call	STDOUT_PUTS	; puts
		call	STDOUT_NEWLN	; newln
		call	STDOUT_NEWLN	; newln
		jmp	L843_EndFunction__hla_

L893_YgreaterthanZ2__hla_:
		mov	bx, word ptr [ebp+8]	;/* z */
		cmp	bx, word ptr [ebp+8]	;/* z */
		je	L942_YequalZ__hla_
		jne	L816_noMiddle__hla_

L815_XequalY__hla_:
		mov	bx, word ptr [ebp+12]	;/* y */
		cmp	bx, word ptr [ebp+8]	;/* z */
		je	L942_YequalZ__hla_
		jne	L816_noMiddle__hla_

L942_YequalZ__hla_:
		push	L956_str__hla_
		call	STDOUT_PUTS	; puts
		call	STDOUT_NEWLN	; newln
		mov	al, 1
		jmp	L843_EndFunction__hla_

L816_noMiddle__hla_:
		mov	al, 0
		push	L970_str__hla_
		call	STDOUT_PUTS	; puts
		call	STDOUT_NEWLN	; newln

L843_EndFunction__hla_:
		pop	bx
		ret
xL810_middle_num__hla___hla_:
;L810_middle_num__hla_ endp




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


		push	L984_str__hla_
		call	STDOUT_PUTS	; puts
		push	eax
		call	STDIN_GETI16	; geti16
		mov	word ptr [L806_val_01__hla_+0], ax	;/* val_01 */
		pop	eax
		push	L1006_str__hla_
		call	STDOUT_PUTS	; puts
		push	eax
		call	STDIN_GETI16	; geti16
		mov	word ptr [L807_val_02__hla_+0], ax	;/* val_02 */
		pop	eax
		push	L1028_str__hla_
		call	STDOUT_PUTS	; puts
		push	eax
		call	STDIN_GETI16	; geti16
		mov	word ptr [L808_val_03__hla_+0], ax	;/* val_03 */
		pop	eax
		push	word ptr [L806_val_01__hla_+0]	;/* val_01 */
		push	word ptr [L807_val_02__hla_+0]	;/* val_02 */
		push	word ptr [L808_val_03__hla_+0]	;/* val_03 */
		push	word ptr [L809_temp_pad__hla_+0]	;/* temp_pad */
		call	L810_middle_num__hla_
		push	L1050_str__hla_
		call	STDOUT_PUTS	; puts
		push	eax
		call	STDOUT_PUTI8	; puti8
		call	STDOUT_NEWLN	; newln
QuitMain__hla_:
		push	dword 00h
		call	dword ptr [__imp__ExitProcess@4]
;_HLAMain        endp


