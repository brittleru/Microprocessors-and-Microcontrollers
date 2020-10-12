
_main:
	LDI        R27, 255
	OUT        SPL+0, R27
	LDI        R27, 0
	OUT        SPL+1, R27
	IN         R28, SPL+0
	IN         R29, SPL+1
	SBIW       R28, 14
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;lab11.mpas,6 :: 		begin
;lab11.mpas,8 :: 		UART1_init(9600);
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	LDI        R27, 103
	OUT        UBRRL+0, R27
	LDI        R27, 0
	OUT        UBRRH+0, R27
	CALL       _UART1_Init+0
;lab11.mpas,9 :: 		LCD_init;
	CALL       _lcd_init+0
;lab11.mpas,10 :: 		LCD_text(1,1, 'Potentiometru');
	MOVW       R30, R28
	LDI        R27, 80
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 110
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 105
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 109
	ST         Z+, R27
	LDI        R27, 101
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 117
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
;lab11.mpas,12 :: 		while 1=1 do begin
L__main2:
;lab11.mpas,13 :: 		a:= ADC_Read(1) div 4;
	LDI        R27, 1
	MOV        R2, R27
	CALL       _ADC_Read+0
	LSR        R17
	ROR        R16
	LSR        R17
	ROR        R16
	STS        _a+0, R16
	STS        _a+1, R17
;lab11.mpas,14 :: 		LCD_Word(2,1,a);
	MOVW       R4, R16
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _lcd_word+0
;lab11.mpas,15 :: 		UART1_Write(a);
	LDS        R2, _a+0
	CALL       _UART1_Write+0
;lab11.mpas,16 :: 		delay_ms(100);
	LDI        R18, lo_addr(R9)
	LDI        R17, lo_addr(R30)
	LDI        R16, 229
L__main6:
	DEC        R16
	BRNE       L__main6
	DEC        R17
	BRNE       L__main6
	DEC        R18
	BRNE       L__main6
	NOP
;lab11.mpas,18 :: 		if (a > 170) then begin
	LDS        R18, _a+0
	LDS        R19, _a+1
	LDI        R16, 170
	LDI        R17, 0
	CP         R16, R18
	CPC        R17, R19
	BRLO       L__main12
	JMP        L__main9
L__main12:
;lab11.mpas,19 :: 		LCD_text(2,7, 'ATENTIE!');
	MOVW       R30, R28
	LDI        R27, 65
	ST         Z+, R27
	LDI        R27, 84
	ST         Z+, R27
	LDI        R27, 69
	ST         Z+, R27
	LDI        R27, 78
	ST         Z+, R27
	LDI        R27, 84
	ST         Z+, R27
	LDI        R27, 73
	ST         Z+, R27
	LDI        R27, 69
	ST         Z+, R27
	LDI        R27, 33
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	MOVW       R4, R16
	LDI        R27, 7
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _lcd_text+0
;lab11.mpas,20 :: 		UART1_Write('A');
	LDI        R27, 65
	MOV        R2, R27
	CALL       _UART1_Write+0
;lab11.mpas,22 :: 		end
	JMP        L__main10
;lab11.mpas,23 :: 		else begin
L__main9:
;lab11.mpas,24 :: 		LCD_text(2, 7, '          ');
	MOVW       R30, R28
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 0
	ST         Z+, R27
	MOVW       R16, R28
	MOVW       R4, R16
	LDI        R27, 7
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _lcd_text+0
;lab11.mpas,25 :: 		end;
L__main10:
;lab11.mpas,26 :: 		end;
	JMP        L__main2
;lab11.mpas,27 :: 		end.
L_end_main:
	JMP        L_end_main
; end of _main
