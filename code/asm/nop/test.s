# Nop
# Format:
#	NOP
# Description:
#	This instruction has no effect.
#	NOP is a pseudoinstruction, and is assembled identically to:
#		ADDI x0, x0, 0
#

	.text			# Define beginning of text section
	.global	_start		# Define entry _start

_start:
	nop			# do nothing and has no effect on system
	
	addi x0, x0, 0		# the same as nop

stop:
	j stop			# Infinite loop to stop execution

	.end			# End of file
