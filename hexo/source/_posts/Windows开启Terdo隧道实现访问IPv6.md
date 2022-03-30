---
title: Windows开启Teredo隧道实现访问IPv6
date: 2022-02-11 20:32:49
tags:
	- IPv6
	- VPS
	- Windows
categories: VPS
---

本文方法来自[小御坂的破站](https://owo.misaka.rest/ipv6-teredo/)
Teredo是一个IPv6转换机制，它可以为运行在IPv4互联网但没有IPv6网络的设备提供IPv6联通性。在某些时候我们需要使用IPv6，所以就可以开启Teredo隧道来实现IPv6的访问。
#### 开启步骤
1.以管理员身份打开Windows终端(powershell,cmd均可)，输入：
```powershell
netsh interface teredo set state enterpriseclient server=default
```
2.由于一般情况下Teredo隧道默认服务器会被屏蔽，所以需要使用备用服务器。
```powershell
netsh interface teredo set state server=teredo.remlab.net
```
3.关闭Teredo隧道
```powershell
netsh interface teredo set state disable
```
