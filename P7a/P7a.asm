
_interrupt:

;P7a.c,20 :: 		void interrupt(){
;P7a.c,21 :: 		x=0;
	CLRF        _x+0 
	CLRF        _x+1 
;P7a.c,22 :: 		x=(ADRESH<<8);
	MOVF        ADRESH+0, 0 
	MOVWF       R1 
	CLRF        R0 
	MOVF        R0, 0 
	MOVWF       _x+0 
	MOVF        R1, 0 
	MOVWF       _x+1 
;P7a.c,23 :: 		x=x+ADRESL;
	MOVF        ADRESL+0, 0 
	ADDWF       R0, 1 
	MOVLW       0
	ADDWFC      R1, 1 
	MOVF        R0, 0 
	MOVWF       _x+0 
	MOVF        R1, 0 
	MOVWF       _x+1 
;P7a.c,24 :: 		v = x*0.00488758553;
	CALL        _word2double+0, 0
	MOVLW       10
	MOVWF       R4 
	MOVLW       40
	MOVWF       R5 
	MOVLW       32
	MOVWF       R6 
	MOVLW       119
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _v+0 
	MOVF        R1, 0 
	MOVWF       _v+1 
	MOVF        R2, 0 
	MOVWF       _v+2 
	MOVF        R3, 0 
	MOVWF       _v+3 
;P7a.c,25 :: 		lcd_cmd(_LCD_CLEAR); //Borra la pantalla
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;P7a.c,26 :: 		FloatToStr(v,txt);
	MOVF        _v+0, 0 
	MOVWF       FARG_FloatToStr_fnum+0 
	MOVF        _v+1, 0 
	MOVWF       FARG_FloatToStr_fnum+1 
	MOVF        _v+2, 0 
	MOVWF       FARG_FloatToStr_fnum+2 
	MOVF        _v+3, 0 
	MOVWF       FARG_FloatToStr_fnum+3 
	MOVLW       _txt+0
	MOVWF       FARG_FloatToStr_str+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_FloatToStr_str+1 
	CALL        _FloatToStr+0, 0
;P7a.c,27 :: 		lcd_out(1,1,txt);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _txt+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;P7a.c,29 :: 		delay_ms(1000);
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
	MOVWF       R13, 0
L_interrupt0:
	DECFSZ      R13, 1, 1
	BRA         L_interrupt0
	DECFSZ      R12, 1, 1
	BRA         L_interrupt0
	DECFSZ      R11, 1, 1
	BRA         L_interrupt0
	NOP
	NOP
;P7a.c,30 :: 		ADCON0.GO = 1;
	BSF         ADCON0+0, 2 
;P7a.c,32 :: 		}
L_end_interrupt:
L__interrupt4:
	RETFIE      1
; end of _interrupt

_main:

;P7a.c,34 :: 		void main() {
;P7a.c,35 :: 		TRISA.B0 = 1;
	BSF         TRISA+0, 0 
;P7a.c,36 :: 		Lcd_Init();
	CALL        _Lcd_Init+0, 0
;P7a.c,37 :: 		PIR1.ADIF =0;
	BCF         PIR1+0, 6 
;P7a.c,38 :: 		PIE1.ADIE = 1; // habilita la interrupcion del convertidor A/D
	BSF         PIE1+0, 6 
;P7a.c,41 :: 		ADCON0 = 0x41;
	MOVLW       65
	MOVWF       ADCON0+0 
;P7a.c,42 :: 		ADCON1 = 0xCE;
	MOVLW       206
	MOVWF       ADCON1+0 
;P7a.c,43 :: 		INTCON.PEIE = 1;
	BSF         INTCON+0, 6 
;P7a.c,44 :: 		INTCON.GIE = 1; // se habilitan las interrupciones en general
	BSF         INTCON+0, 7 
;P7a.c,45 :: 		ADCON0.GO = 1;
	BSF         ADCON0+0, 2 
;P7a.c,47 :: 		while(1)
L_main1:
;P7a.c,48 :: 		asm nop;
	NOP
	GOTO        L_main1
;P7a.c,51 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
