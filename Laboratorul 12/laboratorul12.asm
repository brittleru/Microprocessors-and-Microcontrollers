
_delay:

;laboratorul12.mpas,11 :: 		begin
;laboratorul12.mpas,12 :: 		for i:= 0 to x do delay_ms(1);
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
;laboratorul12.mpas,13 :: 		end;
L_end_delay:
	RET
; end of _delay

_main:
	LDI        R27, 255
	OUT        SPL+0, R27
	LDI        R27, 0
	OUT        SPL+1, R27

;laboratorul12.mpas,15 :: 		begin
;laboratorul12.mpas,16 :: 		DDRD:= %00001111;
	PUSH       R2
	PUSH       R3
	LDI        R27, 15
	OUT        DDRD+0, R27
;laboratorul12.mpas,17 :: 		while 1=1 do begin
L__main10:
;laboratorul12.mpas,18 :: 		t:= ADC_read(1);
	LDI        R27, 1
	MOV        R2, R27
	CALL       _ADC_Read+0
	STS        _t+0, R16
	STS        _t+1, R17
;laboratorul12.mpas,19 :: 		t:= t/32;
	LDI        R27, 5
	MOVW       R18, R16
L__main30:
	ASR        R19
	ROR        R18
	DEC        R27
	BRNE       L__main30
L__main31:
	STS        _t+0, R18
	STS        _t+1, R19
;laboratorul12.mpas,21 :: 		if t < 2 then t:= 2;
	LDI        R16, 2
	LDI        R17, 0
	CP         R18, R16
	CPC        R19, R17
	BRLT       L__main32
	JMP        L__main15
L__main32:
	LDI        R27, 2
	STS        _t+0, R27
	LDI        R27, 0
	STS        _t+1, R27
L__main15:
;laboratorul12.mpas,22 :: 		if t < 31 then begin
	LDS        R18, _t+0
	LDS        R19, _t+1
	LDI        R16, 31
	LDI        R17, 0
	CP         R18, R16
	CPC        R19, R17
	BRLT       L__main33
	JMP        L__main18
L__main33:
;laboratorul12.mpas,23 :: 		if PINA.0 = 1 then begin
	IN         R27, PINA+0
	SBRS       R27, 0
	JMP        L__main21
;laboratorul12.mpas,24 :: 		PORTD:= pas[0]; delay(t);
	LDI        R27, 1
	OUT        PORTD+0, R27
	LDI        R27, #lo_addr(_t+0)
	MOV        R2, R27
	LDI        R27, hi_addr(_t+0)
	MOV        R3, R27
	CALL       _delay+0
;laboratorul12.mpas,25 :: 		PORTD:= pas[1]; delay(t);
	LDI        R27, 2
	OUT        PORTD+0, R27
	LDI        R27, #lo_addr(_t+0)
	MOV        R2, R27
	LDI        R27, hi_addr(_t+0)
	MOV        R3, R27
	CALL       _delay+0
;laboratorul12.mpas,26 :: 		PORTD:= pas[2]; delay(t);
	LDI        R27, 4
	OUT        PORTD+0, R27
	LDI        R27, #lo_addr(_t+0)
	MOV        R2, R27
	LDI        R27, hi_addr(_t+0)
	MOV        R3, R27
	CALL       _delay+0
;laboratorul12.mpas,27 :: 		PORTD:= pas[3]; delay(t);
	LDI        R27, 8
	OUT        PORTD+0, R27
	LDI        R27, #lo_addr(_t+0)
	MOV        R2, R27
	LDI        R27, hi_addr(_t+0)
	MOV        R3, R27
	CALL       _delay+0
;laboratorul12.mpas,28 :: 		end;
L__main21:
;laboratorul12.mpas,30 :: 		if PINA.0 = 0 then begin
	IN         R27, PINA+0
	SBRC       R27, 0
	JMP        L__main24
;laboratorul12.mpas,31 :: 		PORTD:= pas[3]; delay(t);
	LDI        R27, 8
	OUT        PORTD+0, R27
	LDI        R27, #lo_addr(_t+0)
	MOV        R2, R27
	LDI        R27, hi_addr(_t+0)
	MOV        R3, R27
	CALL       _delay+0
;laboratorul12.mpas,32 :: 		PORTD:= pas[2]; delay(t);
	LDI        R27, 4
	OUT        PORTD+0, R27
	LDI        R27, #lo_addr(_t+0)
	MOV        R2, R27
	LDI        R27, hi_addr(_t+0)
	MOV        R3, R27
	CALL       _delay+0
;laboratorul12.mpas,33 :: 		PORTD:= pas[1]; delay(t);
	LDI        R27, 2
	OUT        PORTD+0, R27
	LDI        R27, #lo_addr(_t+0)
	MOV        R2, R27
	LDI        R27, hi_addr(_t+0)
	MOV        R3, R27
	CALL       _delay+0
;laboratorul12.mpas,34 :: 		PORTD:= pas[0]; delay(t);
	LDI        R27, 1
	OUT        PORTD+0, R27
	LDI        R27, #lo_addr(_t+0)
	MOV        R2, R27
	LDI        R27, hi_addr(_t+0)
	MOV        R3, R27
	CALL       _delay+0
;laboratorul12.mpas,35 :: 		end;
L__main24:
;laboratorul12.mpas,36 :: 		end;
L__main18:
;laboratorul12.mpas,37 :: 		end;
	JMP        L__main10
;laboratorul12.mpas,38 :: 		end.
L_end_main:
	JMP        L_end_main
; end of _main
