
_main:
	LDI        R27, 255
	OUT        SPL+0, R27
	LDI        R27, 0
	OUT        SPL+1, R27

;programul1.mpas,3 :: 		begin
;programul1.mpas,6 :: 		LDI R25,%11111111     // REGISTRUL 25, 11111111= 8 LED-URI
	LDI        R25, 255
;programul1.mpas,7 :: 		OUT DDRC,R25          //REGISTRU CARE-SI IA DATELE
	OUT        DDRC+0, R25
;programul1.mpas,9 :: 		LDI R25,%10000011
	LDI        R25, 131
;programul1.mpas,10 :: 		OUT PORTC,R25
	OUT        PORTC+0, R25
;programul1.mpas,13 :: 		end.
L_end_main:
	JMP        L_end_main
; end of _main
