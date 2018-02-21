#line 1 "C:/Documents and Settings/Electrónica/Escritorio/Archivos HAE/Miercoles de 12-30 a 14-30/P4b/MyProject.c"
int pulsado = 0;

void interrupt(){
 INTCON.INT0IF = 0;
 if(pulsado == 0){
 PORTC.B1 = 0;
 delay_ms( 20 ; );
 PORTC.B2 = 0;
 delay_ms(20);
 PORTC.B3 = 1;
 delay_ms(20);
 PORTC.B3 = 0;
 delay_ms(20);
 PORTC.B0 = 1;
 delay_ms(20);
 PORTC.B1 = 1;
 delay_ms(20);
 pulsado = 1;
 }else{
 PORTC.B1 = 0;
 delay_ms(20);
 PORTC.B0 = 0;
 delay_ms(20);

 PORTC.B3 = 1;
 delay_ms(20);
 PORTC.B3 = 0;
 delay_ms(20);
 PORTC.B2 = 1;
 delay_ms(20);
 PORTC.B2 = 0;
 delay_ms(20);
 PORTC.B1 = 1;
 delay_ms(20);
 PORTC.B1 = 0;
 delay_ms(20);
 PORTC.B0 = 1;
 delay_ms(20);



 PORTC.B3 = 1;
 delay_ms(20);
 PORTC.B0 = 0;
 delay_ms(20);
 PORTC.B3 = 0;
 delay_ms(20);
 PORTC.B2 = 1;
 delay_ms(20);
 PORTC.B2 = 0;
 delay_ms(20);
 PORTC.B1 = 1;
 delay_ms(20);
 PORTC.B0 = 1;
 delay_ms(20);

}
}

void main() {
 TRISC = 0;
 PORTC = 0;
 TRISB = 1;

 INTCON2.INTEDG0 = 0;
 INTCON.INT0IF = 0;
 INTCON.INT0IE = 1;
 INTCON.GIE = 1;


 PORTC.B0 = 1;
 delay_ms(20);
 PORTC.B0 = 0;
 delay_ms(20);
 PORTC.B1 = 1;
 delay_ms(20);
 PORTC.B2 = 1;
 delay_ms(20);
 while(1);
}
