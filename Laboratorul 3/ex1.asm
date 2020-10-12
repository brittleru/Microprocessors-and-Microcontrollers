
_main:
	LDI        R27, 255
	OUT        SPL+0, R27
	LDI        R27, 0
	OUT        SPL+1, R27

;ex1.mpas,5 :: 		begin
;ex1.mpas,8 :: 		LDI R20, %11111111
	LDI        R20, 255
;ex1.mpas,9 :: 		OUT DDRC, R20
	OUT        DDRC+0, R20
;ex1.mpas,11 :: 		LDI R21, %00000001
	LDI        R21, lo_addr(R1)
;ex1.mpas,12 :: 		START:
START:
;ex1.mpas,14 :: 		OUT PORTC, R21
	OUT        PORTC+0, R21
;ex1.mpas,15 :: 		CALL ASTEAPTA
	CALL       ASTEAPTA
;ex1.mpas,16 :: 		INC R21
	INC        R21
;ex1.mpas,18 :: 		JMP START
	JMP        START
;ex1.mpas,20 :: 		ASTEAPTA:
ASTEAPTA:
;ex1.mpas,21 :: 		LDI R20, 40
	LDI        R20, 40
;ex1.mpas,22 :: 		LOOP3:
LOOP3:
;ex1.mpas,23 :: 		LDI R19, 255
	LDI        R19, 255
;ex1.mpas,24 :: 		LOOP2:
LOOP2:
;ex1.mpas,25 :: 		LDI R18, 255
	LDI        R18, 255
;ex1.mpas,26 :: 		LOOP1:
LOOP1:
;ex1.mpas,27 :: 		DEC R18
	DEC        R18
;ex1.mpas,28 :: 		BRNE LOOP1// BRENCH IF NOT EQUAL CU ETICHETA
	BRNE       LOOP1
;ex1.mpas,29 :: 		DEC R19
	DEC        R19
;ex1.mpas,30 :: 		BRNE LOOP2
	BRNE       LOOP2
;ex1.mpas,31 :: 		DEC R20
	DEC        R20
;ex1.mpas,32 :: 		BRNE LOOP3
	BRNE       LOOP3
;ex1.mpas,33 :: 		RET
	RET
;ex1.mpas,36 :: 		end.
L_end_main:
	JMP        L_end_main
; end of _main
