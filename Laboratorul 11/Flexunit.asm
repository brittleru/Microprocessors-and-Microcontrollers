
_serial_init:

;Flexunit.mpas,22 :: 		begin
;Flexunit.mpas,23 :: 		UART1_Init(9600);
	LDI        R27, 103
	OUT        UBRRL+0, R27
	LDI        R27, 0
	OUT        UBRRH+0, R27
	CALL       _UART1_Init+0
;Flexunit.mpas,24 :: 		end;
L_end_serial_init:
	RET
; end of _serial_init

_serial_send:

;Flexunit.mpas,28 :: 		begin
;Flexunit.mpas,29 :: 		datab:=in_0 mod 256;UART1_Write(datab);delay_ms(20);
	PUSH       R2
	PUSH       R3
	MOVW       R16, R2
	ANDI       R16, 255
	ANDI       R17, 0
	PUSH       R3
	PUSH       R2
	MOV        R2, R16
	CALL       _UART1_Write+0
	POP        R2
	POP        R3
	LDI        R18, lo_addr(R2)
	LDI        R17, 160
	LDI        R16, 147
L__serial_send2:
	DEC        R16
	BRNE       L__serial_send2
	DEC        R17
	BRNE       L__serial_send2
	DEC        R18
	BRNE       L__serial_send2
	NOP
;Flexunit.mpas,30 :: 		datab:=in_0 div 256;UART1_Write(datab);delay_ms(20);
	MOV        R16, R3
	LDI        R17, 0
	MOV        R2, R16
	CALL       _UART1_Write+0
	LDI        R18, lo_addr(R2)
	LDI        R17, 160
	LDI        R16, 147
L__serial_send4:
	DEC        R16
	BRNE       L__serial_send4
	DEC        R17
	BRNE       L__serial_send4
	DEC        R18
	BRNE       L__serial_send4
	NOP
;Flexunit.mpas,31 :: 		datab:=in_1 mod 256;UART1_Write(datab);delay_ms(20);
	MOVW       R16, R4
	ANDI       R16, 255
	ANDI       R17, 0
	MOV        R2, R16
	CALL       _UART1_Write+0
	LDI        R18, lo_addr(R2)
	LDI        R17, 160
	LDI        R16, 147
L__serial_send6:
	DEC        R16
	BRNE       L__serial_send6
	DEC        R17
	BRNE       L__serial_send6
	DEC        R18
	BRNE       L__serial_send6
	NOP
;Flexunit.mpas,32 :: 		datab:=in_1 div 256;UART1_Write(datab);delay_ms(20);
	MOV        R16, R5
	LDI        R17, 0
	MOV        R2, R16
	CALL       _UART1_Write+0
	LDI        R18, lo_addr(R2)
	LDI        R17, 160
	LDI        R16, 147
L__serial_send8:
	DEC        R16
	BRNE       L__serial_send8
	DEC        R17
	BRNE       L__serial_send8
	DEC        R18
	BRNE       L__serial_send8
	NOP
;Flexunit.mpas,33 :: 		datab:=ref  mod 256;UART1_Write(datab);delay_ms(20);
	MOVW       R16, R6
	ANDI       R16, 255
	ANDI       R17, 0
	MOV        R2, R16
	CALL       _UART1_Write+0
	LDI        R18, lo_addr(R2)
	LDI        R17, 160
	LDI        R16, 147
L__serial_send10:
	DEC        R16
	BRNE       L__serial_send10
	DEC        R17
	BRNE       L__serial_send10
	DEC        R18
	BRNE       L__serial_send10
	NOP
;Flexunit.mpas,34 :: 		datab:=ref  div 256;UART1_Write(datab);delay_ms(20);
	MOV        R16, R7
	LDI        R17, 0
	MOV        R2, R16
	CALL       _UART1_Write+0
	LDI        R18, lo_addr(R2)
	LDI        R17, 160
	LDI        R16, 147
L__serial_send12:
	DEC        R16
	BRNE       L__serial_send12
	DEC        R17
	BRNE       L__serial_send12
	DEC        R18
	BRNE       L__serial_send12
	NOP
;Flexunit.mpas,36 :: 		end;
L_end_serial_send:
	POP        R3
	POP        R2
	RET
; end of _serial_send

_Init_pwm:

