#line 1 "C:/Documents and Settings/Electrónica/Escritorio/Archivos HAE/Miercoles de 12-30 a 14-30/P1b/P1b.c"
void main() {
 ADCON1 = 0x07;
 TRISC = 0;
 PORTC = 0;


 while(1){
 PORTC.B0 = 1;
 PORTC.B7 = 1;
 delay_ms(400);
 PORTC.B0 = 0;
 PORTC.B7 = 0;
 delay_ms(200);

 PORTC.B1 = 1;
 PORTC.B6 = 1;
 delay_ms(400);
 PORTC.B1 = 0;
 PORTC.B6 = 0;
 delay_ms(200);

 PORTC.B2 = 1;
 PORTC.B5 = 1;
 delay_ms(400);
 PORTC.B2 = 0;
 PORTC.B5 = 0;
 delay_ms(200);

 PORTC.B3 = 1;
 PORTC.B4 = 1;
 delay_ms(400);
 PORTC.B3 = 0;
 PORTC.B4 = 0;
 delay_ms(200);

 PORTC.B2 = 1;
 PORTC.B5 = 1;
 delay_ms(400);
 PORTC.B2 = 0;
 PORTC.B5 = 0;
 delay_ms(200);

 PORTC.B1 = 1;
 PORTC.B6 = 1;
 delay_ms(400);
 PORTC.B1 = 0;
 PORTC.B6 = 0;
 delay_ms(200);

 PORTC.B0 = 1;
 PORTC.B7 = 1;
 delay_ms(400);
 PORTC.B0 = 0;
 PORTC.B7 = 0;
 delay_ms(200);
}
}
