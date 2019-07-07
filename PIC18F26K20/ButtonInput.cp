#line 1 "D:/picmcu_research_development/PIC18F26K20/ButtonInput.c"
bit oldstate;
int ledOnMask;
int ledOffMask;

void main() {
 ANSEL = 0;
 ANSELH = 0;
 TRISB0_bit = 1;


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
