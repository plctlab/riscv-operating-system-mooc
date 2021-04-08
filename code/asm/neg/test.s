# Negate
# Format:
#	NEG RD, RS
# Description:
#	The contents of RS is arithmetically negated and the result is placed in RD.
#	NEG is a pseudoinstruction, and is assembled identically to:
#		SUB RD, x0, RS
#

	.text			# Define beginning of text section
	.global	_start		# Define entry _start

_start:
	li x6, 1		# x6 = 1
	neg x5, x6		# x5 = -x6
	sub x5, x0, x6		# these two instructions assemble into the same thing!

stop:
	j stop			# Infinite loop to stop execution

	.end			# End of file
