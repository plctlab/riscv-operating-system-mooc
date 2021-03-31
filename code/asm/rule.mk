CROSS_COMPILE = riscv64-unknown-elf-
CFLAGS = -nostdlib -fno-builtin -mcmodel=medany -march=rv32ima -mabi=ilp32 -g -Wall

QEMU = qemu-system-riscv32
QFLAGS = -nographic -smp 1 -machine virt -bios none

GDB = ${CROSS_COMPILE}gdb

.DEFAULT_GOAL := all
all:
	@$(CROSS_COMPILE)gcc $(CFLAGS) ${SRC} -Ttext=0x80000000 -o $(EXEC).elf
	@$(CROSS_COMPILE)objcopy -O binary $(EXEC).elf $(EXEC).bin

.PHONY : run
run: all
	@echo "Press Ctrl-A and then X to exit QEMU"
	@echo "------------------------------------"
	@echo "No output, please run 'make debug' to see details"
	@$(QEMU) $(QFLAGS) -kernel ./$(EXEC).elf

.PHONY : debug
debug: all
	@echo "Press Ctrl-C and then input 'quit' to exit GDB and QEMU"
	@echo "-------------------------------------------------------"
	@$(QEMU) $(QFLAGS) -kernel $(EXEC).elf -s -S &
	@$(GDB) $(EXEC).elf -q -x ${GDBINIT}

.PHONY : code
code: all
	@$(CROSS_COMPILE)objdump -S $(EXEC).elf | less

.PHONY : hex
hex: all
	@hexdump -C $(EXEC).bin

.PHONY : clean
clean:
	rm -rf *.o *.bin *.elf
