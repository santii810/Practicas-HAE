char numeros[] = {0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D, 0x07, 0x7F, 0x67};
char cont = 0;
void interrupt(){
        INTCON.INT0IF=0;
        if(cont >= 99){
                cont = 0;
        }else{
              cont++;
        }
}
void main() {
     ADCON1 = 0x07;
          TRISB.B0 = 1;
          TRISB.B1 = 0;
          PORTB.B1 = 0;
          INTCON2.RBPU = 0;
          INTCON2.INTEDG0 = 0; //flaco de bajada o subida
          INTCON.INT0IF = 0;
          INTCON.INT0IE = 1;
          INTCON.GIE = 1;
     
     //Configuracion del display
     TRISC.B0 = 0;
     TRISC.B1 = 0;
     PORTC.B0 = 0;
     PORTC.B1 = 0;
     TRISD = 0;
     PORTD = 0;

     while(1){
     PORTD = numeros[cont/10];
     PORTC.B0 = 0;
     delay_ms(20);
     PORTC.B0 = 1;

     PORTD = numeros[cont%10];
     PORTC.B1 = 0;
     delay_ms(20);
     PORTC.B1 = 1;
    }
}