;Flexunit.mpas,39 :: 		begin
;Flexunit.mpas,40 :: 		ddrd.5:=1;portd.5:=0;
	IN         R27, DDRD+0
	SBR        R27, 32
	OUT        DDRD+0, R27
	IN         R27, PORTD+0
	CBR        R27, 32
	OUT        PORTD+0, R27
;Flexunit.mpas,41 :: 		ddrb.3:=1;portb.3:=0;
	IN         R27, DDRB+0
	SBR        R27, 8
	OUT        DDRB+0, R27
	IN         R27, PORTB+0
	CBR        R27, 8
	OUT        PORTB+0, R27
;Flexunit.mpas,42 :: 		ddrd.4:=1;portd.4:=0;
	IN         R27, DDRD+0
	SBR        R27, 16
	OUT        DDRD+0, R27
	IN         R27, PORTD+0
	CBR        R27, 16
	OUT        PORTD+0, R27
;Flexunit.mpas,43 :: 		ddrb.1:=1;portb.1:=0;
	IN         R27, DDRB+0
	SBR        R27, 2
	OUT        DDRB+0, R27
	IN         R27, PORTB+0
	CBR        R27, 2
	OUT        PORTB+0, R27
;Flexunit.mpas,44 :: 		tccr1a:=$A1;
	LDI        R27, 161
	OUT        TCCR1A+0, R27
;Flexunit.mpas,45 :: 		tccr1b:=$0A;
	LDI        R27, 10
	OUT        TCCR1B+0, R27
;Flexunit.mpas,46 :: 		ocr1ah:=0;ocr1al:=0;
	LDI        R27, 0
	OUT        OCR1AH+0, R27
	LDI        R27, 0
	OUT        OCR1AL+0, R27
;Flexunit.mpas,47 :: 		ocr1bh:=0;ocr1bl:=0;
	LDI        R27, 0
	OUT        OCR1BH+0, R27
	LDI        R27, 0
	OUT        OCR1BL+0, R27
;Flexunit.mpas,48 :: 		end ;
L_end_Init_pwm:
	RET
; end of _Init_pwm

_Init_int0:

;Flexunit.mpas,51 :: 		begin
;Flexunit.mpas,52 :: 		gicr.int0:=1;
	IN         R27, GICR+0
	SBR        R27, 64
	OUT        GICR+0, R27
;Flexunit.mpas,53 :: 		sreg.7:=1;
	IN         R27, SREG+0
	SBR        R27, 128
	OUT        SREG+0, R27
;Flexunit.mpas,54 :: 		mcucr.isc00:=1;
	IN         R27, MCUCR+0
	SBR        R27, 1
	OUT        MCUCR+0, R27
;Flexunit.mpas,55 :: 		mcucr.isc01:=1;
	IN         R27, MCUCR+0
	SBR        R27, 2
	OUT        MCUCR+0, R27
;Flexunit.mpas,56 :: 		end;
L_end_Init_int0:
	RET
; end of _Init_int0

_Init_int1:

;Flexunit.mpas,59 :: 		begin
;Flexunit.mpas,60 :: 		gicr.int1:=1;
	IN         R27, GICR+0
	SBR        R27, 128
	OUT        GICR+0, R27
;Flexunit.mpas,61 :: 		sreg.7:=1;
	IN         R27, SREG+0
	SBR        R27, 128
	OUT        SREG+0, R27
;Flexunit.mpas,62 :: 		mcucr.isc10:=1;
	IN         R27, MCUCR+0
	SBR        R27, 4
	OUT        MCUCR+0, R27
;Flexunit.mpas,63 :: 		mcucr.isc11:=1;
	IN         R27, MCUCR+0
	SBR        R27, 8
	OUT        MCUCR+0, R27
;Flexunit.mpas,64 :: 		end;
L_end_Init_int1:
	RET
; end of _Init_int1

_Init_int2:

;Flexunit.mpas,67 :: 		begin
;Flexunit.mpas,68 :: 		gicr.int2:=1;
	IN         R27, GICR+0
	SBR        R27, 32
	OUT        GICR+0, R27
;Flexunit.mpas,69 :: 		sreg.7:=1;
	IN         R27, SREG+0
	SBR        R27, 128
	OUT        SREG+0, R27
;Flexunit.mpas,70 :: 		mcucsr.isc2:=1;
	IN         R27, MCUCSR+0
	SBR        R27, 64
	OUT        MCUCSR+0, R27
