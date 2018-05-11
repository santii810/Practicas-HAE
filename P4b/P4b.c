//Pr�ctica 3-c


  void interrupt() //rutina de servicio de interrupciones (MikroC)
  {

         INTCON.INT0IF = 0; // se borra el flag de la interrupci�n INT0
  }

  void main()
  {

   ADCON1=0x07; //Configuraci�n de los canales anal�gicos como digitales

   //Configuraci�n de terminales
     TRISC=0;   //Terminales RD como salida digital
     TRISB.B0=1;

  //Configuramos interruptor
       ADCON1=0x07; //Configuraci�n de los canales anal�gicos como digitales
       RBPU_bit=0;
       TRISB.B1=0;
       PORTB.B1=0;
       TRISB.B0 = 1; //se configura RB0 como entrada
       INTCON2.INTEDG0 = 0; //la interrupci�n la provoca un flanco de subida (x=1)/ bajada (x=0)
       INTCON.INT0IF = 0; // se pone el flag de la interrupci�n INT0 a 0
       INTCON.INT0IE = 1; // se habilita la interrupci�n INT0
       INTCON.GIE = 1; // se habilitan las interrupciones en general
       
       //Al inicio, para -90� necesitas el puerto 2 y 3 activados
       //Cuando se pulsa el bot�n tengo que hacer en este orden 1, !3, 4, !2, 3, !1
       //Cuando se pulsa otra vez el bot�n :
       //2, !4, 1, !3, 4, !2, 3, !1, 2,!4, 1,!3, 4, !2, 3, !1
       
       //   INICIO EN -90�
       PORTC.B1=1;
       delay_ms(20); //retardo
       PORTC.B2=1;
       delay_ms(20); //retardo
       
       while(1){//Buble infinito
       }
}
