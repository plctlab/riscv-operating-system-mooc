int foo(int a, int b)
{
	int sum;
	asm volatile(
		"nop\n"
		"add %0, %1, %2" 
		:"=r"(sum)
		:"r"(a), "r"(b)
	);
	return sum;
}