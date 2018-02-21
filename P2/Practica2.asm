
_main:

;Practica2.c,3 :: 		void main() {
;Practica2.c,4 :: 		ADCON1 = 0x07;
	MOVLW       7
	MOVWF       ADCON1+0 
;Practica2.c,5 :: 		TRISD = 0;
	CLRF        TRISD+0 
;Practica2.c,6 :: 		PORTD = 0;
	CLRF        PORTD+0 
;Practica2.c,8 :: 		TRISA.B0 = 0;
	BCF         TRISA+0, 0 
;Practica2.c,9 :: 		TRISA.B1 = 0;
	BCF         TRISA+0, 1 
;Practica2.c,10 :: 		PORTA.B0 = 0;
	BCF         PORTA+0, 0 
;Practica2.c,11 :: 		PORTA.B1 = 0;
	BCF         PORTA+0, 1 
;Practica2.c,12 :: 		while(1){
L_main0:
;Practica2.c,14 :: 		for(i = 0; i< 60; i++){
	CLRF        _i+0 
L_main2:
	MOVLW       60
	SUBWF       _i+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_main3
;Practica2.c,15 :: 		for( j = 0; j<1;j++){
	CLRF        _j+0 
L_main5:
	MOVLW       1
	SUBWF       _j+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_main6
;Practica2.c,16 :: 		PORTD = numeros[i%10];
	MOVLW       10
	MOVWF       R4 
	MOVF        _i+0, 0 
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
;Practica2.c,17 :: 		PORTA.B0 = 1;
	BSF         PORTA+0, 0 
;Practica2.c,18 :: 		delay_ms(20);
	MOVLW       52
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_main8:
	DECFSZ      R13, 1, 1
	BRA         L_main8
	DECFSZ      R12, 1, 1
	BRA         L_main8
	NOP
	NOP
;Practica2.c,19 :: 		PORTA.B0 = 0;
	BCF         PORTA+0, 0 
;Practica2.c,22 :: 		PORTD = numeros[i/10];
	MOVLW       10
	MOVWF       R4 
	MOVF        _i+0, 0 
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
;Practica2.c,24 :: 		PORTA.B1 = 1;
	BSF         PORTA+0, 1 
;Practica2.c,26 :: 		delay_ms(20);
	MOVLW       52
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_main9:
	DECFSZ      R13, 1, 1
	BRA         L_main9
	DECFSZ      R12, 1, 1
	BRA         L_main9
	NOP
	NOP
;Practica2.c,27 :: 		PORTA.B1 = 0;
	BCF         PORTA+0, 1 
;Practica2.c,15 :: 		for( j = 0; j<1;j++){
	INCF        _j+0, 1 
;Practica2.c,28 :: 		}
	GOTO        L_main5
L_main6:
;Practica2.c,14 :: 		for(i = 0; i< 60; i++){
	INCF        _i+0, 1 
;Practica2.c,29 :: 		}
	GOTO        L_main2
L_main3:
;Practica2.c,30 :: 		}
	GOTO        L_main0
;Practica2.c,31 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
