
_main:
	LDI        R27, 255
	OUT        SPL+0, R27
	LDI        R27, 0
	OUT        SPL+1, R27

;lab13.mpas,5 :: 		begin
;lab13.mpas,7 :: 		DDRA:= %00000000;
	PUSH       R2
	LDI        R27, 0
	OUT        DDRA+0, R27
;lab13.mpas,8 :: 		DDRD:= %00001111;
	LDI        R27, 15
	OUT        DDRD+0, R27
;lab13.mpas,10 :: 		while 1=1 do begin
L__main2:
;lab13.mpas,11 :: 		t:= ADC_read(1);
	LDI        R27, 1
	MOV        R2, R27
	CALL       _ADC_Read+0
	STS        _t+0, R16
	STS        _t+1, R17
;lab13.mpas,13 :: 		if t < 512 then begin
	LDI        R18, 0
	LDI        R19, 2
	CP         R16, R18
	CPC        R17, R19
	BRLT       L__main32
	JMP        L__main7
L__main32:
;lab13.mpas,14 :: 		if PINA.0 = 0 then begin
	IN         R27, PINA+0
	SBRC       R27, 0
	JMP        L__main10
;lab13.mpas,15 :: 		PORTD.4:= 1;
	IN         R27, PORTD+0
	SBR        R27, 16
	OUT        PORTD+0, R27
;lab13.mpas,16 :: 		delay_us(1750);
	LDI        R17, 37
	LDI        R16, 92
L__main12:
	DEC        R16
	BRNE       L__main12
	DEC        R17
	BRNE       L__main12
	NOP
;lab13.mpas,17 :: 		PORTD.4:= 0;
	IN         R27, PORTD+0
	CBR        R27, 16
	OUT        PORTD+0, R27
;lab13.mpas,18 :: 		delay_us(a - 1750);
	LDI        R18, lo_addr(R2)
	LDI        R17, 124
	LDI        R16, 54
L__main14:
	DEC        R16
	BRNE       L__main14
	DEC        R17
	BRNE       L__main14
	DEC        R18
	BRNE       L__main14
;lab13.mpas,19 :: 		end
	JMP        L__main11
;lab13.mpas,21 :: 		else begin
L__main10:
;lab13.mpas,22 :: 		PORTD.4:= 1;
	IN         R27, PORTD+0
	SBR        R27, 16
	OUT        PORTD+0, R27
;lab13.mpas,23 :: 		delay_us(2000);
	LDI        R17, 42
	LDI        R16, 142
L__main16:
	DEC        R16
	BRNE       L__main16
	DEC        R17
	BRNE       L__main16
	NOP
;lab13.mpas,24 :: 		PORTD.4:= 0;
	IN         R27, PORTD+0
	CBR        R27, 16
	OUT        PORTD+0, R27
;lab13.mpas,25 :: 		delay_us(a - 2000);
	LDI        R18, lo_addr(R2)
	LDI        R17, 119
	LDI        R16, lo_addr(R4)
L__main18:
	DEC        R16
	BRNE       L__main18
	DEC        R17
	BRNE       L__main18
	DEC        R18
	BRNE       L__main18
;lab13.mpas,26 :: 		end;
L__main11:
;lab13.mpas,27 :: 		end
	JMP        L__main8
;lab13.mpas,28 :: 		else begin
L__main7:
;lab13.mpas,29 :: 		if PINA.0 = 0 then begin
	IN         R27, PINA+0
	SBRC       R27, 0
	JMP        L__main21
;lab13.mpas,30 :: 		PORTD.4:= 1;
	IN         R27, PORTD+0
	SBR        R27, 16
	OUT        PORTD+0, R27
;lab13.mpas,31 :: 		delay_us(1500);
	LDI        R17, 32
	LDI        R16, 42
L__main23:
	DEC        R16
	BRNE       L__main23
	DEC        R17
	BRNE       L__main23
	NOP
;lab13.mpas,32 :: 		PORTD.4:= 0;
	IN         R27, PORTD+0
	CBR        R27, 16
	OUT        PORTD+0, R27
;lab13.mpas,33 :: 		delay_us(a - 1500);
	LDI        R18, lo_addr(R2)
	LDI        R17, 129
	LDI        R16, 104
L__main25:
	DEC        R16
	BRNE       L__main25
	DEC        R17
	BRNE       L__main25
	DEC        R18
	BRNE       L__main25
;lab13.mpas,34 :: 		end
	JMP        L__main22
;lab13.mpas,36 :: 		else begin
L__main21:
;lab13.mpas,37 :: 		PORTD.4:= 1;
	IN         R27, PORTD+0
	SBR        R27, 16
	OUT        PORTD+0, R27
;lab13.mpas,38 :: 		delay_us(2000);
	LDI        R17, 42
	LDI        R16, 142
L__main27:
	DEC        R16
	BRNE       L__main27
	DEC        R17
	BRNE       L__main27
	NOP
;lab13.mpas,39 :: 		PORTD.4:= 0;
	IN         R27, PORTD+0
	CBR        R27, 16
	OUT        PORTD+0, R27
;lab13.mpas,40 :: 		delay_us(a - 2000);
	LDI        R18, lo_addr(R2)
	LDI        R17, 119
	LDI        R16, lo_addr(R4)
L__main29:
	DEC        R16
	BRNE       L__main29
	DEC        R17
	BRNE       L__main29
	DEC        R18
	BRNE       L__main29
;lab13.mpas,41 :: 		end;
L__main22:
;lab13.mpas,42 :: 		end;
L__main8:
;lab13.mpas,44 :: 		end;
	JMP        L__main2
;lab13.mpas,45 :: 		end.
L_end_main:
	JMP        L_end_main
; end of _main
