/*
 * Task5Ccode.c
 *
 * Created: 3/14/2018 4:16:02 PM
 * Author : vince
 */ 

#include <avr/io.h>
#include <util/delay.h>
#include <avr/interrupt.h>
ISR(INT0_vect)
{
		PORTB = 0x04;
		_delay_ms(1000);
		PORTB = 0x00;
}

int main(void)
{
	EIMSK = 0x01;		//Enable External Interrupt 0
	EIFR = 0x01;		//Enable External Interrupt Flag Request 0
	EICRA = 0x03;		//Rising edge of Int0 generates an interrupt request
	sei();				//Enable 'I' Bit in status register
	DDRB = 0xFF;
	
	while (1)
	{
	
	}
	return 0;
}


