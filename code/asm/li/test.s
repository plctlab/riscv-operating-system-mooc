# Load Immediate
# Format:
#	LI RD, IMM
# Description:
#	The immediate value (which can be any 32-bit value) is copied into RD.
#	LI is a pseudoinstruction, and is assembled differently depending on 
#	the actual value present.
#
#	If the immediate value is in the range of -2,048 .. +2,047, then it can
#	be assembled identically to: 
#
#	ADDI RD, x0, IMM
#
#	If the immediate value is not within the range of -2,048 .. +2,047 but 
#	is within the range of a 32-bit number (i.e., -2,147,483,648 .. +2,147,483,647) 
#	then it can be assembled using this two-instruction sequence:
#
#	LUI RD, Upper-20
#	ADDI RD, RD, Lower-12
#
#	where "Upper-20" represents the uppermost 20 bits of the value 
#	and "Lower-12" represents the least significant 12-bits of the value.
#	Note that, due to the immediate operand to the addi has its 
#	most-significant-bit set to 1 then it will have the effect of 
#	subtracting 1 from the operand in the lui instruction.

	.text			# Define beginning of text section
	.global	_start		# Define entry _start

_start:
	# imm is in the range of [-2,048, +2,047]
	li x5, 0x80

	addi x5, x0, 0x80

	# imm is NOT in the range of [-2,048, +2,047]
	# and the most-significant-bit of "lower-12" is 0
	li x6, 0x12345001

	lui x6, 0x12345
	addi x6, x6, 0x001

	# imm is NOT in the range of [-2,048, +2,047]
	# and the most-significant-bit of "lower-12" is 1
	li x7, 0x12345FFF	

	lui x7, 0x12346
	addi x7, x7, -1

stop:
	j stop			# Infinite loop to stop execution

	.end			# End of file
