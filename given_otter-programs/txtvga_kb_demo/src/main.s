# This program demonstrates the TXTVGAv2 and KBA modules for the OTTER.
# It displays the font in the center of the screen with a box around it, then
# echoes keys from the keyboard to the screen directly under the box while
# advancing the "cursor" for each.

# Note that the calling convention is not used internally (as in one of these
#  functions calling another of these functions) but is used externally (as in a
#  function in another file calling one of these functions).

# coordinates are given in row major format, with (0, 0) at the top-left
# (col, row) = (x, y)

.equ TVG_ADDR_PORT, 0x11200000
.equ TVG_WRITE_PORT, 0x11240000
.equ TVG_READ_PORT, 0x11280000
.equ KEY_CHAR_PORT, 0x11300000

# never returns, so no need to preserve caller's registers
.global main
.type main, @function
main:
	# global constant registers, don't modify anywhere!
	li   s8, TVG_ADDR_PORT
	li   s9, TVG_WRITE_PORT
	li   s10, TVG_READ_PORT
	li   s11, KEY_CHAR_PORT

	# clear the key-hit global flag register, don't use this register for any
	#   other purpose!
	li   s7, 0

	# register the interrupt handler
1:	auipc t0, %pcrel_hi(ISR)
        addi  t0, t0, %pcrel_lo(1b)
	csrrw zero, mtvec, t0

	# enable interrupts
	li   t0, 1
	csrrw zero, mie, t0

	# clear the screen, overwriting anything in the textram init file
	call clear_screen

	# display font in center of screen (16x16 chars)
	li   a0, 32	# X coordinate of upper-left corner
	li   a1, 12	# Y coordinate of upper-left corner
	call display_font

	# draw a box around the font display
	li   a0, 31	# left side
	li   a1, 11	# top side
	li   a2, 48	# right side
	li   a3, 28	# bottom side
	call draw_box

	# echo keyboard hits to screen just below font box, indefinitely
	li   a0, 31	# starting X coordinate
	li   a1, 29	# starting Y coordinate
	call echo_kb	# never returns


# starts echoing keys hit on the keyboard to the screen, starting at (a0, a1)
# never returns, so no need to preserve caller's registers
# ASSUMES: s11 holds IOBUS port address for keyboard key char, and s7 is set by
#            the ISR when a key hit triggers the interrupt
.type echo_kb, @function
echo_kb:
	beq  s7, zero, echo_kb
	li   s7, 0
	lw   a3, 0(s11)
	call write_char		# MUST NOT MODIFY: a0, a1
	addi a0, a0, 1
	j echo_kb


# minimal interrupt handler, just sets the global flag register s7 to 1
# MUST NOT MODIFY ANY OTHER REGISTER
.type ISR, @function
ISR:
	li   s7, 1
	mret


# clears the screen by writing null characters to all 3200 locations
# ONLY MODIFIES: t4, t5
# ASSUMES: s8 and s9 hold IOBUS port addresses for screen location and character
#            write respectively
.global clear_screen
.type clear_screen, @function
clear_screen:
	li   t5, 0
	li   t4, 3200
clr_scrn1:
	addi t4, t4, -1
	sw   t4, 0(s8)		# write screen location to IOBUS register
				#   specified by address in s8
	sw   t5, 0(s9)		# write character to IOBUS register specified by
				#   address in s9, which triggers the write to
				#   the screen frame buffer
	bne  t4, zero, clr_scrn1
	ret


# fills a 16x16 block of characters with the full set of font symbols, with the
#   upper-left corner at (a0, a1)
# ONLY MODIFIES: t2, t3, t4, t5, a0, a1, a3
# ASSUMES: s8 and s9 hold IOBUS port addresses for screen location and character
#            write respectively
.global display_font
.type display_font, @function
display_font:
	addi sp, sp, -4
	sw   ra, 0(sp)

	addi t2, a0, 16
	addi t3, a1, 16
	li   a3, 0
disp_font1:
	call write_char		# MUST NOT MODIFY: t2, t3, a0, a1, a3
	addi a3, a3, 1
	addi a0, a0, 1
	bne  a0, t2, disp_font1
	addi a0, a0, -16
	addi a1, a1, 1
	bne  a1, t3, disp_font1

	lw   ra, 0(sp)
	addi sp, sp, 4
	ret


