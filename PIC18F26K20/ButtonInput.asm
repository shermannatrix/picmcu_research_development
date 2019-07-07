
_main:

;ButtonInput.c,5 :: 		void main() {
;ButtonInput.c,6 :: 		ANSEL = 0;
	CLRF        ANSEL+0 
;ButtonInput.c,7 :: 		ANSELH = 0;
	CLRF        ANSELH+0 
;ButtonInput.c,8 :: 		TRISB0_bit = 1;
	BSF         TRISB0_bit+0, BitPos(TRISB0_bit+0) 
;ButtonInput.c,11 :: 		TRISC = 0x00;
	CLRF        TRISC+0 
;ButtonInput.c,12 :: 		PORTC = 0x00;
	CLRF        PORTC+0 
;ButtonInput.c,13 :: 		oldstate = 0;
	BCF         _oldstate+0, BitPos(_oldstate+0) 
;ButtonInput.c,14 :: 		ledOnMask = 0x01;
	MOVLW       1
	MOVWF       _ledOnMask+0 
	MOVLW       0
	MOVWF       _ledOnMask+1 
;ButtonInput.c,15 :: 		ledOffMask = 0x00;
	CLRF        _ledOffMask+0 
	CLRF        _ledOffMask+1 
;ButtonInput.c,18 :: 		do {
L_main0:
;ButtonInput.c,19 :: 		if (Button(&PORTB, 0, 1, 1)) {
	MOVLW       PORTB+0
	MOVWF       FARG_Button_port+0 
	MOVLW       hi_addr(PORTB+0)
	MOVWF       FARG_Button_port+1 
	CLRF        FARG_Button_pin+0 
	MOVLW       1
	MOVWF       FARG_Button_time_ms+0 
	MOVLW       1
	MOVWF       FARG_Button_active_state+0 
	CALL        _Button+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main3
;ButtonInput.c,20 :: 		oldstate = 1;
	BSF         _oldstate+0, BitPos(_oldstate+0) 
;ButtonInput.c,21 :: 		}
L_main3:
;ButtonInput.c,22 :: 		if (Button(&PORTB, 1, 1, 1)) {
	MOVLW       PORTB+0
	MOVWF       FARG_Button_port+0 
	MOVLW       hi_addr(PORTB+0)
	MOVWF       FARG_Button_port+1 
	MOVLW       1
	MOVWF       FARG_Button_pin+0 
	MOVLW       1
	MOVWF       FARG_Button_time_ms+0 
	MOVLW       1
	MOVWF       FARG_Button_active_state+0 
	CALL        _Button+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main4
;ButtonInput.c,23 :: 		oldstate = 0;
	BCF         _oldstate+0, BitPos(_oldstate+0) 
;ButtonInput.c,24 :: 		}
L_main4:
;ButtonInput.c,26 :: 		if (oldstate) {
	BTFSS       _oldstate+0, BitPos(_oldstate+0) 
	GOTO        L_main5
;ButtonInput.c,27 :: 		PORTC = PORTC | ledOnMask;
	MOVF        _ledOnMask+0, 0 
	IORWF       PORTC+0, 1 
;ButtonInput.c,28 :: 		} else {
	GOTO        L_main6
L_main5:
;ButtonInput.c,29 :: 		PORTC = PORTC & ledOffMask;
	MOVF        _ledOffMask+0, 0 
	ANDWF       PORTC+0, 1 
;ButtonInput.c,30 :: 		}
L_main6:
;ButtonInput.c,31 :: 		} while (1);
	GOTO        L_main0
;ButtonInput.c,32 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
