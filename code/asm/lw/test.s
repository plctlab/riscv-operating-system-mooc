# Load Byte (Signed)
# Format:
#	LW RD, IMM(RS1)
# Description:
#	An 32-bit value is fetched from memory and moved into register RD. The
#	memory address is formed by adding the offset(IMM) to the contents of RS1.
# Note: 
#	Due to IMM is 12 bits width, the target location given by the 
#	offset(IMM) must be within the range of -2,048 .. 2,047 relative to the
#	value in RS1.
#	In a machine with 32-bit registers(rv32), neither sign-extension nor 
#	zero-extension is necessary for value that is already 32 bits wide. 
#	Therefore the "signed load" instruction (LW) does the same thing as the 
#	"unsigned load" instruction(LWU), making LWU redundant.

	.text			# Define beginning of text section
	.global	_start		# Define entry _start

_start: 			# Label, not really required
	la x5, _array		# int *x5 = &(array[0])
	lw x6, 0(x5)		# int x6 = *x5
	lw x7, 4(x5)		# int x7 = *(x5 + 1)
stop:
	j stop			# Infinite loop to stop execution

_array:	
	.word 0x11111111
	.word 0xffffffff

	.end			# End of file

