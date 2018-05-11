
_interrupt:

;Ejer2_Receptor.c,21 :: 		void interrupt(){
;Ejer2_Receptor.c,23 :: 		if(PIR1.RCIF){
	BTFSS       PIR1+0, 5 
	GOTO        L_interrupt0
;Ejer2_Receptor.c,24 :: 		*(puntero+cont)=UART1_READ();
	MOVF        _cont+0, 0 
	ADDWF       _puntero+0, 0 
	MOVWF       FLOC__interrupt+0 
	MOVF        _cont+1, 0 
	ADDWFC      _puntero+1, 0 
	MOVWF       FLOC__interrupt+1 
	CALL        _UART1_Read+0, 0
	MOVFF       FLOC__interrupt+0, FSR1
	MOVFF       FLOC__interrupt+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;Ejer2_Receptor.c,25 :: 		cont++;
	INFSNZ      _cont+0, 1 
	INCF        _cont+1, 1 
;Ejer2_Receptor.c,27 :: 		if(cont==4){
	MOVLW       0
	XORWF       _cont+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt7
	MOVLW       4
	XORWF       _cont+0, 0 
L__interrupt7:
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt1
;Ejer2_Receptor.c,28 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Ejer2_Receptor.c,29 :: 		FloatToStr(temperatura,txt);
	MOVF        _temperatura+0, 0 
	MOVWF       FARG_FloatToStr_fnum+0 
	MOVF        _temperatura+1, 0 
	MOVWF       FARG_FloatToStr_fnum+1 
	MOVF        _temperatura+2, 0 
	MOVWF       FARG_FloatToStr_fnum+2 
	MOVF        _temperatura+3, 0 
	MOVWF       FARG_FloatToStr_fnum+3 
	MOVLW       _txt+0
	MOVWF       FARG_FloatToStr_str+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_FloatToStr_str+1 
	CALL        _FloatToStr+0, 0
;Ejer2_Receptor.c,30 :: 		lcd_out(1,1,txt);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _txt+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Ejer2_Receptor.c,31 :: 		Lcd_Chr_cp(223);
	MOVLW       223
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;Ejer2_Receptor.c,32 :: 		Lcd_Chr_cp('C');
	MOVLW       67
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;Ejer2_Receptor.c,33 :: 		cont=0;
	CLRF        _cont+0 
	CLRF        _cont+1 
;Ejer2_Receptor.c,34 :: 		}
L_interrupt1:
;Ejer2_Receptor.c,35 :: 		PIR1.RCIF=0;
	BCF         PIR1+0, 5 
;Ejer2_Receptor.c,36 :: 		}
L_interrupt0:
;Ejer2_Receptor.c,38 :: 		}
L_end_interrupt:
L__interrupt6:
	RETFIE      1
; end of _interrupt

_main:

;Ejer2_Receptor.c,39 :: 		void main() {
;Ejer2_Receptor.c,40 :: 		ADCON1 = 0x0f;
	MOVLW       15
	MOVWF       ADCON1+0 
;Ejer2_Receptor.c,41 :: 		cmcon = 0X07;
	MOVLW       7
	MOVWF       CMCON+0 
;Ejer2_Receptor.c,42 :: 		puntero = &temperatura;
	MOVLW       _temperatura+0
	MOVWF       _puntero+0 
	MOVLW       hi_addr(_temperatura+0)
	MOVWF       _puntero+1 
;Ejer2_Receptor.c,44 :: 		PIR1.RCIF = 0;
	BCF         PIR1+0, 5 
;Ejer2_Receptor.c,45 :: 		PIE1.RCIE = 1;
	BSF         PIE1+0, 5 
;Ejer2_Receptor.c,46 :: 		INTCON.PEIE = 1;
	BSF         INTCON+0, 6 
;Ejer2_Receptor.c,47 :: 		INTCON.GIE = 1;
	BSF         INTCON+0, 7 
;Ejer2_Receptor.c,48 :: 		Lcd_Init();
	CALL        _Lcd_Init+0, 0
;Ejer2_Receptor.c,49 :: 		UART1_Init(9600);
	BSF         BAUDCON+0, 3, 0
	CLRF        SPBRGH+0 
	MOVLW       207
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;Ejer2_Receptor.c,50 :: 		delay_ms(300);
	MOVLW       4
	MOVWF       R11, 0
	MOVLW       12
	MOVWF       R12, 0
	MOVLW       51
	MOVWF       R13, 0
L_main2:
	DECFSZ      R13, 1, 1
	BRA         L_main2
	DECFSZ      R12, 1, 1
	BRA         L_main2
	DECFSZ      R11, 1, 1
	BRA         L_main2
	NOP
	NOP
;Ejer2_Receptor.c,51 :: 		while(1){
L_main3:
;Ejer2_Receptor.c,52 :: 		asm nop;
	NOP
;Ejer2_Receptor.c,53 :: 		}
	GOTO        L_main3
;Ejer2_Receptor.c,54 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
