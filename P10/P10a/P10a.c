int alto,bajo;
char flag = 0;

void main() {
     TRISC = 0;
     PORTC.B0=1;
     
     alto = 0x3F;
     bajo = 0xFF;
     
     SPI1_INIT();//Inicia el convertidor D/A
     delay_us(100);
     
     PORTC.B0=0;
     SPI1_WRITE(alto);
     SPI1_WRITE(bajo);
     PORTC.B0 = 1;
     
     while(1){
        asm nop;
     }
}