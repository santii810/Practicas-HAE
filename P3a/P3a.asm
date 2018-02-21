
_main:

;P2b.c,2 :: 		void main() {
;P2b.c,3 :: 		TRISB.B0 = 1;
	BSF         TRISB+0, 0 
;P2b.c,4 :: 		TRISB.B1 = 0;
	BCF         TRISB+0, 1 
;P2b.c,5 :: 		PORTB = 0;
	CLRF        PORTB+0 
;P2b.c,6 :: 		INTCON2.RBPU = 0;
	BCF         INTCON2+0, 7 
;P2b.c,8 :: 		while(1){
L_main0:
;P2b.c,9 :: 		delay_ms(100);
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
;P2b.c,10 :: 		if( (PORTB.B0 == 0) && (anterior == 1) ){
	BTFSC       PORTB+0, 0 
	GOTO        L_main5
	MOVF        _anterior+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main5
L__main6:
;P2b.c,11 :: 		PORTB.B1 = !PORTB.B1;
	BTG         PORTB+0, 1 
;P2b.c,13 :: 		}
L_main5:
;P2b.c,14 :: 		PORTB.B0 = anterior;
	BTFSC       _anterior+0, 0 
	GOTO        L__main8
	BCF         PORTB+0, 0 
	GOTO        L__main9
L__main8:
	BSF         PORTB+0, 0 
L__main9:
;P2b.c,16 :: 		}
	GOTO        L_main0
;P2b.c,17 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
