
_interrupt:

;p6a.c,1 :: 		void interrupt() // rutina de servicio de la interrupción (MikroC)
;p6a.c,3 :: 		INTCON.TMR0IF = 0; // se borra el flag
	BCF         INTCON+0, 2 
;p6a.c,4 :: 		if(PORTC.B0 == 0){
	BTFSC       PORTC+0, 0 
	GOTO        L_interrupt0
;p6a.c,5 :: 		T0CON = 0xC1;
	MOVLW       193
	MOVWF       T0CON+0 
;p6a.c,6 :: 		TMR0L = 106;
	MOVLW       106
	MOVWF       TMR0L+0 
;p6a.c,7 :: 		}
	GOTO        L_interrupt1
L_interrupt0:
;p6a.c,9 :: 		T0CON = 0xC2;
	MOVLW       194
	MOVWF       T0CON+0 
;p6a.c,10 :: 		TMR0L = 81;
	MOVLW       81
	MOVWF       TMR0L+0 
;p6a.c,11 :: 		}
L_interrupt1:
;p6a.c,12 :: 		PORTC.B0 =~ PORTC.B0;
	BTG         PORTC+0, 0 
;p6a.c,13 :: 		}
L_end_interrupt:
L__interrupt3:
	RETFIE      1
; end of _interrupt

_main:

;p6a.c,14 :: 		void main()
;p6a.c,16 :: 		TRISC.B0 = 0;
	BCF         TRISC+0, 0 
;p6a.c,17 :: 		PORTC.B0 = 0;
	BCF         PORTC+0, 0 
;p6a.c,19 :: 		T0CON = 0xC1;
	MOVLW       193
	MOVWF       T0CON+0 
;p6a.c,20 :: 		INTCON.TMR0IF = 0; // se pone el flag a 0
	BCF         INTCON+0, 2 
;p6a.c,21 :: 		INTCON.TMR0IE = 1; // se habilita la interrupción del Timer 0
	BSF         INTCON+0, 5 
;p6a.c,22 :: 		INTCON.GIE = 1; // se habilitan las interrupciones en general
	BSF         INTCON+0, 7 
;p6a.c,24 :: 		TMR0L = 106; //se carga el valor inicial (alfa) del ‘contador’
	MOVLW       106
	MOVWF       TMR0L+0 
;p6a.c,26 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
