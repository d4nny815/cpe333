// Game of Life with random initial generation.
// This program demonstrates use of range-mapped VGA memory on the OTTER for
// both data storage and display, while verifying functionality of switches,
// leds, and the 7seg display.

#include <stdlib.h>

#define SWITCHES_AD  0x11000000
#define LEDS_AD      0x11080000
#define SSEG_AD      0x110C0000
#define VGA_RANGE_AD 0x20000000
#define STRIDE 128  // vga bytes per row, including dead space
#define ROWS 60     // vga visible rows
#define COLS 80     // vga visible columns
#define WHITE 0xFF  // vga color white
#define BLACK 0x00  // vga color black

// Pointers to hardware ports. The addresses are constant, but the data (not
// constant) they point to are indicated as volatile to enforce direct access
// without that being optimized away by the compiler.
volatile unsigned char (* const vga)[STRIDE] = (void *)VGA_RANGE_AD;
volatile unsigned short * const sw = (void *)SWITCHES_AD;
volatile unsigned short * const leds = (void *)LEDS_AD;
volatile unsigned short * const sseg = (void *)SSEG_AD;

void delay(volatile long iters) {
    while (iters--);
}

int main() {
    int i, j, lnc, live;
    unsigned char cell;
    unsigned short ctr;

    // Initialize the cells randomly, using the switches as the RNG seed.
    srand(*sw);
    for (i = 1; i < ROWS-1; i++) {
        for (j = 1; j < COLS-1; j++) {
            vga[i][j] = rand() & 1 ? WHITE : BLACK;
        }
    }
    
    // Repeatedly calculate subsequent generations, using the vga as both memory
    // and display. Note that the algorithm requires access to the previous
    // state of neighboring cells even after updating their next state, so
    // normally this would require an extra buffer. However, we can use just the
    // LSB of the cell's color to temporarily hold the next state without losing
    // the previous state (second-LSB and others), with minimal visual impact.
    ctr = 0;
    while (1) {
        
        // Update the leds to show the state of the switches, and increment the
        // counter on the 7seg display, then pause for a short time before the
        // next generation.
        *leds = *sw;
        *sseg = ctr++;
        //delay(100000);

        // For each cell, excluding borders to avoid overflow (wrapping)...
        for (i = 1; i < ROWS-1; i++) {
            for (j = 1; j < COLS-1; j++) {
                cell = vga[i][j];

                // Count live neighbors, looking at only the second-LSB which
                // will have value 2 if last generation was live or 0 if dead.
                live = (cell&2) >> 1;
                lnc = ((vga[i-1][j-1]&2) + (vga[i-1][j]&2) + (vga[i-1][j+1]&2)
                     + (vga[i  ][j-1]&2)                   + (vga[i  ][j+1]&2)
                     + (vga[i+1][j-1]&2) + (vga[i+1][j]&2) + (vga[i+1][j+1]&2))
                     >> 1;

                // Change only the LSB to the new live/dead state, to avoid
                // needing a separate memory buffer. This changes the color only
                // slightly, barely noticable even if not brief.
                vga[i][j] = (cell & ~1) | (lnc == 3 || (live && (lnc == 2)));
            }
        }

        // Go over each cell again, using the LSB to update the new state to
        // live (fully white) or dead (fully black).
        for (i = 1; i < ROWS-1; i++) {
            for (j = 1; j < COLS-1; j++) {
                vga[i][j] = vga[i][j] & 1 ? WHITE : BLACK;
            }
        }
    }
}
