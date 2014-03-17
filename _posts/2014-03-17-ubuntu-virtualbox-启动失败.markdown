---
title:virtualbox打开虚拟机失败 
layout:post
tags:
    - ubuntu
    - virtualbox
---
vurtualbox打开虚拟机时报如下警告：\r\n
WARNING: The vboxdrv kernel module is not loaded. Either there is no module
         available for the current kernel (3.8.0-26-generic) or it failed to
         load. Please recompile the kernel module and install it by

           sudo /etc/init.d/vboxdrv setup

         You will not be able to start VMs until this problem is fixed.

按警告的提示执行如下命令：
sudo /etc/init.d/vboxdrv setup

但执行此命令时，我又出现了错误：\r\n
Stopping VirtualBox kernel module                          [确定]\r\n
Recompiling VirtualBox kernel module                       [失败]\r\n
  (Look at /var/log/vbox-install.log to find out what went wrong)
打开/var/log/vbox-install.log 看到\r\n
Makefile:147: *** Error: unable to find the sources of your current Linux kernel. Specify KERN_DIR=<directory> and run Make again
出现Kernel driver not installed (rc=-1908)错误的原因是，没有成功编译供virtualbox使用的内核模块。

此时需执行下列安装语句\r\n
"sudo apt-get install build-essential\r\n
sudo apt-get install linux-headers-`uname -r`"

然后在执行sudo /etc/init.d/vboxdrv setup
现在虚拟机就可以正常工作了。
