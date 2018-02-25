;
; Assignment1.asm
;
; Created: 2/23/2018 3:14:31 PM
; Author : Vincent
;


; Replace with your application code
.org 0

.DEF counterL = R20		;define R21:R20 as my counter holding the value 300
.DEF counterH = R21
LDI counterL, 0x2c		;300 in hex = Ox012c load lower bits to counterL
LDI counterH, 0x01		;load higher bits to counterH

.DEF divFiveSumL = R17	;store sum of divisible by 5 numbers in R16:R17
.DEF divFiveSumH = R16

.DEF notDivFiveSumL = R19	;store sum of not divisible by 5 numbers in R18:R19
.DEF notDivFiveSumH = R18

LDI XL, 0x22			;Load lower half of 0x0222 memory location to XL
LDI XH, 0x02			;Load higher half of 0x0222 memory location to XH

LDI YL, 0x00			;Load lower half of 0x0400 memory location to YL
LDI YH, 0x04			;Load higher half of 0x0400 memory location to YH

LDI ZL, 0x00			;Load lower half of 0x0600 memory location to ZL
LDI ZH, 0x06			;Load higher half of 0x0600 memory location to ZH

loop1:

mov R23, XH				;place XH to r23
add R23, XL				;add the lower bits of the value in X to R23
ST X+, R23				;store the number in R23 into the 0x0222 location
mov R24, R23			;move the value in R23 to R24

subFive:

subi R24, 0x05			;sub 5 from R24	
cpi R24, 0x05			;if the difference is greater than 5 keep subtracting by 5
brsh subFive			;branch to subFive if R24 is same as 5 or higher than 5
cpi R24, 0x00			;if the difference is less than 5, compare it to 0
brne notDivisibleByFive	;if the difference is not equal to 0, the number is not div. by 5
st Y+, R23				;if it did not branch store that number in 0x0400
clr R24					;clears R24 so it has the value 0
add divFiveSumL, R23	;add R23 to lower bits of divisible by 5 sum
adc divfiveSumH, R24	;since the value in R23 is 8 bits long, Im adding R24(has a value of 0) to the higher bits of the sum 

jmp nextNumber			;after storing the number, repeat the loop for the next number

notDivisibleByFive:
st Z+, R23				;store number that is not div. by 5 into 0x0600
clr R24
add notDivFiveSumL, R23		;add R23 to lower bits of not divisible by 5 sum
adc notDivFiveSumH, R24		;since the value in R23 is 8 bits long, Im adding R24(has a value of 0) to the higher bits of the sum 

nextNumber:

subi counterL, 0x01		;sub 1 from 300
sbci counterH, 0x00		;sub 0 from higher half and include carry
cpi counterL, 0			;check if the lower bits = 0
brne loop1				;if lower bits != 0, then keep looping
cpi counterH, 0			;if lowers bits = 0 and and higher bits = 0, then stop  if not, keep looping
brne loop1				;if counterH does not equal 0, then keep looping

done:


