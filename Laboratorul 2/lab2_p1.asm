
_main:
	LDI        R27, 255
	OUT        SPL+0, R27
	LDI        R27, 0
	OUT        SPL+1, R27

;lab2_p1.mpas,5 :: 		begin
;lab2_p1.mpas,8 :: 		LDI R18, %11111111
	LDI        R18, 255
;lab2_p1.mpas,9 :: 		OUT DDRC, R18
	OUT        DDRC+0, R18
;lab2_p1.mpas,11 :: 		START:
START:
;lab2_p1.mpas,13 :: 		LDI R18, %00100000        // MERGE SI ALT REGISTRU
	LDI        R18, 32
;lab2_p1.mpas,14 :: 		OUT PORTC, R18
	OUT        PORTC+0, R18
;lab2_p1.mpas,16 :: 		CALL DELAY
	CALL       DELAY
;lab2_p1.mpas,18 :: 		LDI R18, %01000000
	LDI        R18, 64
;lab2_p1.mpas,19 :: 		OUT PORTC, R18
	OUT        PORTC+0, R18
;lab2_p1.mpas,21 :: 		CALL DELAY
	CALL       DELAY
;lab2_p1.mpas,23 :: 		LDI R18, %10000000        // MERGE SI ALT REGISTRU
	LDI        R18, 128
;lab2_p1.mpas,24 :: 		OUT PORTC, R18
	OUT        PORTC+0, R18
;lab2_p1.mpas,26 :: 		CALL DELAY
	CALL       DELAY
;lab2_p1.mpas,28 :: 		JMP START
	JMP        START
;lab2_p1.mpas,29 :: 		DELAY:
DELAY:
;lab2_p1.mpas,30 :: 		LDI R20, 40
	LDI        R20, 40
;lab2_p1.mpas,31 :: 		LOOP3:
LOOP3:
;lab2_p1.mpas,32 :: 		LDI R19, 255
	LDI        R19, 255
;lab2_p1.mpas,33 :: 		LOOP2:
LOOP2:
;lab2_p1.mpas,34 :: 		LDI R18, 255
	LDI        R18, 255
;lab2_p1.mpas,35 :: 		LOOP1:
LOOP1:
;lab2_p1.mpas,36 :: 		DEC R18
	DEC        R18
;lab2_p1.mpas,37 :: 		BRNE LOOP1      // BRENCH IF NOT EQUAL CU ETICHETA
	BRNE       LOOP1
;lab2_p1.mpas,38 :: 		DEC R19
	DEC        R19
;lab2_p1.mpas,39 :: 		BRNE LOOP2
	BRNE       LOOP2
;lab2_p1.mpas,40 :: 		DEC R20
	DEC        R20
;lab2_p1.mpas,41 :: 		BRNE LOOP3
	BRNE       LOOP3
;lab2_p1.mpas,42 :: 		RET
	RET
;lab2_p1.mpas,45 :: 		end.
L_end_main:
	JMP        L_end_main
; end of _main
