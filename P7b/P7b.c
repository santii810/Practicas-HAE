float v;
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



void interrupt(){
    if(PIR1.ADIF){ //interrupcion del convertidor AD
        PIR1.ADIF = 0;
        x=0;
        x=(ADRESH<<8);
        x=x+ADRESL;
        v = x*0.488758553;   //  la temperatura es el voltaje de salida * 100
        lcd_cmd(_LCD_CLEAR); //Borra la pantalla
        FloatToStr(v,txt);
        lcd_out(1,1,txt);
    }
    if(INTCON3.INT1IF){        //interrupcion del timer
        INTCON.TMR0IF = 0;
        ADCON0.GO = 1;        //Hace que empiece la conversion
        T0CON = 0x85;
        TMR0H = (18660>>8);         //1.5 seg
        TMR0L = 18660;
        INTCON3.INT1IF = 1;
    }
}

void main() {
TRISE.B1 = 1;
Lcd_Init();
PIR1.ADIF =0;
PIE1.ADIE = 1; // habilita la interrupcion del convertidor A/D

//Configuracion convertidor A/D
ADCON0 = 0x71;
ADCON1 = 0xCE;
INTCON.PEIE = 1;

//INTERRUPCION DEL TIMER
INTCON.TMR0IF = 1;
INTCON.TMR0IE = 1;

INTCON.GIE = 1; // se habilitan las interrupciones en general
ADCON0.GO = 1;        //Hace que empiece la conversion

while(1)
 asm nop;      //operacion en ensablador para no hacer


}