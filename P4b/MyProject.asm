
_interrupt:

;MyProject.c,3 :: 		void interrupt(){
;MyProject.c,4 :: 		INTCON.INT0IF = 0;
	BCF         INTCON+0, 1 
;MyProject.c,5 :: 		if(pulsado == 0){
	MOVLW       0
	XORWF       _pulsado+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt32
	MOVLW       0
	XORWF       _pulsado+0, 0 
L__interrupt32:
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt0
;MyProject.c,6 :: 		PORTC.B1 = 0;
	BCF         PORTC+0, 1 
;MyProject.c,7 :: 		delay_ms(tiempo);
	MOVLW       52
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_interrupt1:
	DECFSZ      R13, 1, 1
	BRA         L_interrupt1
	DECFSZ      R12, 1, 1
	BRA         L_interrupt1
	NOP
	NOP
;MyProject.c,8 :: 		PORTC.B2 = 0;
	BCF         PORTC+0, 2 
;MyProject.c,9 :: 		delay_ms(20);
	MOVLW       52
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_interrupt2:
	DECFSZ      R13, 1, 1
	BRA         L_interrupt2
	DECFSZ      R12, 1, 1
	BRA         L_interrupt2
	NOP
	NOP
;MyProject.c,10 :: 		PORTC.B3 = 1;
	BSF         PORTC+0, 3 
;MyProject.c,11 :: 		delay_ms(20);
	MOVLW       52
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_interrupt3:
	DECFSZ      R13, 1, 1
	BRA         L_interrupt3
	DECFSZ      R12, 1, 1
	BRA         L_interrupt3
	NOP
	NOP
;MyProject.c,12 :: 		PORTC.B3 = 0;
	BCF         PORTC+0, 3 
;MyProject.c,13 :: 		delay_ms(20);
	MOVLW       52
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_interrupt4:
	DECFSZ      R13, 1, 1
	BRA         L_interrupt4
	DECFSZ      R12, 1, 1
	BRA         L_interrupt4
	NOP
	NOP
;MyProject.c,14 :: 		PORTC.B0 = 1;
	BSF         PORTC+0, 0 
;MyProject.c,15 :: 		delay_ms(20);
	MOVLW       52
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_interrupt5:
	DECFSZ      R13, 1, 1
	BRA         L_interrupt5
	DECFSZ      R12, 1, 1
	BRA         L_interrupt5
	NOP
	NOP
;MyProject.c,16 :: 		PORTC.B1 = 1;
	BSF         PORTC+0, 1 
;MyProject.c,17 :: 		delay_ms(20);
	MOVLW       52
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_interrupt6:
	DECFSZ      R13, 1, 1
	BRA         L_interrupt6
	DECFSZ      R12, 1, 1
	BRA         L_interrupt6
	NOP
	NOP
;MyProject.c,18 :: 		pulsado = 1;
	MOVLW       1
	MOVWF       _pulsado+0 
	MOVLW       0
	MOVWF       _pulsado+1 
;MyProject.c,19 :: 		}else{
	GOTO        L_interrupt7
L_interrupt0:
;MyProject.c,20 :: 		PORTC.B1 = 0;
	BCF         PORTC+0, 1 
;MyProject.c,21 :: 		delay_ms(20);
	MOVLW       52
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_interrupt8:
	DECFSZ      R13, 1, 1
	BRA         L_interrupt8
	DECFSZ      R12, 1, 1
	BRA         L_interrupt8
	NOP
	NOP
;MyProject.c,22 :: 		PORTC.B0 = 0;
	BCF         PORTC+0, 0 
;MyProject.c,23 :: 		delay_ms(20);
	MOVLW       52
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_interrupt9:
	DECFSZ      R13, 1, 1
	BRA         L_interrupt9
	DECFSZ      R12, 1, 1
	BRA         L_interrupt9
	NOP
	NOP
;MyProject.c,25 :: 		PORTC.B3 = 1;
	BSF         PORTC+0, 3 
;MyProject.c,26 :: 		delay_ms(20);
	MOVLW       52
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_interrupt10:
	DECFSZ      R13, 1, 1
	BRA         L_interrupt10
	DECFSZ      R12, 1, 1
	BRA         L_interrupt10
	NOP
	NOP
;MyProject.c,27 :: 		PORTC.B3 = 0;
	BCF         PORTC+0, 3 
;MyProject.c,28 :: 		delay_ms(20);
	MOVLW       52
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_interrupt11:
	DECFSZ      R13, 1, 1
	BRA         L_interrupt11
	DECFSZ      R12, 1, 1
	BRA         L_interrupt11
	NOP
	NOP
;MyProject.c,29 :: 		PORTC.B2 = 1;
	BSF         PORTC+0, 2 
;MyProject.c,30 :: 		delay_ms(20);
	MOVLW       52
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_interrupt12:
	DECFSZ      R13, 1, 1
	BRA         L_interrupt12
	DECFSZ      R12, 1, 1
	BRA         L_interrupt12
	NOP
	NOP
;MyProject.c,31 :: 		PORTC.B2 = 0;
	BCF         PORTC+0, 2 
;MyProject.c,32 :: 		delay_ms(20);
	MOVLW       52
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_interrupt13:
	DECFSZ      R13, 1, 1
	BRA         L_interrupt13
	DECFSZ      R12, 1, 1
	BRA         L_interrupt13
	NOP
	NOP
;MyProject.c,33 :: 		PORTC.B1 = 1;
	BSF         PORTC+0, 1 
;MyProject.c,34 :: 		delay_ms(20);
	MOVLW       52
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_interrupt14:
	DECFSZ      R13, 1, 1
	BRA         L_interrupt14
	DECFSZ      R12, 1, 1
	BRA         L_interrupt14
	NOP
	NOP
;MyProject.c,35 :: 		PORTC.B1 = 0;
	BCF         PORTC+0, 1 
;MyProject.c,36 :: 		delay_ms(20);
	MOVLW       52
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_interrupt15:
	DECFSZ      R13, 1, 1
	BRA         L_interrupt15
	DECFSZ      R12, 1, 1
	BRA         L_interrupt15
	NOP
	NOP
;MyProject.c,37 :: 		PORTC.B0 = 1;
	BSF         PORTC+0, 0 
;MyProject.c,38 :: 		delay_ms(20);
	MOVLW       52
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_interrupt16:
	DECFSZ      R13, 1, 1
	BRA         L_interrupt16
	DECFSZ      R12, 1, 1
	BRA         L_interrupt16
	NOP
	NOP
;MyProject.c,42 :: 		PORTC.B3 = 1;
	BSF         PORTC+0, 3 
;MyProject.c,43 :: 		delay_ms(20);
	MOVLW       52
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_interrupt17:
	DECFSZ      R13, 1, 1
	BRA         L_interrupt17
	DECFSZ      R12, 1, 1
	BRA         L_interrupt17
	NOP
	NOP
;MyProject.c,44 :: 		PORTC.B0 = 0;
	BCF         PORTC+0, 0 
;MyProject.c,45 :: 		delay_ms(20);
	MOVLW       52
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_interrupt18:
	DECFSZ      R13, 1, 1
	BRA         L_interrupt18
	DECFSZ      R12, 1, 1
	BRA         L_interrupt18
	NOP
	NOP
;MyProject.c,46 :: 		PORTC.B3 = 0;
	BCF         PORTC+0, 3 
;MyProject.c,47 :: 		delay_ms(20);
	MOVLW       52
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_interrupt19:
	DECFSZ      R13, 1, 1
	BRA         L_interrupt19
	DECFSZ      R12, 1, 1
	BRA         L_interrupt19
	NOP
	NOP
;MyProject.c,48 :: 		PORTC.B2 = 1;
	BSF         PORTC+0, 2 
;MyProject.c,49 :: 		delay_ms(20);
	MOVLW       52
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_interrupt20:
	DECFSZ      R13, 1, 1
	BRA         L_interrupt20
	DECFSZ      R12, 1, 1
	BRA         L_interrupt20
	NOP
	NOP
;MyProject.c,50 :: 		PORTC.B2 = 0;
	BCF         PORTC+0, 2 
;MyProject.c,51 :: 		delay_ms(20);
	MOVLW       52
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_interrupt21:
	DECFSZ      R13, 1, 1
	BRA         L_interrupt21
	DECFSZ      R12, 1, 1
	BRA         L_interrupt21
	NOP
	NOP
;MyProject.c,52 :: 		PORTC.B1 = 1;
	BSF         PORTC+0, 1 
;MyProject.c,53 :: 		delay_ms(20);
	MOVLW       52
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_interrupt22:
	DECFSZ      R13, 1, 1
	BRA         L_interrupt22
	DECFSZ      R12, 1, 1
	BRA         L_interrupt22
	NOP
	NOP
;MyProject.c,54 :: 		PORTC.B0 = 1;
	BSF         PORTC+0, 0 
;MyProject.c,55 :: 		delay_ms(20);
	MOVLW       52
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_interrupt23:
	DECFSZ      R13, 1, 1
	BRA         L_interrupt23
	DECFSZ      R12, 1, 1
	BRA         L_interrupt23
	NOP
	NOP
;MyProject.c,57 :: 		}
L_interrupt7:
;MyProject.c,58 :: 		}
L_end_interrupt:
L__interrupt31:
	RETFIE      1
