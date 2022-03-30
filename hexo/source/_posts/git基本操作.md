---
title: git基本操作
date: 2022-02-03 17:08:57
tags:
	- git
	- Linux
	- Github
categories: Linux
---
### git常用命令速查

<img src="https://img-blog.csdn.net/20180620113451746?watermark/2/text/aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L2hhbGFvZGE=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70" alt="img" style="zoom:150%;" />

原地址：[(Git 常用命令大全_道的博客-CSDN博客_git命令](https://blog.csdn.net/halaoda/article/details/78661334)

### git结构

![image-20220203174041857](https://cdn.jsdelivr.net/gh/liwangshengya/picture/img/202202031740109.png)

### git基本命令

#### 创建仓库

```bash
git init#创键仓库
Initialized empty Git repository in /home/linux1/git/.git/
```

.git 目录中存放的是本地库相关的子目录和文件，不要删除也不要随意修改。

#### 设置签名

形式：

​	用户：tom

​	Email地址：dgfdssd@good.com

作用：区分不同开发人员的身份。这里设置的签名和登录远程库(代码托管中心)的账号、密码没有任何关系.

项目级别优先于系统用户级别，不允许二者均无。

```bash
#项目级别/仓库级别：仅在当前本地库范围内有效
#信息保存位置：./.git/config 文件
 git config user.name wangsheng
 git config user.email 111@wewr.com
 cat ./.git/config
[core]
        repositoryformatversion = 0
        filemode = true
        bare = false
        logallrefupdates = true
[user]
        name = wangsheng
        email = 111@wewr.com
```

```bash
#系统用户级别：登录当前操作系统的用户范围
#~/.gitconfig 文件
 git config --global  user.name wangsheng1
 git config --global  user.email wewg@wdw.com
 cd /home/linux1/
 cat ~/.gitconfig
[user]
        name = wangsheng1
        email = wewg@wdw.com
```

#### 查看状态

```bash
git status#查看状态
On branch master

No commits yet

nothing to commit (create/copy files and use "git add" to track)

vim test.c#新建文件后再次查看状态
git status
On branch master

No commits yet

Untracked files:
  (use "git add <file>..." to include in what will be committed)
        test.c

nothing added to commit but untracked files present (use "git add" to track)
```

#### 提交文件

```bash
git add test.c #提交文件
git status
On branch master

No commits yet

Changes to be committed:
  (use "git rm --cached <file>..." to unstage)
        new file:   test.c

git rm --cached test.c #从暂存区移除文件
rm 'test.c'
linux1@linuxone:~/git$ git status
On branch master

No commits yet

Untracked files:
  (use "git add <file>..." to include in what will be committed)
        test.c

nothing added to commit but untracked files present (use "git add" to track)
```

#### 提交文件

``` bash
git commit test.c #提交文件
# 接下来会出现如下画面，添加 提交信息
my first commit #在第一行处输入提交信息
# Please enter the commit message for your changes. Lines starting
# with '#' will be ignored, and an empty message aborts the commit.
#
# On branch master
#
# Initial commit
#
# Changes to be committed:
#       new file:   test.c
#
git commit test.c
[master (root-commit) c3a5dbd] my first commit
 1 file changed, 5 insertions(+)#共提交了一个文件，总共有5行
 create mode 100644 test.c

git status #再次查看状态
On branch master
nothing to commit, working tree clean

#对文件进行修改再次查看状态
git status
On branch master
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)#注意，此处变为了updata，第一次添加的时候是 include
  (use "git restore <file>..." to discard changes in working directory)
        modified:   test.c

no changes added to commit (use "git add" and/or "git commit -a")
linux1@linuxone:~/git$ git add test.c #重新添加
linux1@linuxone:~/git$ git status
On branch master
Changes to be committed:
  (use "git restore --staged <file>..." to unstage)
        modified:   test.c
git commit -m "此处填写提交信息" test.c #带上-m参数 可以之间提交，不用在进入编辑器书写提交信息了
[master 5844a4f] 此处填写提交信息
 1 file changed, 3 insertions(+), 1 deletion(-)
```

#### 版本穿梭

```bash
git log#查看历史信息
commit 5844a4f522fb8b50b71793ed80888995c4f45180 (HEAD -> master)
Author: wangsheng <111@wewr.com>
Date:   Thu Feb 3 10:00:20 2022 +0000

    此处填写提交信息

commit c3a5dbd770d1f255a11fda1f87299e1ba1892066
Author: wangsheng <111@wewr.com>
Date:   Thu Feb 3 09:43:47 2022 +0000

    my first commit
```

为了更好进行版本穿梭，我们多次修改文件并提交

```bash
vim test.c
linux1@linuxone:~/git$ git add test.c
linux1@linuxone:~/git$ git commit -m "qwq" test.c
[master d967874] qwq
 1 file changed, 2 insertions(+)
linux1@linuxone:~/git$ vim test.c
linux1@linuxone:~/git$ git commit -m "复制1" test.c
[master 688502c] 复制1
 1 file changed, 1 insertion(+)
linux1@linuxone:~/git$ vim test.c
linux1@linuxone:~/git$ git commit -m "复制2" test.c
[master 53a2912] 复制2
 1 file changed, 1 insertion(+)
linux1@linuxone:~/git$ vim test.c
linux1@linuxone:~/git$ git commit -m "复制3" test.c
[master c0ada25] 复制3
 1 file changed, 1 insertion(+)
linux1@linuxone:~/git$ vim test.c
linux1@linuxone:~/git$ git commit -m "复制4" test.c
[master 6d3b535] 复制4
 1 file changed, 1 insertion(+)
```



```bash
#再次查看版本信息，由于直接使用log命令会造成内容过多，查看不方便。所以我们添加一些参数
git log --pretty=oneline
6d3b5356d60564d51d87600967c44971c0a1eb01 (HEAD -> master) 复制4
c0ada2579c3c309450609ce7d818ab1e4c6cacac 复制3
53a2912f51ffec27b3e6e4f81d8b20bf434e66d5 复制2
688502cfa68b3e3e71a96a471ee0b0238f8f6eb8 复制1
d967874fcd193bef504d8d91b6159fdbca75e94e qwq
5844a4f522fb8b50b71793ed80888995c4f45180 此处填写提交信息
c3a5dbd770d1f255a11fda1f87299e1ba1892066 my first commit

#或直接使用oneline
git log --oneline
6d3b535 (HEAD -> master) 复制4
c0ada25 复制3
53a2912 复制2
688502c 复制1
d967874 qwq
5844a4f 此处填写提交信息
c3a5dbd my first commit

#另一个版本命令
git reflog #HEAD后面括号的数组代表head指针要回退多少次能回到现在位置
6d3b535 (HEAD -> master) HEAD@{0}: commit: 复制4
c0ada25 HEAD@{1}: commit: 复制3
53a2912 HEAD@{2}: commit: 复制2
688502c HEAD@{3}: commit: 复制1
d967874 HEAD@{4}: commit: qwq
5844a4f HEAD@{5}: commit: 此处填写提交信息
c3a5dbd HEAD@{6}: commit (initial): my first commit
```

git的版本控制本质即是控制head指针的移动

①基于索引值进行版本控制

```bash
git reset --hard 53a2912
HEAD is now at 53a2912 复制2
linux1@linuxone:~/git$ cat test.c #可以看到复制2之后的内容都无了
#include<stdio.h>
int main()
{
printf("hello world");
printf("yes");
printf("asdads");

printf("asdads");
printf("asdads");
}

```

②通过 ^ 符号来进行版本回退

git reset --hard HEAD^

一个^表示后退一步，n 个表示后退 n 步

并且只能后退不能前进

```bash
git reset --hard HEAD^
HEAD is now at d967874 qwq
```

③通过 ~后退

git reset --hard HEAD~n

注：表示后退 n 步  只能后退

```bash
git reset --hard HEAD~3
```

#### 文件删除与恢复

前提：删除前，文件存在时的状态提交到了本地库。

操作：git reset --hard [指针位置]

删除操作已经提交到本地库：指针位置指向历史记录

删除操作尚未提交到本地库：指针位置使用 HEAD

```bash
#新建文件并提交
vim aaa.txt
linux1@linuxone:~/git$ git add aaa.txt
linux1@linuxone:~/git$ git commit -m "aaa.txt" aaa.txt
[master 03abfa2] aaa.txt
 1 file changed, 2 insertions(+)
 create mode 100644 aaa.txt

 rm -f aaa.txt #删除文件
linux1@linuxone:~/git$ git status
On branch master
Changes not staged for commit:
  (use "git add/rm <file>..." to update what will be committed)
  (use "git restore <file>..." to discard changes in working directory)
        deleted:    aaa.txt

no changes added to commit (use "git add" and/or "git commit -a")
linux1@linuxone:~/git$ ls
test.c
linux1@linuxone:~/git$ git add aaa.txt #提交删除
linux1@linuxone:~/git$ git commit -m "deleta aaa.txt"
[master d929131] deleta aaa.txt
 1 file changed, 2 deletions(-)
 delete mode 100644 aaa.txt
```

#### 文件比较

git diff [文件名]  将工作区中的文件和暂存区进行比较

 git diff [本地库中历史版本] [文件名]   将工作区中的文件和本地库历史记录比较

不带文件名比较多个文件

```bash
 vim aaa.txt#修改aaa文件
linux1@linuxone:~/git$ git diff aaa.txt#在工作区和暂存区进行比较
diff --git a/aaa.txt b/aaa.txt
index 2584198..7bfe159 100644
--- a/aaa.txt
+++ b/aaa.txt
@@ -1,2 +1,3 @@
 hidsvdnscvdsnbsbcs
 dsvcseyhf
+gvdhfvdsndvsefewhf
linux1@linuxone:~/git$ git add aaa.txt
linux1@linuxone:~/git$ git diff HEAD aaa.txt#在工作区和本地库进行比较
diff --git a/aaa.txt b/aaa.txt
index 2584198..7bfe159 100644
--- a/aaa.txt
+++ b/aaa.txt
@@ -1,2 +1,3 @@
 hidsvdnscvdsnbsbcs
 dsvcseyhf
+gvdhfvdsndvsefewhf
```

#### 分支管理

分支：在版本控制过程中，使用多条线同时推进多个任务。

创建分支  git branch [分支名]

查看分支  git branch -v

切换分支  git checkout [分支名]

合并分支

   第一步：切换到接受修改的分支（被合并，增加新内容）上    git checkout [被合并分支名]

 第二步：执行 merge 命令    git merge [有新内容分支名]  

```bash
git branch ht_fix#创建分支
linux1@linuxone:~/git$ git branch -v#查看所有分支
  ht_fix 03abfa2 aaa.txt
* master 03abfa2 aaa.txt
git switch ht_fix #切换分支
M       aaa.txt
Switched to branch 'ht_fix'

vim aaa.txt #修改aaa文件
linux1@linuxone:~/git$ git add aaa.txt
linux1@linuxone:~/git$ git commit -m "ht-fix aaa"#提交的ht_fix分支
[ht_fix 7d0130e] ht-fix aaa
 1 file changed, 2 insertions(+)
linux1@linuxone:~/git$ git branch -v#可以看出此时ht_fix分支比master分支提前了一步
* ht_fix 7d0130e ht-fix aaa
  master 03abfa2 aaa.txt


  git switch master#切换分支
Switched to branch 'master'
linux1@linuxone:~/git$ git merge ht_fix #合并分支
Updating 03abfa2..7d0130e
Fast-forward
 aaa.txt | 2 ++
 1 file changed, 2 insertions(+)
```

### 远程仓库操作

#### 创建远程仓库别名

git remote -v 查看当前所有远程地址别名

git remote add [别名] [远程地址]

#### 推送

git push [别名] [分支名]

#### 克隆

git origin [远程地址]

克隆作用：

&emsp;完整的把远程库下载到本地

&emsp;创建 origin 远程地址别名

&emsp;初始化本地库

#### 拉取

 pull=fetch+merge

对于复杂的：

 git fetch [远程库地址别名] [远程分支名]

 git merge [远程库地址别名/远程分支名]

简单的直接pull

git pull [远程库地址别名] [远程分支名]

#### 解决冲突

如果不是基于 GitHub 远程库的最新版所做的修改，不能推送，必须先拉

取。

拉取下来后如果进入冲突状态，则按照“分支冲突解决”操作解决即可。
