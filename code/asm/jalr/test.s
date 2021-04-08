# Jump And Link (Short-Distance CALL)
# Format:
#	JAL RD, IMM
# Description:
#	This instruction is used to call a subroutine (i.e., function). 
#	The jump and link (JAL) instruction uses the J-type format, where the 
#	immediate (20 bits width) encodes a signed offset in multiples of 2 bytes. 
#	The offset is sign-extended and added to the address of the jump 
#	instruction to form the jump target address. JAL can therefore target 
#	a ±1 MiB range.
#	JAL stores the address of the instruction following the jump (pc+4) into
#	register RD.
# Note:
#	When programming, we just provide label instead of immediate value, and
#	leave linker to provide the final immediate value.
#
# Jump And Link Register
# Format:
#	JALR RD, RS1, IMM
# Description:
#	This instruction is used to call a subroutine (i.e., function). 
#	The indirect jump instruction JALR (jump and link register) uses the 
#	I-type encoding. The target address is obtained by adding the 
#	sign-extended 12-bit I-immediate to the register RS1, then setting
#	the least-significant bit of the result to zero. JALR can therefore target 
#	a ±1 KiB range, relative to the address in RS1.
#	The address of the instruction following the jump(pc+4) is written to register RD.
#
# Sample to demo how to call a sub-function and return from it
#
# int a = 1;
# int b = 1;
#
# void sum()
# {
#     a = a + b;
# } 
#
# void _start()
# {
#     sum();
# }

	.text			# Define beginning of text section
	.global	_start		# Define entry _start

_start:
	li x6, 1
	li x7, 2
	jal x5, sum		# call sum, return address is saved in x5

stop:
	j stop			# Infinite loop to stop execution

sum:
	add x6, x6, x7		# x6 = x6 + x7
	jalr x0, 0(x5)		# return

	.end			# End of file
