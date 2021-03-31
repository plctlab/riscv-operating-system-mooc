#include "syscall.h"

.global gethid
gethid:
	li a7, SYS_gethid
	ecall
	ret
