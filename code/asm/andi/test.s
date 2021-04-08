# And Immediate 
# Format:
#	ANDI RD, RS1, IMM
# Description:
#	The immediate value (a sign-extended 12-bit value, i.e., -2,048 .. +2,047) 
#	is logically ANDed with the contents of RD1 and the result is placed in RD.

	.text			# Define beginning of text section
	.global	_start		# Define entry _start

_start:
	li x6, 0x10		# x6 = b1000-0000
	andi x5, x6, 0x01	# x5 = x6 & 0x01

stop:
	j stop			# Infinite loop to stop execution

	.end			# End of file
