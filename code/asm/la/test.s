# Load Address
# Format:
#	LA RD, Address
# Description:
#	The address of some memory location is copied into RD.
#
#	LA is a pseudoinstruction, and is assembled to a sequence of two 
#	instructions to achieve the same effect.
#		AUIPC RD, Upper-20
#		ADDI RD, RD, Lower-12
#
#	The "Address" can refer to any location within the 32-bit memory space. 
#	The address is converted to a PC-relative address, with an offset of
#	32 bits. This offset is then broken into two pieces: a upper 20-bit 
#	piece and a lower 12-bit piece.

	.text			# Define beginning of text section
	.global	_start		# Define entry _start

_start:
	la x5, _start		# x5 = _start
	jr x5

stop:
	j stop			# Infinite loop to stop execution

exit:

	.end			# End of file
