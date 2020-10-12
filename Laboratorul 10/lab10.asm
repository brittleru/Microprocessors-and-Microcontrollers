
_main:
	LDI        R27, 255
	OUT        SPL+0, R27
	LDI        R27, 0
	OUT        SPL+1, R27

;lab10.mpas,5 :: 		begin
;lab10.mpas,7 :: 		DDRC:= %00011111;
	PUSH       R2
	LDI        R27, 31
	OUT        DDRC+0, R27
;lab10.mpas,9 :: 		while 1=1 do begin
L__main2:
;lab10.mpas,10 :: 		a:= ADC_Read(1); // Citirea pe canalul 1 al convertorului
	LDI        R27, 1
	MOV        R2, R27
	CALL       _ADC_Read+0
	STS        _a+0, R16
	STS        _a+1, R17
;lab10.mpas,11 :: 		a:= a div 32;     // se imparte valoare citita pentru a putea citi
	LDI        R27, 5
L__main7:
	LSR        R17
	ROR        R16
	DEC        R27
	BRNE       L__main7
L__main8:
	STS        _a+0, R16
	STS        _a+1, R17
;lab10.mpas,12 :: 		PORTC:= a;       // pe leduri
	OUT        PORTC+0, R16
;lab10.mpas,13 :: 		end;
	JMP        L__main2
;lab10.mpas,15 :: 		end.
L_end_main:
	JMP        L_end_main
; end of _main
