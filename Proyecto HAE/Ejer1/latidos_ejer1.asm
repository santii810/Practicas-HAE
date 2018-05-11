
_interrupt:

;latidos_ejer1.c,21 :: 		void interrupt(){
;latidos_ejer1.c,22 :: 		ciclos = TMR0L;
	MOVF        TMR0L+0, 0 
	MOVWF       _ciclos+0 
	MOVLW       0
	MOVWF       _ciclos+1 
;latidos_ejer1.c,23 :: 		ciclos = ciclos+(TMR0H<<8);
	MOVF        TMR0H+0, 0 
	MOVWF       R1 
	CLRF        R0 
	MOVF        _ciclos+0, 0 
	ADDWF       R0, 1 
	MOVF        _ciclos+1, 0 
	ADDWFC      R1, 1 
	MOVF        R0, 0 
	MOVWF       _ciclos+0 
	MOVF        R1, 0 
	MOVWF       _ciclos+1 
;latidos_ejer1.c,24 :: 		TMR0H = 0;
	CLRF        TMR0H+0 
;latidos_ejer1.c,25 :: 		TMR0L = 0;
	CLRF        TMR0L+0 
;latidos_ejer1.c,26 :: 		frec = 60.0e6/(64.0 * ciclos);
	CALL        _word2double+0, 0
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       0
	MOVWF       R6 
	MOVLW       133
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       R4 
	MOVF        R1, 0 
	MOVWF       R5 
	MOVF        R2, 0 
	MOVWF       R6 
	MOVF        R3, 0 
	MOVWF       R7 
	MOVLW       192
	MOVWF       R0 
	MOVLW       225
	MOVWF       R1 
	MOVLW       100
	MOVWF       R2 
	MOVLW       152
	MOVWF       R3 
	CALL        _Div_32x32_FP+0, 0
	CALL        _double2word+0, 0
	MOVF        R0, 0 
	MOVWF       _frec+0 
	MOVF        R1, 0 
	MOVWF       _frec+1 
;latidos_ejer1.c,29 :: 		WordToStr(frec, txt);
	MOVF        R0, 0 
	MOVWF       FARG_WordToStr_input+0 
	MOVF        R1, 0 
	MOVWF       FARG_WordToStr_input+1 
	MOVLW       _txt+0
	MOVWF       FARG_WordToStr_output+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_WordToStr_output+1 
	CALL        _WordToStr+0, 0
;latidos_ejer1.c,30 :: 		Lcd_out(1,1, txt);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _txt+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;latidos_ejer1.c,33 :: 		T0CON.TMR0ON = 1;
	BSF         T0CON+0, 7 
;latidos_ejer1.c,34 :: 		INTCON.INT0IF = 0;
	BCF         INTCON+0, 1 
;latidos_ejer1.c,35 :: 		}
L_end_interrupt:
L__interrupt3:
	RETFIE      1
; end of _interrupt

_main:

;latidos_ejer1.c,38 :: 		void main() {
;latidos_ejer1.c,39 :: 		ADCON1 = 0x0F;
	MOVLW       15
	MOVWF       ADCON1+0 
;latidos_ejer1.c,40 :: 		CMCON = 0x07;        //Configuramos los comparadores analógicos
	MOVLW       7
	MOVWF       CMCON+0 
;latidos_ejer1.c,42 :: 		TRISB.B0 = 1;
	BSF         TRISB+0, 0 
;latidos_ejer1.c,44 :: 		T0CON=0x86;
	MOVLW       134
	MOVWF       T0CON+0 
;latidos_ejer1.c,45 :: 		Lcd_Init();
	CALL        _Lcd_Init+0, 0
;latidos_ejer1.c,46 :: 		INTCON2.INTEDG0 = 1; //la interrupción la provoca un flanco de subida (x=1)/ bajada (x=0)
	BSF         INTCON2+0, 6 
;latidos_ejer1.c,47 :: 		INTCON.INT0IF = 0;   // se pone el flaga 0
	BCF         INTCON+0, 1 
;latidos_ejer1.c,48 :: 		INTCON.INT0IE = 1;   // se habilita la interrupción del Timer 0
	BSF         INTCON+0, 4 
;latidos_ejer1.c,49 :: 		INTCON.GIE = 1;      // se habilitan las interrupciones en general
	BSF         INTCON+0, 7 
;latidos_ejer1.c,51 :: 		while(1){
L_main0:
;latidos_ejer1.c,52 :: 		asm nop;
	NOP
;latidos_ejer1.c,53 :: 		}
	GOTO        L_main0
;latidos_ejer1.c,54 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
