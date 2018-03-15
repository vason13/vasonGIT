/*
 * Task4Ccode.c
 *
 * Created: 3/13/2018 2:48:47 PM
 * Author : vince
 */ 
#include <avr/io.h>
#include <util/delay.h>
#include <avr/interrupt.h>

ISR(TIMER0_OVF_vect)
{
	PORTB ^= 0x04;	// output to pb2
	TCNT0 = 12; 	//65535-976.
}

int main(void)
{
	DDRB = 0x04;
	TIMSK0 = (1<<TOIE0);	//Overflow Interrupt Enable.
	TCCR0B = 5;		//Prescalar 1024.
	TCNT0 = 12;	//
	sei();			//Interrupt enable.
	while(1)
	{

	}
}

