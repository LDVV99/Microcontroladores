#include "p16F628a.inc"
__CONFIG _FOSC_INTOSCCLK & _WDTE_OFF & _PWRTE_OFF & _MCLRE_OFF & _BOREN_OFF & _LVP_OFF & _CPD_OFF & _CP_OFF

RES_VECT CODE 0x0000 ; processor reset vector
GOTO START ; go to beginning of program
; TODO ADD INTERRUPTS HERE IF USED
MAIN_PROG CODE ; let linker place main program

i equ 0x30
j equ 0x31
k equ 0x32

START

MOVLW 0x07
MOVWF CMCON
BCF STATUS, RP1
BSF STATUS, RP0
MOVLW b'00000000'
MOVWF TRISB
BCF STATUS, RP0
inicio:
btfsc PORTB,0
bcf PORTB,0
call tiempo
nop
nop
nop
nop
bsf PORTB,0
call tiempo
nop
nop
NOP 
btfss PORTB,1
bcf PORTB,0
call tiempo1
nop
nop
nop
bsf PORTB,0
call tiempo1
goto inicio
tiempo:
	MOVLW d'54'
	MOVWF i
loopj:  MOVLW d'60'
	MOVWF j
loopk:  MOVLW d'50'
	MOVWF k
	DECFSZ k
	GOTO $-1
	DECFSZ j
	GOTO loopk
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	DECFSZ i
	GOTO loopj
	nop
	nop
	nop
	nop
	return   
tiempo1:
	MOVLW d'108'
	MOVWF i
loopj1: MOVLW d'60'
	MOVWF j
loopk1: MOVLW d'50'
	MOVWF k
	DECFSZ k
	GOTO $-1
	DECFSZ j
	GOTO loopk1
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	DECFSZ i
	GOTO loopj1
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	return 
END 