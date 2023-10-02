# This program demonstrates the 80x60 VGA, switches, LEDs, and 7-seg modules on
# an OTTER. The switches are divided up as {1-bit write enable, 2-bit color
# index, 6-bit row, 7-bit column}. The program repeatedly reads the switches,
# and sets the 7-seg to the row/column, and the LEDs to the actual color read
# back from the VGA memory at the switches-specified location. If the left
# switch (write enable) is on, it also writes the color selected by the index
# to the VGA memory at the switches-specified location.

# inputs
.equ SWITCHES_AD , 0x11000000
.equ VGA_READ_AD , 0x11040000

# outputs
.equ LEDS_AD     , 0x11080000
.equ SSEG_AD     , 0x110C0000
.equ VGA_ADDR_AD , 0x11100000
.equ VGA_COLOR_AD, 0x11140000

.data
COLORS:
.word 0x000000FF  # white
.word 0x000000E0  # red
.word 0x0000001C  # green
.word 0x00000003  # blue

.text
.global main
main:

li s2, SWITCHES_AD
li s3, VGA_READ_AD
li s4, LEDS_AD
li s5, SSEG_AD
li s6, VGA_ADDR_AD
li s7, VGA_COLOR_AD
li s8,  0x00008000
li s9,  0x00001FFF
li s10, 0x00006000

loop:
# read switches
lw t0, 0(s2)

# use right 13 switches [12:0] as buffer address
and t1, t0, s9
sw t1, 0(s6)

# write buffer address to SSEG (only good for small addresses)
sw t1, 0(s5)

# use left switch [15] as write enable
and t1, t0, s8
beq t1, zero, not_we

# if write enable, write color chosen by middle switches [14:13]
and t1, t0, s10
srl t1, t1, 11  # shift right 13, then multiply by 4 for word offset
# index into the 4-element array of colors, by those switches
la t2, COLORS
add t2, t2, t1
lw t1, 0(t2)
sw t1, 0(s7)

not_we:

# read color and write to LEDs
lw t1, 0(s3)
sw t1, 0(s4)

j loop

ret
