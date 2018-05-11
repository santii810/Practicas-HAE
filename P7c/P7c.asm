
_representar:

;P7c.c,20 :: 		void representar(){
;P7c.c,21 :: 		v = x*0.488758553;   //  la temperatura es el voltaje de salida * 100
	MOVF        _x+0, 0 
	MOVWF       R0 
	MOVF        _x+1, 0 
	MOVWF       R1 
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
;P7c.c,22 :: 		if(escala){ // farenheit
	MOVF        _escala+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_representar0
;P7c.c,23 :: 		v = v*1.8 + 32.0;
	MOVF        _v+0, 0 
	MOVWF       R0 
	MOVF        _v+1, 0 
	MOVWF       R1 
	MOVF        _v+2, 0 
	MOVWF       R2 
	MOVF        _v+3, 0 
	MOVWF       R3 
	MOVLW       102
	MOVWF       R4 
	MOVLW       102
	MOVWF       R5 
	MOVLW       102
	MOVWF       R6 
	MOVLW       127
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       0
	MOVWF       R6 
	MOVLW       132
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _v+0 
	MOVF        R1, 0 
	MOVWF       _v+1 
	MOVF        R2, 0 
	MOVWF       _v+2 
	MOVF        R3, 0 
	MOVWF       _v+3 
;P7c.c,24 :: 		}
L_representar0:
;P7c.c,25 :: 		if(escala == 2){ //Kelvin
	MOVF        _escala+0, 0 
	XORLW       2
	BTFSS       STATUS+0, 2 
	GOTO        L_representar1
;P7c.c,26 :: 		v += 273.15;
	MOVF        _v+0, 0 
	MOVWF       R0 
	MOVF        _v+1, 0 
	MOVWF       R1 
	MOVF        _v+2, 0 
	MOVWF       R2 
	MOVF        _v+3, 0 
	MOVWF       R3 
	MOVLW       51
	MOVWF       R4 
	MOVLW       147
	MOVWF       R5 
	MOVLW       8
	MOVWF       R6 
	MOVLW       135
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _v+0 
	MOVF        R1, 0 
	MOVWF       _v+1 
	MOVF        R2, 0 
	MOVWF       _v+2 
	MOVF        R3, 0 
	MOVWF       _v+3 
;P7c.c,27 :: 		}
L_representar1:
;P7c.c,28 :: 		FloatToStr(v,txt);
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
;P7c.c,29 :: 		lcd_cmd(_LCD_CLEAR); //Borra la pantalla
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;P7c.c,30 :: 		lcd_out(1,1,txt);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _txt+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;P7c.c,31 :: 		}
L_end_representar:
	RETURN      0
; end of _representar

_interrupt:

