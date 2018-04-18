#define TIEMPO 2
char contando = 0, cont =TIEMPO;

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
}        else{
             contando = 0;
             cont = TIEMPO;
             T0CON.B7=0;
             PORTC.B0 = 0;
             INTCON.TMR0IF = 0;

}

   }
//
}
void main()
{
TRISC.B0 = 0;
PORTC.B0 = 0;
TRISB.B1 = 1;

T0CON.B7=0;
INTCON.TMR0IF = 0; // se pone el flag a 0
INTCON.TMR0IE = 1; // se habilita la interrupción del Timer 0

INTCON2.INTEDG1 = 0;

INTCON3.INT1IF = 0; // se habilita la interrupción del Timer 0
INTCON3.INT1IE = 1; // habilita
INTCON.GIE = 1; // se habilitan las interrupciones en general

while(1);
}