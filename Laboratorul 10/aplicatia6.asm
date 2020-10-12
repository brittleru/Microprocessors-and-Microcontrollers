
_main:
	LDI        R27, 255
	OUT        SPL+0, R27
	LDI        R27, 0
	OUT        SPL+1, R27
	IN         R28, SPL+0
	IN         R29, SPL+1
	SBIW       R28, 9
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;aplicatia6.mpas,6 :: 		begin
;aplicatia6.mpas,8 :: 		LCD_init;
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	CALL       _lcd_init+0
;aplicatia6.mpas,10 :: 		while 1=1 do begin
L__main2:
;aplicatia6.mpas,12 :: 		k:=ADC_Read(0);
	CLR        R2
	CALL       _ADC_Read+0
	STS        _k+0, R16
	STS        _k+1, R17
;aplicatia6.mpas,13 :: 		k:= k div 8;
	LSR        R17
	ROR        R16
	LSR        R17
	ROR        R16
	LSR        R17
	ROR        R16
	STS        _k+0, R16
	STS        _k+1, R17
;aplicatia6.mpas,14 :: 		LCD_word(1, 8, k);
	MOVW       R4, R16
	LDI        R27, 8
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _lcd_word+0
;aplicatia6.mpas,15 :: 		LCD_text(1, 1, 'Valoare:');
	MOVW       R30, R28
	LDI        R27, 86
	ST         Z+, R27
	LDI        R27, 97
	ST         Z+, R27
	LDI        R27, 108
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 97
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 58
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _lcd_text+0
;aplicatia6.mpas,16 :: 		LCD_text(2, 6, 'Lab10');
	MOVW       R30, R28
	LDI        R27, 76
	ST         Z+, R27
	LDI        R27, 97
	ST         Z+, R27
	LDI        R27, 98
	ST         Z+, R27
	LDI        R27, 49
	ST         Z+, R27
	LDI        R27, 48
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	MOVW       R4, R16
	LDI        R27, 6
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _lcd_text+0
;aplicatia6.mpas,17 :: 		delay_ms(30);
	LDI        R18, lo_addr(R3)
	LDI        R17, 112
	LDI        R16, 93
L__main6:
	DEC        R16
	BRNE       L__main6
	DEC        R17
	BRNE       L__main6
	DEC        R18
	BRNE       L__main6
	NOP
;aplicatia6.mpas,18 :: 		end;
	JMP        L__main2
;aplicatia6.mpas,20 :: 		end.
L_end_main:
	JMP        L_end_main
; end of _main
