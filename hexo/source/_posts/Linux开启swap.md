---
title: Linux开启swap
date: 2022-02-13 19:28:02
tags:
	- Linux
	- swap
	- 虚拟内存
categories: VPS
---
最近发现服务器内存占用率好高，经过排查修改了php-fpm的pm.max_children的值也没有多大改善，期间发现swap分区为0.就开始添加swap分区。
1.创建一个swap文件
```bash
cd /usr
mkdir swap
```
2.创建swap分区文件
```bash
dd if=/dev/zero of=swapfile bs=1024 count=2000000
#bs代表每个块大小，
#count代表的是大小， 这里大约是2G
```
3.挂载swap文件
```bash
swapon /usr/swap/swapfile
#卸载swap
swap /usr/swap/swapfile
```
4.设置开机自动挂载
```bash
vim /etc/fastab
#在文件最后增加
/usr/swap/swapfile  swap swap default 0 0
```
再来说下内存释放，最后重启内存占用正常了。😅😅😂😂果然重启解决90%问题。😊😊😊
