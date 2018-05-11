char alto,bajo;
char flag = 0;
char i;
int value;

void convertir(){
     PORTC.B0=0;
     SPI1_WRITE( value >> 8);
     delay_us(10);
     SPI1_WRITE(value);
     PORTC.B0 = 1;
}

void main() {
     TRISC = 0;
     PORTC.B0=1;
     SPI1_INIT();//Inicia el convertidor D/A

     while(1){
         for(value = 0x3000; value < 0x3FFF;value++){  //12 bits de datos = 2^12 = 4096
             convertir();
             delay_us(10);
         }
         for(value = 0x3FFF; value > 0x3000;value--){  //12 bits de datos = 2^12 = 4096
             convertir();
              delay_us(10);
         }
      
      // asm nop;
     }
}