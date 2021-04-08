# Move (Register to Register)
# Format:
#	MV RD, RS
# Description:
#	The contents of RS is copied into RD.
#	MV is a pseudoinstruction, and is assembled identically to:
#		ADDI RD, RS, 0
#

	.text			# Define beginning of text section
	.global	_start		# Define entry _start

_start:
	li x6, 30		# x6 = 30
	mv x5, x6		# x5 = x6
	addi x5, x6, 0		# these two instructions assemble into the same thing!
stop:
	j stop			# Infinite loop to stop execution

	.end			# End of file
