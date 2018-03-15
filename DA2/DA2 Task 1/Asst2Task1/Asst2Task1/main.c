/*
 * Asst2Task1.c
 *
 * Created: 3/12/2018 2:21:49 PM
 * Author : vince
 */ 

#include <avr/io.h>
#include <util/delay.h>


int main(void)
{
	DDRB |= (1<<PB2);

    while (1) 
    {
		PORTB |= (1<<PB2);
		_delay_ms(250);
		PORTB &= ~(1<<PB2);
		_delay_ms(250);
    }
	return 1;
}

