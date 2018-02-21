void interrupt(){
     INTCON.INT0IF=0;
     PORTB.B1 = !PORTB.B1;
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
          
     while(1){

    }
}