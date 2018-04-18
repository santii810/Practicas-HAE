
_interrupt:

;P7b.c,20 :: 		void interrupt(){
;P7b.c,21 :: 		if(PIR1.ADIF){
	BTFSS       PIR1+0, 6 
	GOTO        L_interrupt0
;P7b.c,22 :: 		PIR1.ADIF = 0;
	BCF         PIR1+0, 6 
;P7b.c,23 :: 		x=0;
	CLRF        _x+0 
	CLRF        _x+1 
;P7b.c,24 :: 		x=(ADRESH<<8);
	MOVF        ADRESH+0, 0 
	MOVWF       R1 
	CLRF        R0 
	MOVF        R0, 0 
	MOVWF       _x+0 
	MOVF        R1, 0 
	MOVWF       _x+1 
;P7b.c,25 :: 		x=x+ADRESL;
	MOVF        ADRESL+0, 0 
	ADDWF       R0, 1 
	MOVLW       0
	ADDWFC      R1, 1 
	MOVF        R0, 0 
	MOVWF       _x+0 
	MOVF        R1, 0 
	MOVWF       _x+1 
;P7b.c,26 :: 		v = x*0.488758553;   //  la temperatura es el voltaje de salida * 100
	CALL        _word2double+0, 0
	MOVLW       144
	MOVWF       R4 
	MOVLW       62
	MOVWF       R5 
	MOVLW       122
	MOVWF       R6 
	MOVLW       125
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
;P7b.c,27 :: 		lcd_cmd(_LCD_CLEAR); //Borra la pantalla
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;P7b.c,28 :: 		FloatToStr(v,txt);
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
;P7b.c,29 :: 		lcd_out(1,1,txt);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _txt+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;P7b.c,30 :: 		ADCON0.GO = 1;
	BSF         ADCON0+0, 2 
;P7b.c,31 :: 		delay_ms(1000);
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
	MOVWF       R13, 0
L_interrupt1:
	DECFSZ      R13, 1, 1
	BRA         L_interrupt1
	DECFSZ      R12, 1, 1
	BRA         L_interrupt1
	DECFSZ      R11, 1, 1
	BRA         L_interrupt1
	NOP
	NOP
;P7b.c,33 :: 		}
L_interrupt0:
;P7b.c,34 :: 		if(INTCON3.INT1IF){
	BTFSS       INTCON3+0, 0 
	GOTO        L_interrupt2
;P7b.c,35 :: 		INTCON.TMR0IF = 0;
	BCF         INTCON+0, 2 
;P7b.c,36 :: 		ADCON0.GO = 1;        //Hace que empiece la conversion
	BSF         ADCON0+0, 2 
;P7b.c,37 :: 		T0CON = 0x85;
	MOVLW       133
	MOVWF       T0CON+0 
;P7b.c,38 :: 		TMR0H = (18660>>8);         //1.5 seg
	MOVLW       72
	MOVWF       TMR0H+0 
;P7b.c,39 :: 		TMR0L = 18660;
	MOVLW       228
	MOVWF       TMR0L+0 
;P7b.c,40 :: 		INTCON3.INT1IF = 1;
	BSF         INTCON3+0, 0 
;P7b.c,41 :: 		}
L_interrupt2:
;P7b.c,42 :: 		}
L_end_interrupt:
L__interrupt6:
	RETFIE      1
; end of _interrupt

_main:

;P7b.c,44 :: 		void main() {
;P7b.c,45 :: 		TRISE.B1 = 1;
	BSF         TRISE+0, 1 
;P7b.c,46 :: 		Lcd_Init();
	CALL        _Lcd_Init+0, 0
;P7b.c,47 :: 		PIR1.ADIF =0;
	BCF         PIR1+0, 6 
;P7b.c,48 :: 		PIE1.ADIE = 1; // habilita la interrupcion del convertidor A/D
	BSF         PIE1+0, 6 
;P7b.c,51 :: 		ADCON0 = 0x71;
	MOVLW       113
	MOVWF       ADCON0+0 
;P7b.c,52 :: 		ADCON1 = 0xCE;
	MOVLW       206
	MOVWF       ADCON1+0 
;P7b.c,53 :: 		INTCON.PEIE = 1;
	BSF         INTCON+0, 6 
;P7b.c,56 :: 		T0CON.B7=0;      //tiempo = 0 (la primera la hace al empezar)
	BCF         T0CON+0, 7 
;P7b.c,57 :: 		INTCON3.INT1IF = 1;
	BSF         INTCON3+0, 0 
;P7b.c,58 :: 		INTCON3.INT1IE = 1; // se habilita la interrupción del Timer 0
	BSF         INTCON3+0, 3 
;P7b.c,61 :: 		INTCON.GIE = 1; // se habilitan las interrupciones en general
	BSF         INTCON+0, 7 
;P7b.c,62 :: 		ADCON0.GO = 1;        //Hace que empiece la conversion
	BSF         ADCON0+0, 2 
;P7b.c,64 :: 		while(1)
L_main3:
;P7b.c,65 :: 		asm nop;      //operacion en ensablador para no hacer
	NOP
	GOTO        L_main3
;P7b.c,68 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
