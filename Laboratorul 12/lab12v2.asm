
_delay:

;lab12v2.mpas,10 :: 		begin
;lab12v2.mpas,11 :: 		for i:= 0 to x do delay_ms(1);
; i start address is: 18 (R18)
; i start address is: 18 (R18)
	LDI        R18, 0
	LDI        R19, 0
; i end address is: 18 (R18)
; i end address is: 18 (R18)
L__delay1:
; i start address is: 18 (R18)
	MOVW       R30, R2
	LD         R16, Z+
	LD         R17, Z+
	CP         R16, R18
	CPC        R17, R19
	BRGE       L__delay27
	JMP        L__delay5
L__delay27:
	LDI        R17, lo_addr(R21)
	LDI        R16, 199
L__delay6:
	DEC        R16
	BRNE       L__delay6
	DEC        R17
	BRNE       L__delay6
	MOVW       R30, R2
	LD         R16, Z+
	LD         R17, Z+
	CP         R18, R16
	CPC        R19, R17
	BRNE       L__delay28
	JMP        L__delay5
L__delay28:
	MOVW       R16, R18
	SUBI       R16, 255
	SBCI       R17, 255
	MOVW       R18, R16
; i end address is: 18 (R18)
	JMP        L__delay1
L__delay5:
;lab12v2.mpas,12 :: 		end;
L_end_delay:
	RET
; end of _delay

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

;lab12v2.mpas,14 :: 		begin
;lab12v2.mpas,16 :: 		DDRB:= $0a;
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	LDI        R27, 10
	OUT        DDRB+0, R27
;lab12v2.mpas,17 :: 		DDRD:= $30;
	LDI        R27, 48
	OUT        DDRD+0, R27
;lab12v2.mpas,18 :: 		DDRC:= $FF;
	LDI        R27, 255
	OUT        DDRC+0, R27
;lab12v2.mpas,19 :: 		LCD_init;
	CALL       _lcd_init+0
;lab12v2.mpas,20 :: 		nrpasi:= 0;
	LDI        R27, 0
	STS        _nrpasi+0, R27
;lab12v2.mpas,21 :: 		while 1=1 do begin
L__main10:
;lab12v2.mpas,22 :: 		t:= ADC_read(1);
	LDI        R27, 1
	MOV        R2, R27
	CALL       _ADC_Read+0
	STS        _t+0, R16
;lab12v2.mpas,23 :: 		t:= t/16;
	LSR        R16
	LSR        R16
	LSR        R16
	LSR        R16
	STS        _t+0, R16
;lab12v2.mpas,24 :: 		LCD_text(1,1, 'Motor Pas cu Pas');
	MOVW       R30, R28
	LDI        R27, 77
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 116
	ST         Z+, R27
	LDI        R27, 111
	ST         Z+, R27
	LDI        R27, 114
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 80
	ST         Z+, R27
	LDI        R27, 97
	ST         Z+, R27
	LDI        R27, 115
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 99
	ST         Z+, R27
	LDI        R27, 117
	ST         Z+, R27
	LDI        R27, 32
	ST         Z+, R27
	LDI        R27, 80
	ST         Z+, R27
	LDI        R27, 97
	ST         Z+, R27
	LDI        R27, 115
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
;lab12v2.mpas,25 :: 		LCD_byte(2, 1, nrpasi);
	LDS        R4, _nrpasi+0
	LDI        R27, 1
	MOV        R3, R27
	LDI        R27, 2
	MOV        R2, R27
	CALL       _lcd_byte+0
;lab12v2.mpas,26 :: 		if t < 5 then t:= 5;
	LDS        R16, _t+0
	CPI        R16, 5
	BRLO       L__main30
	JMP        L__main15
L__main30:
	LDI        R27, 5
	STS        _t+0, R27
L__main15:
;lab12v2.mpas,27 :: 		if t < 63 then begin
	LDS        R16, _t+0
	CPI        R16, 63
	BRLO       L__main31
	JMP        L__main18
L__main31:
;lab12v2.mpas,28 :: 		if PIND.6 = 1 then begin
	IN         R27, PIND+0
	SBRS       R27, 6
	JMP        L__main21
