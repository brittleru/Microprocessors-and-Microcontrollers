
_main:
	LDI        R27, 255
	OUT        SPL+0, R27
	LDI        R27, 0
	OUT        SPL+1, R27
	IN         R28, SPL+0
	IN         R29, SPL+1
	SBIW       R28, 10
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;aplicatia3.mpas,5 :: 		begin
;aplicatia3.mpas,7 :: 		LCD_init;
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	CALL       _lcd_init+0
;aplicatia3.mpas,8 :: 		LCD_text(1, 3, 'Mocanu');
	MOVW       R30, R28
	LDI        R27, 77
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 99
	ST         Z+, R27
	LDI        R27, 97
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 117
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	MOVW       R4, R16
	LDI        R27, 3
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _lcd_text+0
;aplicatia3.mpas,9 :: 		LCD_text(2, 4, 'Sebastian');
	MOVW       R30, R28
	LDI        R27, 83
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 98
	ST         Z+, R27
	LDI        R27, 97
	ST         Z+, R27
	LDI        R27, 115
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 97
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	MOVW       R4, R16
	LDI        R27, 4
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _lcd_text+0
;aplicatia3.mpas,11 :: 		end.
L_end_main:
	POP        R5
	POP        R4
	POP        R3
	POP        R2
	JMP        L_end_main
; end of _main
