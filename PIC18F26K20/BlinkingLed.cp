#line 1 "D:/picmcu_research_development/PIC18F26K20/BlinkingLed.c"
void main() {
 TRISB0_bit = 0;
 ANSEL = 0;
 do {
 LATB.B0 = 0;
 Delay_ms(500);
 LATB.B0 = 1;
 Delay_ms(500);
 } while (1);
}
