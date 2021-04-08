# Substract Immediate
# Description:
#	There is no “subtract immediate” instruction because subtraction is 
#	equivalent to adding a negative value of immediate.

	.text			# Define beginning of text section
	.global	_start		# Define entry _start

_start:
	li x6, 30		# x5 = 1
	addi x5, x6, -20	# x5 = x6 - 20

stop:
	j stop			# Infinite loop to stop execution

	.end			# End of file
