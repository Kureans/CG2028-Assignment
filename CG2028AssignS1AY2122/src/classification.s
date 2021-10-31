 	.syntax unified
 	.cpu cortex-m3
 	.thumb
 	.align 2
 	.global	classification
 	.thumb_func

@ CG2028 Assignment, Sem 2, AY 2021/21
@ (c) CG2028 Teaching Team, ECE NUS, 2021

@ student 1: Name: Teng Yi Shiong , Matriculation No.: A0217611N
@ student 2: Name: , Matriculation No.:

@Register map
@R0 - N, returns class
@R1 - points
@R2 - label
@R3 - sample, sample Y value
@R4 - current min dist
@R5 - current min label
@R6 - square of X distance, current calculated distance
@R7 - sample X value
@R8 - square of Y distance


classification:
@ PUSH / save (only those) registers which are modified by your function
		PUSH {R1-R8, R14}
@ parameter registers need not be saved.

@ write asm function body here
@ Set R4 to INT_MAX
		LDR R4, INT_MAX
@ Load Sample X and Y values
		LDR R7, [R3], #4
		LDR R3, [R3]
 LOOP:  LDR R6, [R1], #4 @ Load trng X value into R6
        SUB R6, R7
        MUL R6, R6 @ square of X distance
        LDR R8, [R1], #4 @ Load trng Y value in R8
        SUB R8, R3
        MLA R6, R8, R8, R6 @ Get square of Y value, add square of X value and store back into R6
        CMP R4, R6 @R4 - R6, checks if calc dist is lower than curr min dist
        ITTE		PL
        LDRPL	R5, [R2], #4 @ Store current label if calc dist is lower than curr min dist
        MOVPL	R4, R6
		ADDMI   R2, #4 @ Else just increment the label pointer
		SUBS R0, #1
		BGT LOOP





@ branch to SUBROUTINE for illustration only
		BL SUBROUTINE
@ prepare value to return (class) to C program in R0
		MOV R0, R5
@ POP / restore original register values. DO NOT save or restore R0. Why?
		POP {R1-R8, R14}
@ return to C program
		BX	LR

@ you could write your code without SUBROUTINE
SUBROUTINE:

		BX LR

@label: .word value
INT_MAX:
			.word 0x7FFFFFFF
@.lcomm label num_bytes