;lab12v2.mpas,29 :: 		PORTB:= pas[0]; PORTC:= $01; delay(t);
	LDI        R27, 2
	OUT        PORTB+0, R27
	LDI        R27, 1
	OUT        PORTC+0, R27
	LDI        R27, #lo_addr(_t+0)
	MOV        R2, R27
	LDI        R27, hi_addr(_t+0)
	MOV        R3, R27
	CALL       _delay+0
;lab12v2.mpas,30 :: 		PORTB:= pas[1]; PORTC:= $02; delay(t);
	LDI        R27, 16
	OUT        PORTB+0, R27
	LDI        R27, 2
	OUT        PORTC+0, R27
	LDI        R27, #lo_addr(_t+0)
	MOV        R2, R27
	LDI        R27, hi_addr(_t+0)
	MOV        R3, R27
	CALL       _delay+0
;lab12v2.mpas,31 :: 		PORTB:= pas[2]; PORTC:= $04; delay(t);
	LDI        R27, 8
	OUT        PORTB+0, R27
	LDI        R27, 4
	OUT        PORTC+0, R27
	LDI        R27, #lo_addr(_t+0)
	MOV        R2, R27
	LDI        R27, hi_addr(_t+0)
	MOV        R3, R27
	CALL       _delay+0
;lab12v2.mpas,32 :: 		PORTB:= pas[3]; PORTC:= $08; delay(t);
	LDI        R27, 32
	OUT        PORTB+0, R27
	LDI        R27, 8
	OUT        PORTC+0, R27
	LDI        R27, #lo_addr(_t+0)
	MOV        R2, R27
	LDI        R27, hi_addr(_t+0)
	MOV        R3, R27
	CALL       _delay+0
;lab12v2.mpas,33 :: 		inc(nrpasi);
	LDS        R16, _nrpasi+0
	SUBI       R16, 255
	STS        _nrpasi+0, R16
;lab12v2.mpas,34 :: 		end;
L__main21:
;lab12v2.mpas,35 :: 		if PIND.6 = 0 then begin
	IN         R27, PIND+0
	SBRC       R27, 6
	JMP        L__main24
;lab12v2.mpas,36 :: 		PORTB:= pas[3]; PORTC:= $08; delay(t);
	LDI        R27, 32
	OUT        PORTB+0, R27
	LDI        R27, 8
	OUT        PORTC+0, R27
	LDI        R27, #lo_addr(_t+0)
	MOV        R2, R27
	LDI        R27, hi_addr(_t+0)
	MOV        R3, R27
	CALL       _delay+0
;lab12v2.mpas,37 :: 		PORTB:= pas[2]; PORTC:= $04; delay(t);
	LDI        R27, 8
	OUT        PORTB+0, R27
	LDI        R27, 4
	OUT        PORTC+0, R27
	LDI        R27, #lo_addr(_t+0)
	MOV        R2, R27
	LDI        R27, hi_addr(_t+0)
	MOV        R3, R27
	CALL       _delay+0
;lab12v2.mpas,38 :: 		PORTB:= pas[1]; PORTC:= $02; delay(t);
	LDI        R27, 16
	OUT        PORTB+0, R27
	LDI        R27, 2
	OUT        PORTC+0, R27
	LDI        R27, #lo_addr(_t+0)
	MOV        R2, R27
	LDI        R27, hi_addr(_t+0)
	MOV        R3, R27
	CALL       _delay+0
;lab12v2.mpas,39 :: 		PORTB:= pas[0]; PORTC:= $01; delay(t);
	LDI        R27, 2
	OUT        PORTB+0, R27
	LDI        R27, 1
	OUT        PORTC+0, R27
	LDI        R27, #lo_addr(_t+0)
	MOV        R2, R27
	LDI        R27, hi_addr(_t+0)
	MOV        R3, R27
	CALL       _delay+0
;lab12v2.mpas,40 :: 		nrpasi:= nrpasi-1;
	LDS        R16, _nrpasi+0
	SUBI       R16, 1
	STS        _nrpasi+0, R16
;lab12v2.mpas,41 :: 		end;
L__main24:
;lab12v2.mpas,42 :: 		end;
L__main18:
;lab12v2.mpas,43 :: 		end;
	JMP        L__main10
;lab12v2.mpas,44 :: 		end.
L_end_main:
	JMP        L_end_main
; end of _main
