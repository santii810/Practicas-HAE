#line 1 "D:/Escritorio/Hoxe/p10B/P10B.c"
char alto,bajo;
char flag = 0;
char i;
int value = 0x3000;

void convertir(){
 PORTC.B0=0;
 SPI1_WRITE( value >> 8);
 delay_us(10);
 SPI1_WRITE(value);
 PORTC.B0 = 1;
}
void interrupt(){
 if(INTCON3.INT1IF){

 }
 if(INTCON.INT1IF){
 value -= 0x10;

 }


}

void main() {
 TRISC = 0;
 TRISB = 1;
 PORTC.B0=0;
 SPI1_INIT();

 INTCON.INT0IE = 1;
 INTCON.INT0IF = 0;

 INTCON.GIE = 1;

 while(1){
#line 46 "D:/Escritorio/Hoxe/p10B/P10B.c"
 asm nop;
 }
}