# draws a box with line-drawing characters from (a0, a1) to (a2, a3)
# ONLY MODIFIES: t0, t1, t2, t3, t4, t5, a0, a1, a2, a3
# ASSUMES: s8 and s9 hold IOBUS port addresses for screen location and character
#            write respectively
.global draw_box
.type draw_box, @function
draw_box:
	addi sp, sp, -4
	sw   ra, 0(sp)

	mv   t0, a0
	mv   t1, a1
	mv   t2, a2
	mv   t3, a3

	# draw the upper-left box corner
	mv   a0, t0		# X coordinate
	mv   a1, t1		# Y coordinate
	li   a3, 218		# ascii code
	call write_char		# MUST NOT MODIFY: t0, t1, t2, t3

	# draw the top box side
	addi a0, t0, 1		# start X coordinate
	mv   a1, t1		# Y coordinate
	addi a2, t2, -1		# ending X coordinate
	li   a3, 196		# ascii code
	call fill_horizontal	# MUST NOT MODIFY: t0, t1, t2, t3

	# draw the upper-right box corner
	mv   a0, t2		# X coordinate
	mv   a1, t1		# Y coordinate
	li   a3, 191		# ascii code
	call write_char		# MUST NOT MODIFY: t0, t1, t2, t3

	# draw the right box side
	mv   a0, t2		# X coordinate
	addi a1, t1, 1		# starting Y coordinate
	addi a2, t3, -1		# ending Y coordinate
	li   a3, 179		# ascii code
	call fill_vertical	# MUST NOT MODIFY: t0, t1, t2, t3

	# draw the lower-right box corner
	mv   a0, t2		# X coordinate
	mv   a1, t3		# Y coordinate
	li   a3, 217		# ascii code
	call write_char		# MUST NOT MODIFY: t0, t1, t2, t3

	# draw the bottom box side
	addi a0, t0, 1		# start X coordinate
	mv   a1, t3		# Y coordinate
	addi a2, t2, -1		# ending X coordinate
	li   a3, 196		# ascii code
	call fill_horizontal	# MUST NOT MODIFY: t0, t1, t2, t3

	# draw the lower-left box corner
	mv   a0, t0		# X coordinate
	mv   a1, t3		# Y coordinate
	li   a3, 192		# ascii code
	call write_char		# MUST NOT MODIFY: t0, t1, t2, t3

	# draw the left box side
	mv   a0, t0		# X coordinate
	addi a1, t1, 1		# starting Y coordinate
	addi a2, t3, -1		# ending Y coordinate
	li   a3, 179		# ascii code
	call fill_vertical	# MUST NOT MODIFY: t0, t1, t2, t3

	lw   ra, 0(sp)
	addi sp, sp, 4
	ret


# writes the character a3 multiple times in a row from (a0, a1) to (a2, a1)
# ONLY MODIFIES: t4, t5, a0, a2
# ASSUMES: s8 and s9 hold IOBUS port addresses for screen location and character
#            write respectively
.global fill_horizontal
.type fill_horizontal, @function
fill_horizontal:
	addi sp, sp, -4
	sw   ra, 0(sp)

	addi a2, a2, 1
fill_horiz1:
	call write_char
	addi a0, a0, 1
	bne  a0, a2, fill_horiz1

	lw   ra, 0(sp)
	addi sp, sp, 4
	ret


# writes the character a3 multiple times in a column from (a0, a1) to (a0, a2)
# ONLY MODIFIES: t4, t5, a1, a2
# ASSUMES: s8 and s9 hold IOBUS port addresses for screen location and character
#            write respectively
.global fill_vertical
.type fill_vertical, @function
fill_vertical:
	addi sp, sp, -4
	sw   ra, 0(sp)

	addi a2, a2, 1
fill_vert1:
	call write_char
	addi a1, a1, 1
	bne  a1, a2, fill_vert1

	lw   ra, 0(sp)
	addi sp, sp, 4
	ret


# writes the character a3 on the display at coordinates (a0, a1)
# ONLY MODIFIES: t4, t5
# ASSUMES: s8 and s9 hold IOBUS port addresses for screen location and character
#            write respectively
.global write_char
.type write_char, @function
write_char:
	# calculate location = X + Y * 80
	mv   t4, a0		# X
	sll  t5, a1, 4
	add  t4, t4, t5		# + Y * 16
	sll  t5, a1, 6
	add  t4, t4, t5		# + Y * 64

	# write the character at the computed location
	sw   t4, 0(s8)		# write screen location to IOBUS register
				#   specified by address in s8
	sw   a3, 0(s9)		# write character to IOBUS register specified by
				#   address in s9, which triggers the write to
				#   the screen frame buffer
	ret


# reads the character on the display at coordinates (a0, a1) into a3
# ONLY MODIFIES: t4, t5
# ASSUMES: s8 and s10 hold IOBUS port addresses for screen location and character
#            read respectively
.global read_char
.type read_char, @function
read_char:
	# calculate location = X + Y * 80
	mv   t4, a0		# X
	sll  t5, a1, 4
	add  t4, t4, t5		# + Y * 16
	sll  t5, a1, 6
	add  t4, t4, t5		# + Y * 64

	# read the character at the computed location
	sw   t4, 0(s8)		# write screen location to IOBUS register
				#   specified by address in s8
	lw   a3, 0(s10)		# read character from IOBUS port specified by
				#   address in s10, which is from the screen frame
				#   buffer
	ret