;Flexunit.mpas,71 :: 		end;
L_end_Init_int2:
	RET
; end of _Init_int2

_Motor0:

;Flexunit.mpas,74 :: 		begin
;Flexunit.mpas,75 :: 		if a>=0 then begin
	LDI        R27, 0
	CP         R2, R27
	BRGE       L__Motor083
	JMP        L__Motor020
L__Motor083:
;Flexunit.mpas,76 :: 		portb.3:=0;
	IN         R27, PORTB+0
	CBR        R27, 8
	OUT        PORTB+0, R27
;Flexunit.mpas,77 :: 		ocr1al:=a*2;
	MOV        R16, R2
	LSL        R16
	OUT        OCR1AL+0, R16
;Flexunit.mpas,78 :: 		end
	JMP        L__Motor021
;Flexunit.mpas,79 :: 		else begin
L__Motor020:
;Flexunit.mpas,80 :: 		portb.3:=1;
	IN         R27, PORTB+0
	SBR        R27, 8
	OUT        PORTB+0, R27
;Flexunit.mpas,81 :: 		ocr1al:=256+a*2;
	MOV        R16, R2
	LSL        R16
	SUBI       R16, 0
	OUT        OCR1AL+0, R16
;Flexunit.mpas,82 :: 		end;
L__Motor021:
;Flexunit.mpas,83 :: 		end;
L_end_Motor0:
	RET
; end of _Motor0

_Motor1:

;Flexunit.mpas,86 :: 		begin
;Flexunit.mpas,87 :: 		if b>=0 then begin
	LDI        R27, 0
	CP         R2, R27
	BRGE       L__Motor185
	JMP        L__Motor124
L__Motor185:
;Flexunit.mpas,88 :: 		portb.1:=0;
	IN         R27, PORTB+0
	CBR        R27, 2
	OUT        PORTB+0, R27
;Flexunit.mpas,89 :: 		ocr1bl:=b*2;
	MOV        R16, R2
	LSL        R16
	OUT        OCR1BL+0, R16
;Flexunit.mpas,90 :: 		end
	JMP        L__Motor125
;Flexunit.mpas,91 :: 		else begin
L__Motor124:
;Flexunit.mpas,92 :: 		portb.1:=1;
	IN         R27, PORTB+0
	SBR        R27, 2
	OUT        PORTB+0, R27
;Flexunit.mpas,93 :: 		ocr1bl:=256+b*2;
	MOV        R16, R2
	LSL        R16
	SUBI       R16, 0
	OUT        OCR1BL+0, R16
;Flexunit.mpas,94 :: 		end;
L__Motor125:
;Flexunit.mpas,95 :: 		end;
L_end_Motor1:
	RET
; end of _Motor1

_stai_us:

;Flexunit.mpas,98 :: 		begin
;Flexunit.mpas,100 :: 		PUSH R24
	PUSH       R24
;Flexunit.mpas,101 :: 		PUSH R25
	PUSH       R25
;Flexunit.mpas,102 :: 		LDD R24, Y+0
	LDD        R24, Y+0
;Flexunit.mpas,103 :: 		LDD R25, Y+1
	LDD        R25, Y+1
;Flexunit.mpas,104 :: 		SBIW R24, 2
	SBIW       R24, 2
;Flexunit.mpas,105 :: 		CICLU_STAI_US_16:
CICLU_STAI_US_16:
;Flexunit.mpas,106 :: 		NOP
	NOP
;Flexunit.mpas,107 :: 		NOP
	NOP
;Flexunit.mpas,108 :: 		NOP
	NOP
;Flexunit.mpas,109 :: 		NOP
	NOP
;Flexunit.mpas,110 :: 		NOP
	NOP
;Flexunit.mpas,111 :: 		NOP
	NOP
;Flexunit.mpas,112 :: 		NOP
	NOP
;Flexunit.mpas,113 :: 		NOP
	NOP
;Flexunit.mpas,114 :: 		NOP
	NOP
;Flexunit.mpas,115 :: 		NOP
	NOP
;Flexunit.mpas,116 :: 		NOP
	NOP
;Flexunit.mpas,117 :: 		NOP
	NOP
;Flexunit.mpas,118 :: 		SBIW R24,1
	SBIW       R24, 1
