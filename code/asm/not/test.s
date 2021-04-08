# Not 
# Format:
#	NOT RD, RS
# The contents of RS is fetched and each of the bits is flipped. The resulting
# value is copied into RD.
# NEG is a pseudoinstruction, and is assembled identically to:
#	XORI RD, RS, -1 // Note that -1 is 0xFFFFFFFF

	.text			# Define beginning of text section
	.global	_start		# Define entry _start

_start:
	li x6, 0xffff0000	# x6 = 0xffff0000

	not x5, x6		# x5 = ~x6
	xori x5, x6, -1		# the same as not
stop:
	j stop			# Infinite loop to stop execution

	.end			# End of file
