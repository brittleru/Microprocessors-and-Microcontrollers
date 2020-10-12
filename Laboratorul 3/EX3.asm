
_main:
	LDI        R27, 255
	OUT        SPL+0, R27
	LDI        R27, 0
	OUT        SPL+1, R27

;EX3.mpas,5 :: 		begin
;EX3.mpas,8 :: 		LDI R25, %11111111
	LDI        R25, 255
;EX3.mpas,9 :: 		OUT DDRC, R25               // PORT LED    OUTPUT
	OUT        DDRC+0, R25
;EX3.mpas,11 :: 		LDI R25, %00000000
	LDI        R25, lo_addr(R0)
;EX3.mpas,12 :: 		OUT DDRA, R25               // PORT BUTTON INPUT
	OUT        DDRA+0, R25
;EX3.mpas,14 :: 		START:
START:
;EX3.mpas,15 :: 		IN R25, PINA                // CITIM STAREA BUTONULUI
	IN         R25, PINA+0
;EX3.mpas,16 :: 		ANDI R25, %00000001
	ANDI       R25, 1
;EX3.mpas,18 :: 		BRNE STINGERE
	BRNE       STINGERE
;EX3.mpas,20 :: 		LDI R25, %00000000
	LDI        R25, lo_addr(R0)
;EX3.mpas,21 :: 		OUT PORTC, R25
	OUT        PORTC+0, R25
;EX3.mpas,23 :: 		LDI R25, %11111111
	LDI        R25, 255
;EX3.mpas,24 :: 		OUT PORTC, R25
	OUT        PORTC+0, R25
;EX3.mpas,26 :: 		JMP START
	JMP        START
;EX3.mpas,28 :: 		STINGERE:
STINGERE:
;EX3.mpas,29 :: 		LDI R25, %00000000
	LDI        R25, lo_addr(R0)
;EX3.mpas,30 :: 		OUT PORTC, R25
	OUT        PORTC+0, R25
;EX3.mpas,32 :: 		JMP START
	JMP        START
;EX3.mpas,37 :: 		end.
L_end_main:
	JMP        L_end_main
; end of _main
