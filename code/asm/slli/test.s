# Shift Left Logical Immediate
# Format:
#	SLLI RD, RS1, IMM
# Description:
#	The immediate value determines the number of bits to shift. The contents 
#	of RS1 is shifted left that many bits and the result is placed in RD. 
#	The bits shifted in are filled with zero.
#	For 32-bit machines, the shift amount must be within 0..31, 0 means no 
#	shifting is done.

	.text			# Define beginning of text section
	.global	_start		# Define entry _start

_start:
	li x6, 1		# x6 = 1
	slli x5, x6, 3		# x5 = x6 << 3

stop:
	j stop			# Infinite loop to stop execution

	.end			# End of file
