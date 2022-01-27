# Shift Right Arithmetic Immediate
# Format:
#	SRAI RD, RS1, IMM
# Description:
# 	The immediate value determines the number of bits to shift. The contents of
#	RS1 is shifted right that many bits and the result is placed in RD. The shift
#	is “arithmetic”, i.e., the sign bit is repeatedly shifted in on the
#	most-significant end.
# Comment:
#	In C, for signed integer, >> is shift right with arithmetic.

	.text			# Define beginning of text section
	.global	_start		# Define entry _start

_start:
#	li x6, 0x80		# x6 = 0b1000-0000
	li x6, 0x80000000	# x6 = 0b1000-0000-0000-0000-0000-0000-0000-0000
	srai x5, x6, 4		# x5 = x6 >> 4

stop:
	j stop			# Infinite loop to stop execution

	.end			# End of file
