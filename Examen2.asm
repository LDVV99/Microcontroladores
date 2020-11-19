#include "p16F887.inc"   ; TODO INSERT CONFIG CODE HERE USING CONFIG BITS GENERATOR
 	__CONFIG	_CONFIG1,	_INTRC_OSC_NOCLKOUT & _WDT_OFF & _PWRTE_OFF & _MCLRE_ON & _CP_OFF & _CPD_OFF & _BOR_OFF & _IESO_ON & _FCMEN_ON & _LVP_OFF 
 	__CONFIG	_CONFIG2,	_BOR40V & _WRT_OFF

RES_VECT  CODE    0x0000            ; processor reset vector
    GOTO    START                   ; go to beginning of program

    BCF PORTC, 0		;reset
    MOVLW 0x01
    MOVWF PORTD
    
    BSF PORTC, 1		;exec
    CALL tiempo1
    BCF PORTC, 1
    CALL tiempo1
  
    GOTO    START

MAIN_PROG CODE                      ; let linker place main program

START

i equ 0x30
j equ 0x31
k equ 0x32
r0 equ 0x40
r1 equ 0x41
r2 equ 0x42
r3 equ 0x43
r4 equ 0x44
r5 equ 0x45
r6 equ 0x46
r7 equ 0x47
ind equ 0x48
mae equ 0x49

START
    BANKSEL PORTA
    CLRF PORTA
    BANKSEL ANSEL
    CLRF ANSEL
    CLRF ANSELH
    BANKSEL TRISA
    MOVLW d'0'
    MOVWF TRISA
    CLRF TRISB
    CLRF TRISC
    CLRF TRISD
    MOVLW b'11111100'
    CLRF TRISE
    BCF STATUS, RP1
    BCF STATUS, RP0
    BCF PORTC, 1
    BCF PORTC, 0
    
INITLCD
    MOVLW 0x3F
    MOVWF ind
    
    MOVLW 0xD0
    MOVWF mae
    
    BCF PORTC, 0	;reset
    MOVLW 0x01
    MOVWF PORTD
    
    CALL ejec
    
    MOVLW 0x0C		;first line
    MOVWF PORTD
    
    CALL ejec
    
    MOVLW 0x3C		;cursor mode
    MOVWF PORTD
    
    CALL ejec

INICIO
    BCF PORTE, 0
    BCF PORTE, 1
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    BCF PORTC, 0	;command mode
    CALL tiempo1
    
    MOVLW 0x80		;LCD position
    MOVWF PORTD
    CALL ejec
    
    BSF PORTC, 0	;data mode
    CALL tiempo1
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    MOVLW 'C'
    MOVWF PORTD
    CALL ejec
    MOVLW 'l'
    MOVWF PORTD
    CALL ejec
    MOVLW 'a'
    MOVWF PORTD
    CALL ejec
    MOVLW 'v'
    MOVWF PORTD
    CALL ejec
    MOVLW 'e'
    MOVWF PORTD
    CALL ejec
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    BCF PORTC, 0	;command mode
    CALL tiempo1
    
    MOVLW 0xC0		;LCD position 
    MOVWF PORTD
    CALL ejec
    
    BSF PORTC, 0	;data mode
    CALL tiempo1
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    MOVLW '8'
    MOVWF PORTD
    CALL ejec
    MOVLW '9'
    MOVWF PORTD
    CALL ejec
    MOVLW '1'
    MOVWF PORTD
    CALL ejec
    MOVLW '3'
    MOVWF PORTD
    CALL ejec
    MOVLW '2'
    MOVWF PORTD
    CALL ejec
    MOVLW '2'
    MOVWF PORTD
    CALL ejec
    MOVLW '5'
    MOVWF PORTD
    CALL ejec
    MOVLW '0'
    MOVWF PORTD
    CALL ejec
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    BCF PORTC, 0	;command mode
    CALL tiempo1
    
    MOVLW 0x90		;LCD position 
    MOVWF PORTD
    CALL ejec
    
    BSF PORTC, 0	;data mode
    CALL tiempo1
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    MOVLW 'I'
    MOVWF PORTD
    CALL ejec
    MOVLW 'n'
    MOVWF PORTD
    CALL ejec
    MOVLW 'g'
    MOVWF PORTD
    CALL ejec
    MOVLW 'r'
    MOVWF PORTD
    CALL ejec
    MOVLW 'e'
    MOVWF PORTD
    CALL ejec
    MOVLW 's'
    MOVWF PORTD
    CALL ejec
    MOVLW 'a'
    MOVWF PORTD
    CALL ejec
    MOVLW ' '
    MOVWF PORTD
    CALL ejec
    MOVLW 'l'
    MOVWF PORTD
    CALL ejec
    MOVLW 'a'
    MOVWF PORTD
    CALL ejec
    MOVLW ' '
    MOVWF PORTD
    CALL ejec
    MOVLW 'c'
    MOVWF PORTD
    CALL ejec
    MOVLW 'l'
    MOVWF PORTD
    CALL ejec
    MOVLW 'a'
    MOVWF PORTD
    CALL ejec
    MOVLW 'v'
    MOVWF PORTD
    CALL ejec
    MOVLW 'e'
    MOVWF PORTD
    CALL ejec
    MOVLW ':'
    MOVWF PORTD
    CALL ejec
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    BCF PORTC, 0	;command mode
    CALL tiempo1
    
    MOVLW 0xD0		;LCD position 
    MOVWF PORTD
    CALL ejec
    
    BSF PORTC, 0	;data mode
    CALL tiempo1
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    CALL leer
    
    GOTO INICIO