; end of _interrupt

_main:

;MyProject.c,60 :: 		void main() {
;MyProject.c,61 :: 		TRISC = 0;
	CLRF        TRISC+0 
;MyProject.c,62 :: 		PORTC = 0;
	CLRF        PORTC+0 
;MyProject.c,63 :: 		TRISB = 1;
	MOVLW       1
	MOVWF       TRISB+0 
;MyProject.c,65 :: 		INTCON2.INTEDG0 = 0;
	BCF         INTCON2+0, 6 
;MyProject.c,66 :: 		INTCON.INT0IF = 0;
	BCF         INTCON+0, 1 
;MyProject.c,67 :: 		INTCON.INT0IE = 1;
	BSF         INTCON+0, 4 
;MyProject.c,68 :: 		INTCON.GIE = 1;
	BSF         INTCON+0, 7 
;MyProject.c,71 :: 		PORTC.B0 = 1;
	BSF         PORTC+0, 0 
;MyProject.c,72 :: 		delay_ms(20);
	MOVLW       52
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_main24:
	DECFSZ      R13, 1, 1
	BRA         L_main24
	DECFSZ      R12, 1, 1
	BRA         L_main24
	NOP
	NOP
;MyProject.c,73 :: 		PORTC.B0 = 0;
	BCF         PORTC+0, 0 
;MyProject.c,74 :: 		delay_ms(20);
	MOVLW       52
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_main25:
	DECFSZ      R13, 1, 1
	BRA         L_main25
	DECFSZ      R12, 1, 1
	BRA         L_main25
	NOP
	NOP
;MyProject.c,75 :: 		PORTC.B1 = 1;
	BSF         PORTC+0, 1 
;MyProject.c,76 :: 		delay_ms(20);
	MOVLW       52
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_main26:
	DECFSZ      R13, 1, 1
	BRA         L_main26
	DECFSZ      R12, 1, 1
	BRA         L_main26
	NOP
	NOP
;MyProject.c,77 :: 		PORTC.B2 = 1;
	BSF         PORTC+0, 2 
;MyProject.c,78 :: 		delay_ms(20);
	MOVLW       52
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_main27:
	DECFSZ      R13, 1, 1
	BRA         L_main27
	DECFSZ      R12, 1, 1
	BRA         L_main27
	NOP
	NOP
;MyProject.c,79 :: 		while(1);
L_main28:
	GOTO        L_main28
;MyProject.c,80 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
