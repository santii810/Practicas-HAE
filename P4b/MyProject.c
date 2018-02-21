int pulsado = 0;
#define tiempo 20
void interrupt(){
       INTCON.INT0IF = 0;
       if(pulsado == 0){
                  PORTC.B1 = 0;
                  delay_ms(tiempo);
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
                 //  PORTC.B0 = 0;
                 // delay_ms(20);

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
     //Programar interrupcion
     INTCON2.INTEDG0 = 0;
     INTCON.INT0IF = 0;
     INTCON.INT0IE = 1;
     INTCON.GIE = 1;
     
     //Movemos a -90º al inicio
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