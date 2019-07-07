void main() {
     TRISB0_bit = 0;    // Set pin B0 to output
     ANSEL = 0;         // Set port as Digital
     do {
		LATB.B0 = 0;    // write the pin B0 with 0 value
		Delay_ms(500); // delay 1 second
		LATB.B0 = 1;    // write the pin B0 with 1 value
		Delay_ms(500);
     } while (1);
}