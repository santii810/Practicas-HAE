
_main:

;P3a.c,2 :: 		void main() {
;P3a.c,3 :: 		ADCON1 = 0x07;
	MOVLW       7
	MOVWF       ADCON1+0 
;P3a.c,4 :: 		TRISB.B0 = 1;
	BSF         TRISB+0, 0 
;P3a.c,5 :: 		TRISB.B1 = 0;
	BCF         TRISB+0, 1 
;P3a.c,6 :: 		PORTB = 0;
	CLRF        PORTB+0 
;P3a.c,7 :: 		INTCON2.RBPU = 0;
	BCF         INTCON2+0, 7 
;P3a.c,9 :: 		while(1){
L_main0:
;P3a.c,10 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main2:
	DECFSZ      R13, 1, 1
	BRA         L_main2
	DECFSZ      R12, 1, 1
	BRA         L_main2
	DECFSZ      R11, 1, 1
	BRA         L_main2
	NOP
;P3a.c,11 :: 		if((anterior == 1) && (PORTB.B0 == 0)){
	MOVF        _anterior+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main5
	BTFSC       PORTB+0, 0 
	GOTO        L_main5
L__main6:
;P3a.c,12 :: 		PORTB.B1 = !PORTB.B1;
	BTG         PORTB+0, 1 
;P3a.c,13 :: 		}
L_main5:
;P3a.c,14 :: 		anterior =   PORTB.B0;
	MOVLW       0
	BTFSC       PORTB+0, 0 
	MOVLW       1
	MOVWF       _anterior+0 
;P3a.c,15 :: 		}
	GOTO        L_main0
;P3a.c,16 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