;Flexunit.mpas,119 :: 		BRNE CICLU_STAI_US_16
	BRNE       CICLU_STAI_US_16
;Flexunit.mpas,120 :: 		POP R25
	POP        R25
;Flexunit.mpas,121 :: 		POP R24
	POP        R24
;Flexunit.mpas,123 :: 		end;
L_end_stai_us:
	RET
; end of _stai_us

Flexunit_lcd_comm:
	PUSH       R28
	PUSH       R29
	IN         R28, SPL+0
	IN         R29, SPL+1
	SBIW       R28, 2
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;Flexunit.mpas,127 :: 		begin
;Flexunit.mpas,129 :: 		m:=ddrc;
	IN         R16, DDRC+0
	STD        Y+0, R16
;Flexunit.mpas,130 :: 		n:=portc;
; n start address is: 17 (R17)
	IN         R17, PORTC+0
;Flexunit.mpas,131 :: 		o.0:=ddrd.6;
	IN         R27, DDRD+0
	BST        R27, 6
	LDD        R27, Y+1
	BLD        R27, 0
	STD        Y+1, R27
;Flexunit.mpas,132 :: 		o.1:=portd.6;
	IN         R27, PORTD+0
	BST        R27, 6
	LDD        R27, Y+1
	BLD        R27, 1
	STD        Y+1, R27
;Flexunit.mpas,134 :: 		ddrc:=$ff;
	LDI        R27, 255
	OUT        DDRC+0, R27
;Flexunit.mpas,135 :: 		ddrd.6:=1;
	IN         R27, DDRD+0
	SBR        R27, 64
	OUT        DDRD+0, R27
;Flexunit.mpas,136 :: 		if t=1 then portd.6:=1 else portd.6:=0;
	LDI        R27, 1
	CP         R2, R27
	BREQ       L_Flexunit_lcd_comm88
	JMP        L_Flexunit_lcd_comm30
L_Flexunit_lcd_comm88:
	IN         R27, PORTD+0
	SBR        R27, 64
	OUT        PORTD+0, R27
	JMP        L_Flexunit_lcd_comm31
L_Flexunit_lcd_comm30:
	IN         R27, PORTD+0
	CBR        R27, 64
	OUT        PORTD+0, R27
L_Flexunit_lcd_comm31:
;Flexunit.mpas,137 :: 		portc:=b;
	OUT        PORTC+0, R3
;Flexunit.mpas,138 :: 		delay_us(20);
	LDI        R16, 106
L_Flexunit_lcd_comm32:
	DEC        R16
	BRNE       L_Flexunit_lcd_comm32
	NOP
	NOP
;Flexunit.mpas,139 :: 		portd.7:=1;
	IN         R27, PORTD+0
	SBR        R27, 128
	OUT        PORTD+0, R27
;Flexunit.mpas,140 :: 		delay_us(20);
	LDI        R16, 106
L_Flexunit_lcd_comm34:
	DEC        R16
	BRNE       L_Flexunit_lcd_comm34
	NOP
	NOP
;Flexunit.mpas,141 :: 		portd.7:=0;
	IN         R27, PORTD+0
	CBR        R27, 128
	OUT        PORTD+0, R27
;Flexunit.mpas,142 :: 		delay_us(20);
	LDI        R16, 106
L_Flexunit_lcd_comm36:
	DEC        R16
	BRNE       L_Flexunit_lcd_comm36
	NOP
	NOP
;Flexunit.mpas,144 :: 		ddrc:=m;
	LDD        R16, Y+0
	OUT        DDRC+0, R16
;Flexunit.mpas,145 :: 		portc:=n;
	OUT        PORTC+0, R17
; n end address is: 17 (R17)
;Flexunit.mpas,146 :: 		ddrd.6:=o.0;
	LDD        R27, Y+1
	BST        R27, 0
	IN         R27, DDRD+0
	BLD        R27, 6
	OUT        DDRD+0, R27
;Flexunit.mpas,147 :: 		portd.6:=o.1;
	LDD        R27, Y+1
	BST        R27, 1
	IN         R27, PORTD+0
	BLD        R27, 6
	OUT        PORTD+0, R27
;Flexunit.mpas,148 :: 		end;
L_end_lcd_comm:
	ADIW       R28, 1
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	POP        R29
	POP        R28
	RET
; end of Flexunit_lcd_comm

_lcd_init:

