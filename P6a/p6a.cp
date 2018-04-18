#line 1 "C:/Documents and Settings/Electrónica/Escritorio/Archivos HAE/Miercoles de 12-30 a 14-30/P6a/p6a.c"
void interrupt()
{
INTCON.TMR0IF = 0;
if(PORTC.B0 == 0){
T0CON = 0xC1;
TMR0L = 106;
}
else{
T0CON = 0xC2;
TMR0L = 81;
}
PORTC.B0 =~ PORTC.B0;
}
void main()
{
TRISC.B0 = 0;
PORTC.B0 = 0;

T0CON = 0xC1;
INTCON.TMR0IF = 0;
INTCON.TMR0IE = 1;
INTCON.GIE = 1;

TMR0L = 106;

}
