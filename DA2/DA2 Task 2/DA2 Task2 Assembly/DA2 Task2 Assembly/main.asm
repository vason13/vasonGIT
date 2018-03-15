;
; DA2 Task2 Assembly.asm
;
; Created: 3/13/2018 1:37:37 PM
; Author : vince
;


; Replace with your application code
.org 0

LDI R16, 0x00
SBI DDRB, 2
SBI DDRD, 2

begin:
in R16, PIND
out PORTB, R16
cpi R16, 0x04
BRSH getDelay
rjmp begin

getDelay:
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

rjmp begin
	