;Flexunit.mpas,151 :: 		begin
;Flexunit.mpas,153 :: 		ddrd.7:=1;
	PUSH       R2
	PUSH       R3
	IN         R27, DDRD+0
	SBR        R27, 128
	OUT        DDRD+0, R27
;Flexunit.mpas,154 :: 		delay_ms(20);
	LDI        R18, lo_addr(R2)
	LDI        R17, 160
	LDI        R16, 147
L__lcd_init39:
	DEC        R16
	BRNE       L__lcd_init39
	DEC        R17
	BRNE       L__lcd_init39
	DEC        R18
	BRNE       L__lcd_init39
	NOP
;Flexunit.mpas,155 :: 		lcd_comm(0,$30);
	LDI        R27, 48
	MOV        R3, R27
	CLR        R2
	CALL       Flexunit_lcd_comm+0
;Flexunit.mpas,156 :: 		delay_ms(5);
	LDI        R17, 104
	LDI        R16, 229
L__lcd_init41:
	DEC        R16
	BRNE       L__lcd_init41
	DEC        R17
	BRNE       L__lcd_init41
;Flexunit.mpas,157 :: 		lcd_comm(0,$30);
	LDI        R27, 48
	MOV        R3, R27
	CLR        R2
	CALL       Flexunit_lcd_comm+0
;Flexunit.mpas,158 :: 		delay_us(150);
	LDI        R17, lo_addr(R4)
	LDI        R16, lo_addr(R29)
L__lcd_init43:
	DEC        R16
	BRNE       L__lcd_init43
	DEC        R17
	BRNE       L__lcd_init43
;Flexunit.mpas,159 :: 		lcd_comm(0,$30);
	LDI        R27, 48
	MOV        R3, R27
	CLR        R2
	CALL       Flexunit_lcd_comm+0
;Flexunit.mpas,160 :: 		lcd_comm(0,$38);
	LDI        R27, 56
	MOV        R3, R27
	CLR        R2
	CALL       Flexunit_lcd_comm+0
;Flexunit.mpas,161 :: 		lcd_comm(0,$08);
	LDI        R27, 8
	MOV        R3, R27
	CLR        R2
	CALL       Flexunit_lcd_comm+0
;Flexunit.mpas,162 :: 		lcd_comm(0,$01);
	LDI        R27, 1
	MOV        R3, R27
	CLR        R2
	CALL       Flexunit_lcd_comm+0
;Flexunit.mpas,163 :: 		delay_ms(5);
	LDI        R17, 104
	LDI        R16, 229
L__lcd_init45:
	DEC        R16
	BRNE       L__lcd_init45
	DEC        R17
	BRNE       L__lcd_init45
;Flexunit.mpas,164 :: 		lcd_comm(0,$06);
	LDI        R27, 6
	MOV        R3, R27
	CLR        R2
	CALL       Flexunit_lcd_comm+0
;Flexunit.mpas,165 :: 		lcd_comm(0,$0c);
	LDI        R27, 12
	MOV        R3, R27
	CLR        R2
	CALL       Flexunit_lcd_comm+0
;Flexunit.mpas,166 :: 		end;
L_end_lcd_init:
	POP        R3
	POP        R2
	RET
; end of _lcd_init

_lcd_data:

;Flexunit.mpas,169 :: 		begin
;Flexunit.mpas,170 :: 		lcd_comm(1,b);
	PUSH       R2
	PUSH       R3
	MOV        R3, R2
	LDI        R27, 1
	MOV        R2, R27
	CALL       Flexunit_lcd_comm+0
;Flexunit.mpas,171 :: 		end;
L_end_lcd_data:
	POP        R3
	POP        R2
	RET
; end of _lcd_data

_lcd_cmd:

;Flexunit.mpas,174 :: 		begin
;Flexunit.mpas,175 :: 		lcd_comm(0,b);
	PUSH       R2
	PUSH       R3
	MOV        R3, R2
	CLR        R2
	CALL       Flexunit_lcd_comm+0
;Flexunit.mpas,176 :: 		end;
L_end_lcd_cmd:
	POP        R3
	POP        R2
	RET
; end of _lcd_cmd

_lcd_clear:

;Flexunit.mpas,179 :: 		begin
;Flexunit.mpas,180 :: 		lcd_comm(0,1);
	PUSH       R2
	PUSH       R3
	LDI        R27, 1
	MOV        R3, R27
	CLR        R2
	CALL       Flexunit_lcd_comm+0
