#line 1 "C:/Documents and Settings/Electrónica/Escritorio/Archivos HAE/Miercoles de 12-30 a 14-30/P5bc/P5bc.c"

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

char x, cont = 0;
char txt[4];
char flag = 0;
char first = 1;
void interrupt(){
x=PORTB;
INTCON.RBIF=0;
if(first==1){
 first = 0;
 Lcd_Out(1,1,"Turno:");
}
if(flag == 0){
 if(cont ==100) cont = 0;
 flag = 1;

 ByteToStr(cont,txt);
 Lcd_Out(1,7,txt);
 cont++;
} else{
 flag = 0;
}

}

void main() {
PORTB=0;
TRISB.B4 = 1;

INTCON2.RBPU=0;
x=PORTB;
 INTCON.RBIF=0;
INTCON.RBIE=1;


INTCON.GIE = 1;
Lcd_Init();
x=PORTB;
INTCON.RBIF=1;

while(1);

}
