
_main:
	LDI        R27, 255
	OUT        SPL+0, R27
	LDI        R27, 0
	OUT        SPL+1, R27

;aplicatia6.mpas,5 :: 		begin
;aplicatia6.mpas,9 :: 		ddrc:=$FF;
	LDI        R27, 255
	OUT        DDRC+0, R27
;aplicatia6.mpas,10 :: 		portc.1:=1;
	IN         R27, PORTC+0
	SBR        R27, 2
	OUT        PORTC+0, R27
;aplicatia6.mpas,11 :: 		portc.4:=1;
	IN         R27, PORTC+0
	SBR        R27, 16
	OUT        PORTC+0, R27
;aplicatia6.mpas,12 :: 		portc.7:=1;
	IN         R27, PORTC+0
	SBR        R27, 128
	OUT        PORTC+0, R27
;aplicatia6.mpas,15 :: 		end.
L_end_main:
	JMP        L_end_main
; end of _main
