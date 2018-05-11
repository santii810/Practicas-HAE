#line 1 "P:/HAE/Proyecto/Ejer1/latidos_ejer1.c"

sbit LCD_RS at RB2_bit;
sbit LCD_EN at RB3_bit;
sbit LCD_D7 at RB7_bit;
sbit LCD_D6 at RB6_bit;
sbit LCD_D5 at RB5_bit;
sbit LCD_D4 at RB4_bit;

sbit LCD_RS_Direction at TRISB2_bit;
sbit LCD_EN_Direction at TRISB3_bit;
sbit LCD_D7_Direction at TRISB7_bit;
sbit LCD_D6_Direction at TRISB6_bit;
sbit LCD_D5_Direction at TRISB5_bit;
sbit LCD_D4_Direction at TRISB4_bit;

unsigned int frec;
unsigned int ciclos;
char txt [6];


void interrupt(){
 ciclos = TMR0L;
 ciclos = ciclos+(TMR0H<<8);
 TMR0H = 0;
 TMR0L = 0;
 frec = 60.0e6/(64.0 * ciclos);


 WordToStr(frec, txt);
 Lcd_out(1,1, txt);


 T0CON.TMR0ON = 1;
 INTCON.INT0IF = 0;
}


void main() {
 ADCON1 = 0x0F;
 CMCON = 0x07;

 TRISB.B0 = 1;

 T0CON=0x86;
 Lcd_Init();
 INTCON2.INTEDG0 = 1;
 INTCON.INT0IF = 0;
 INTCON.INT0IE = 1;
 INTCON.GIE = 1;

 while(1){
 asm nop;
 }
}
