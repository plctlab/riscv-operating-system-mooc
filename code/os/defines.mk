# Define macros for conditional compilation.
# Support customization in the Makefile files for each project separately.
# And also support customization in common.mk

ifeq (${SYSCALL}, y)
DEFS += -DCONFIG_SYSCALL
endif

