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
x=0;
x=(ADRESH<<8);
x=x+ADRESL;
v = x*0.00488758553;
lcd_cmd(_LCD_CLEAR); //Borra la pantalla
FloatToStr(v,txt);
lcd_out(1,1,txt);

 delay_ms(1000);
 ADCON0.GO = 1;

}

void main() {
TRISA.B0 = 1;
Lcd_Init();
PIR1.ADIF =0;
PIE1.ADIE = 1; // habilita la interrupcion del convertidor A/D

//Configuracion convertidor A/D
ADCON0 = 0x41;
ADCON1 = 0xCE;
INTCON.PEIE = 1;
INTCON.GIE = 1; // se habilitan las interrupciones en general
ADCON0.GO = 1;

while(1)
 asm nop;


}