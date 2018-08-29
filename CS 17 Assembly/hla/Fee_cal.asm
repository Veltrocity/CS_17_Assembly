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

		include	'fee_cal.extpub.inc'




		section	'.data' data readable writeable align 16
		include	'fee_cal.data.inc'

		dd	0	;dummy to keep linker happy
		section	'.bss' readable writeable align 16
		include	'fee_cal.bss.inc'

		rb	4	;dummy to keep linker happy
		section	'.text' code readable executable align 16
		include	'fee_cal.consts.inc'

		include	'fee_cal.ro.inc'

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


		push	L820_str__hla_
		call	STDOUT_PUTS	; puts
		push	eax
		call	STDIN_GETB	; getb
		mov	bl, al
		pop	eax
		mov	ecx, dword ptr [L806_total__hla_+0]	;/* total */
		mov	al, bl
		shr	al, 4
		and	al, 3
		cmp	al, 0
		je	L829_Fall__hla_
		cmp	al, 10
		je	L830_Spring__hla_
		jmp	L831_Winter__hla_

L829_Fall__hla_:
		push	L845_str__hla_
		call	STDOUT_PUTS	; puts
		call	STDOUT_NEWLN	; newln
		mov	al, bl
		shr	al, 7
		and	al, 1
		cmp	al, 1
		je	L850_Total_01__hla_
		add	ecx, 51
		jmp	L851_val_Res__hla_

L830_Spring__hla_:
		push	L865_str__hla_
		call	STDOUT_PUTS	; puts
		call	STDOUT_NEWLN	; newln
		mov	al, bl
		shr	al, 7
		and	al, 1
		cmp	al, 1
		je	L850_Total_01__hla_
		push	L883_str__hla_
		call	STDOUT_PUTS	; puts
		call	STDOUT_NEWLN	; newln
		add	ecx, 51
		jmp	L851_val_Res__hla_

L888_Student_parking__hla_:
		push	L902_str__hla_
		call	STDOUT_PUTS	; puts
		call	STDOUT_NEWLN	; newln
		add	ecx, 136
		jmp	L851_val_Res__hla_

L831_Winter__hla_:
		cmp	al, 11
		je	L907_Summer__hla_
		push	L921_str__hla_
		call	STDOUT_PUTS	; puts
		call	STDOUT_NEWLN	; newln
		mov	al, bl
		shr	al, 7
		and	al, 1
		cmp	al, 1
		je	L850_Total_01__hla_
		push	L939_str__hla_
		call	STDOUT_PUTS	; puts
		call	STDOUT_NEWLN	; newln
		add	ecx, 51
		jmp	L851_val_Res__hla_

L907_Summer__hla_:
		push	L957_str__hla_
		call	STDOUT_PUTS	; puts
		call	STDOUT_NEWLN	; newln
		mov	al, bl
		shr	al, 7
		and	al, 1
		cmp	al, 1
		je	L850_Total_01__hla_
		push	L975_str__hla_
		call	STDOUT_PUTS	; puts
		add	ecx, 51
		jmp	L851_val_Res__hla_

L850_Total_01__hla_:
		push	L989_str__hla_
		call	STDOUT_PUTS	; puts
		call	STDOUT_NEWLN	; newln
		add	ecx, 133
		jmp	L851_val_Res__hla_

L851_val_Res__hla_:
		mov	al, bl
		shr	al, 6
		and	al, 1
		cmp	al, 1
		je	L994_Res__hla_
		push	L1008_str__hla_
		call	STDOUT_PUTS	; puts
		call	STDOUT_NEWLN	; newln
		mov	edx, 335
		jmp	L1013_val_cal__hla_

L994_Res__hla_:
		push	L1027_str__hla_
		call	STDOUT_PUTS	; puts
		call	STDOUT_NEWLN	; newln
		mov	edx, 46
		jmp	L1013_val_cal__hla_

L1013_val_cal__hla_:

L1032_ForLp__hla_:
		mov	al, bl
		and	al, 15
		push	eax
		call	STDOUT_PUTI8	; puti8
		push	L1046_str__hla_
		call	STDOUT_PUTS	; puts
		call	STDOUT_NEWLN	; newln

L1051_ForLpTerminationTest__hla_:
		cmp	al, 0
		jle	L1052_ForLpDone__hla_

L1053_ForLpBody__hla_:
		add	ecx, edx

L1054_ForLpDecrement__hla_:
		dec	al
		jmp	L1051_ForLpTerminationTest__hla_

L1052_ForLpDone__hla_:
		push	L1068_str__hla_
		call	STDOUT_PUTS	; puts
		push	ecx
		call	STDOUT_PUTI32	; puti32
QuitMain__hla_:
		push	dword 00h
		call	dword ptr [__imp__ExitProcess@4]
;_HLAMain        endp