;Flexunit.mpas,181 :: 		end;
L_end_lcd_clear:
	POP        R3
	POP        R2
	RET
; end of _lcd_clear

_lcd_move:

;Flexunit.mpas,184 :: 		begin
;Flexunit.mpas,185 :: 		if r=1 then
	PUSH       R2
	PUSH       R3
	LDI        R27, 1
	CP         R2, R27
	BREQ       L__lcd_move94
	JMP        L__lcd_move52
L__lcd_move94:
;Flexunit.mpas,186 :: 		lcd_comm(0,128+c-1)
	MOV        R16, R3
	SUBI       R16, 128
	SUBI       R16, 1
	MOV        R3, R16
	CLR        R2
	CALL       Flexunit_lcd_comm+0
	JMP        L__lcd_move53
;Flexunit.mpas,187 :: 		else
L__lcd_move52:
;Flexunit.mpas,188 :: 		lcd_comm(0,192+c-1);
	MOV        R16, R3
	SUBI       R16, 64
	SUBI       R16, 1
	MOV        R3, R16
	CLR        R2
	CALL       Flexunit_lcd_comm+0
L__lcd_move53:
;Flexunit.mpas,189 :: 		end;
L_end_lcd_move:
	POP        R3
	POP        R2
	RET
; end of _lcd_move

_lcd_text:

;Flexunit.mpas,193 :: 		begin
;Flexunit.mpas,194 :: 		lcd_move(r,c);
	CALL       _lcd_move+0
;Flexunit.mpas,195 :: 		i:=0;
; i start address is: 17 (R17)
; i start address is: 17 (R17)
	LDI        R17, 0
; i end address is: 17 (R17)
; i end address is: 17 (R17)
;Flexunit.mpas,196 :: 		while s[i]<>0 do begin
L__lcd_text56:
; i start address is: 17 (R17)
	MOV        R30, R17
	LDI        R31, 0
	ADD        R30, R4
	ADC        R31, R5
	LD         R16, Z
	CPI        R16, 0
	BRNE       L__lcd_text96
	JMP        L__lcd_text57
L__lcd_text96:
;Flexunit.mpas,197 :: 		lcd_data(s[i]);
	MOV        R30, R17
	LDI        R31, 0
	ADD        R30, R4
	ADC        R31, R5
	LD         R16, Z
	PUSH       R17
	PUSH       R2
	MOV        R2, R16
	CALL       _lcd_data+0
	POP        R2
	POP        R17
;Flexunit.mpas,198 :: 		inc(i);
	MOV        R16, R17
	SUBI       R16, 255
	MOV        R17, R16
;Flexunit.mpas,199 :: 		end;
; i end address is: 17 (R17)
	JMP        L__lcd_text56
L__lcd_text57:
;Flexunit.mpas,200 :: 		end;
L_end_lcd_text:
	RET
; end of _lcd_text

_lcd_byte:

;Flexunit.mpas,203 :: 		begin
;Flexunit.mpas,204 :: 		lcd_move(r,c);
	PUSH       R2
	CALL       _lcd_move+0
;Flexunit.mpas,205 :: 		lcd_data((b div 100)+ord('0'));
	LDI        R20, 100
	MOV        R16, R4
	CALL       _Div_8x8_U+0
	SUBI       R16, 208
	MOV        R2, R16
	CALL       _lcd_data+0
;Flexunit.mpas,206 :: 		lcd_data((b div 10 mod 10)+ord('0'));
	LDI        R20, 10
	MOV        R16, R4
	CALL       _Div_8x8_U+0
	LDI        R20, 10
	CALL       _Div_8x8_U+0
	MOV        R16, R25
	SUBI       R16, 208
	MOV        R2, R16
	CALL       _lcd_data+0
;Flexunit.mpas,207 :: 		lcd_data((b mod 10)+ord('0'));
	LDI        R20, 10
	MOV        R16, R4
	CALL       _Div_8x8_U+0
	MOV        R16, R25
	SUBI       R16, 208
	MOV        R2, R16
	CALL       _lcd_data+0
;Flexunit.mpas,208 :: 		end;
L_end_lcd_byte:
	POP        R2
	RET
; end of _lcd_byte

_lcd_word:

