#ifndef __TYPES_H__
#define __TYPES_H__

typedef unsigned char uint8_t;
typedef unsigned short uint16_t;
typedef unsigned int  uint32_t;
typedef unsigned long long uint64_t;

/*
 * Register Width
 */
#ifdef CONFIG_RV64
typedef uint64_t reg_t;
typedef uint64_t ptr_t;
#else
typedef uint32_t reg_t;
typedef uint32_t ptr_t;
#endif

#endif /* __TYPES_H__ */
