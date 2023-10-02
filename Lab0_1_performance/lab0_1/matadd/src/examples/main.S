# coordinates are given in col major format
# (col,row) = (x,y)

.equ BG_COLOR, 0x0F	#blue
.equ VG_ADDR, 0x11100000
.equ VG_COLOR, 0x11140000

.option rvc
.global main 
.type main, @function
main:
	li x18, VG_ADDR
	li x19, VG_COLOR

	call draw_background 	# draw using default color

loop:	li a0, 10		# Y coordinate
	li a1, 20		# X coordinate
	li a3, 0xE0		# color red
	call draw_dot		# draw red square


	li a0, 50		# Y coordinate
	li a1, 20		# X coordinate
	li a3, 0xE0		# color red
	call draw_dot		# draw red square


	li a0, 5		# Y coordinate
	li a1, 5		# X coordinate
	li a3, 0xE5		# color red
	call draw_dot		# draw red square
	
	li a3, 0xE0
	li a1, 1		#  x coordinate
	li a0, 0x4		# start y coordinate
	li a2, 0x46		# ending y coordinate
	call draw_horizontal_line

	li a1, 8		# starting x coordinate
	li a0, 4		# y coordinate
	li a2, 0x37		# ending x coordiante
	call draw_vertical_line

	j loop # continuous loop

# draws a horizontal line from (a0,a1) to (a2,a1) using color in a3
draw_horizontal_line:
	addi sp,sp,-4
	sw ra, 0(sp)
	addi a2,a2,1	#go from a0 to a2 inclusive
draw_horiz1:
	call draw_dot
	addi a0,a0,1
	bne a0,a2, draw_horiz1
	lw ra, 0(sp)
	addi sp,sp,4
	ret

# draws a vertical line from (a0,a1) to (a0,a2) using color in a3
draw_vertical_line:
	addi sp,sp,-4
	sw ra, 0(sp)
	addi a2,a2,1
draw_vert1:
	call draw_dot
	addi a1,a1,1
	bne a1,a2,draw_vert1
	lw ra, 0(sp)
	addi sp,sp,4
	ret

# Fills the 60x80 grid with one color using successive calls to draw_horizontal_line
draw_background:
	addi sp,sp,-4
	sw ra, 0(sp)
	li a3, BG_COLOR	#use default color
	li a1, 0	#a1= row_counter
	li t4, 60 	#max rows
start:	li a0, 0
	li a2, 79 	#total number of columns
	call draw_horizontal_line
	addi a1,a1, 1
	bne t4,a1, start	#branch to draw more rows
	lw ra, 0(sp)
	addi sp,sp,4
	ret

# draws a dot on the display at the given coordinates:
# 	(X,Y) = (a0,a1) with a color stored in a3
# 	(col, row) = (a0,a1)
draw_dot:
	andi t0,a0,0x7F	# select bottom 7 bits (col)
	andi t1,a1,0x3F	# select bottom 6 bits  (row)
	slli t1,t1,7	#  {a1[5:0],a0[6:0]} 
	or t0,t1,t0	# 13-bit address
	sw t0, 0(x18)	# write 13 address bits to register
	sw a3, 0(x19)	# write color data to frame buffer
	ret
