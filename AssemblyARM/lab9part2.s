		.text
		.global _ start
_start:	LDR		R1 = 0XFF200000
		LDR		R4 = 0XFF200050
		MOV		R9, #0
		MOV		R5, #0X1
		LDR 	R8, =0XFFEC600
		LDR		R0, =0X03FFFFF
		STR 	R0, [R8]
		MOV		R0, #0b11
		STR 	R0, [R8, #8]

LEDS:	STR 	R6, [R1]
		LDR		R7, [R4]	// The keys to R7

		CMP		R7, #0
		BEQ		NO_KEY
		MOV 	R5, R6

LEFT:	LSR		R6, #1
		STR 	R6, [R1]
		ADD		R9, R9, #1	//counter
		LDR		R7, [R2]
		CMP		R7, #B0 //key not push


RIGHT: 	ROR		R6, #1
		STR 	R6, [R1]
		SUB		R9, R9, #1	//counter
		LDR		R7, [R2]
		CMP		R7, #B0 //key not push

WAIT:	LDR		R7, [R4]
		CMP		R7, #0
		BNE		WAIT
		BL		STOP

STOP:	LDR 	R7, [R4]
		CMP		R7, #0 //Not pressed
		BEQ		STOP //keep looping if not pressed
		B 		WAIT


DELAY:	LDR R0, [R8, #0xCS]
		CMP R0, #0
		BEQ	DELAY
		STR R0, [R8, #0XC]
		CMP	R9, #9
		BEQ LEFT
		B 	RIGHT
		B   DELAY
		.end 


