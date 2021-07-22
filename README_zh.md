**循序渐进，学习开发一个 RISC-V 上的操作系统**

<!-- TOC -->

- [简介](#简介)
- [运行环境](#运行环境)
- [构建和使用说明](#构建和使用说明)
- [参考文献](#参考文献)

<!-- /TOC -->
# 简介

本课程用于教学演示如何从零开始为 RISC-V 平台编写一个简单的操作系统内核。采用 BSD 2-Clause 许可证发布（具体请阅读本仓库根目录下的 [LICENSE 文件](./LICENSE)）。

如果您有任何的问题或者发现任何可疑的 bug，请通过 [Gitee 的 issue 跟踪系统](https://gitee.com/unicornx/riscv-operating-system-mooc/issues) 给我们提出报告，我们将第一时间检查并在系统中回复您。

**本课程的配套教学视频在线播放地址**: <https://www.bilibili.com/video/BV1Q5411w7z5>

欢迎加入本课程的 **学习群**，边学习边讨论：

- **QQ 学习群**，群号 976125506，或者扫码加入，见下：

![](./qq-group.png)

- **微信学习群**，请添加微信 fangzhang1024 （标注 【汪辰老师】）加入。

# 运行环境

所有演示代码在以下设备环境下验证通过：

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

有可能需要手动安装的依赖库，如果运行过程中提示缺少其他的库和依赖，请按照提示自行安装。

```
$ sudo apt update
$ sudo apt install build-essential git gitk vim libfdt-dev libsdl2-dev
```

实验需要一些运行工具，已经提供预先编译好的二进制文件，具体安装步骤描述如下：

首先，创建一个工作目录，然后进入该目录。

```
$ mkdir $HOME/ws
$ cd $HOME/ws
```

下载开发工具软件包 `tools.tar.gz`，下载地址为：

- 腾讯微云: <https://share.weiyun.com/nyTqAGKh>
或者
- 百度网盘：链接：<https://pan.baidu.com/s/11FAq64YGu3JVkZSTtoVMOg>, 提取码：bjnj

下载完毕后将该文件拷贝到 `$HOME/ws` 下并解压。

```
$ tar xzf tools.tar.gz
```

将以下路径加入 `$HOME/.bashrc`
```
export PATH="$PATH:$HOME/ws/tools/gcc/bin:$HOME/ws/tools/qemu/bin"
```

重新导入 `$HOME/.bashrc` 或者重启系统使配置生效即可。

# 构建和使用说明

- make：编译构建
- make run：启动 qemu 并运行
- make debug：启动调试
- make code：反汇编查看二进制代码
- make clean：清理

具体使用请参考具体子项目下的 Makefile 文件。

# 参考文献

本课程的设计参考了如下网络资源，在此表示感谢 :)

- The Adventures of OS：<https://osblog.stephenmarz.com/index.html>
- mini-riscv-os: <https://github.com/cccriscv/mini-riscv-os>
- Xv6, a simple Unix-like teaching operating system：<https://pdos.csail.mit.edu/6.828/2020/xv6.html>
