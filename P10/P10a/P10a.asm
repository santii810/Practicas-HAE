
_main:

;P10a.c,4 :: 		void main() {
;P10a.c,5 :: 		TRISC = 0;
	CLRF        TRISC+0 
;P10a.c,6 :: 		PORTC.B0=0;
	BCF         PORTC+0, 0 
;P10a.c,8 :: 		alto = 0x3F;
	MOVLW       63
	MOVWF       _alto+0 
	MOVLW       0
	MOVWF       _alto+1 
;P10a.c,9 :: 		bajo = 0xFF;
	MOVLW       255
	MOVWF       _bajo+0 
	MOVLW       0
	MOVWF       _bajo+1 
;P10a.c,11 :: 		SPI1_INIT();//Inicia el convertidor D/A
	CALL        _SPI1_Init+0, 0
;P10a.c,13 :: 		SPI1_WRITE(alto);
	MOVF        _alto+0, 0 
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;P10a.c,14 :: 		delay_us(100);
	MOVLW       66
	MOVWF       R13, 0
L_main0:
	DECFSZ      R13, 1, 1
	BRA         L_main0
	NOP
;P10a.c,16 :: 		SPI1_WRITE(bajo);
	MOVF        _bajo+0, 0 
	MOVWF       FARG_SPI1_Write_data_+0 
	CALL        _SPI1_Write+0, 0
;P10a.c,18 :: 		delay_us(100);
	MOVLW       66
	MOVWF       R13, 0
L_main1:
	DECFSZ      R13, 1, 1
	BRA         L_main1
	NOP
;P10a.c,19 :: 		PORTC.B0 = 1;
	BSF         PORTC+0, 0 
;P10a.c,21 :: 		while(1){
L_main2:
;P10a.c,22 :: 		asm nop;
	NOP
;P10a.c,23 :: 		}
	GOTO        L_main2
;P10a.c,24 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
