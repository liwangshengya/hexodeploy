---
title: WordPress使用LateX
date: 2022-02-11 22:15:15
tags:
    - WordPress
    - LateX
    - VPS
categories: VPS
---
由于WordPress不支持Latex公式，对要写一大堆公式的我很是难受，无奈投靠了Hexo，今天重要找到了办法。转载自：想在WordPress使用Latex？两行代码解决！ - 宅到没朋友 (weekreport.cn)
很多人用WordPress建站作为自己的个人博客，平时写一些技术博客，有时必然会用到数学公式，Latex是编辑数学公式的利器，WordPress也有很多插件用来支持Latex，但如果你不想使用插件，或者担心插件拖慢你站点的速度该怎么办呢？
其实只需要两行代码就可以解决问题！
找到主题文件夹的header.php文件，在文件的<head>与<\head>插入以下脚本：:
```php
<!--MathJax show start-->
<script>MathJax = {tex: {inlineMath: [['$', '$'], ['\\(', '\\)']]}, svg: {fontCache: 'global'}};</script>
<script type="text/javascript" id="MathJax-script" async src="https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-svg.js"></script>
<!--MathJax show end-->
```
现在你就可以使用Latex语法编辑公式了！
