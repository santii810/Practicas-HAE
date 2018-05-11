
_interrupt:

;Ejer2_Emisor.c,7 :: 		void interrupt(){
;Ejer2_Emisor.c,9 :: 		if(INTCON.TMR0IF){
	BTFSS       INTCON+0, 2 
	GOTO        L_interrupt0
;Ejer2_Emisor.c,10 :: 		PORTB.B0 = !PORTB.B0;
	BTG         PORTB+0, 0 
;Ejer2_Emisor.c,11 :: 		TMR0H = (18661>>8);
	MOVLW       72
	MOVWF       TMR0H+0 
;Ejer2_Emisor.c,12 :: 		TMR0L = 18661;
	MOVLW       229
	MOVWF       TMR0L+0 
;Ejer2_Emisor.c,13 :: 		ADCON0.B1 = 1;
	BSF         ADCON0+0, 1 
;Ejer2_Emisor.c,14 :: 		INTCON.TMR0IF = 0;
	BCF         INTCON+0, 2 
;Ejer2_Emisor.c,15 :: 		}
L_interrupt0:
;Ejer2_Emisor.c,17 :: 		if(PIR1.ADIF){
	BTFSS       PIR1+0, 6 
	GOTO        L_interrupt1
;Ejer2_Emisor.c,18 :: 		x = ADRESL + (ADRESH << 8);
	MOVF        ADRESH+0, 0 
	MOVWF       R1 
	CLRF        R0 
	MOVF        ADRESL+0, 0 
	ADDWF       R0, 1 
	MOVLW       0
	ADDWFC      R1, 1 
	CALL        _word2double+0, 0
	MOVF        R0, 0 
	MOVWF       _x+0 
	MOVF        R1, 0 
	MOVWF       _x+1 
	MOVF        R2, 0 
	MOVWF       _x+2 
	MOVF        R3, 0 
	MOVWF       _x+3 
;Ejer2_Emisor.c,19 :: 		volt = x * 5 / 1024;        // Multiplicamos por resolucion par obtener voltaje leido
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       32
	MOVWF       R6 
	MOVLW       129
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       0
	MOVWF       R6 
	MOVLW       137
	MOVWF       R7 
	CALL        _Div_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _volt+0 
	MOVF        R1, 0 
	MOVWF       _volt+1 
	MOVF        R2, 0 
	MOVWF       _volt+2 
	MOVF        R3, 0 
	MOVWF       _volt+3 
;Ejer2_Emisor.c,20 :: 		temp = 100.0 * volt -50.0;  // Calcular temperatura a partir del voltaje
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       72
	MOVWF       R6 
	MOVLW       133
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       72
	MOVWF       R6 
	MOVLW       132
	MOVWF       R7 
	CALL        _Sub_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _temp+0 
	MOVF        R1, 0 
	MOVWF       _temp+1 
	MOVF        R2, 0 
	MOVWF       _temp+2 
	MOVF        R3, 0 
	MOVWF       _temp+3 
;Ejer2_Emisor.c,21 :: 		puntero = &temp;
	MOVLW       _temp+0
	MOVWF       _puntero+0 
	MOVLW       hi_addr(_temp+0)
	MOVWF       _puntero+1 
;Ejer2_Emisor.c,24 :: 		UART1_Write(*puntero);
	MOVFF       _puntero+0, FSR0
	MOVFF       _puntero+1, FSR0H
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;Ejer2_Emisor.c,25 :: 		delay_ms(10);
	MOVLW       26
	MOVWF       R12, 0
	MOVLW       248
	MOVWF       R13, 0
L_interrupt2:
	DECFSZ      R13, 1, 1
	BRA         L_interrupt2
	DECFSZ      R12, 1, 1
	BRA         L_interrupt2
	NOP
;Ejer2_Emisor.c,26 :: 		UART1_Write(*(puntero+1));
	MOVLW       1
	ADDWF       _puntero+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      _puntero+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;Ejer2_Emisor.c,27 :: 		delay_ms(10);
	MOVLW       26
	MOVWF       R12, 0
	MOVLW       248
	MOVWF       R13, 0
L_interrupt3:
	DECFSZ      R13, 1, 1
	BRA         L_interrupt3
	DECFSZ      R12, 1, 1
	BRA         L_interrupt3
	NOP
;Ejer2_Emisor.c,28 :: 		UART1_Write(*(puntero+2));
	MOVLW       2
	ADDWF       _puntero+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      _puntero+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;Ejer2_Emisor.c,29 :: 		delay_ms(10);
	MOVLW       26
	MOVWF       R12, 0
	MOVLW       248
	MOVWF       R13, 0
L_interrupt4:
	DECFSZ      R13, 1, 1
	BRA         L_interrupt4
	DECFSZ      R12, 1, 1
	BRA         L_interrupt4
	NOP
;Ejer2_Emisor.c,30 :: 		UART1_Write(*(puntero+3));
	MOVLW       3
	ADDWF       _puntero+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      _puntero+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;Ejer2_Emisor.c,31 :: 		delay_ms(10);
	MOVLW       26
	MOVWF       R12, 0
	MOVLW       248
	MOVWF       R13, 0
L_interrupt5:
	DECFSZ      R13, 1, 1
	BRA         L_interrupt5
	DECFSZ      R12, 1, 1
	BRA         L_interrupt5
	NOP
;Ejer2_Emisor.c,33 :: 		PIR1.ADIF = 0;
	BCF         PIR1+0, 6 
;Ejer2_Emisor.c,34 :: 		}
L_interrupt1:
;Ejer2_Emisor.c,35 :: 		}
L_end_interrupt:
L__interrupt10:
	RETFIE      1
