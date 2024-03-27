# Define macros for conditional compilation.
# Support customization in the Makefile files for each project separately.
# And also support customization in common.mk

ifeq (${ARCH}, RV64)
DEFS += -DCONFIG_RV64
else
# RV32 or default is 32bit
DEFS += -DCONFIG_RV32
endif

ifeq (${SYSCALL}, y)
DEFS += -DCONFIG_SYSCALL
endif

