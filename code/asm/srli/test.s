# Shift Right Logical Immediate
# Format:
#	SRLI RD, RS1, IMM
# Description:
#	The immediate value determines the number of bits to shift. The contents 
#	of RS1 is shifted right that many bits and the result is placed in RD. 
#	The bits shifted in on the most-significant end are filled with zero.
#	For 32-bit machines, the shift amount must be within 0..31, 0 means no 
#	shifting is done.

	.text			# Define beginning of text section
	.global	_start		# Define entry _start

_start:
	li x6, 0x80000000	# x6 = 0x80000000
	srli x5, x6, 3		# x5 = x6 >> 3

stop:
	j stop			# Infinite loop to stop execution

	.end			# End of file
