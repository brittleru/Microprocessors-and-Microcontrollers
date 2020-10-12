
_main:
	LDI        R27, 255
	OUT        SPL+0, R27
	LDI        R27, 0
	OUT        SPL+1, R27
	IN         R28, SPL+0
	IN         R29, SPL+1
	SBIW       R28, 4
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;aplicatia4.mpas,6 :: 		begin
;aplicatia4.mpas,8 :: 		UART1_init(9600);
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	LDI        R27, 103
	OUT        UBRRL+0, R27
	LDI        R27, 0
	OUT        UBRRH+0, R27
	CALL       _UART1_Init+0
;aplicatia4.mpas,9 :: 		UART1_write_text('255');
	LDI        R27, 50
	STD        Y+0, R27
	LDI        R27, 53
	STD        Y+1, R27
	LDI        R27, 53
	STD        Y+2, R27
	LDI        R27, 0
	STD        Y+3, R27
	MOVW       R16, R28
	MOVW       R2, R16
	CALL       _UART1_Write_Text+0
;aplicatia4.mpas,10 :: 		LCD_init;
	CALL       _lcd_init+0
;aplicatia4.mpas,11 :: 		while 1=1 do begin
L__main2:
;aplicatia4.mpas,12 :: 		if UART1_data_ready then begin
	CALL       _UART1_Data_Ready+0
	TST        R16
	BRNE       L__main12
	JMP        L__main7
L__main12:
;aplicatia4.mpas,13 :: 		k:= UART1_read;
	CALL       _UART1_Read+0
	STS        _k+0, R16
	LDI        R27, 0
	STS        _k+1, R27
;aplicatia4.mpas,14 :: 		LCD_word(1, 1, k);
	LDS        R4, _k+0
	LDS        R5, _k+1
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 1
	MOV        R2, R27
	CALL       _lcd_word+0
;aplicatia4.mpas,15 :: 		delay_ms(30);
	LDI        R18, lo_addr(R3)
	LDI        R17, 112
	LDI        R16, 93
L__main9:
	DEC        R16
	BRNE       L__main9
	DEC        R17
	BRNE       L__main9
	DEC        R18
	BRNE       L__main9
	NOP
;aplicatia4.mpas,16 :: 		end;
L__main7:
;aplicatia4.mpas,17 :: 		end;
	JMP        L__main2
;aplicatia4.mpas,18 :: 		end.
L_end_main:
	JMP        L_end_main
; end of _main