;P7c.c,33 :: 		void interrupt(){
;P7c.c,34 :: 		if(PIR1.ADIF){ //interrupcion provocada por convertidor AD
	BTFSS       PIR1+0, 6 
	GOTO        L_interrupt2
;P7c.c,35 :: 		PIR1.ADIF = 0;
	BCF         PIR1+0, 6 
;P7c.c,36 :: 		x=0;
	CLRF        _x+0 
	CLRF        _x+1 
;P7c.c,37 :: 		x=(ADRESH<<8);
	MOVF        ADRESH+0, 0 
	MOVWF       _x+1 
	CLRF        _x+0 
;P7c.c,38 :: 		x=x+ADRESL;
	MOVF        ADRESL+0, 0 
	ADDWF       _x+0, 1 
	MOVLW       0
	ADDWFC      _x+1, 1 
;P7c.c,40 :: 		representar();
	CALL        _representar+0, 0
;P7c.c,42 :: 		}
L_interrupt2:
;P7c.c,43 :: 		if(INTCON.TMR0IF){        //interrupcion provocada por el timer
	BTFSS       INTCON+0, 2 
	GOTO        L_interrupt3
;P7c.c,44 :: 		INTCON.TMR0IF = 0;
	BCF         INTCON+0, 2 
;P7c.c,45 :: 		ADCON0.GO = 1;        //Hace que empiece la conversion
	BSF         ADCON0+0, 2 
;P7c.c,47 :: 		TMR0H = (18660>>8);   //1.5 seg
	MOVLW       72
	MOVWF       TMR0H+0 
;P7c.c,48 :: 		TMR0L = 18660;
	MOVLW       228
	MOVWF       TMR0L+0 
;P7c.c,49 :: 		}
L_interrupt3:
;P7c.c,50 :: 		if(INTCON3.INT1IF){
	BTFSS       INTCON3+0, 0 
	GOTO        L_interrupt4
;P7c.c,51 :: 		escala = escala%3;
	MOVLW       3
	MOVWF       R4 
	MOVF        _escala+0, 0 
	MOVWF       R0 
	CALL        _Div_8X8_U+0, 0
	MOVF        R8, 0 
	MOVWF       R0 
	MOVF        R0, 0 
	MOVWF       _escala+0 
;P7c.c,52 :: 		escala++;
	MOVF        R0, 0 
	ADDLW       1
	MOVWF       _escala+0 
;P7c.c,53 :: 		representar();
	CALL        _representar+0, 0
;P7c.c,54 :: 		INTCON3.INT1IF = 0;
	BCF         INTCON3+0, 0 
;P7c.c,55 :: 		}
L_interrupt4:
;P7c.c,57 :: 		}
L_end_interrupt:
L__interrupt9:
	RETFIE      1
; end of _interrupt

_main:

;P7c.c,59 :: 		void main() {
;P7c.c,60 :: 		TRISE.B1 = 1;
	BSF         TRISE+0, 1 
;P7c.c,61 :: 		Lcd_Init();
	CALL        _Lcd_Init+0, 0
;P7c.c,62 :: 		PIR1.ADIF =0;
	BCF         PIR1+0, 6 
;P7c.c,63 :: 		PIE1.ADIE = 1; // habilita la interrupcion del convertidor A/D
	BSF         PIE1+0, 6 
;P7c.c,64 :: 		TRISB = 0xFF;
	MOVLW       255
	MOVWF       TRISB+0 
;P7c.c,67 :: 		ADCON0 = 0x71;
	MOVLW       113
	MOVWF       ADCON0+0 
;P7c.c,68 :: 		ADCON1 = 0xCE;
	MOVLW       206
	MOVWF       ADCON1+0 
;P7c.c,69 :: 		INTCON.PEIE = 1;
	BSF         INTCON+0, 6 
;P7c.c,72 :: 		INTCON.TMR0IF = 0;
	BCF         INTCON+0, 2 
;P7c.c,73 :: 		INTCON.TMR0IE = 1;
	BSF         INTCON+0, 5 
;P7c.c,74 :: 		T0CON = 0x85;     //configuramos el timer y lanzamos una primera temporizacion
	MOVLW       133
	MOVWF       T0CON+0 
;P7c.c,75 :: 		TMR0H = (18660>>8);   //1.5 seg
	MOVLW       72
	MOVWF       TMR0H+0 
;P7c.c,76 :: 		TMR0L = 18660;
	MOVLW       228
	MOVWF       TMR0L+0 
;P7c.c,80 :: 		INTCON2.INTEDG1 = 0;       //Flanco de subida o *bajada*
	BCF         INTCON2+0, 5 
;P7c.c,81 :: 		INTCON3.INT1IF = 0;
	BCF         INTCON3+0, 0 
;P7c.c,82 :: 		INTCON3.INT1IE = 1;
	BSF         INTCON3+0, 3 
;P7c.c,86 :: 		INTCON.GIE = 1; // se habilitan las interrupciones en general
	BSF         INTCON+0, 7 
;P7c.c,87 :: 		ADCON0.GO = 1;        //Hace que empiece la conversion
	BSF         ADCON0+0, 2 
;P7c.c,89 :: 		while(1)
L_main5:
;P7c.c,90 :: 		asm nop;      //operacion en ensablador para no hacer
	NOP
	GOTO        L_main5
;P7c.c,93 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
