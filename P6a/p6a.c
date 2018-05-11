void interrupt() // rutina de servicio de la interrupción (MikroC)
{
INTCON.TMR0IF = 0; // se borra el flag
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
INTCON.TMR0IF = 0; // se pone el flag a 0
INTCON.TMR0IE = 1; // se habilita la interrupción del Timer 0
INTCON.GIE = 1; // se habilitan las interrupciones en general

TMR0L = 106; //se carga el valor inicial (alfa) del ‘contador’
// ya se puede poner el Timer0 a realizar una temporización
}