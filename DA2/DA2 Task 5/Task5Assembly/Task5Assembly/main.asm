;
; Task5Assembly.asm
;
; Created: 3/14/2018 5:39:03 PM
; Author : vince
;
.include "m328pdef.inc"
jmp main

.org INT0addr
jmp INT0_interrupt

main: 
	SBI DDRB, 2
	ldi r16, low(RAMEND)
	out SPL, r16
	ldi r16, high(RAMEND)
	out SPH, r16
	ldi r16, (1 << ISC01) | (1 << ISC00)		;rising edge toggle 
	STS EICRA, r16
	in r16, EIMSK
	ori r16, (1<<INT0)
	out EIMSK, r16
	sei

while:
	
	rjmp while

INT0_interrupt:

	push r16
	in r16, SREG
	push r16
	in r16, PORTB
	com r16
	out PORTB, r16
	call delay
	ldi r16, 0x00
	out PORTB, r16
	reti
delay:

LDI R19, 8
delays:
LDI R20, 125
delayss:
LDI R21, 250
delaysss:
dec r21
nop
brne delaysss
dec r20
brne delayss
dec r19
brne delays
	ret