; end of _interrupt

_main:

;Ejer2_Emisor.c,37 :: 		void main() {
;Ejer2_Emisor.c,39 :: 		ADCON1 = 0x00;
	CLRF        ADCON1+0 
;Ejer2_Emisor.c,40 :: 		ADCON0 = 0x03;
	MOVLW       3
	MOVWF       ADCON0+0 
;Ejer2_Emisor.c,41 :: 		ADCON2 = 0x8D;
	MOVLW       141
	MOVWF       ADCON2+0 
;Ejer2_Emisor.c,43 :: 		TRISB.B0 = 0;
	BCF         TRISB+0, 0 
;Ejer2_Emisor.c,46 :: 		T0CON = 0X85;
	MOVLW       133
	MOVWF       T0CON+0 
;Ejer2_Emisor.c,47 :: 		TMR0H = (18661>>8);
	MOVLW       72
	MOVWF       TMR0H+0 
;Ejer2_Emisor.c,48 :: 		TMR0L = 18661;
	MOVLW       229
	MOVWF       TMR0L+0 
;Ejer2_Emisor.c,50 :: 		UART1_Init(9600);
	BSF         BAUDCON+0, 3, 0
	CLRF        SPBRGH+0 
	MOVLW       207
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;Ejer2_Emisor.c,51 :: 		delay_ms(300);
	MOVLW       4
	MOVWF       R11, 0
	MOVLW       12
	MOVWF       R12, 0
	MOVLW       51
	MOVWF       R13, 0
L_main6:
	DECFSZ      R13, 1, 1
	BRA         L_main6
	DECFSZ      R12, 1, 1
	BRA         L_main6
	DECFSZ      R11, 1, 1
	BRA         L_main6
	NOP
	NOP
;Ejer2_Emisor.c,52 :: 		TRISB =0x00;
	CLRF        TRISB+0 
;Ejer2_Emisor.c,54 :: 		INTCON.TMR0IF = 0;   // se pone el flaga 0
	BCF         INTCON+0, 2 
;Ejer2_Emisor.c,55 :: 		INTCON.TMR0IE = 1;    // se habilita la interrupción del Timer 0
	BSF         INTCON+0, 5 
;Ejer2_Emisor.c,57 :: 		PIR1.ADIF = 0;   //el bit PIR1.ADIF se pone a 1 siempre que el convertidor AD finaliza una conversión
	BCF         PIR1+0, 6 
;Ejer2_Emisor.c,61 :: 		una conversion AD*/
	BSF         PIE1+0, 6 
;Ejer2_Emisor.c,63 :: 		INTCON.PEIE = 1;
	BSF         INTCON+0, 6 
;Ejer2_Emisor.c,64 :: 		INTCON.GIE = 1;    // se habilitan las interrupciones en general
	BSF         INTCON+0, 7 
;Ejer2_Emisor.c,67 :: 		ADCON0.B1 = 1;
	BSF         ADCON0+0, 1 
;Ejer2_Emisor.c,70 :: 		while(1){
L_main7:
;Ejer2_Emisor.c,71 :: 		asm nop;
	NOP
;Ejer2_Emisor.c,72 :: 		}
	GOTO        L_main7
;Ejer2_Emisor.c,73 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
