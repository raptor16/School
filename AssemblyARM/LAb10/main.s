	.include "address_map_arm.s"
/* 
 * This program demonstrates the use of interrupts using the KEY and timer ports. It
 * 	1. displays a sweeping red light on LEDR, which moves left and right
 * 	2. stops/starts the sweeping motion if KEY3 is pressed
 * Both the timer and KEYs are handled via interrupts
*/
			.text
			.global	_start
_start:
			LDR     R0, #0b10010
            MSR     CPSR, R0
            LDR     SP, #0xFFFFFFFC

            LDR     R0, #0b10011
            MSR     CPSR, R0
            LDR     SP, #0x3FFFFFFC

			... initialize the SVC stack pointer ...

			BL			CONFIG_GIC				// configure the ARM generic interrupt controller
			BL			CONFIG_PRIV_TIMER		// configure the MPCore private timer
			BL			CONFIG_KEYS				// configure the pushbutton KEYs
			
			//... enable ARM processor interrupts ...

            MSR     CPSR, #0b01010011


			LDR		R6, =0xFF200000 		// red LED base address
MAIN:
			LDR		R4, LEDR_PATTERN		// LEDR pattern; modified by timer ISR
			STR 		R4, [R6] 				// write to red LEDs
			B 			MAIN

/* Configure the MPCore private timer to create interrupts every 1/10 second */
CONFIG PRIV TIMER:
			LDR		R0, =0xFFFEC600 		// Timer base address
            CMP     R0, #MPCORE_ORIV_TIMER_IRQ


            BL      PRIV_TIMER_IRQ
            B       EXIT_IRQ

            MOV 		PC, LR 					// return

/* Configure the KEYS to generate an interrupt */
CONFIG KEYS:
			LDR 		R0, =0xFF200050 		// KEYs base address
			MOV         R1, #0xF
            STR         R1, [R0, #8]
			MOV 		PC, LR 					// return

			.global	LEDR_DIRECTION
LEDR_DIRECTION:
			.word 	0							// 0 means left, 1 means right

			.global	LEDR_PATTERN
LEDR_PATTERN:
			.word 	0x1
