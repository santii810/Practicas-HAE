char i,j;
char numeros[] = {0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D, 0x07, 0x7F, 0x67};
void main() {
     ADCON1 = 0x07;
     TRISD = 0;
     PORTD = 0;
     
     TRISA.B0 = 0;
     TRISA.B1 = 0;
     PORTA.B0 = 0;
     PORTA.B1 = 0;
     while(1){

     for(i = 0; i< 60; i++){
            for( j = 0; j<25;j++){
                 PORTD = numeros[i%10];
                 PORTA.B0 = 1;
                 delay_ms(20);
                 PORTA.B0 = 0;

                 PORTD = numeros[i/10];
                 PORTA.B1 = 1;
                 delay_ms(20);
                 PORTA.B1 = 0;
            }
     }
}
}