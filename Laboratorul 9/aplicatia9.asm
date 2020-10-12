
_CustomChar:

;aplicatia9.mpas,10 :: 		begin
;aplicatia9.mpas,12 :: 		LCD_CMD(64);
	PUSH       R2
	LDI        R27, 64
	MOV        R2, R27
	CALL       _lcd_cmd+0
;aplicatia9.mpas,13 :: 		for i := 0 to 7 do LCD_data(character[i]);
; i start address is: 18 (R18)
; i start address is: 18 (R18)
	LDI        R18, 0
; i end address is: 18 (R18)
; i end address is: 18 (R18)
L__CustomChar2:
; i start address is: 18 (R18)
	LDI        R16, #lo_addr(_character+0)
	LDI        R17, hi_addr(_character+0)
	MOV        R30, R18
	LDI        R31, 0
	ADD        R30, R16
	ADC        R31, R17
	LPM        R16, Z
	PUSH       R18
	MOV        R2, R16
	CALL       _lcd_data+0
	POP        R18
	CPI        R18, 7
	BRNE       L__CustomChar13
	JMP        L__CustomChar5
L__CustomChar13:
	MOV        R16, R18
	SUBI       R16, 255
	MOV        R18, R16
; i end address is: 18 (R18)
	JMP        L__CustomChar2
L__CustomChar5:
;aplicatia9.mpas,17 :: 		end;
L_end_CustomChar:
	POP        R2
	RET
; end of _CustomChar

_main:
	LDI        R27, 255
	OUT        SPL+0, R27
	LDI        R27, 0
	OUT        SPL+1, R27
	IN         R28, SPL+0
	IN         R29, SPL+1
	SBIW       R28, 17
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;aplicatia9.mpas,19 :: 		begin
;aplicatia9.mpas,20 :: 		CustomChar();
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	CALL       _CustomChar+0
;aplicatia9.mpas,21 :: 		LCD_init;
	CALL       _lcd_init+0
;aplicatia9.mpas,22 :: 		while 1=1 do begin
L__main8:
;aplicatia9.mpas,24 :: 		LCD_text(1, 1, 'Characterul meu:');
	MOVW       R30, R28
	LDI        R27, 67
	ST         Z+, R27
	LDI        R27, 104
	ST         Z+, R27
	LDI        R27, 97
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 97
	ST         Z+, R27
	LDI        R27, 99
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 117
	ST         Z+, R27
	LDI        R27, 108
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 117
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
;aplicatia9.mpas,25 :: 		LCD_move(2, 4);
	LDI        R27, 4
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _lcd_move+0
;aplicatia9.mpas,26 :: 		LCD_data(0);
	CLR        R2
	CALL       _lcd_data+0
;aplicatia9.mpas,27 :: 		end;
	JMP        L__main8
;aplicatia9.mpas,28 :: 		end.
L_end_main:
	JMP        L_end_main
; end of _main
