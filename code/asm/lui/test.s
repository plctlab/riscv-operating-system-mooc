# Load Upper Immediate
# Format:
#	LUI RD, IMM
# Description:
#	The instruction contains a 20-bit immediate value. This value is placed 
#	in the leftmost (i.e., upper, most significant) 20 bits of the register 
#	RD and the rightmost (i.e., lower, least significant) 12-bits are set 
#	to zero.

	.text			# Define beginning of text section
	.global	_start		# Define entry _start

_start:
	lui x5, 0x12345		# int x5 = 0x12345 << 12
	addi x5, x5, 0x678	# x5 = x5 + 0x678
stop:
	j stop			# Infinite loop to stop execution

	.end			# End of file
