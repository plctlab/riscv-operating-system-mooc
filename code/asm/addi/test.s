# Add Immediate
# Format:
#	ADDI RD, RS1, IMM
# Description:
#	The immediate value (a sign-extended 12-bit value, i.e., -2,048 .. +2,047)
#	is added to the contents of RS1 and the result is placed in RD.

	.text			# Define beginning of text section
	.global	_start		# Define entry _start

_start:
	li x6, 2		# x6 = 2
	addi x5, x6, 1		# x5 = x6 + 1

stop:
	j stop			# Infinite loop to stop execution

	.end			# End of file
