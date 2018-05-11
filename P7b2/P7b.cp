#line 1 "C:/Documents and Settings/Electrónica/Escritorio/Archivos HAE/Miercoles de 12-30 a 14-30/P7b2/P7b.c"
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
 if(PIR1.ADIF){
 PIR1.ADIF = 0;
 x=0;
 x=(ADRESH<<8);
 x=x+ADRESL;
 v = x*0.488758553;
 FloatToStr(v,txt);
 lcd_cmd(_LCD_CLEAR);
 lcd_out(1,1,txt);
 }
 if(INTCON.TMR0IF){
 INTCON.TMR0IF = 0;
 ADCON0.GO = 1;

 TMR0H = (18660>>8);
 TMR0L = 18660;

 }
}

void main() {
 TRISE.B1 = 1;
 Lcd_Init();
 PIR1.ADIF =0;
 PIE1.ADIE = 1;


 ADCON0 = 0x71;
 ADCON1 = 0xCE;
 INTCON.PEIE = 1;
 T0CON = 0x85;
 TMR0H = (18660>>8);
 TMR0L = 18660;

 INTCON.TMR0IF = 0;
 INTCON.TMR0IE = 1;

 INTCON.GIE = 1;
 ADCON0.GO = 1;

 while(1)
 asm nop;


}
