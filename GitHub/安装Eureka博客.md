# 安装Eureka博客

[官方文档](https://www.wangchucheng.com/zh/docs/hugo-eureka/getting-started/#使用hugo-modules安装)

```shell
cd /Volumes/video/GitHub/Eureka

git init

git submodule add https://github.com/wangchucheng/hugo-eureka.git themes/eureka

```

切换版本方法如下:

```shell
cd themes/eureka
git checkout v0.8.2
#git checkout <eureka_version>
#eureka_version 替换成版本号
```

接下来，将[exampleSite](https://github.com/wangchucheng/hugo-eureka/tree/master/exampleSite)中的`config`文件夹复制到项目根目录下，对`config`文件夹的内容进行配置。配置后删除原先的`config.toml`文件即可。

如果你是新建的Hugo项目，`content`文件夹下默认没有内容。你可以将[exampleSite](https://github.com/wangchucheng/hugo-eureka/tree/master/exampleSite)中的`content`文件夹复制到项目根目录下预览主题效果。

完成以上步骤后使用以下命令即可在浏览器中预览项目：

```shell
hugo server
```

草稿不会被Hugo部署，所以你需要将内容头部的`draft`属性设为`false`或使用`hugo server -D`预览网站。

# 内容管理

## 目录结构

### 新建文章页

文章内容为Eureka默认的文章结构，因此新建文章页时不需指定其类型。

```shell
hugo new posts/<your_post.md>
```

### 新建文档页

新建文档页时需指定其类型为`docs`。

```shell
hugo new -k docs docs/<your_doc>/<your_page.md>
```

如果你此前没有创建过文档类型的内容，你需要先生成文档列表：

```shell
hugo new -k docs docs
```

### 新建作者页

新建作者页时需指定其类型为`authors`。

```shell
hugo new -k authors authors/<your_author>
```

## 

