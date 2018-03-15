/*
 * Asst2Task2.c
 *
 * Created: 3/12/2018 4:02:14 PM
 * Author : vince
 */ 

#include <avr/io.h>
#include <util/delay.h>

int main(void)
{
    DDRB = 0xFF;
	DDRD = 0x00;
    while (1) 
    {
		if((PIND&0x04)==0x04)
		{
			PORTB = 0xff;
			_delay_ms(1000);
		}
			
		else
			PORTB = 0x00;
    }
	
	return 0;
}

