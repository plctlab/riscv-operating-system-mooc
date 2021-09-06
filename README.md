**Step by step, learn to develop an operating system on RISC-V**

<!-- TOC -->

- [1. Introduction](#1-introduction)
- [2. Operating environment](#2-operating-environment)
- [3. Building and usage](#3-building-and-usage)
- [4. References](#4-references)

<!-- /TOC -->
# 1. Introduction

This course is used to teach and demonstrate how to write a simple operating system kernel for the RISC-V platform from scratch. Released under the BSD 2-Clause license (For details, please read the [LICENSE file](./LICENSE) under the root directory of this repository).

If you have any questions or bug report, please use the issue tracking system on github.

Note: We also have a mirror repository on gitee (<https://gitee.com/unicornx/riscv-operating-system-mooc>), and we use the issue tracking system on gitee more actively than on github, all issue# filled in git commitment are from the issue tracking system of gitee.

# 2. Operating environment

Ubuntu 20.04 is recommended. Ubuntu 20.04 is currently the latest recommended long-term stable release of Ubuntu. It is also the easiest to install and run the environment in this environment.

Some students reported that they hope to still use Ubuntu 18.04. Because the official source of Ubunt 18.04 does not support the RISC-V development kit, so the environment is a little more complicated. I wrote a simple document, and you can refer [here ](./howto-run-with-ubuntu1804.md) to have a try with Ubuntu 18.04.

All demo codes have been verified under the following environment. Please carefully check whether your Ubuntu version and kernel version are consistent with the following information.

```
$ lsb_release -a
No LSB modules are available.
Distributor ID:	Ubuntu
Description:	Ubuntu 20.04.3 LTS
Release:	20.04
Codename:	focal

$ uname -r
5.11.0-27-generic
```

At present, in the Ubuntu 20.04 environment, we can directly use the official GNU toolchain and QEMU emulator, and execute the following command to install online to start the test:

```
$ sudo apt update
$ sudo apt install build-essential gcc make perl dkms git gcc-riscv64-unknown-elf gdb-multiarch qemu-system-misc
```

# 3. Building and usage

- `make`：Compile and build
- `make run`：Start qemu and run
- `make debug`：Start debugging
- `make code`：Disassemble to view binary code
- `make clean`：cleanup

For specific use, please refer to the Makefile under the specific sub-project.

# 4. References

The design of this course refers to the following network resources, thank you :)

- The Adventures of OS：<https://osblog.stephenmarz.com/index.html>
- mini-riscv-os: <https://github.com/cccriscv/mini-riscv-os>
- Xv6, a simple Unix-like teaching operating system：<https://pdos.csail.mit.edu/6.828/2020/xv6.html>
