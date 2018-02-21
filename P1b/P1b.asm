
_main:

;P1b.c,1 :: 		void main() {
;P1b.c,2 :: 		ADCON1 = 0x07;
	MOVLW       7
	MOVWF       ADCON1+0 
;P1b.c,3 :: 		TRISC = 0;
	CLRF        TRISC+0 
;P1b.c,4 :: 		PORTC = 0;
	CLRF        PORTC+0 
;P1b.c,7 :: 		while(1){
L_main0:
;P1b.c,8 :: 		PORTC.B0 = 1;
	BSF         PORTC+0, 0 
;P1b.c,9 :: 		PORTC.B7 = 1;
	BSF         PORTC+0, 7 
;P1b.c,10 :: 		delay_ms(400);
	MOVLW       5
	MOVWF       R11, 0
	MOVLW       15
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_main2:
	DECFSZ      R13, 1, 1
	BRA         L_main2
	DECFSZ      R12, 1, 1
	BRA         L_main2
	DECFSZ      R11, 1, 1
	BRA         L_main2
;P1b.c,11 :: 		PORTC.B0 = 0;
	BCF         PORTC+0, 0 
;P1b.c,12 :: 		PORTC.B7 = 0;
	BCF         PORTC+0, 7 
;P1b.c,13 :: 		delay_ms(200);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       119
	MOVWF       R13, 0
L_main3:
	DECFSZ      R13, 1, 1
	BRA         L_main3
	DECFSZ      R12, 1, 1
	BRA         L_main3
	DECFSZ      R11, 1, 1
	BRA         L_main3
;P1b.c,15 :: 		PORTC.B1 = 1;
	BSF         PORTC+0, 1 
;P1b.c,16 :: 		PORTC.B6 = 1;
	BSF         PORTC+0, 6 
;P1b.c,17 :: 		delay_ms(400);
	MOVLW       5
	MOVWF       R11, 0
	MOVLW       15
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_main4:
	DECFSZ      R13, 1, 1
	BRA         L_main4
	DECFSZ      R12, 1, 1
	BRA         L_main4
	DECFSZ      R11, 1, 1
	BRA         L_main4
;P1b.c,18 :: 		PORTC.B1 = 0;
	BCF         PORTC+0, 1 
;P1b.c,19 :: 		PORTC.B6 = 0;
	BCF         PORTC+0, 6 
;P1b.c,20 :: 		delay_ms(200);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       119
	MOVWF       R13, 0
L_main5:
	DECFSZ      R13, 1, 1
	BRA         L_main5
	DECFSZ      R12, 1, 1
	BRA         L_main5
	DECFSZ      R11, 1, 1
	BRA         L_main5
;P1b.c,22 :: 		PORTC.B2 = 1;
	BSF         PORTC+0, 2 
;P1b.c,23 :: 		PORTC.B5 = 1;
	BSF         PORTC+0, 5 
;P1b.c,24 :: 		delay_ms(400);
	MOVLW       5
	MOVWF       R11, 0
	MOVLW       15
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_main6:
	DECFSZ      R13, 1, 1
	BRA         L_main6
	DECFSZ      R12, 1, 1
	BRA         L_main6
	DECFSZ      R11, 1, 1
	BRA         L_main6
;P1b.c,25 :: 		PORTC.B2 = 0;
	BCF         PORTC+0, 2 
;P1b.c,26 :: 		PORTC.B5 = 0;
	BCF         PORTC+0, 5 
;P1b.c,27 :: 		delay_ms(200);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       119
	MOVWF       R13, 0
L_main7:
	DECFSZ      R13, 1, 1
	BRA         L_main7
	DECFSZ      R12, 1, 1
	BRA         L_main7
	DECFSZ      R11, 1, 1
	BRA         L_main7
;P1b.c,29 :: 		PORTC.B3 = 1;
	BSF         PORTC+0, 3 
;P1b.c,30 :: 		PORTC.B4 = 1;
	BSF         PORTC+0, 4 
;P1b.c,31 :: 		delay_ms(400);
	MOVLW       5
	MOVWF       R11, 0
	MOVLW       15
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_main8:
	DECFSZ      R13, 1, 1
	BRA         L_main8
	DECFSZ      R12, 1, 1
	BRA         L_main8
	DECFSZ      R11, 1, 1
	BRA         L_main8
;P1b.c,32 :: 		PORTC.B3 = 0;
	BCF         PORTC+0, 3 
;P1b.c,33 :: 		PORTC.B4 = 0;
	BCF         PORTC+0, 4 
;P1b.c,34 :: 		delay_ms(200);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       119
	MOVWF       R13, 0
L_main9:
	DECFSZ      R13, 1, 1
	BRA         L_main9
	DECFSZ      R12, 1, 1
	BRA         L_main9
	DECFSZ      R11, 1, 1
	BRA         L_main9
;P1b.c,36 :: 		PORTC.B2 = 1;
	BSF         PORTC+0, 2 
;P1b.c,37 :: 		PORTC.B5 = 1;
	BSF         PORTC+0, 5 
;P1b.c,38 :: 		delay_ms(400);
	MOVLW       5
	MOVWF       R11, 0
	MOVLW       15
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_main10:
	DECFSZ      R13, 1, 1
	BRA         L_main10
	DECFSZ      R12, 1, 1
	BRA         L_main10
	DECFSZ      R11, 1, 1
	BRA         L_main10
;P1b.c,39 :: 		PORTC.B2 = 0;
	BCF         PORTC+0, 2 
;P1b.c,40 :: 		PORTC.B5 = 0;
	BCF         PORTC+0, 5 
;P1b.c,41 :: 		delay_ms(200);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       119
	MOVWF       R13, 0
L_main11:
	DECFSZ      R13, 1, 1
	BRA         L_main11
	DECFSZ      R12, 1, 1
	BRA         L_main11
	DECFSZ      R11, 1, 1
	BRA         L_main11
;P1b.c,43 :: 		PORTC.B1 = 1;
	BSF         PORTC+0, 1 
;P1b.c,44 :: 		PORTC.B6 = 1;
	BSF         PORTC+0, 6 
;P1b.c,45 :: 		delay_ms(400);
	MOVLW       5
	MOVWF       R11, 0
	MOVLW       15
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_main12:
	DECFSZ      R13, 1, 1
	BRA         L_main12
	DECFSZ      R12, 1, 1
	BRA         L_main12
	DECFSZ      R11, 1, 1
	BRA         L_main12
;P1b.c,46 :: 		PORTC.B1 = 0;
	BCF         PORTC+0, 1 
;P1b.c,47 :: 		PORTC.B6 = 0;
	BCF         PORTC+0, 6 
;P1b.c,48 :: 		delay_ms(200);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       119
	MOVWF       R13, 0
L_main13:
	DECFSZ      R13, 1, 1
	BRA         L_main13
	DECFSZ      R12, 1, 1
	BRA         L_main13
	DECFSZ      R11, 1, 1
	BRA         L_main13
;P1b.c,50 :: 		PORTC.B0 = 1;
	BSF         PORTC+0, 0 
;P1b.c,51 :: 		PORTC.B7 = 1;
	BSF         PORTC+0, 7 
;P1b.c,52 :: 		delay_ms(400);
	MOVLW       5
	MOVWF       R11, 0
	MOVLW       15
	MOVWF       R12, 0
	MOVLW       241
	MOVWF       R13, 0
L_main14:
	DECFSZ      R13, 1, 1
	BRA         L_main14
	DECFSZ      R12, 1, 1
	BRA         L_main14
	DECFSZ      R11, 1, 1
	BRA         L_main14
;P1b.c,53 :: 		PORTC.B0 = 0;
	BCF         PORTC+0, 0 
;P1b.c,54 :: 		PORTC.B7 = 0;
	BCF         PORTC+0, 7 
;P1b.c,55 :: 		delay_ms(200);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       119
	MOVWF       R13, 0
L_main15:
	DECFSZ      R13, 1, 1
	BRA         L_main15
	DECFSZ      R12, 1, 1
	BRA         L_main15
	DECFSZ      R11, 1, 1
	BRA         L_main15
;P1b.c,56 :: 		}
	GOTO        L_main0
;P1b.c,57 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
