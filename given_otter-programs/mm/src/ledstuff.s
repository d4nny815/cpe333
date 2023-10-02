
.global turnLEDSon
.type turnLEDSon, @function
turnLEDSon:
li x6, 0x11080000
li x12, 4294967295
sw x12, 0(x6)
ret

.global turnLEDSoff
.type turnLEDSoff, @function
turnLEDSoff:
li x6, 0x11080000
li x12, 0
sw x12, 0(x6)
ret
