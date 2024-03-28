# Common part for the Makefile.
# This file will be included by the Makefile of each project.

# Custom Macro Definition (Common part)
ARCH = RV64
PLATFORM = DUO

include ../defines.mk
DEFS +=

CROSS_COMPILE = riscv64-unknown-elf-
CFLAGS += -nostdlib -fno-builtin -g -Wall
ifeq (${ARCH}, RV64)
CFLAGS += -march=rv64g -mabi=lp64 -mcmodel=medany
else
CFLAGS += -march=rv32g -mabi=ilp32
endif

ifeq (${ARCH}, RV64)
QEMU = qemu-system-riscv64
else
QEMU = qemu-system-riscv32
endif

QFLAGS = -nographic -smp 1 -machine virt -bios none

GDB = gdb-multiarch
CC = ${CROSS_COMPILE}gcc
OBJCOPY = ${CROSS_COMPILE}objcopy
OBJDUMP = ${CROSS_COMPILE}objdump
MKDIR = mkdir -p
RM = rm -rf

OUTPUT_PATH = out

# SRCS_ASM & SRCS_C are defined in the Makefile of each project.
OBJS_ASM := $(addprefix ${OUTPUT_PATH}/, $(patsubst %.S, %.o, ${SRCS_ASM}))
OBJS_C   := $(addprefix $(OUTPUT_PATH)/, $(patsubst %.c, %.o, ${SRCS_C}))
OBJS = ${OBJS_ASM} ${OBJS_C}

ELF = ${OUTPUT_PATH}/os.elf
BIN = ${OUTPUT_PATH}/os.bin

USE_LINKER_SCRIPT ?= true
ifeq (${USE_LINKER_SCRIPT}, true)
LDFLAGS = -T ${OUTPUT_PATH}/os.ld.generated
else
LDFLAGS = -Ttext=0x80000000
endif

.DEFAULT_GOAL := all
ifeq (${PLATFORM}, DUO)
all: ${OUTPUT_PATH} ${ELF} gen_fip
else
all: ${OUTPUT_PATH} ${ELF}
endif

${OUTPUT_PATH}:
	@${MKDIR} $@

# start.o must be the first in dependency!
#
# For USE_LINKER_SCRIPT == true, before do link, run preprocessor manually for
# linker script.
# -E specifies GCC to only run preprocessor
# -P prevents preprocessor from generating linemarkers (#line directives)
# -x c tells GCC to treat your linker script as C source file
${ELF}: ${OBJS}
ifeq (${USE_LINKER_SCRIPT}, true)
	${CC} -E -P -x c ${DEFS} ${CFLAGS} os.ld > ${OUTPUT_PATH}/os.ld.generated
endif
	${CC} ${CFLAGS} ${LDFLAGS} -o ${ELF} $^
	${OBJCOPY} -O binary ${ELF} ${BIN}

${OUTPUT_PATH}/%.o : %.c
	${CC} ${DEFS} ${CFLAGS} -c -o $@ $<

${OUTPUT_PATH}/%.o : %.S
	${CC} ${DEFS} ${CFLAGS} -c -o $@ $<

run: all
	@${QEMU} -M ? | grep virt >/dev/null || exit
	@echo "Press Ctrl-A and then X to exit QEMU"
	@echo "------------------------------------"
	@${QEMU} ${QFLAGS} -kernel ${ELF}

.PHONY : debug
debug: all
	@echo "Press Ctrl-C and then input 'quit' to exit GDB and QEMU"
	@echo "-------------------------------------------------------"
	@${QEMU} ${QFLAGS} -kernel ${ELF} -s -S &
	@${GDB} ${ELF} -q -x ../gdbinit

.PHONY : code
code: all
	@${OBJDUMP} -S ${ELF} | less

.PHONY : clean
clean:
	@${RM} ${OUTPUT_PATH}

chip_conf:
	python3 ../chip_conf.py ${OUTPUT_PATH}/chip_conf.bin

gen_fip: $(BIN) chip_conf
	python3 ../fiptool.py -v genfip \
		'${OUTPUT_PATH}/fip.bin' \
		--MONITOR_RUNADDR="0x0000000080000000" \
		--BLCP_2ND_RUNADDR="0x0000000083f40000" \
		--CHIP_CONF='${OUTPUT_PATH}/chip_conf.bin' \
		--NOR_INFO='FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF' \
		--NAND_INFO='00000000'\
		--BL2='../prebuild/bl2.bin' \
		--BLCP_IMG_RUNADDR=0x05200200 \
		--BLCP_PARAM_LOADADDR=0 \
		--BLCP='../prebuild/empty.bin' \
		--DDR_PARAM='../prebuild/ddr_param.bin' \
		--BLCP_2ND='../prebuild/rtos.bin' \
		--MONITOR='${OUTPUT_PATH}/os.bin' \
		--LOADER_2ND='../prebuild/u-boot-raw.bin' \
		--compress='lzma'
