#line 1 "C:/Documents and Settings/Electrónica/Escritorio/Archivos HAE/Miercoles de 12-30 a 14-30/P6c/p6c.c"

char contando = 0, cont = 2 ;

void interrupt(){
 if(INTCON3.INT1IF){
 if(!contando){
 contando = 1;
 T0CON = 0x84;
 TMR0H = (3035>>8);
 TMR0L = 3035;
 PORTC.B0 = 1;
 INTCON3.INT1IF = 0;
 INTCON.TMR0IF = 0;
 }
 }
 if(INTCON.TMR0IF){
 if(cont > 1){
 T0CON = 0x84;
 TMR0H = (3035>>8);
 TMR0L = 3035;
 PORTC.B0 = 1;
 INTCON3.INT1IF = 0;
 INTCON.TMR0IF = 0;
 cont--;
} else{
 contando = 0;
 cont =  2 ;
 T0CON.B7=0;
 PORTC.B0 = 0;
 INTCON.TMR0IF = 0;

}

 }

}
void main()
{
TRISC.B0 = 0;
PORTC.B0 = 0;
TRISB.B1 = 1;

T0CON.B7=0;
INTCON.TMR0IF = 0;
INTCON.TMR0IE = 1;

INTCON2.INTEDG1 = 0;

INTCON3.INT1IF = 0;
INTCON3.INT1IE = 1;
INTCON.GIE = 1;

while(1);
}
