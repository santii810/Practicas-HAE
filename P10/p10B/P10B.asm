
_convertir:

;P10B.c,6 :: 		void convertir(){
;P10B.c,7 :: 		PORTC.B0=0;
	BCF         PORTC+0, 0 
;P10B.c,8 :: 		SPI1_WRITE( value >> 8);
	MOVF        _value+1, 0 
	MOVWF       R0 
	MOVLW       0
	BTFSC       _value+1, 7 
	MOVLW       255
	MOVWF       R1 
	MOVF        R0, 0 
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;P10B.c,9 :: 		delay_us(10);
	MOVLW       6
	MOVWF       R13, 0
L_convertir0:
	DECFSZ      R13, 1, 1
	BRA         L_convertir0
	NOP
;P10B.c,10 :: 		SPI1_WRITE(value);
	MOVF        _value+0, 0 
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;P10B.c,11 :: 		PORTC.B0 = 1;
	BSF         PORTC+0, 0 
;P10B.c,12 :: 		}
L_end_convertir:
	RETURN      0
; end of _convertir

_interrupt:

;P10B.c,13 :: 		void interrupt(){
;P10B.c,14 :: 		if(INTCON3.INT1IF){
	BTFSS       INTCON3+0, 0 
	GOTO        L_interrupt1
;P10B.c,16 :: 		}
L_interrupt1:
;P10B.c,17 :: 		if(INTCON.INT1IF){
	BTFSS       INTCON+0, 0 
	GOTO        L_interrupt2
;P10B.c,18 :: 		value -= 0x10;
	MOVLW       16
	SUBWF       _value+0, 1 
	MOVLW       0
	SUBWFB      _value+1, 1 
;P10B.c,20 :: 		}
L_interrupt2:
;P10B.c,23 :: 		}
L_end_interrupt:
L__interrupt7:
	RETFIE      1
; end of _interrupt

_main:

;P10B.c,25 :: 		void main() {
;P10B.c,26 :: 		TRISC = 0;
	CLRF        TRISC+0 
;P10B.c,27 :: 		TRISB = 1;
	MOVLW       1
	MOVWF       TRISB+0 
;P10B.c,28 :: 		PORTC.B0=0;
	BCF         PORTC+0, 0 
;P10B.c,29 :: 		SPI1_INIT();//Inicia el convertidor D/A
	CALL        _SPI1_Init+0, 0
;P10B.c,31 :: 		INTCON.INT0IE = 1;
	BSF         INTCON+0, 4 
;P10B.c,32 :: 		INTCON.INT0IF = 0;
	BCF         INTCON+0, 1 
;P10B.c,34 :: 		INTCON.GIE = 1; //habilitar interrupciones en general
	BSF         INTCON+0, 7 
;P10B.c,36 :: 		while(1){
L_main3:
;P10B.c,46 :: 		asm nop;
	NOP
;P10B.c,47 :: 		}
	GOTO        L_main3
;P10B.c,48 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
