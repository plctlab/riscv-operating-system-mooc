#! /bin/bash

TOOLS="$HOME/riscv_tools/tools"
export PATH="$TOOLS/gcc/bin:$TOOLS/qemu/bin:$PATH"
export CROSS_COMPILE=riscv64-unknown-elf-
