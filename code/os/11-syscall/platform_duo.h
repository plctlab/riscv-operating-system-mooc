#ifndef __PLATFORM_DUO_H__
#define __PLATFORM_DUO_H__

/*
 * Although Duo has two RISC-V cores, it does not support one OS on multi-core
 * architecture, and the hartid of both cores is 0.
 */
#define MAXNUM_CPU 1

/* used in os.ld */
#define ORIGIN_ADDRESS 0x80000000
#define LENGTH_RAM 64*1024*1024

#define PINMUX_BASE	0x03001000L

/*
 * During test, I found that UART0 was not working properly and could not
 * report interrupts, so I switched to UART1.
 * Please note: In order to avoid excessive code modification, I simply
 * changed the values of UART0/UART0_IRQ to the values of UART1/UART1_IRQ,
 * but did not change the name of the macro.
 */
//#define UART0 0x04140000L
#define UART0 0x04150000L

//#define UART0_IRQ 44
#define UART0_IRQ 45

#define PLIC_BASE 0x70000000L
#define PLIC_PRIORITY(id) (PLIC_BASE + (id) * 4)
#define PLIC_PENDING(id) (PLIC_BASE + 0x1000 + ((id) / 32) * 4)
#define PLIC_MENABLE(hart, id) (PLIC_BASE + 0x2000 + (hart) * 0x80 + ((id) / 32) * 4)
#define PLIC_MTHRESHOLD(hart) (PLIC_BASE + 0x200000 + (hart) * 0x1000)
#define PLIC_MCLAIM(hart) (PLIC_BASE + 0x200004 + (hart) * 0x1000)
#define PLIC_MCOMPLETE(hart) (PLIC_BASE + 0x200004 + (hart) * 0x1000)

/*
 * See XuanTie C906 UserManual v10
 * Chapter 9.1
 * According to Table 9.1, MTIMECMPL & MTIMECMPH are two 32-bit
 * memory-mapped control registers, not 64-bit memory-mapped.
 * FIXME: This does not comply with the requirements of the privilege
 * specification, I am not sure if this is a design flaw.
 */
#define CLINT_BASE 0x74000000L
#define CLINT_MSIP(hartid) (CLINT_BASE + 4 * (hartid))
#define CLINT_MTIMECMPL (CLINT_BASE + 0x4000)
#define CLINT_MTIMECMPH (CLINT_BASE + 0x4004)

#define CLINT_TIMEBASE_FREQ 25000000

#endif /* __PLATFORM_DUO_H__ */
