
_interrupt:

;P4b.c,4 :: 		void interrupt() //rutina de servicio de interrupciones (MikroC)
;P4b.c,7 :: 		INTCON.INT0IF = 0; // se borra el flag de la interrupción INT0
	BCF         INTCON+0, 1 
;P4b.c,8 :: 		}
L_end_interrupt:
L__interrupt5:
	RETFIE      1
; end of _interrupt

_main:

;P4b.c,10 :: 		void main()
;P4b.c,13 :: 		ADCON1=0x07; //Configuración de los canales analógicos como digitales
	MOVLW       7
	MOVWF       ADCON1+0 
;P4b.c,16 :: 		TRISC=0;   //Terminales RD como salida digital
	CLRF        TRISC+0 
;P4b.c,17 :: 		TRISB.B0=1;
	BSF         TRISB+0, 0 
;P4b.c,20 :: 		ADCON1=0x07; //Configuración de los canales analógicos como digitales
	MOVLW       7
	MOVWF       ADCON1+0 
;P4b.c,21 :: 		RBPU_bit=0;
	BCF         RBPU_bit+0, BitPos(RBPU_bit+0) 
;P4b.c,22 :: 		TRISB.B1=0;
	BCF         TRISB+0, 1 
;P4b.c,23 :: 		PORTB.B1=0;
	BCF         PORTB+0, 1 
;P4b.c,24 :: 		TRISB.B0 = 1; //se configura RB0 como entrada
	BSF         TRISB+0, 0 
;P4b.c,25 :: 		INTCON2.INTEDG0 = 0; //la interrupción la provoca un flanco de subida (x=1)/ bajada (x=0)
	BCF         INTCON2+0, 6 
;P4b.c,26 :: 		INTCON.INT0IF = 0; // se pone el flag de la interrupción INT0 a 0
	BCF         INTCON+0, 1 
;P4b.c,27 :: 		INTCON.INT0IE = 1; // se habilita la interrupción INT0
	BSF         INTCON+0, 4 
;P4b.c,28 :: 		INTCON.GIE = 1; // se habilitan las interrupciones en general
	BSF         INTCON+0, 7 
;P4b.c,36 :: 		PORTC.B1=1;
	BSF         PORTC+0, 1 
;P4b.c,37 :: 		delay_ms(20); //retardo
	MOVLW       52
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_main0:
	DECFSZ      R13, 1, 1
	BRA         L_main0
	DECFSZ      R12, 1, 1
	BRA         L_main0
	NOP
	NOP
;P4b.c,38 :: 		PORTC.B2=1;
	BSF         PORTC+0, 2 
;P4b.c,39 :: 		delay_ms(20); //retardo
	MOVLW       52
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_main1:
	DECFSZ      R13, 1, 1
	BRA         L_main1
	DECFSZ      R12, 1, 1
	BRA         L_main1
	NOP
	NOP
;P4b.c,41 :: 		while(1){//Buble infinito
L_main2:
;P4b.c,42 :: 		}
	GOTO        L_main2
;P4b.c,43 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
