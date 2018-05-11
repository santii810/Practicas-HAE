#line 1 "C:/Documents and Settings/Electrónica/Escritorio/Archivos HAE/Miercoles de 12-30 a 14-30/P7c/P7c.c"
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
 v = x*0.488758553;
 if(escala){
 v = v*1.8 + 32.0;
 }
 if(escala == 2){
 v += 273.15;
 }
 FloatToStr(v,txt);
 lcd_cmd(_LCD_CLEAR);
 lcd_out(1,1,txt);
}

void interrupt(){
 if(PIR1.ADIF){
 PIR1.ADIF = 0;
 x=0;
 x=(ADRESH<<8);
 x=x+ADRESL;

 representar();

 }
 if(INTCON.TMR0IF){
 INTCON.TMR0IF = 0;
 ADCON0.GO = 1;

 TMR0H = (18660>>8);
 TMR0L = 18660;
 }
 if(INTCON3.INT1IF){
 escala = escala%3;
 escala++;
 representar();
 INTCON3.INT1IF = 0;
 }

}

void main() {
 TRISE.B1 = 1;
 Lcd_Init();
 PIR1.ADIF =0;
 PIE1.ADIE = 1;
 TRISB = 0xFF;


 ADCON0 = 0x71;
 ADCON1 = 0xCE;
 INTCON.PEIE = 1;


 INTCON.TMR0IF = 0;
 INTCON.TMR0IE = 1;
 T0CON = 0x85;
 TMR0H = (18660>>8);
 TMR0L = 18660;



 INTCON2.INTEDG1 = 0;
 INTCON3.INT1IF = 0;
 INTCON3.INT1IE = 1;



 INTCON.GIE = 1;
 ADCON0.GO = 1;

 while(1)
 asm nop;


}
