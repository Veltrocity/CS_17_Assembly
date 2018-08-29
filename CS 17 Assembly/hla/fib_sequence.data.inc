		label	L1_count__hla_ dword
		rb	4
		label	L2_val_01__hla_ dword
		rb	4
		label	L3_val_02__hla_ dword
		rb	4
		label	L4_val_03__hla_ dword
		rb	4
		label	MainPgmCoroutine__hla_ byte
		dd	MainPgmVMT__hla_
		dd	00h		;/* CurrentSP */
		dd	00h		;/* Pointer to stack */
		dd	00h		;/* ExceptionContext */
		dd	00h		;/* Pointer to last caller */
		label	MainPgmVMT__hla_ word
		dd	QuitMain__hla_
