volatile int * const LED_ADDR = (int *)0x11080000;

void toggle() {
	*LED_ADDR = *LED_ADDR ^ 1; 
}


void main()
{

		toggle(); 
		toggle(); 
		toggle(); 
		toggle(); 

	return;
}
