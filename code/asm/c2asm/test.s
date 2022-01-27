# C all ASM

	.text			# Define beginning of text section
	.global	_start		# Define entry _start
	.global	foo		# foo is a C function defined in test.c

_start:
	la sp, stack_end	# prepare stack for calling functions

	li a0, 1
	li a1, 2
	call foo

stop:
	j stop			# Infinite loop to stop execution

	nop			# just for demo effect

stack_start:
	.rept 12
	.word 0
	.endr
stack_end:

	.end			# End of file
