# Store Byte
# Format:
#	SB RS2, IMM(RS1)
# Description:
#	An 8-bit value is copied from register RS2 to memory. The upper (more
#	significant) bits in RS2 are ignored. The memory address is formed by 
#	adding the offset(IMM) to the contents of RS1.
# Note: 
#	Due to IMM is 12 bits width, the target location given by the 
#	offset(IMM) must be within the range of -2,048 .. 2,047 relative to the
#	value in RS1.

	.text			# Define beginning of text section
	.global	_start		# Define entry _start

_start:
	li x6, 0xffffffab	# int x6 = 0xffffffab
	la x5, _array		# array[0] = (char)x6
	sb x6, 0(x5)
stop:
	j stop			# Infinite loop to stop execution

_array:	
	.byte 0x00
	.byte 0x00

	.end			# End of file

