#include "os.h"
#include "syscall.h"

int sys_gethid(unsigned int *ptr_hid)
{
	printf("--> sys_gethid, arg0 = 0x%x\n", ptr_hid);
	if (ptr_hid == NULL) {
		return -1;
	} else {
		*ptr_hid = r_mhartid();
		return 0;
	}
}

void do_syscall(struct context *cxt)
{
	uint32_t syscall_num = cxt->a7;

	switch (syscall_num) {
	case SYS_gethid:
		cxt->a0 = sys_gethid((unsigned int *)(cxt->a0));
		break;
	default:
		printf("Unknown syscall no: %d\n", syscall_num);
		cxt->a0 = -1;
	}

	return;
}