# How to run RVOS on Ubuntu 18.04

All demo codes have been verified under the following environment. Please carefully check whether your Ubuntu version and kernel version are consistent with the following information.

```
$ lsb_release -a
No LSB modules are available.
Distributor ID:	Ubuntu
Description:	Ubuntu 18.04.5 LTS
Release:	18.04
Codename:	bionic

$ uname -r
5.4.0-84-generic

```

The installation steps are as follows:

- First, please manually install some basic tools and dependent libraries. Note that if it prompts that other libraries and dependencies are missing during the running process, please follow the prompts and try to install them yourself.

  ```
  $ sudo apt update
  $ sudo apt install build-essential gcc make perl dkms git libsnappy1v5 libsdl2-2.0-0 libvdeplug2 librbd1 libaio1
  ```

- Second, create a working directory, and then enter the directory.

  ```
  $ mkdir $HOME/ws
  $ cd $HOME/ws
  ```

- Then, because the official source of Ubunt 18.04 does not support the RISC-V development kit, I have provided a pre-compiled binary tool file. You can download and install it in the following two ways:


  **The first method**: Download the development tool software compressed package `tools.tar.xz` through the network disk. The download address is currently provided for everyone’s convenience. Two ways are provided for everyone to get what they need. Please pay attention it mau be slower to downloading from the network disk.

  - <https://share.weiyun.com/nyTqAGKh>

  or

  - <https://pan.baidu.com/s/11FAq64YGu3JVkZSTtoVMOg>, password: bjnj

  After downloading, copy the file to `$HOME/ws` and unzip it.

  ```
  $ tar xJf tools.tar.xz
  ```

  **Second method**: If you think the download speed through the network disk is too slow, I also store the files in the `tools` package (uncompressed) in the form of a warehouse on **Gitee**, you can execute the following command to clone the tools. The only purpose of this is to allow you to download these files faster:

  ```
  $ cd <YOUR_WORKSPACE>
  $ git clone https://gitee.com/unicornx/rvos_tools_ubuntu_18_04.git
  ```

  The uncompressed tools directory in the warehouse is the same as the decompressed content of `tools.tar.xz`.

  After the warehouse is cloned, copy the tools directory to `$HOME/ws` as well.

  ```
  $ cp -r rvos_tools_ubuntu_18_04/tools $HOME/ws
  ```

  Note that you also need to modify the value of an environment variable in a Makefile in the `riscv-operating-system-mooc` code repository. Open `code/common.mk`  with text editor and change `GDB = gdb-multiarch` to `GDB = ${CROSS_COMPILE}gdb`.

- Finally, add the following path to `$HOME/.bashrc`.

  ```
  export PATH="$HOME/ws/tools/gcc/bin:$HOME/ws/tools/qemu/bin:$PATH"
  ```

  Re-import `$HOME/.bashrc` or restart the system to make the configuration effective.
