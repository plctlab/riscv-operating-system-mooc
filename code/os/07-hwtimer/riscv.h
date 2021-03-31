#ifndef __RISCV_H__
#define __RISCV_H__

#include "types.h"

/*
 * ref: https://github.com/mit-pdos/xv6-riscv/blob/riscv/kernel/riscv.h
 */

static inline reg_t r_tp()
{
	reg_t x;
	asm volatile("mv %0, tp" : "=r" (x) );
	return x;
}

/* which hart (core) is this? */
static inline reg_t r_mhartid()
{
	reg_t x;
	asm volatile("csrr %0, mhartid" : "=r" (x) );
	return x;
}

/* Machine Status Register, mstatus */
#define MSTATUS_MPP (3 << 11)
#define MSTATUS_SPP (1 << 8)

#define MSTATUS_MPIE (1 << 7)
#define MSTATUS_SPIE (1 << 5)
#define MSTATUS_UPIE (1 << 4)

#define MSTATUS_MIE (1 << 3)
#define MSTATUS_SIE (1 << 1)
#define MSTATUS_UIE (1 << 0)

static inline reg_t r_mstatus()
{
	reg_t x;
	asm volatile("csrr %0, mstatus" : "=r" (x) );
	return x;
}

static inline void w_mstatus(reg_t x)
{
	asm volatile("csrw mstatus, %0" : : "r" (x));
}

/*
 * machine exception program counter, holds the
 * instruction address to which a return from
 * exception will go.
 */
static inline void w_mepc(reg_t x)
{
	asm volatile("csrw mepc, %0" : : "r" (x));
}

static inline reg_t r_mepc()
{
	reg_t x;
	asm volatile("csrr %0, mepc" : "=r" (x));
	return x;
}

/* Machine Scratch register, for early trap handler */
static inline void w_mscratch(reg_t x)
{
	asm volatile("csrw mscratch, %0" : : "r" (x));
}

/* Machine-mode interrupt vector */
static inline void w_mtvec(reg_t x)
{
	asm volatile("csrw mtvec, %0" : : "r" (x));
}

/* Machine-mode Interrupt Enable */
#define MIE_MEIE (1 << 11) // external
#define MIE_MTIE (1 << 7)  // timer
#define MIE_MSIE (1 << 3)  // software

static inline reg_t r_mie()
{
	reg_t x;
	asm volatile("csrr %0, mie" : "=r" (x) );
	return x;
}

static inline void w_mie(reg_t x)
{
	asm volatile("csrw mie, %0" : : "r" (x));
}

static inline reg_t r_mcause()
{
	reg_t x;
	asm volatile("csrr %0, mcause" : "=r" (x) );
	return x;
}

#endif /* __RISCV_H__ */
