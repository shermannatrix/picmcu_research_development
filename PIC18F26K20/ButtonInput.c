bit oldstate;
int ledOnMask;
int ledOffMask;

void main() {
	 ANSEL = 0;
  	 ANSELH = 0;
	 TRISB0_bit = 1;
         
	 //TRISB1_bit = 0;
	 TRISC = 0x00;
	 PORTC = 0x00;
	 oldstate = 0;
	 ledOnMask = 0x01;
	 ledOffMask = 0x00;
	 
         
	 do {
	 	if (Button(&PORTB, 0, 1, 1)) {
		    oldstate = 1;
		}
		if (Button(&PORTB, 1, 1, 1)) {
		    oldstate = 0;
		}
		
		if (oldstate) {
      	    PORTC = PORTC | ledOnMask;
		} else {
			PORTC = PORTC & ledOffMask;
		}
	} while (1);
}