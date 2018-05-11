#define TIME 10
char flag = 0;
char i;
int value = 0x3F00;

void convertir(){
     PORTC.B0=0;
     SPI1_WRITE( value >> 8);
     delay_us(10);
     SPI1_WRITE(value);
     PORTC.B0 = 1;
}

void interrupt(){
     if(INTCON3.INT1IF){
              INTCON3.INT1IF = 0;
              value -= 0x10;
     }
     if(INTCON.INT0IF){
              INTCON.INT0IF = 0;
              value += 0x10;
     }
     convertir();
     delay_us(TIME);

}

void main() {
     ADCON1 = 0x07;

     TRISC = 0;
     TRISB.B0 = 1;
     TRISB.B1 = 1;

     SPI1_INIT();//Inicia el convertidor D/A

     INTCON.INT0IE = 1;
     INTCON.INT0IF = 0;
     INTCON2.INTEDG0 = 1;
     
     INTCON3.INT1IE = 1;
     INTCON3.INT1IF = 0;
     INTCON2.INTEDG1 = 1;

     INTCON.GIE = 1; //habilitar interrupciones en general

     while(1){
      asm nop;
     }
}