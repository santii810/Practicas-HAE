char txt[14];
unsigned out;
float temp,volt;
char *puntero;
char i;
float x;
void interrupt(){
     //Preguntamos por la bandera del timer0
        if(INTCON.TMR0IF){
                PORTB.B0 = !PORTB.B0;
                TMR0H = (18661>>8);
                TMR0L = 18661;
                ADCON0.B1 = 1;
                INTCON.TMR0IF = 0;
        }
        //Preguntamos por la bandera del convertidor
        if(PIR1.ADIF){
                x = ADRESL + (ADRESH << 8);
                volt = x * 5 / 1024;        // Multiplicamos por resolucion par obtener voltaje leido
                temp = 100.0 * volt -50.0;  // Calcular temperatura a partir del voltaje
                puntero = &temp;

               //Enviamos la informacion con en protocolo UART con cada uno de los punteros
               UART1_Write(*puntero);
               delay_ms(10);
               UART1_Write(*(puntero+1));
               delay_ms(10);
               UART1_Write(*(puntero+2));
               delay_ms(10);
               UART1_Write(*(puntero+3));
               delay_ms(10);
               
               PIR1.ADIF = 0;
        }
}

void main() {
     //Es necesario configurar los 3 adcon que hay en el micro.
     ADCON1 = 0x00;
     ADCON0 = 0x03;
     ADCON2 = 0x8D;
     
     TRISB.B0 = 0;
     
     
     T0CON = 0X85;
     TMR0H = (18661>>8);
     TMR0L = 18661;
     
     UART1_Init(9600);
     delay_ms(300);
     TRISB =0x00;

     INTCON.TMR0IF = 0;   // se pone el flaga 0
     INTCON.TMR0IE = 1;    // se habilita la interrupción del Timer 0

     PIR1.ADIF = 0;   //el bit PIR1.ADIF se pone a 1 siempre que el convertidor AD finaliza una conversión
     PIE1.ADIE = 1;   /*se habilitan las interrupciones del convertidor AD.
                       Siempre que el bit (flag) PIR1.ADIF se ponga a 1, el micro dejara de ejecutar el codigo
                       que este ejecutando en ese momento para ejecutar la rutina asociada a la finalizacion de
                       una conversion AD*/

     INTCON.PEIE = 1;
     INTCON.GIE = 1;    // se habilitan las interrupciones en general

     //bit a 1 para iniciar la conversion
     ADCON0.B1 = 1;
     
     
     while(1){
         asm nop;
     }
}