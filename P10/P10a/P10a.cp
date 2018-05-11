#line 1 "D:/Escritorio/Hoxe/P10a.c"
int alto,bajo;
char flag = 0;

void main() {
 TRISC = 0;
 PORTC.B0=0;

 alto = 0x3F;
 bajo = 0xFF;

 SPI1_INIT();

 SPI1_WRITE(alto);
 delay_us(100);

 SPI1_WRITE(bajo);

 delay_us(100);
 PORTC.B0 = 1;

 while(1){
 asm nop;
 }
}
