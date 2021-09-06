# 如何在 Ubuntu 18.04 下开展 RVOS 实验

所有演示代码在以下环境下验证通过，请仔细核对你的 Ubuntu 版本和内核版本与以下信息是否一致。

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

因为 Ubunt 18.04 的官方源还不支持 RISC-V 的开发工具包，所以搭建环境稍微复杂一些。安装步骤如下：

- 首先，请手动安装一些基本工具和依赖库。注意如果运行过程中提示缺少其他的库和依赖，请按照提示自行尝试安装。

  ```
  $ sudo apt update
  $ sudo apt install build-essential gcc make perl dkms git libsnappy1v5 libsdl2-2.0-0 libvdeplug2 librbd1 libaio1
  ```

- 其次，创建一个工作目录，然后进入该目录。

  ```
  $ mkdir $HOME/ws
  $ cd $HOME/ws
  ```

- 然后，因为 Ubunt 18.04 的官方源还不支持 RISC-V 的开发工具包，所以我提供了预先编译好的二进制工具文件，大家可以通过以下两种方式下载和安装：

  **第一种方式**：通过网盘下载开发工具软件压缩包 `tools.tar.xz`，下载地址目前为了大家方便，提供了两个途径，大家各取所需，注意网盘方式下载可能会比较慢：

  - 腾讯微云: <https://share.weiyun.com/nyTqAGKh>
  或者
  - 百度网盘：链接：<https://pan.baidu.com/s/11FAq64YGu3JVkZSTtoVMOg>, 提取码：bjnj

  下载完毕后将该文件拷贝到 `$HOME/ws` 下并解压。

  ```
  $ tar xJf tools.tar.xz
  ```

  **第二种方式**：如果你觉得通过网盘下载速度太慢，我还将 `tools` 包中的文件（未压缩）以仓库的形式存放在 **Gitee** 上，你可以执行如下命令将 tools 克隆下来，这么做的唯一目的是为了让你更快地下载这些文件：

  ```
  $ cd <YOUR_WORKSPACE>
  $ git clone https://gitee.com/unicornx/rvos_tools_ubuntu_18_04.git
  ```

  仓库里是未压缩的 tools 目录，它和 `tools.tar.xz` 解压缩后的内容是一样的。

  仓库克隆完成后将 tools 目录同样拷贝到 `$HOME/ws` 下即可。

  ```
  $ cp -r rvos_tools_ubuntu_18_04/tools $HOME/ws
  ```

  注意最后还需要修改 `riscv-operating-system-mooc` 代码仓库中的一个 Makefile 中的环境变量的值。编辑 `code/common.mk`，将其中的 `GDB = gdb-multiarch` 修改为 `GDB = ${CROSS_COMPILE}gdb`。

- 最后将以下路径加入 `$HOME/.bashrc`

  ```
  export PATH="$HOME/ws/tools/gcc/bin:$HOME/ws/tools/qemu/bin:$PATH"
  ```

  重新导入 `$HOME/.bashrc` 或者重启系统使配置生效即可。
