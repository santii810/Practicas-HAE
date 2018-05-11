
_interrupt:

;P5bc.c,20 :: 		void interrupt(){
;P5bc.c,21 :: 		x=PORTB; // para poder borrar el bit RBIF (define x global)
	MOVF        PORTB+0, 0 
	MOVWF       _x+0 
;P5bc.c,22 :: 		INTCON.RBIF=0; // se borra el bit RBIF después de llamar a la función tecla()
	BCF         INTCON+0, 0 
;P5bc.c,23 :: 		if(first==1){
	MOVF        _first+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt0
;P5bc.c,24 :: 		first = 0;
	CLRF        _first+0 
;P5bc.c,25 :: 		Lcd_Out(1,1,"Turno:");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_P5bc+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_P5bc+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;P5bc.c,26 :: 		}
L_interrupt0:
;P5bc.c,27 :: 		if(flag == 0){
	MOVF        _flag+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt1
;P5bc.c,28 :: 		if(cont ==100) cont = 0;
	MOVF        _cont+0, 0 
	XORLW       100
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt2
	CLRF        _cont+0 
L_interrupt2:
;P5bc.c,29 :: 		flag = 1;
	MOVLW       1
	MOVWF       _flag+0 
;P5bc.c,31 :: 		ByteToStr(cont,txt);
	MOVF        _cont+0, 0 
	MOVWF       FARG_ByteToStr_input+0 
	MOVLW       _txt+0
	MOVWF       FARG_ByteToStr_output+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_ByteToStr_output+1 
	CALL        _ByteToStr+0, 0
;P5bc.c,32 :: 		Lcd_Out(1,7,txt);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       7
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _txt+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_txt+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;P5bc.c,33 :: 		cont++;
	INCF        _cont+0, 1 
;P5bc.c,34 :: 		} else{
	GOTO        L_interrupt3
L_interrupt1:
;P5bc.c,35 :: 		flag = 0;
	CLRF        _flag+0 
;P5bc.c,36 :: 		}
L_interrupt3:
;P5bc.c,38 :: 		}
L_end_interrupt:
L__interrupt7:
	RETFIE      1
; end of _interrupt

_main:

;P5bc.c,40 :: 		void main() {
;P5bc.c,41 :: 		PORTB=0;
	CLRF        PORTB+0 
;P5bc.c,42 :: 		TRISB.B4 = 1;      //modo lectura
	BSF         TRISB+0, 4 
;P5bc.c,44 :: 		INTCON2.RBPU=0; // se habilitan las resistencias de pullup del puerto B
	BCF         INTCON2+0, 7 
;P5bc.c,45 :: 		x=PORTB; //para poder borrar el RBIF
	MOVF        PORTB+0, 0 
	MOVWF       _x+0 
;P5bc.c,46 :: 		INTCON.RBIF=0;
	BCF         INTCON+0, 0 
;P5bc.c,47 :: 		INTCON.RBIE=1;
	BSF         INTCON+0, 3 
;P5bc.c,50 :: 		INTCON.GIE = 1;
	BSF         INTCON+0, 7 
;P5bc.c,51 :: 		Lcd_Init();
	CALL        _Lcd_Init+0, 0
;P5bc.c,52 :: 		x=PORTB; //para poder borrar el RBIF
	MOVF        PORTB+0, 0 
	MOVWF       _x+0 
;P5bc.c,53 :: 		INTCON.RBIF=1;
	BSF         INTCON+0, 0 
;P5bc.c,55 :: 		while(1);
L_main4:
	GOTO        L_main4
;P5bc.c,57 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
