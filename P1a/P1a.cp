#line 1 "C:/Documents and Settings/Electrónica/Escritorio/Archivos HAE/Miercoles de 12-30 a 14-30/P1a/P1a.c"
void main()
{
 ADCON1 = 0x07;
 TRISC = 0;
 PORTC = 0;


 while(1){
 PORTC.B0 = 1;
 delay_ms(200);
 PORTC.B0 = 0;
 delay_ms(100);

 PORTC.B1 = 1;
 delay_ms(200);
 PORTC.B1 = 0;
 delay_ms(100);

 PORTC.B2 = 1;
 delay_ms(200);
 PORTC.B2 = 0;
 delay_ms(100);

 PORTC.B3 = 1;
 delay_ms(200);
 PORTC.B3 = 0;
 delay_ms(100);

 PORTC.B4 = 1;
 delay_ms(200);
 PORTC.B4 = 0;
 delay_ms(100);

 PORTC.B5 = 1;
 delay_ms(200);
 PORTC.B5 = 0;
 delay_ms(100);

 PORTC.B6 = 1;
 delay_ms(200);
 PORTC.B6 = 0;
 delay_ms(100);

 PORTC.B7 = 1;
 delay_ms(200);
 PORTC.B7 = 0;
 delay_ms(100);

}

}
