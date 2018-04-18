
_interrupt:

;p6c.c,4 :: 		void interrupt(){
;p6c.c,5 :: 		if(INTCON3.INT1IF){
	BTFSS       INTCON3+0, 0 
	GOTO        L_interrupt0
;p6c.c,6 :: 		if(!contando){
	MOVF        _contando+0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt1
;p6c.c,7 :: 		contando = 1;
	MOVLW       1
	MOVWF       _contando+0 
;p6c.c,8 :: 		T0CON = 0x84;
	MOVLW       132
	MOVWF       T0CON+0 
;p6c.c,9 :: 		TMR0H = (3035>>8);
	MOVLW       11
	MOVWF       TMR0H+0 
;p6c.c,10 :: 		TMR0L = 3035;
	MOVLW       219
	MOVWF       TMR0L+0 
;p6c.c,11 :: 		PORTC.B0 = 1;
	BSF         PORTC+0, 0 
;p6c.c,12 :: 		INTCON3.INT1IF = 0;
	BCF         INTCON3+0, 0 
;p6c.c,13 :: 		INTCON.TMR0IF = 0;
	BCF         INTCON+0, 2 
;p6c.c,14 :: 		}
L_interrupt1:
;p6c.c,15 :: 		}
L_interrupt0:
;p6c.c,16 :: 		if(INTCON.TMR0IF){
	BTFSS       INTCON+0, 2 
	GOTO        L_interrupt2
;p6c.c,17 :: 		if(cont > 1){
	MOVF        _cont+0, 0 
	SUBLW       1
	BTFSC       STATUS+0, 0 
	GOTO        L_interrupt3
;p6c.c,18 :: 		T0CON = 0x84;
	MOVLW       132
	MOVWF       T0CON+0 
;p6c.c,19 :: 		TMR0H = (3035>>8);
	MOVLW       11
	MOVWF       TMR0H+0 
;p6c.c,20 :: 		TMR0L = 3035;
	MOVLW       219
	MOVWF       TMR0L+0 
;p6c.c,21 :: 		PORTC.B0 = 1;
	BSF         PORTC+0, 0 
;p6c.c,22 :: 		INTCON3.INT1IF = 0;
	BCF         INTCON3+0, 0 
;p6c.c,23 :: 		INTCON.TMR0IF = 0;
	BCF         INTCON+0, 2 
;p6c.c,24 :: 		cont--;
	DECF        _cont+0, 1 
;p6c.c,25 :: 		}        else{
	GOTO        L_interrupt4
L_interrupt3:
;p6c.c,26 :: 		contando = 0;
	CLRF        _contando+0 
;p6c.c,27 :: 		cont = TIEMPO;
	MOVLW       2
	MOVWF       _cont+0 
;p6c.c,28 :: 		T0CON.B7=0;
	BCF         T0CON+0, 7 
;p6c.c,29 :: 		PORTC.B0 = 0;
	BCF         PORTC+0, 0 
;p6c.c,30 :: 		INTCON.TMR0IF = 0;
	BCF         INTCON+0, 2 
;p6c.c,32 :: 		}
L_interrupt4:
;p6c.c,34 :: 		}
L_interrupt2:
;p6c.c,36 :: 		}
L_end_interrupt:
L__interrupt8:
	RETFIE      1
; end of _interrupt

_main:

;p6c.c,37 :: 		void main()
;p6c.c,39 :: 		TRISC.B0 = 0;
	BCF         TRISC+0, 0 
;p6c.c,40 :: 		PORTC.B0 = 0;
	BCF         PORTC+0, 0 
;p6c.c,41 :: 		TRISB.B1 = 1;
	BSF         TRISB+0, 1 
;p6c.c,43 :: 		T0CON.B7=0;
	BCF         T0CON+0, 7 
;p6c.c,44 :: 		INTCON.TMR0IF = 0; // se pone el flag a 0
	BCF         INTCON+0, 2 
;p6c.c,45 :: 		INTCON.TMR0IE = 1; // se habilita la interrupción del Timer 0
	BSF         INTCON+0, 5 
;p6c.c,47 :: 		INTCON2.INTEDG1 = 0;
	BCF         INTCON2+0, 5 
;p6c.c,49 :: 		INTCON3.INT1IF = 0; // se habilita la interrupción del Timer 0
	BCF         INTCON3+0, 0 
;p6c.c,50 :: 		INTCON3.INT1IE = 1; // habilita
	BSF         INTCON3+0, 3 
;p6c.c,51 :: 		INTCON.GIE = 1; // se habilitan las interrupciones en general
	BSF         INTCON+0, 7 
;p6c.c,53 :: 		while(1);
L_main5:
	GOTO        L_main5
;p6c.c,54 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
