         char anterior = 1;
void main() {
     ADCON1 = 0x07;
          TRISB.B0 = 1;
          TRISB.B1 = 0;
          PORTB = 0;
          INTCON2.RBPU = 0;

     while(1){
         delay_ms(100);
         if((anterior == 1) && (PORTB.B0 == 0)){
             PORTB.B1 = !PORTB.B1;
         }
         anterior =   PORTB.B0;
    }
}