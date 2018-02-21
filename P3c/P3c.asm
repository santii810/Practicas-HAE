
_interrupt:

;P3c.c,3 :: 		void interrupt(){
;P3c.c,4 :: 		INTCON.INT0IF=0;
	BCF         INTCON+0, 1 
;P3c.c,5 :: 		if(cont >= 99){
	MOVLW       99
	SUBWF       _cont+0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L_interrupt0
;P3c.c,6 :: 		cont = 0;
	CLRF        _cont+0 
;P3c.c,7 :: 		}else{
	GOTO        L_interrupt1
L_interrupt0:
;P3c.c,8 :: 		cont++;
	INCF        _cont+0, 1 
;P3c.c,9 :: 		}
L_interrupt1:
;P3c.c,10 :: 		}
L_end_interrupt:
L__interrupt7:
	RETFIE      1
; end of _interrupt

_main:

;P3c.c,11 :: 		void main() {
;P3c.c,12 :: 		ADCON1 = 0x07;
	MOVLW       7
	MOVWF       ADCON1+0 
;P3c.c,13 :: 		TRISB.B0 = 1;
	BSF         TRISB+0, 0 
;P3c.c,14 :: 		TRISB.B1 = 0;
	BCF         TRISB+0, 1 
;P3c.c,15 :: 		PORTB.B1 = 0;
	BCF         PORTB+0, 1 
;P3c.c,16 :: 		INTCON2.RBPU = 0;
	BCF         INTCON2+0, 7 
;P3c.c,17 :: 		INTCON2.INTEDG0 = 0; //flaco de bajada o subida
	BCF         INTCON2+0, 6 
;P3c.c,18 :: 		INTCON.INT0IF = 0;
	BCF         INTCON+0, 1 
;P3c.c,19 :: 		INTCON.INT0IE = 1;
	BSF         INTCON+0, 4 
;P3c.c,20 :: 		INTCON.GIE = 1;
	BSF         INTCON+0, 7 
;P3c.c,23 :: 		TRISC.B0 = 0;
	BCF         TRISC+0, 0 
;P3c.c,24 :: 		TRISC.B1 = 0;
	BCF         TRISC+0, 1 
;P3c.c,25 :: 		PORTC.B0 = 0;
	BCF         PORTC+0, 0 
;P3c.c,26 :: 		PORTC.B1 = 0;
	BCF         PORTC+0, 1 
;P3c.c,27 :: 		TRISD = 0;
	CLRF        TRISD+0 
;P3c.c,28 :: 		PORTD = 0;
	CLRF        PORTD+0 
;P3c.c,30 :: 		while(1){
L_main2:
;P3c.c,31 :: 		PORTD = numeros[cont/10];
	MOVLW       10
	MOVWF       R4 
	MOVF        _cont+0, 0 
	MOVWF       R0 
	CALL        _Div_8X8_U+0, 0
	MOVLW       _numeros+0
	MOVWF       FSR0 
	MOVLW       hi_addr(_numeros+0)
	MOVWF       FSR0H 
	MOVF        R0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       PORTD+0 
;P3c.c,32 :: 		PORTC.B0 = 0;
	BCF         PORTC+0, 0 
;P3c.c,33 :: 		delay_ms(20);
	MOVLW       52
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_main4:
	DECFSZ      R13, 1, 1
	BRA         L_main4
	DECFSZ      R12, 1, 1
	BRA         L_main4
	NOP
	NOP
;P3c.c,34 :: 		PORTC.B0 = 1;
	BSF         PORTC+0, 0 
;P3c.c,36 :: 		PORTD = numeros[cont%10];
	MOVLW       10
	MOVWF       R4 
	MOVF        _cont+0, 0 
	MOVWF       R0 
	CALL        _Div_8X8_U+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVLW       _numeros+0
	MOVWF       FSR0 
	MOVLW       hi_addr(_numeros+0)
	MOVWF       FSR0H 
	MOVF        R0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       PORTD+0 
;P3c.c,37 :: 		PORTC.B1 = 0;
	BCF         PORTC+0, 1 
;P3c.c,38 :: 		delay_ms(20);
	MOVLW       52
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_main5:
	DECFSZ      R13, 1, 1
	BRA         L_main5
	DECFSZ      R12, 1, 1
	BRA         L_main5
	NOP
	NOP
;P3c.c,39 :: 		PORTC.B1 = 1;
	BSF         PORTC+0, 1 
;P3c.c,40 :: 		}
	GOTO        L_main2
;P3c.c,41 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