leer
    BSF PORTA, 6
    BSF PORTA, 5
    BSF PORTA, 4
    BSF PORTA, 3
    BSF PORTA, 2
    BSF PORTA, 1
    BSF PORTA, 0
    
    BCF PORTA, 3
    CALL RNA
    CALL tiempo2
    BSF PORTA, 3
    
    BCF PORTA, 2
    CALL RNB
    CALL tiempo2
    BSF PORTA, 2
    
    BCF PORTA, 1
    CALL RNC
    CALL tiempo2
    BSF PORTA, 1
    
    BCF PORTA, 0
    CALL RND
    CALL tiempo2
    BCF PORTA, 0
    
    GOTO leer

RNA
    BTFSS PORTA, 4
    CALL imp1
    BTFSS PORTA, 5
    CALL imp2
    BTFSS PORTA, 6
    CALL imp3
    RETURN

RNB
    BTFSS PORTA, 4
    CALL imp4
    BTFSS PORTA, 5
    CALL imp5
    BTFSS PORTA, 6
    CALL imp6
    RETURN

RNC
    BTFSS PORTA, 4
    CALL imp7
    BTFSS PORTA, 5
    CALL imp8
    BTFSS PORTA, 6
    CALL imp9
    RETURN

RND
    BTFSS PORTA, 4
    CALL borrar
    BTFSS PORTA, 5
    CALL imp0
    BTFSS PORTA, 6
    CALL intro
    RETURN

imp0
    INCF ind
    MOVFW ind
    MOVWF FSR
    MOVLW '0'
    MOVWF INDF
    MOVWF PORTD
    CALL ejec
    BSF PORTA, 5
    CALL tiempo3
    RETURN

imp1
    INCF ind
    MOVFW ind
    MOVWF FSR
    MOVLW '1'
    MOVWF INDF
    MOVWF PORTD
    CALL ejec
    BSF PORTA, 4
    CALL tiempo3
    RETURN

imp2
    INCF ind
    MOVFW ind
    MOVWF FSR
    MOVLW '2'
    MOVWF INDF
    MOVWF PORTD
    CALL ejec
    BSF PORTA, 5
    CALL tiempo3
    RETURN

imp3
    INCF ind
    MOVFW ind
    MOVWF FSR
    MOVLW '3'
    MOVWF INDF
    MOVWF PORTD
    CALL ejec
    BSF PORTA, 6
    CALL tiempo3
    RETURN

imp4
    INCF ind
    MOVFW ind
    MOVWF FSR
    MOVLW '4'
    MOVWF INDF
    MOVWF PORTD
    CALL ejec
    BSF PORTA, 4
    CALL tiempo3
    RETURN

imp5
    INCF ind
    MOVFW ind
    MOVWF FSR
    MOVLW '5'
    MOVWF INDF
    MOVWF PORTD
    CALL ejec
    BSF PORTA, 5
    CALL tiempo3
    RETURN

imp6
    INCF ind
    MOVFW ind
    MOVWF FSR
    MOVLW '6'
    MOVWF INDF
    MOVWF PORTD
    CALL ejec
    BSF PORTA, 6
    CALL tiempo3
    RETURN

imp7
    INCF ind
    MOVFW ind
    MOVWF FSR
    MOVLW '7'
    MOVWF INDF
    MOVWF PORTD
    CALL ejec
    BSF PORTA, 4
    CALL tiempo3
    RETURN

imp8
    INCF ind
    MOVFW ind
    MOVWF FSR
    MOVLW '8'
    MOVWF INDF
    MOVWF PORTD
    CALL ejec
    BSF PORTA, 5
    CALL tiempo3
    RETURN

imp9
    INCF ind
    MOVFW ind
    MOVWF FSR
    MOVLW '9'
    MOVWF INDF
    MOVWF PORTD
    CALL ejec
    BSF PORTA, 6
    CALL tiempo3
    RETURN

borrar
    MOVLW 0x40
    SUBWF ind, 0
    ADDWF mae, 1
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    BCF PORTC, 0	;command mode
    CALL tiempo1
    
    MOVFW mae		;LCD position
    MOVWF PORTD
    CALL ejec
    
    BSF PORTC, 0	;data mode
    CALL tiempo1
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    MOVLW ' '
    MOVWF PORTD
    CALL ejec
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    BCF PORTC, 0	;command mode
    CALL tiempo1
    
    MOVFW mae		;LCD position
    MOVWF PORTD
    CALL ejec
    
    BSF PORTC, 0	;data mode
    CALL tiempo1
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    MOVLW 0xD0
    MOVWF mae
    DECF ind, 1
    
    BSF PORTA, 5
    CALL tiempo3
    
    RETURN

