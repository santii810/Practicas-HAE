float v;
char escala =0;
unsigned int x;
 char txt [15];
sbit LCD_RS at RD2_bit;
sbit LCD_EN at RD3_bit;
sbit LCD_D7 at RD7_bit;
sbit LCD_D6 at RD6_bit;
sbit LCD_D5 at RD5_bit;
sbit LCD_D4 at RD4_bit;

sbit LCD_RS_Direction at TRISD2_bit;
sbit LCD_EN_Direction at TRISD3_bit;
sbit LCD_D7_Direction at TRISD7_bit;
sbit LCD_D6_Direction at TRISD6_bit;
sbit LCD_D5_Direction at TRISD5_bit;
sbit LCD_D4_Direction at TRISD4_bit;


void representar(){
        v = x*0.488758553;   //  la temperatura es el voltaje de salida * 100
        if(escala){ // farenheit
             v = v*1.8 + 32.0;
        }
        if(escala == 2){ //Kelvin
             v += 273.15;
        }
        FloatToStr(v,txt);
        lcd_cmd(_LCD_CLEAR); //Borra la pantalla
        lcd_out(1,1,txt);
}

void interrupt(){
    if(PIR1.ADIF){ //interrupcion provocada por convertidor AD
        PIR1.ADIF = 0;
        x=0;
        x=(ADRESH<<8);
        x=x+ADRESL;

        representar();

    }
<<<<<<< HEAD

    if(INTCON3.INT1IF){
          escala = escala%8;
=======
    if(INTCON.TMR0IF){        //interrupcion provocada por el timer
        INTCON.TMR0IF = 0;
        ADCON0.GO = 1;        //Hace que empiece la conversion
        //reiniciamos el valor de alfa con el timer ya configurado
        TMR0H = (18660>>8);   //1.5 seg
        TMR0L = 18660;
    }
    if(INTCON3.INT1IF){
          escala = escala%3;
>>>>>>> 5d0d6e7e88c6cd26a50519db888f46dc6c35173e
          escala++;
          representar();
          INTCON3.INT1IF = 0;
    }

}

void main() {
<<<<<<< HEAD
    TRISE.B0 = 1;
    TRISB = 0xFF;
    
    Lcd_Init();
    PIR1.ADIF =0;
    PIE1.ADIE = 1; // habilita la interrupcion del convertidor A/D

=======
    TRISE.B1 = 1;
    Lcd_Init();
    PIR1.ADIF =0;
    PIE1.ADIE = 1; // habilita la interrupcion del convertidor A/D
    TRISB = 0xFF;
>>>>>>> 5d0d6e7e88c6cd26a50519db888f46dc6c35173e

    //Configuracion convertidor A/D
    ADCON0 = 0x71;
    ADCON1 = 0xCE;
    INTCON.PEIE = 1;

<<<<<<< HEAD
=======
    //INTERRUPCION DEL TIMER
    INTCON.TMR0IF = 0;
    INTCON.TMR0IE = 1;
    T0CON = 0x85;     //configuramos el timer y lanzamos una primera temporizacion
    TMR0H = (18660>>8);   //1.5 seg
    TMR0L = 18660;

>>>>>>> 5d0d6e7e88c6cd26a50519db888f46dc6c35173e

    //INTERRUPCION DEL PULSADOR
    INTCON2.INTEDG1 = 0;       //Flanco de subida o *bajada*
    INTCON3.INT1IF = 0;
    INTCON3.INT1IE = 1;



    INTCON.GIE = 1; // se habilitan las interrupciones en general
    ADCON0.GO = 1;        //Hace que empiece la conversion

    while(1)
      asm nop;      //operacion en ensablador para no hacer


}