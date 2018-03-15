;
; Assignment2.asm
;
; Created: 2/26/2018 1:18:48 PM
; Author : vince
;


; Replace with your application code

.org 0
LDI R16,32
SBI DDRB, 2				;PB2 as output
LDI R17,0 				;needed to toogle led
STS PORTB,R17
LDI R20,5 				;to set prescaler
STS TCCR1B,R20 			;Prescaler: 1024
begin:
RCALL delay				;calling timer to wait for 1 sec
EOR R17,R16 			;XOR to toogle led
OUT PORTC,R17
RJMP begin 				;repeating i.e, while(1)
delay:
 LDS R29, TCNT1H 		;loading upper bit of counter to R29
 LDS R28, TCNT1L 		;loading lower bit of counter to R28
 CPI R28,0x3e			;comparing if lower is 0xC6
 BRSH body
 RJMP delay
body:
 CPI R29,0x03
 BRSH done
 RJMP delay
done:
 LDI R20,0x02
 STS TCNT1H,R20			;resetting the counter to 0 for next round
 LDI R20,0x4F
 STS TCNT1L,R20 		;resetting the counter to 0 for next round
 RET



