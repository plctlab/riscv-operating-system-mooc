**Step by step, learn to develop an operating system on RISC-V**

<!-- TOC -->

- [Introduction](#introduction)
- [Operating environment](#operating-environment)
- [Construction and usage](#construction-and-usage)
- [References](#references)

<!-- /TOC -->
# Introduction

This course is used to teach and demonstrate how to write a simple operating system kernel for the RISC-V platform from scratch. Released under the BSD 2-Clause license (For details, please read the [LICENSE file](./LICENSE) under the root directory of this repository). 

# Operating environment

All demo codes have been verified under the following equipment environment: 

```
$ lsb_release -a
No LSB modules are available.
Distributor ID:	Ubuntu
Description:	Ubuntu 20.04.2 LTS
Release:	20.04
Codename:	focal
$ uname -r
5.8.0-45-generic
```

There may be dependent libraries that need to be installed manually. If you are prompted that other libraries and dependencies are missing during the operation, please install them by yourself according to the prompts. 

```
$ sudo apt update 
$ sudo apt install build-essential git gitk vim libfdt-dev libsdl2-dev
```

The experiment requires some running tools, pre-compiled binary files have been provided, the specific installation steps are described as follows:

First, create a working directory, and then enter the directory. 

```
$ mkdir $HOME/ws
$ cd $HOME/ws
```

Download the development tool package `tools.tar.gz`, the download address is:<https://share.weiyun.com/nyTqAGKh>。

After downloading, copy the file to `$HOME/ws` and unzip it.

```
$ tar xzf tools.tar.gz
```

Add the following path to `$HOME/.bashrc`
```
export PATH="$PATH:$HOME/ws/tools/gcc/bin:$HOME/ws/tools/qemu/bin"
```

Re-import `$HOME/.bashrc` or restart the system to make the configuration effective.

# Construction and usage

- make：Compile and build
- make run：Start qemu and run
- make debug：Start debugging
- make code：Disassemble to view binary code
- make clean：cleanup

For specific use, please refer to the Makefile under the specific sub-project.

# References

The design of this course refers to the following network resources, thank you :)

- The Adventures of OS：<https://osblog.stephenmarz.com/index.html>
- mini-riscv-os: <https://github.com/cccriscv/mini-riscv-os>
- Xv6, a simple Unix-like teaching operating system：<https://pdos.csail.mit.edu/6.828/2020/xv6.html>
