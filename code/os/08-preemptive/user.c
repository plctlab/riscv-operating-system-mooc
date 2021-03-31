#include "os.h"

#define DELAY 1000

void user_task0(void)
{
	uart_puts("Task 0: Created!\n");

	task_yield();
	uart_puts("Task 0: I'm back!\n");
	while (1) {
		uart_puts("Task 0: Running...\n");
		task_delay(DELAY);
	}
}

void user_task1(void)
{
	uart_puts("Task 1: Created!\n");
	while (1) {
		uart_puts("Task 1: Running...\n");
		task_delay(DELAY);
	}
}

/* NOTICE: DON'T LOOP INFINITELY IN main() */
void os_main(void)
{
	task_create(user_task0);
	task_create(user_task1);
}

