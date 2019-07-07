
_main:

;BlinkingLed.c,1 :: 		void main() {
;BlinkingLed.c,2 :: 		TRISB0_bit = 0;    // Set pin B0 to output
	BCF         TRISB0_bit+0, BitPos(TRISB0_bit+0) 
;BlinkingLed.c,3 :: 		ANSEL = 0;         // Set port as Digital
	CLRF        ANSEL+0 
;BlinkingLed.c,4 :: 		do {
L_main0:
;BlinkingLed.c,5 :: 		LATB.B0 = 0;    // write the pin B0 with 0 value
	BCF         LATB+0, 0 
;BlinkingLed.c,6 :: 		Delay_ms(500); // delay 1 second
	MOVLW       21
	MOVWF       R11, 0
	MOVLW       75
	MOVWF       R12, 0
	MOVLW       190
	MOVWF       R13, 0
L_main3:
	DECFSZ      R13, 1, 1
	BRA         L_main3
	DECFSZ      R12, 1, 1
	BRA         L_main3
	DECFSZ      R11, 1, 1
	BRA         L_main3
	NOP
;BlinkingLed.c,7 :: 		LATB.B0 = 1;    // write the pin B0 with 1 value
	BSF         LATB+0, 0 
;BlinkingLed.c,8 :: 		Delay_ms(500);
	MOVLW       21
	MOVWF       R11, 0
	MOVLW       75
	MOVWF       R12, 0
	MOVLW       190
	MOVWF       R13, 0
L_main4:
	DECFSZ      R13, 1, 1
	BRA         L_main4
	DECFSZ      R12, 1, 1
	BRA         L_main4
	DECFSZ      R11, 1, 1
	BRA         L_main4
	NOP
;BlinkingLed.c,9 :: 		} while (1);
	GOTO        L_main0
;BlinkingLed.c,10 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
