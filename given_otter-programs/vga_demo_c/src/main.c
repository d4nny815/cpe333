// coordinates are given in row major format
// (col,row) = (x,y)

const int BG_COLOR = 0x0F;  // light blue (0/7 red, 3/7 green, 3/3 blue)
volatile int * const VG_ADDR = (int *)0x11100000;
volatile int * const VG_COLOR = (int *)0x11140000;

static void draw_horizontal_line(int X, int Y, int toX, int color);
static void draw_vertical_line(int X, int Y, int toY, int color);
static void draw_background();
static void draw_dot(int X, int Y, int color);

void main() {
	// fill screen using default color
	draw_background();

	while (1) {
		// small square at (10,20)
		// with color red (7/7 red, 0/7 green, 0/3 blue)
		draw_dot(10, 20, 0xE0);

		// small square at (50,20)
		// with color red (7/7 red, 0/7 green, 0/3 blue)
		draw_dot(50, 20, 0xE0);

		// small square at (5,5)
		// with color off-red (7/7 red, 1/7 green, 1/3 blue)
		draw_dot(5, 5, 0xE5);

		// horizontal line from (4,1) to (70, 1)
		// with color red (7/7 red, 0/7 green, 0/3 blue)
		draw_horizontal_line(4, 1, 70, 0xE0);

		// vertical line from (4,8) to (4, 55)
		// with color red (7/7 red, 0/7 green, 0/3 blue)
		draw_vertical_line(4, 8, 55, 0xE0);
	}
}

static void draw_horizontal_line(int X, int Y, int toX, int color) {
	toX++;
	for (; X != toX; X++) {
		draw_dot(X, Y, color);
	}
}


static void draw_vertical_line(int X, int Y, int toY, int color) {
	toY++;
	for (; Y != toY; Y++) {
		draw_dot(X, Y, color);
	}
}

// fills the screen with BG_COLOR
static void draw_background() {
	for (int Y = 0; Y != 60; Y++) {
		draw_horizontal_line(0, Y, 79, BG_COLOR);
	}
}

// draws a small square (a single memory cell)
static void draw_dot(int X, int Y, int color) {
	*VG_ADDR = (Y << 7) | X;  // store into the address IO register
	*VG_COLOR = color;  // store into the color IO register, which triggers
	                    // the actual write to the framebuffer at the address
	                    // previously stored in the address IO register
}
