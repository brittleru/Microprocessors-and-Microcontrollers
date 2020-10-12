
_main:
	LDI        R27, 255
	OUT        SPL+0, R27
	LDI        R27, 0
	OUT        SPL+1, R27

;aplicatia10.mpas,5 :: 		begin
;aplicatia10.mpas,7 :: 		end.
L_end_main:
	JMP        L_end_main
; end of _main
