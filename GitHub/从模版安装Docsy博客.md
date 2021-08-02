# 从模版安装Docsy博客.md

## 安装先决条件

1. 在 Mac 和 Windows 上，下载并安装[Docker Desktop](https://www.docker.com/get-started)。在 Linux 上，安装[Docker 引擎](https://docs.docker.com/engine/install/#server)和[Docker compose](https://docs.docker.com/compose/install/)。

   安装可能需要您重新启动计算机以使更改生效。

2. [安装 git](https://github.com/git-guides/install-git)。

## 从文档示例模板创建存储库

文档示例存储库提供了一个基本的站点结构，您可以将其用作创建自己文档的起点。

1. 使用[docsy-example模板](https://github.com/google/docsy-example)  [创建自己的存储库](https://docs.github.com/en/github/creating-cloning-and-archiving-repositories/creating-a-repository-from-a-template)。

2. 通过[克隆新创建的存储库](https://docs.github.com/en/github/creating-cloning-and-archiving-repositories/cloning-a-repository)，将代码下载到本地机器。

3. 将工作目录更改为新创建的文件夹：

   ```bash
   cd docsy-example
   ```

## 构建并运行容器

文档示例存储库包括一个[Dockerfile](https://docs.docker.com/engine/reference/builder/)，可用于运行站点。

1. 构建docker镜像：

   ```bash
   docker-compose build
   ```

2. 运行已构建的图像：

   ```bash
   docker-compose up
   ```

3. 在网页浏览器中打开地址`http://localhost:1313`以加载文档示例主页。您现在可以对源文件进行更改，这些更改将在浏览器中实时重新加载。

## 清理

要清理系统并删除容器映像，请按照以下步骤操作。

1. 使用**Ctrl + C**停止Docker作曲。

2. 移除生成的图像

   ```bash
   docker-compose rm
   ```