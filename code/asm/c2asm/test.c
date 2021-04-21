int foo(int a, int b)
{
	int c;

	asm volatile (
		"add %[sum], %[add1], %[add2]" 
		:[sum]"=r"(c)
		:[add1]"r"(a), [add2]"r"(b)
	);

/*
	asm volatile (
		"add %0, %1, %2" 
		:"=r"(c)
		:"r"(a), "r"(b)
	);
*/
	return c;
}