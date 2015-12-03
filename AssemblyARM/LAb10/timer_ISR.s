				.include "address_map_arm.s"
				.extern	LEDR_DIRECTION
				.extern	LEDR_PATTERN

/*****************************************************************************
 * MPCORE Private Timer - Interrupt Service Routine                                
 *                                                                          
 * Shifts the pattern being displayed on the LEDR
 * 
******************************************************************************/
				.global PRIV_TIMER_ISR
PRIV_TIMER_ISR:	
				LDR		R0, =MPCORE_PRIV_TIMER	// base address of timer
				MOV		R1, #1ik
				STR		R1, [R0, #0xC]				// write 1 to F bit to reset it
															// and clear the interrupt

/* Rotate the LEDR bits either to the left or right. Reverses direction when hitting 
	position 9 on the left, or position 0 on the right */
SWEEP:          LDR		R0, =LEDR_DIRECTION	// put shifting direction into R2
				LDR		R2, [R0]
				LDR		R1, =LEDR_PATTERN		// put LEDR pattern into R3
				LDR		R3, [R1]

MAIN:
                CMP		R3, #1		//check LED pattern
                BEQ     R_L
                CMP     R3, #512
                BEQ     L_R


SHIFTL:         SL		R3, #1
                B 		DONE_SWEEP


L_R:            MOV 	R2, #1 		//move direction to right
                CMP		R2, #0		//if 0
                BEQ		SHIFTL 		// go left
                B 		SHIFTR

SHIFTR:         LSR		R3, #1
                B 		DONE_SWEEP		//stacking


R_L:			MOV		R2, #0					// change direction to left
                CMP		R2, #0		//if 0
                BEQ		SHIFTL
                B			SHIFTR

DONE_SWEEP:
				STR		R2, [R0]					// put shifting direction back into memory
				STR		R3, [R1]					// put LEDR pattern back onto stack
	
END_TIMER_ISR:
				MOV		PC, LR
