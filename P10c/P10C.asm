
_convertir:

;P10C.c,6 :: 		void convertir(){
;P10C.c,7 :: 		PORTC.B0=0;
	BCF         PORTC+0, 0 
;P10C.c,8 :: 		SPI1_WRITE( value >> 8);
	MOVF        _value+1, 0 
	MOVWF       R0 
	MOVLW       0
	BTFSC       _value+1, 7 
	MOVLW       255
	MOVWF       R1 
	MOVF        R0, 0 
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;P10C.c,9 :: 		delay_us(10);
	MOVLW       6
	MOVWF       R13, 0
L_convertir0:
	DECFSZ      R13, 1, 1
	BRA         L_convertir0
	NOP
;P10C.c,10 :: 		SPI1_WRITE(value);
	MOVF        _value+0, 0 
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;P10C.c,11 :: 		PORTC.B0 = 1;
	BSF         PORTC+0, 0 
;P10C.c,12 :: 		}
L_end_convertir:
	RETURN      0
; end of _convertir

_interrupt:

;P10C.c,14 :: 		void interrupt(){
;P10C.c,15 :: 		if(INTCON3.INT1IF){
	BTFSS       INTCON3+0, 0 
	GOTO        L_interrupt1
;P10C.c,16 :: 		INTCON3.INT1IF = 0;
	BCF         INTCON3+0, 0 
;P10C.c,17 :: 		value -= 0x10;
	MOVLW       16
	SUBWF       _value+0, 1 
	MOVLW       0
	SUBWFB      _value+1, 1 
;P10C.c,18 :: 		}
L_interrupt1:
;P10C.c,19 :: 		if(INTCON.INT0IF){
	BTFSS       INTCON+0, 1 
	GOTO        L_interrupt2
;P10C.c,20 :: 		INTCON.INT0IF = 0;
	BCF         INTCON+0, 1 
;P10C.c,21 :: 		value += 0x10;
	MOVLW       16
	ADDWF       _value+0, 1 
	MOVLW       0
	ADDWFC      _value+1, 1 
;P10C.c,22 :: 		}
L_interrupt2:
;P10C.c,23 :: 		convertir();
	CALL        _convertir+0, 0
;P10C.c,24 :: 		delay_us(TIME);
	MOVLW       6
	MOVWF       R13, 0
L_interrupt3:
	DECFSZ      R13, 1, 1
	BRA         L_interrupt3
	NOP
;P10C.c,26 :: 		}
L_end_interrupt:
L__interrupt8:
	RETFIE      1
; end of _interrupt

_main:

;P10C.c,28 :: 		void main() {
;P10C.c,29 :: 		ADCON1 = 0x07;
	MOVLW       7
	MOVWF       ADCON1+0 
;P10C.c,31 :: 		SPI1_INIT();//Inicia el convertidor D/A
	CALL        _SPI1_Init+0, 0
;P10C.c,33 :: 		TRISC = 0;
	CLRF        TRISC+0 
;P10C.c,34 :: 		TRISB = 0xFF;
	MOVLW       255
	MOVWF       TRISB+0 
;P10C.c,35 :: 		INTCON2.B7 = 0;
	BCF         INTCON2+0, 7 
;P10C.c,37 :: 		INTCON.INT0IE = 1;
	BSF         INTCON+0, 4 
;P10C.c,38 :: 		INTCON.INT0IF = 0;
	BCF         INTCON+0, 1 
;P10C.c,39 :: 		INTCON2.INTEDG0 = 1;
	BSF         INTCON2+0, 6 
;P10C.c,41 :: 		INTCON3.INT1IE = 1;
	BSF         INTCON3+0, 3 
;P10C.c,42 :: 		INTCON3.INT1IF = 0;
	BCF         INTCON3+0, 0 
;P10C.c,43 :: 		INTCON2.INTEDG1 = 1;
	BSF         INTCON2+0, 5 
;P10C.c,45 :: 		INTCON.GIE = 1; //habilitar interrupciones en general
	BSF         INTCON+0, 7 
;P10C.c,47 :: 		while(1){
L_main4:
;P10C.c,48 :: 		asm nop;
	NOP
;P10C.c,49 :: 		}
	GOTO        L_main4
;P10C.c,50 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
