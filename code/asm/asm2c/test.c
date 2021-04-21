/*
 * a0 --> a
 * a1 --> b
 * c  <-- a0
 */
int foo(int a, int b)
{
	int c = a + b;
	return c;
}