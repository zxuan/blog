---
title:virtualbox打开虚拟机失败 
layout:post
tags:
    - ubuntu
    - virtualbox
---
<p>virtualbox打开虚拟机时报如下警告：</p>
<p>WARNING: The vboxdrv kernel module is not loaded. Either there is no module
         available for the current kernel (3.8.0-26-generic) or it failed to
        load. Please recompile the kernel module and install it by</p>
<p>      sudo /etc/init.d/vboxdrv setup</p> 
<p>      You will not be able to start VMs until this problem is fixed.</p>

<p>按警告的提示执行如下命令：<p>
<p><code>sudo /etc/init.d/vboxdrv setup</code><p>

<p>但执行此命令时，我又出现了错误：</p>
<p>Stopping VirtualBox kernel module                          [确定]</p>
<p>Recompiling VirtualBox kernel module                       [失败]</p>
<p>  (Look at /var/log/vbox-install.log to find out what went wrong)</p>
<p>打开/var/log/vbox-install.log 看到</p>
<p>Makefile:147: *** Error: unable to find the sources of your current Linux kernel. Specify KERN_DIR=<directory> and run Make again
出现Kernel driver not installed (rc=-1908)错误的原因是，没有成功编译供virtualbox使用的内核模块。</p>

<p>此时需执行下列安装语句</p>
<p><code>sudo apt-get install build-essential<br/>
sudo apt-get install linux-headers-&apos;uname -r&apos;</code></p>

<p>然后在执行</p>
<p><code>sudo /etc/init.d/vboxdrv setup</code></p>
<p>现在虚拟机就可以正常工作了。</p>
