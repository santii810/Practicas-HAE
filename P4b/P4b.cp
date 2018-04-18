#line 1 "C:/Documents and Settings/Electrónica/Escritorio/Archivos HAE/Miercoles de 12-30 a 14-30/P4b/P4b.c"



 void interrupt()
 {

 INTCON.INT0IF = 0;
 }

 void main()
 {

 ADCON1=0x07;


 TRISC=0;
 TRISB.B0=1;


 ADCON1=0x07;
 RBPU_bit=0;
 TRISB.B1=0;
 PORTB.B1=0;
 TRISB.B0 = 1;
 INTCON2.INTEDG0 = 0;
 INTCON.INT0IF = 0;
 INTCON.INT0IE = 1;
 INTCON.GIE = 1;







 PORTC.B1=1;
 delay_ms(20);
 PORTC.B2=1;
 delay_ms(20);

 while(1){
 }
}
