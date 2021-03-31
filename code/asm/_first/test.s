# First RISC-V Assemble Sample
	.text		# Define beginning of text section
	.global	_start	# Define entry _start
_start: 		# Label, not really required
	li x6, 5	# Load register x6 with the value 5
	li x7, 4	# Load register x7 with the value 4
	add x5, x6, x7	# Add x6 and x7 and store result in x5
stop: j stop		# Infinite loop to stop execution
	.end		# End of file

