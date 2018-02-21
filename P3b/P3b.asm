
_interrupt:

;P3b.c,2 :: 		void interrupt(){
;P3b.c,3 :: 		INTCON.INT0IF=0;
	BCF         INTCON+0, 1 
;P3b.c,4 :: 		PORTB.B1 = !PORTB.B1;
	BTG         PORTB+0, 1 
;P3b.c,5 :: 		}
L_end_interrupt:
L__interrupt3:
	RETFIE      1
; end of _interrupt

_main:

;P3b.c,7 :: 		void main() {
;P3b.c,8 :: 		ADCON1 = 0x07;
	MOVLW       7
	MOVWF       ADCON1+0 
;P3b.c,9 :: 		TRISB.B0 = 1;
	BSF         TRISB+0, 0 
;P3b.c,10 :: 		TRISB.B1 = 0;
	BCF         TRISB+0, 1 
;P3b.c,11 :: 		PORTB.B1 = 0;
	BCF         PORTB+0, 1 
;P3b.c,12 :: 		INTCON2.RBPU = 0;
	BCF         INTCON2+0, 7 
;P3b.c,13 :: 		INTCON2.INTEDG0 = 0; //flaco de bajada o subida
	BCF         INTCON2+0, 6 
;P3b.c,14 :: 		INTCON.INT0IF = 0;
	BCF         INTCON+0, 1 
;P3b.c,15 :: 		INTCON.INT0IE = 1;
	BSF         INTCON+0, 4 
;P3b.c,16 :: 		INTCON.GIE = 1;
	BSF         INTCON+0, 7 
;P3b.c,18 :: 		while(1){
L_main0:
;P3b.c,20 :: 		}
	GOTO        L_main0
;P3b.c,21 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
