
_main:

;Practica1b_2.c,1 :: 		void main() {
;Practica1b_2.c,3 :: 		ADCON1 = 0x07;
	MOVLW       7
	MOVWF       ADCON1+0 
;Practica1b_2.c,4 :: 		TRISC = 0;
	CLRF        TRISC+0 
;Practica1b_2.c,5 :: 		PORTC = 0;
	CLRF        PORTC+0 
;Practica1b_2.c,6 :: 		while(1){
L_main0:
;Practica1b_2.c,7 :: 		PORTC.B0 = 1;
	BSF         PORTC+0, 0 
;Practica1b_2.c,8 :: 		PORTC.B7 = 1;
	BSF         PORTC+0, 7 
;Practica1b_2.c,9 :: 		delay_ms(200);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       119
	MOVWF       R13, 0
L_main2:
	DECFSZ      R13, 1, 1
	BRA         L_main2
	DECFSZ      R12, 1, 1
	BRA         L_main2
	DECFSZ      R11, 1, 1
	BRA         L_main2
;Practica1b_2.c,10 :: 		PORTC.B0 = 0;
	BCF         PORTC+0, 0 
;Practica1b_2.c,11 :: 		PORTC.B7 = 0;
	BCF         PORTC+0, 7 
;Practica1b_2.c,12 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main3:
	DECFSZ      R13, 1, 1
	BRA         L_main3
	DECFSZ      R12, 1, 1
	BRA         L_main3
	DECFSZ      R11, 1, 1
	BRA         L_main3
	NOP
;Practica1b_2.c,14 :: 		PORTC.B1 = 1;
	BSF         PORTC+0, 1 
;Practica1b_2.c,15 :: 		PORTC.B6 = 1;
	BSF         PORTC+0, 6 
;Practica1b_2.c,16 :: 		delay_ms(200);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       119
	MOVWF       R13, 0
L_main4:
	DECFSZ      R13, 1, 1
	BRA         L_main4
	DECFSZ      R12, 1, 1
	BRA         L_main4
	DECFSZ      R11, 1, 1
	BRA         L_main4
;Practica1b_2.c,17 :: 		PORTC.B1 = 0;
	BCF         PORTC+0, 1 
;Practica1b_2.c,18 :: 		PORTC.B6 = 0;
	BCF         PORTC+0, 6 
;Practica1b_2.c,19 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main5:
	DECFSZ      R13, 1, 1
	BRA         L_main5
	DECFSZ      R12, 1, 1
	BRA         L_main5
	DECFSZ      R11, 1, 1
	BRA         L_main5
	NOP
;Practica1b_2.c,22 :: 		PORTC.B2 = 1;
	BSF         PORTC+0, 2 
;Practica1b_2.c,23 :: 		PORTC.B5 = 1;
	BSF         PORTC+0, 5 
;Practica1b_2.c,24 :: 		delay_ms(200);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       119
	MOVWF       R13, 0
L_main6:
	DECFSZ      R13, 1, 1
	BRA         L_main6
	DECFSZ      R12, 1, 1
	BRA         L_main6
	DECFSZ      R11, 1, 1
	BRA         L_main6
;Practica1b_2.c,25 :: 		PORTC.B2 = 0;
	BCF         PORTC+0, 2 
;Practica1b_2.c,26 :: 		PORTC.B5 = 0;
	BCF         PORTC+0, 5 
;Practica1b_2.c,27 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main7:
	DECFSZ      R13, 1, 1
	BRA         L_main7
	DECFSZ      R12, 1, 1
	BRA         L_main7
	DECFSZ      R11, 1, 1
	BRA         L_main7
	NOP
;Practica1b_2.c,29 :: 		PORTC.B3 = 1;
	BSF         PORTC+0, 3 
;Practica1b_2.c,30 :: 		PORTC.B4 = 1;
	BSF         PORTC+0, 4 
;Practica1b_2.c,31 :: 		delay_ms(200);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       119
	MOVWF       R13, 0
L_main8:
	DECFSZ      R13, 1, 1
	BRA         L_main8
	DECFSZ      R12, 1, 1
	BRA         L_main8
	DECFSZ      R11, 1, 1
	BRA         L_main8
;Practica1b_2.c,32 :: 		PORTC.B3 = 0;
	BCF         PORTC+0, 3 
;Practica1b_2.c,33 :: 		PORTC.B4 = 0;
	BCF         PORTC+0, 4 
;Practica1b_2.c,34 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main9:
	DECFSZ      R13, 1, 1
	BRA         L_main9
	DECFSZ      R12, 1, 1
	BRA         L_main9
	DECFSZ      R11, 1, 1
	BRA         L_main9
	NOP
;Practica1b_2.c,37 :: 		PORTC.B2 = 1;
	BSF         PORTC+0, 2 
;Practica1b_2.c,38 :: 		PORTC.B5 = 1;
	BSF         PORTC+0, 5 
;Practica1b_2.c,39 :: 		delay_ms(200);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       119
	MOVWF       R13, 0
L_main10:
	DECFSZ      R13, 1, 1
	BRA         L_main10
	DECFSZ      R12, 1, 1
	BRA         L_main10
	DECFSZ      R11, 1, 1
	BRA         L_main10
;Practica1b_2.c,40 :: 		PORTC.B2 = 0;
	BCF         PORTC+0, 2 
;Practica1b_2.c,41 :: 		PORTC.B5 = 0;
	BCF         PORTC+0, 5 
;Practica1b_2.c,42 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main11:
	DECFSZ      R13, 1, 1
	BRA         L_main11
	DECFSZ      R12, 1, 1
	BRA         L_main11
	DECFSZ      R11, 1, 1
	BRA         L_main11
	NOP
;Practica1b_2.c,44 :: 		PORTC.B1 = 1;
	BSF         PORTC+0, 1 
;Practica1b_2.c,45 :: 		PORTC.B6 = 1;
	BSF         PORTC+0, 6 
;Practica1b_2.c,46 :: 		delay_ms(200);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       119
	MOVWF       R13, 0
L_main12:
	DECFSZ      R13, 1, 1
	BRA         L_main12
	DECFSZ      R12, 1, 1
	BRA         L_main12
	DECFSZ      R11, 1, 1
	BRA         L_main12
;Practica1b_2.c,47 :: 		PORTC.B1 = 0;
	BCF         PORTC+0, 1 
;Practica1b_2.c,48 :: 		PORTC.B6 = 0;
	BCF         PORTC+0, 6 
;Practica1b_2.c,49 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main13:
	DECFSZ      R13, 1, 1
	BRA         L_main13
	DECFSZ      R12, 1, 1
	BRA         L_main13
	DECFSZ      R11, 1, 1
	BRA         L_main13
	NOP
;Practica1b_2.c,51 :: 		PORTC.B0 = 1;
	BSF         PORTC+0, 0 
;Practica1b_2.c,52 :: 		PORTC.B7 = 1;
	BSF         PORTC+0, 7 
;Practica1b_2.c,53 :: 		delay_ms(200);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       119
	MOVWF       R13, 0
L_main14:
	DECFSZ      R13, 1, 1
	BRA         L_main14
	DECFSZ      R12, 1, 1
	BRA         L_main14
	DECFSZ      R11, 1, 1
	BRA         L_main14
;Practica1b_2.c,54 :: 		PORTC.B0 = 0;
	BCF         PORTC+0, 0 
;Practica1b_2.c,55 :: 		PORTC.B7 = 0;
	BCF         PORTC+0, 7 
;Practica1b_2.c,56 :: 		delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main15:
	DECFSZ      R13, 1, 1
	BRA         L_main15
	DECFSZ      R12, 1, 1
	BRA         L_main15
	DECFSZ      R11, 1, 1
	BRA         L_main15
	NOP
;Practica1b_2.c,58 :: 		}}
	GOTO        L_main0
L_end_main:
	GOTO        $+0
; end of _main
