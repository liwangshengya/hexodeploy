---
title: centos8迁移rocky linux
date: 2022-03-20 17:55:50
tags:
    - centos
    - rocky linux
categories: Linux
---
centos8已经在2021年12月31号提前停止维护了。而Rocky Linux 是红帽宣布放弃 CentOS Linux 后，由 CentOS 联合创始人 Gregory Kurtzer 创建的 Linux 发行版，旨在继承 CentOS 的社区属性。
由于阿里云在重装系统时暂时为提供Rocky Linux的镜像，但是由于centos与Rocky Linux的二进制文件是一样的，所以可以通过Rocky Linux给的脚本一键转换为Rocky Linux。
> 注：在迁移完成后，在Rocky Linux迁移脚本的GitHub下看的的修复yum源的镜像链接，本人未经过验证，可以先用如下命令修改yum源，在用dnf update 更新系统后在运行迁移脚本。
```bash
sed -i -r \
    -e 's!^mirrorlist=!#mirrorlist=!' \
    -e 's!^#?baseurl=http://(mirror|vault).centos.org/\$contentdir/\$releasever/!baseurl=https://dl.rockylinux.org/vault/centos/8.5.2111/!i' \
    /etc/yum.repos.d/CentOS-*.repo
```
#### 1.更换yum源(可以直接跳至最后一步)
由于2021年12月31日CentOS 8 EOL。按照社区规则，CentOS 8的源地址http://mirror.centos.org/centos/8/内容已移除，目前第三方的镜像站中均已移除CentOS 8的源。阿里云的源http://mirrors.cloud.aliyuncs.com和http://mirrors.aliyun.com也无法同步到CentOS 8的源。当在阿里云上继续使用默认配置的CentOS 8的源会发生报错。
![](/img/centos迁移rocky/markdown-img-paste-20220320185752369.png)
所以我们需要更换yum源。具体步骤：
##### 1.备份之前的repo文件
```bash
rename '.repo' '.repo.bak' /etc/yum.repos.d/*.repo
```
##### 2.下载最新的repo文件
```bash
wget https://mirrors.aliyun.com/repo/Centos-vault-8.5.2111.repo -O /etc/yum.repos.d/Centos-vault-8.5.2111.repo
wget https://mirrors.aliyun.com/repo/epel-archive-8.repo -O /etc/yum.repos.d/epel-archive-8.repo
```
##### 3.替换repo文件中的链接
```bash
sed -i 's/mirrors.cloud.aliyuncs.com/url_tmp/g'  /etc/yum.repos.d/Centos-vault-8.5.2111.repo &&  sed -i 's/mirrors.aliyun.com/mirrors.cloud.aliyuncs.com/g' /etc/yum.repos.d/Centos-vault-8.5.2111.repo && sed -i 's/url_tmp/mirrors.aliyun.com/g' /etc/yum.repos.d/Centos-vault-8.5.2111.repo
sed -i 's/mirrors.aliyun.com/mirrors.cloud.aliyuncs.com/g' /etc/yum.repos.d/epel-archive-8.repo
```
下面的是来自AlmaLinux脚本的替换链接
```bash
sudo sed -i -e '/mirrorlist=http:\/\/mirrorlist.centos.org\/?release=$releasever&arch=$basearch&repo=/ s/^#*/#/' -e '/baseurl=http:\/\/mirror.centos.org\/$contentdir\/$releasever\// s/^#*/#/' -e '/^\[baseos\]/a baseurl=https://mirror.rackspace.com/centos-vault/8.5.2111/BaseOS/$basearch/os' /etc/yum.repos.d/CentOS-Linux-BaseOS.repo
sudo sed -i -e '/mirrorlist=http:\/\/mirrorlist.centos.org\/?release=$releasever&arch=$basearch&repo=/ s/^#*/#/' -e '/baseurl=http:\/\/mirror.centos.org\/$contentdir\/$releasever\// s/^#*/#/' -e '/^\[appstream\]/a baseurl=https://mirror.rackspace.com/centos-vault/8.5.2111/AppStream/$basearch/os' /etc/yum.repos.d/CentOS-Linux-AppStream.repo
sudo sed -i -e '/mirrorlist=http:\/\/mirrorlist.centos.org\/?release=$releasever&arch=$basearch&repo=/ s/^#*/#/' -e '/baseurl=http:\/\/mirror.centos.org\/$contentdir\/$releasever\// s/^#*/#/' -e '/^\[cr\]/a baseurl=https://mirror.rackspace.com/centos-vault/8.5.2111/ContinuousRelease/$basearch/os' /etc/yum.repos.d/CentOS-Linux-ContinuousRelease.repo
sudo sed -i -e '/mirrorlist=http:\/\/mirrorlist.centos.org\/?release=$releasever&arch=$basearch&repo=/ s/^#*/#/' -e '/baseurl=http:\/\/mirror.centos.org\/$contentdir\/$releasever\// s/^#*/#/' -e '/^\[devel\]/a baseurl=https://mirror.rackspace.com/centos-vault/8.5.2111/Devel/$basearch/os' /etc/yum.repos.d/CentOS-Linux-Devel.repo
sudo sed -i -e '/mirrorlist=http:\/\/mirrorlist.centos.org\/?release=$releasever&arch=$basearch&repo=/ s/^#*/#/' -e '/baseurl=http:\/\/mirror.centos.org\/$contentdir\/$releasever\// s/^#*/#/' -e '/^\[extras\]/a baseurl=https://mirror.rackspace.com/centos-vault/8.5.2111/extras/$basearch/os' /etc/yum.repos.d/CentOS-Linux-Extras.repo
sudo sed -i -e '/mirrorlist=http:\/\/mirrorlist.centos.org\/?release=$releasever&arch=$basearch&repo=/ s/^#*/#/' -e '/baseurl=http:\/\/mirror.centos.org\/$contentdir\/$releasever\// s/^#*/#/' -e '/^\[fasttrack\]/a baseurl=https://mirror.rackspace.com/centos-vault/8.5.2111/fasttrack/$basearch/os' /etc/yum.repos.d/CentOS-Linux-FastTrack.repo
sudo sed -i -e '/mirrorlist=http:\/\/mirrorlist.centos.org\/?release=$releasever&arch=$basearch&repo=/ s/^#*/#/' -e '/baseurl=http:\/\/mirror.centos.org\/$contentdir\/$releasever\// s/^#*/#/' -e '/^\[ha\]/a baseurl=https://mirror.rackspace.com/centos-vault/8.5.2111/HighAvailability/$basearch/os' /etc/yum.repos.d/CentOS-Linux-HighAvailability.repo
sudo sed -i -e '/mirrorlist=http:\/\/mirrorlist.centos.org\/?release=$releasever&arch=$basearch&repo=/ s/^#*/#/' -e '/baseurl=http:\/\/mirror.centos.org\/$contentdir\/$releasever\// s/^#*/#/' -e '/^\[plus\]/a baseurl=https://mirror.rackspace.com/centos-vault/8.5.2111/centosplus/$basearch/os' /etc/yum.repos.d/CentOS-Linux-Plus.repo
sudo sed -i -e '/mirrorlist=http:\/\/mirrorlist.centos.org\/?release=$releasever&arch=$basearch&repo=/ s/^#*/#/' -e '/baseurl=http:\/\/mirror.centos.org\/$contentdir\/$releasever\// s/^#*/#/' -e '/^\[powertools\]/a baseurl=https://mirror.rackspace.com/centos-vault/8.5.2111/PowerTools/$basearch/os' /etc/yum.repos.d/CentOS-Linux-PowerTools.repo
```
##### 4.清理旧包重新创建缓存
```bash
yum clean all && yum makecache
```
#### 2.更新系统
```bash
yum update
#或者
dnf update
#更新完成后重启
reboot
```
#### 3.centos迁移到AlmaLinux(请跳至第4步)
由于我在直接使用Rocky Linux的迁移脚本时总是报错，可能还是源的问题。在我找了好长时间后，发现了这个AlmaLinux,也是centos8宣布结束维护后的一个项目，并且比Rocky Linux要发布正式版，也可以直接从centos迁移到AlmaLinux。
于是我便尝试将CentOs迁移到AlmaLinux，在将其迁移到RockyLinux，最后也成功了。
下面来说明centos迁移至AlmaLinux。
```bash
#下载脚本
curl -O https://raw.githubusercontent.com/AlmaLinux/almalinux-deploy/master/almalinux-deploy.sh
#运行脚本
sudo bash almalinux-deploy.sh
```
![](/img/centos迁移rocky/markdown-img-paste-20220320180931322.png)
转换完成会出现如上图所示状态。最后重启即可完成迁移。
#### 4.迁移至Rocky Linux
如果无法直接从centos迁移至Rocky Linux，可以先用第三步先迁移至AlmaLinux，在执行下面的脚本。
先修改yum源
```bash
sed -i -r \
    -e 's!^mirrorlist=!#mirrorlist=!' \
    -e 's!^#?baseurl=http://(mirror|vault).centos.org/\$contentdir/\$releasever/!baseurl=https://dl.rockylinux.org/vault/centos/8.5.2111/!i' \
    /etc/yum.repos.d/CentOS-*.repo
```
```bash
#下载脚本
curl -O https://raw.githubusercontent.com/rocky-linux/rocky-tools/main/migrate2rocky/migrate2rocky.sh
```
```bash
#运行脚本
./migrate2rocky.sh -r
├── -h   # --> 显示帮助
├── -r   # --> 转换为 Rocky
└── -V   # --> 验证转换
```
迁移完成后如下图所示：
![](/img/centos迁移rocky/markdown-img-paste-20220320180832515.png)
重启完成迁移。
```bash
#输入hostnamectl 查看信息
 hostnamectl
   Static hostname: iZbp173czfyjpvvdm6k4amZ
         Icon name: computer-vm
           Chassis: vm
        Machine ID: 20200914151302543507749550121287
           Boot ID: c0d9f9ae06b14b099e9e81cebebdd499
    Virtualization: kvm
  Operating System: Rocky Linux 8.5 (Green Obsidian)
       CPE OS Name: cpe:/o:rocky:rocky:8:GA
            Kernel: Linux 4.18.0-348.20.1.el8_5.x86_64
      Architecture: x86-64
```