;Flexunit.mpas,212 :: 		begin
;Flexunit.mpas,213 :: 		lcd_move(r,c+4);
	PUSH       R2
	PUSH       R3
	MOV        R16, R3
	SUBI       R16, 252
	MOV        R3, R16
	CALL       _lcd_move+0
;Flexunit.mpas,214 :: 		lcd_cmd($04);
	LDI        R27, 4
	MOV        R2, R27
	CALL       _lcd_cmd+0
;Flexunit.mpas,215 :: 		i:=0;
; i start address is: 18 (R18)
; i start address is: 18 (R18)
	LDI        R18, 0
; i end address is: 18 (R18)
; i end address is: 18 (R18)
;Flexunit.mpas,216 :: 		while w<>0 do begin
L__lcd_word63:
; i start address is: 18 (R18)
	LDI        R27, 0
	CP         R5, R27
	BRNE       L__lcd_word99
	LDI        R27, 0
	CP         R4, R27
L__lcd_word99:
	BRNE       L__lcd_word100
	JMP        L__lcd_word64
L__lcd_word100:
;Flexunit.mpas,217 :: 		lcd_data((w mod 10)+ord('0'));
	LDI        R20, 10
	LDI        R21, 0
	MOVW       R16, R4
	CALL       _Div_16x16_U+0
	MOVW       R16, R26
	SUBI       R16, 208
	PUSH       R18
	PUSH       R2
	MOV        R2, R16
	CALL       _lcd_data+0
	POP        R2
	POP        R18
;Flexunit.mpas,218 :: 		w:=w div 10;
	LDI        R20, 10
	LDI        R21, 0
	MOVW       R16, R4
	CALL       _Div_16x16_U+0
	MOVW       R16, R24
	MOVW       R4, R16
;Flexunit.mpas,219 :: 		i:=i+1;
	MOV        R16, R18
	SUBI       R16, 255
	MOV        R18, R16
;Flexunit.mpas,220 :: 		end;
	JMP        L__lcd_word63
L__lcd_word64:
;Flexunit.mpas,221 :: 		if i=0 then begin
	CPI        R18, 0
	BREQ       L__lcd_word101
	JMP        L__lcd_word75
L__lcd_word101:
;Flexunit.mpas,222 :: 		inc(i);
	MOV        R16, R18
	SUBI       R16, 255
; i end address is: 18 (R18)
; i start address is: 17 (R17)
	MOV        R17, R16
;Flexunit.mpas,223 :: 		lcd_data('0');
	PUSH       R17
	PUSH       R2
	LDI        R27, 48
	MOV        R2, R27
	CALL       _lcd_data+0
; i end address is: 17 (R17)
	POP        R2
	POP        R17
;Flexunit.mpas,224 :: 		end;
	JMP        L__lcd_word68
L__lcd_word75:
;Flexunit.mpas,221 :: 		if i=0 then begin
	MOV        R17, R18
;Flexunit.mpas,224 :: 		end;
L__lcd_word68:
;Flexunit.mpas,225 :: 		for j:=i to 4 do
; i start address is: 17 (R17)
; j start address is: 18 (R18)
	MOV        R18, R17
	LDI        R16, 4
	CP         R16, R17
	BRSH       L__lcd_word102
	JMP        L__lcd_word74
L__lcd_word102:
; i end address is: 17 (R17)
; j end address is: 18 (R18)
	MOV        R17, R18
L__lcd_word71:
;Flexunit.mpas,226 :: 		lcd_data(' ');
; j start address is: 17 (R17)
	PUSH       R17
	PUSH       R2
	LDI        R27, 32
	MOV        R2, R27
	CALL       _lcd_data+0
	POP        R2
	POP        R17
	CPI        R17, 4
	BRNE       L__lcd_word103
	JMP        L__lcd_word74
L__lcd_word103:
	MOV        R16, R17
	SUBI       R16, 255
	MOV        R17, R16
; j end address is: 17 (R17)
	JMP        L__lcd_word71
L__lcd_word74:
;Flexunit.mpas,227 :: 		lcd_cmd(6);
	PUSH       R2
	LDI        R27, 6
	MOV        R2, R27
	CALL       _lcd_cmd+0
	POP        R2
;Flexunit.mpas,228 :: 		end;
L_end_lcd_word:
	POP        R3
	POP        R2
	RET
; end of _lcd_word
