# =====================================
# PROGRAM:
#       Testing I/O from wrapper.
#       Assumes Otter Core works
#
# ======================================
.data
sseg: .byte 0x03,0x9F,0x25,0x0D,0x99,0x49,0x41,0x1F,0x01,0x09 # LUT for 7-segs

.text
init:
    li s0, 0x11008000           # switches addr
    li s1, 0x11008004           # buttons addr
    li s2, 0x1100C000           # led addrs
    li s3, 0x1100C004           # segment addr
    li s4, 0x1100C008           # anodes addr (active low since inverted on board)
    la s5, sseg                 # load addr for sseg LUT

    li a0, 9                    # set count
    li t0, 0xe                  # turn on right anode 
    sb t0, 0(s4)                # output to anodes
count_down:
    add t0, a0, s5              # get LUT offset
    lb t0, 0(t0)                # get byte data from LUT
    sb t0, 0(s3)                # display 7-seg data
count_down_admin:
    call delay                  # delay
    addi a0, a0, -1             # decrement value
    bnez a0, count_down         # loop back

loop:
    lw t0, 0(s0)                # read switches
    sw t0, 0(s2)                # output switches to leds
    j loop                      # loop back infinitely

delay:
    li t0, 0x9FFFFF             # Blink time 
delay_loop:
    addi t0, t0, -1             # decrement timer
    bne zero, t0, delay_loop    # loop if timer not done
    ret


