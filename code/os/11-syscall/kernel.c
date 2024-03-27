#include "os.h"

/*
 * Following functions SHOULD be called ONLY ONE time here,
 * so just declared here ONCE and NOT included in file os.h.
 */
extern void uart_init(void);
extern void page_init(void);
extern void sched_init(void);
extern void schedule(void);
extern void os_main(void);
extern void trap_init(void);
extern void plic_init(void);
extern void timer_init(void);

#ifdef CONFIG_PLATFORM_DUO

static void _delay(volatile int count)
{
	count *= 50000;
	while (count--);
}

/*
 * Regarding PinMux info. See CV180xb-Pinout-v1.xlsx
 * @https://github.com/milkv-duo/duo-files/tree/main/duo/datasheet
 */
#define UART0_TX_OFFSET		0x24
#define UART0_TX_FUNCMASK	(uint32_t)(0x7)
#define UART0_TX_UART1_TX	4

#define UART0_RX_OFFSET		0x28
#define UART0_RX_FUNCMASK	(uint32_t)(0x7)
#define UART0_RX_UART1_RX	4

static inline uint32_t mmio_read_32(uint64_t *addr)
{
	return *(volatile uint32_t *)addr;
}

static inline void mmio_write_32(uint64_t *addr, uint32_t value)
{
	*(volatile uint32_t *)addr = value;
}

void pinmux_select_uart1()
{
	uint32_t val;

	val = mmio_read_32((uint64_t *)(PINMUX_BASE + UART0_TX_OFFSET));
	val &= ~UART0_TX_FUNCMASK;
	val |= UART0_TX_UART1_TX;
	mmio_write_32((uint64_t *)(PINMUX_BASE + UART0_TX_OFFSET), val);

	val = mmio_read_32((uint64_t *)(PINMUX_BASE + UART0_RX_OFFSET));
	val &= ~UART0_RX_FUNCMASK;
	val |= UART0_RX_UART1_RX;
	mmio_write_32((uint64_t *)(PINMUX_BASE + UART0_RX_OFFSET), val);
}
#endif

void start_kernel(void)
{
#ifdef CONFIG_PLATFORM_DUO
	/*
	 * FIXME: During my test, I found a short delay is required to avoid
	 * garbled characters on serial output.
	 */
	_delay(1000);

	/*
	 * FIXME: During test, I found that UART0 was not working properly on DUO
	 * and could not report interrupts, so I switched to UART1.
	 */
	pinmux_select_uart1();
#endif
	uart_init();
	uart_puts("Hello, RVOS!\n");

	page_init();

	trap_init();

	plic_init();

	timer_init();

	sched_init();

	os_main();

	schedule();

	uart_puts("Would not go here!\n");
	while (1) {}; // stop here!
}

