[从Jekyll迁移到Hugo](https://caosiyang.github.io/posts/2020/08/29/migrating-from-jekyll-to-hugo/)

最终还是投入Hugo的怀抱，原因是：

1. 熟悉和欣赏Go
2. 发现一个超级喜欢的Hugo主题 - **[LoveIt](https://themes.gohugo.io/loveit/)**

本文记录下博客从Jekyll迁移到Hugo的过程。

## 创建项目

安装Hugo

```
sudo pacman -S hugo
```

创建名称为Demo的新项目

```
hugo new site Demo
```

添加主题（此为必需步骤，可以选择其他主题）

```
cd Demo && git init && git submodule add https://github.com/dillonzq/LoveIt.git themes/LoveIt
```

> 也可以自行下载主题，放置于 *Demo/themes* 目录下
>
> 但作为submodule添加进Git项目是一个更好的方式

创建示例文章

```
hugo new posts/first.md
```

> 产生的文件位于是 *Demo/content/posts/first.md*

启动Hugo服务

```
hugo server
```

本地预览访问 http://localhost:1313/

## 文章迁移

> hugo import jekyll /Volumes/video/GitHub/xinqinew.github.io  /Volumes/video/GitHub/Eureka2



Hugo提供了迁移命令`import`，可以方便地将Jekyll项目转换为Hugo项目，包括文章和其他静态资源文件。

命令格式是`hugo import jekyll JEKYLL_ROOT_PATH TARGET_PATH`，其中 *JEKYLL_ROOT_PATH* 是Jekyll项目主目录，*TARGET_PATH* 是新生成的Hugo项目目录。

以我的一篇文章为例，原Jekyll项目中的位置是 *_post/2020-07-29-cpp-template-notes.md*，Hugo项目中的位置是 *content/post/2020-07-29-cpp-template-notes.md*，需要注意的是，**迁移前后文件名保持一致**，划重点后面用到。

Jekyll Front Matter

```yaml
---
layout: post
title: C++类与模板
categories: [ 编程语言 ]
tags: [ C++, Template ]
---
```

Hugo Front Matter

```yaml
---
categories:
- 编程语言
date: "2020-07-29T00:00:00Z"
tags:
- C++
- Template
title: C++类与模板
---
```

同时需要注意，**Jekyll和Hugo在FrontMatter变量的定义有区别**，划重点。

|            | Jekyll                                           | Hugo                        |
| :--------- | :----------------------------------------------- | :-------------------------- |
| `date`     | post文件名或FrontMatter指定，FrontMatter重写前者 | FrontMatter指定             |
| `title`    | post文件名指定                                   | FrontMatter指定，即文章标题 |
| `filename` | N/A                                              | 即文件名（不包含扩展名）    |
| `section`  | N/A                                              | content下的目录名           |

以 *2020-07-29-cpp-template-notes.md* 为例，

对于Jekyll，`date`是 *2020-07-29*，`title`是 *cpp-template-notes*；

对于Hugo，`date`是 *2020-07-29*，`title`是 *C++类与模板*，`filename`是 *2020-07-29-cpp-template-notes*。

## URL规则

URL规则在全局配置文件（config.toml）的 *permalinks* 进行配置，也可以使用文章HugoFrontMatter的 `url` 变量指定（优先级高于前者）。

需要保证，**无论URL规则是否变化，都能通过原始URL访问到文章**。

对于迁移后的三种情形：

- 保持原有URL规则

  如果原Jekyll的permalink配置使用 *title* 变量，相应地在Hugo下使用 *filename* 变量，由于迁移前后文件名保持一致，这将破坏原有的URL规则，可以采取两个方案：

  1. 使用HugoFrontMatter的 *url* 变量指定原始URL
  2. 去除迁移后文件名的date部分

  个人采用第一种，因为通过文件名可以区分哪些是迁移前的文章。

- 老文章保持原有URL规则，新文章采用新的URL规则

  老文章使用HugoFrontMatter的 *url* 变量指定原始URL，新文章采用全局 *permalinks* 配置，这种方式实现起来最简单，但URL规则不统一，看着很不规范，不推荐！

- 采用新的URL规则

  如果原Jekyll的permalink配置使用 *title* 变量，使用HugoFrontMatter的 `url` 变量指定新URL；

  使用HugoFrontMatter的 `aliases` 变量指定原始URL，实现页面重定向。

对于我的博客，原Jekyll的URL规则是

```yaml
permalink: /:year/:month/:day/:title
```



在Hugo下使用了新的URL规则

```yaml
[permalinks]
  posts = "/:section/:year/:month/:day/:filename/"
```



JekyllFrontMatter

```yaml
---
layout: post
title: C++类与模板
categories: [ 编程语言 ]
tags: [ C++, Template ]
---
```



HugoFrontMatter

```yaml
---
title: C++类与模板
categories:
- 编程语言
tags:
- C++
- Template
date: 2020-07-29 00:00:00+08:00
url: /posts/2020/07/29/cpp-template-notes/
aliases:
- /2020/07/29/cpp-template-notes/
---
```



Hugo import命令无法满足我的场景，而且HugoFrontMatter变量按照首字符顺序排序，看着实在难受，本着轮子能造就造的原则，写了一个转换工具，仅对_posts下文章进行转换，有需要可以尝试下，项目地址是 https://github.com/caosiyang/convert-jekyll-to-hugo ，嗯，这个硬广阔以：）

## GitHub Pages发布

执行`hugo`命令，在 *public* 目录下生成静态网站，push里面的内容到github就可以了。

Hugo官方提供的方案是submodule方式，如下：

```shell
$ rm -rf public
$ git submodule add -b master https://github.com/<USERNAME>/<USERNAME>.github.io.git public
$ hugo
```



发布新的Hugo页面时遇到了问题，顺便说一下吧。

之前我的博客项目已经托管在GitHub，我把原repo重命名了（暂且称“A"），新建一个repo（暂且称为“B”），名字是.github.io，然后push页面，之后浏览，“首页/分类/标签/关于”页面都是正常的，而“文章”页面还是原始的Jekyll生成的页面，初以为是缓存问题，过了一晚还这样，怀疑跟A有管，把A删除，问题仍然存在，之后又把B删除，重新建repo和push，恢复正常。

## 博客历程回顾

最初产生写博客的想法是2011年，试用了当时几个流行的技术博客平台（csdn/cnblogs/cppblog），最终选择了cnblogs。

2015年了解到GitHub Pages可以搭建博客，当时已经在用GitHub，所以不假思索地转过去，使用Jekyll搭建了新博客，看了很多主题，选了一个并进行小改，但并不满意，最后抱着学习前端的想法，自己写了一个相当相当粗糙的主题，凑合用着了。

后来先后了解到Hexo和Hugo，同为热门的静态网站生成工具，前者node.js实现，后者Go实现，看过它们的主题，感觉都比Jekyll的好看，也很玄学，但迟迟没有折腾，现在想来，能坚持更博就不错了。

2020年是不平凡的一年，新冠疫情爆发，我的工作生活发生了很大变化，在一段闲暇的日子里，又开始琢磨博客，在看到一个相当中意的Hugo主题，坚定了我转到Hugo的决心，于是有了现在的博客。

------

参考文档

1. https://gohugo.io/tools/migrations/
2. https://gohugo.io/commands/hugo_import_jekyll/
3. https://gohugo.io/hosting-and-deployment/hosting-on-github/