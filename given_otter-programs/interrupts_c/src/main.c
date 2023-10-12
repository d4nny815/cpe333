
volatile int * const SWITCHES = (int *) 0x11000000;
volatile int * const VGA_READ = (int *)  0x11040000;
volatile int * const LEDS = (int *) 0x11080000;
volatile int * const VGA_ADDR = (int *)  0x11100000;
volatile int * const VGA_COLOR = (int *) 0x11140000;


volatile int * const SSEG = (int *)  0x110C0000;
#define ENABLE_INT   asm(" li t0, 1		\n\
		      	   la t1, my_ISR 	\n\
	 	      	   csrw mtvec, t1 	\n\
		      	   csrw mie, t0		");
void my_ISR()
{
	*SSEG=*SSEG+1;
	asm("mret");
}
void main(){

	ENABLE_INT
	
	while(1);
}


