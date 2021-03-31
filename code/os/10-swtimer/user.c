#include "os.h"

#define DELAY 4000

struct userdata {
	int counter;
	char *str;
};

/* Jack must be global */
struct userdata person = {0, "Jack"};

void timer_func(void *arg)
{
	if (NULL == arg)
		return;

	struct userdata *param = (struct userdata *)arg;

	param->counter++;
	printf("======> TIMEOUT: %s: %d\n", param->str, param->counter);
}

void user_task0(void)
{
	uart_puts("Task 0: Created!\n");

	struct timer *t1 = timer_create(timer_func, &person, 3);
	if (NULL == t1) {
		printf("timer_create() failed!\n");
	}
	struct timer *t2 = timer_create(timer_func, &person, 5);
	if (NULL == t2) {
		printf("timer_create() failed!\n");
	}
	struct timer *t3 = timer_create(timer_func, &person, 7);
	if (NULL == t3) {
		printf("timer_create() failed!\n");
	}
	while (1) {
		uart_puts("Task 0: Running... \n");
		task_delay(DELAY);
	}
}

void user_task1(void)
{
	uart_puts("Task 1: Created!\n");
	while (1) {
		uart_puts("Task 1: Running... \n");
		task_delay(DELAY);
	}
}

/* NOTICE: DON'T LOOP INFINITELY IN main() */
void os_main(void)
{
	task_create(user_task0);
	task_create(user_task1);
}

