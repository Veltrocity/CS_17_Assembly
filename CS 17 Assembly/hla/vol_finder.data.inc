		label	L806_r__hla_ dword
		rb	4
		label	L807_b__hla_ dword
		rb	4
		label	L808_h__hla_ dword
		rb	4
		label	L809_pi__hla_ dword
		dd	 3.14159012e+00
		label	L810_vol__hla_ dword
		dd	 3.33330005e-01
		label	L811_sum__hla_ dword
		dd	 0.00000000e+00
		label	L812_sum_01__hla_ dword
		dd	 0.00000000e+00
		label	L813_sum_02__hla_ dword
		dd	 0.00000000e+00
		label	L814_temp__hla_ dword
		dd	 0.00000000e+00
		label	L816_returnAddress__hla_ dword
		rb	4
		label	L817_temp__hla_ word
		rb	2
		label	MainPgmCoroutine__hla_ byte
		dd	MainPgmVMT__hla_
		dd	00h		;/* CurrentSP */
		dd	00h		;/* Pointer to stack */
		dd	00h		;/* ExceptionContext */
		dd	00h		;/* Pointer to last caller */
		label	MainPgmVMT__hla_ word
		dd	QuitMain__hla_
