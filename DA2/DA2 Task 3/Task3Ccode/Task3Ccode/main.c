/*
 * Task3Ccode.c
 *
 * Created: 3/14/2018 3:47:14 PM
 * Author : vince
 */ 

#include <avr/io.h>


int main(void)
{
	DDRB = 0x04;
	TCCR0A = 0x02;
	TCCR0B = 0x05;		//prescale 1024
	TCNT0 = 0x00;
	OCR0A = 64;
	
	
	while (1)
	{
		if(TIFR0 & (1 << OCF0A))
		PORTB ^= 0x04;
		TIFR0 |= (1 << OCF0A);
	}
}