intro
    MOVLW '8'
    XORWF r0, 1
    INCF r0, 1
    DECFSZ r0
    GOTO equiv
    
    MOVLW '9'
    XORWF r1, 1
    INCF r1, 1
    DECFSZ r1
    GOTO equiv
    
    MOVLW '1'
    XORWF r2, 1
    INCF r2, 1
    DECFSZ r2
    GOTO equiv
    
    MOVLW '3'
    XORWF r3, 1
    INCF r3, 1
    DECFSZ r3
    GOTO equiv
    
    MOVLW '2'
    XORWF r4, 1
    INCF r4, 1
    DECFSZ r4
    GOTO equiv
    
    MOVLW '2'
    XORWF r5, 1
    INCF r5, 1
    DECFSZ r5
    GOTO equiv
    
    MOVLW '5'
    XORWF r6, 1
    INCF r6, 1
    DECFSZ r6
    GOTO equiv
    
    MOVLW '0'
    XORWF r7, 1
    INCF r7, 1
    DECFSZ r7
    GOTO equiv
    GOTO vale
    
    BSF PORTA, 6
    CALL tiempo3
    RETURN

ejec
    BSF PORTC, 1
    CALL tiempo1
    BCF PORTC, 1
    CALL tiempo1
    RETURN

equiv
    BCF PORTC, 0
    MOVLW 0x01
    MOVWF PORTD
    CALL ejec
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    BCF PORTC, 0	;command mode
    CALL tiempo1
    
    MOVLW 0x80		;LCD position
    MOVWF PORTD
    CALL ejec
    
    BSF PORTC, 0	;data mode
    CALL tiempo1
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    MOVLW 'I'
    MOVWF PORTD
    CALL ejec
    MOVLW 'n'
    MOVWF PORTD
    CALL ejec
    MOVLW 'c'
    MOVWF PORTD
    CALL ejec
    MOVLW 'o'
    MOVWF PORTD
    CALL ejec
    MOVLW 'r'
    MOVWF PORTD
    CALL ejec
    MOVLW 'r'
    MOVWF PORTD
    CALL ejec
    MOVLW 'e'
    MOVWF PORTD
    CALL ejec
    MOVLW 'c'
    MOVWF PORTD
    CALL ejec
    MOVLW 't'
    MOVWF PORTD
    CALL ejec
    MOVLW 'o'
    MOVWF PORTD
    CALL ejec
    MOVLW ' '
    MOVWF PORTD
    CALL ejec
    MOVLW 'x'
    MOVWF PORTD
    CALL ejec
    MOVLW 'D'
    MOVWF PORTD
    CALL ejec
rojo
    BCF PORTE, 0
    BSF PORTE, 1
    GOTO rojo

vale
    BCF PORTC, 0
    MOVLW 0x01
    MOVWF PORTD
    CALL ejec
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    BCF PORTC, 0	;command mode
    CALL tiempo1
    
    MOVLW 0x80		;LCD position
    MOVWF PORTD
    CALL ejec
    
    BSF PORTC, 0	;data mode
    CALL tiempo1
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    MOVLW 'C'
    MOVWF PORTD
    CALL ejec
    MOVLW 'o'
    MOVWF PORTD
    CALL ejec
    MOVLW 'r'
    MOVWF PORTD
    CALL ejec
    MOVLW 'r'
    MOVWF PORTD
    CALL ejec
    MOVLW 'e'
    MOVWF PORTD
    CALL ejec
    MOVLW 'c'
    MOVWF PORTD
    CALL ejec
    MOVLW 't'
    MOVWF PORTD
    CALL ejec
    MOVLW 'o'
    MOVWF PORTD
    CALL ejec
    MOVLW ' '
    MOVWF PORTD
    CALL ejec
    MOVLW ':'
    MOVWF PORTD
    CALL ejec
    MOVLW ')'
    MOVWF PORTD
    CALL ejec
verde
    BSF PORTE, 0
    BCF PORTE, 1
    GOTO verde

tiempo1
    CLRF i
    MOVLW d'10'
    MOVWF j
ciclo1
    MOVLW d'80'
    MOVWF i
    DECFSZ i
    GOTO $-1
    DECFSZ j
    GOTO ciclo1
    RETURN

tiempo2
    CLRF i
    MOVLW d'20'
    MOVWF j
ciclo2 
    MOVLW d'30'
    MOVWF i
    DECFSZ i
    GOTO $-1
    DECFSZ j
    GOTO ciclo2
    RETURN

tiempo3
    MOVLW d'10'
    MOVWF i
cicloj:
    MOVLW d'20'
    MOVWF j
ciclok:
    MOVLW d'200'
    MOVWF k
cicloi:
    NOP
    NOP
    DECFSZ k, 1
    GOTO cicloi
    DECFSZ j, 1
    GOTO ciclok
    DECFSZ i, 1
    GOTO cicloj
    RETURN

END