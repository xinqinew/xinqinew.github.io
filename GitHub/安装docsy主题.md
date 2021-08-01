# 安装docsy主题

[下载并安装npm](https://nodejs.org/en/)



## 苹果系统[ ](https://www.docsy.dev/docs/getting-started/#macos)

在 macOS 上可使用 Homebrew 套件管理安裝

```bash
brew install hugo
```

### 作为`npm`模块

您可以`npm`使用[`hugo-bin`](https://www.npmjs.com/package/hugo-bin). 这会添加`hugo-bin`到您的`node_modules`文件夹并将依赖项添加到您的`package.json`文件中。要安装 Hugo 的扩展版本：

```bash
npm install hugo-extended --save-dev
```

### 安装 PostCSS[ ](https://www.docsy.dev/docs/getting-started/#install-postcss)

要构建或更新站点的 CSS 资源，您还需要[`PostCSS`](https://postcss.org/)创建最终资产。如果您需要安装它，您必须在您的机器上安装最新版本的[NodeJS](https://nodejs.org/en/)，以便您可以使用`npm`Node 包管理器。默认情况`npm`下，在您运行的目录下安装工具[`npm install`](https://docs.npmjs.com/cli/v6/commands/npm-install#description)：

```
sudo npm install -D autoprefixer
sudo npm install -D postcss-cli
```

### 选项 1：复制 Docsy 示例站点

该[示例站点](https://example.docsy.dev/)为您提供了一个很好的起点构建您的文档的网站，并预先配置为使用Docsy主题为Git的子模块。您可以通过以下方式复制示例站点：

- [使用 GitHub 用户界面](https://www.docsy.dev/docs/getting-started/#using-the-github-ui)
- [使用命令行](https://www.docsy.dev/docs/getting-started/#using-the-command-line)

#### 使用 GitHub 用户界面

这是最简单的方法，因为 Docsy 示例站点[存储库](https://github.blog/2019-06-06-generate-new-repositories-with-repository-templates/)是一个[模板存储库](https://github.blog/2019-06-06-generate-new-repositories-with-repository-templates/)。要创建您自己的 Docsy 示例站点存储库副本：

1. 转到[repo 页面](https://github.com/google/docsy-example)并单击**Use this template**。

2. 在**存储库名称**字段中输入您为新存储库选择的名称。您还可以添加可选的**Description**。

3. 单击**从模板创建存储库**以创建新存储库。恭喜，您现在拥有一个 Docsy 站点存储库！

4. 要使用 Hugo 在本地测试您复制的站点，或进行本地编辑，您还需要制作新存储库的本地副本。为此，请使用`git clone`, 替换`https://github.com/my/example.git`为您的存储库的网址（不要忘记使用，`--recurse-submodules`否则您将不会下拉生成工作站点所需的一些代码）：

   ```bash
   cd /Volumes/video/GitHub/Hugo
   git clone --recurse-submodules --depth 1 https://github.com/xinqinew/Docsy.git
   //git clone --recurse-submodules --depth 1 https://ghproxy.com/https://github.com/xinqinew/Docsy.git
   cd Docsy
   hugo server
   ```

您现在可以编辑站点源文件的本地版本。要预览您的站点，请转到站点根目录并运行`hugo server`（[请参阅 MacOS 上的已知问题](https://www.docsy.dev/docs/getting-started/#known-issues)）。默认情况下，您的站点将在 http://localhost:1313/ 上可用。要将更改推送到您的新存储库，请转到您的站点根目录并使用`git push`.



### 苹果系统

#### 错误：`too many open files`或`fatal error: pipe failed`

默认情况下，MacOS 允许少量打开的文件描述符。对于较大的站点，或者当您同时运行多个应用程序时，当您运行[`hugo server`](https://gohugo.io/commands/hugo_server/)以在本地预览站点时，您可能会收到以下错误之一：

- POSTCSS v7 及更早版本：

  ```
  ERROR 2020/04/14 12:37:16 Error: listen tcp 127.0.0.1:1313: socket: too many open files
  ```

- POSTCSS v8 及更高版本：

  ```
  fatal error: pipe failed
  ```

##### 解决方法

暂时允许更多打开的文件：

1. 通过运行查看您当前的设置：

   ```
   sudo launchctl limit maxfiles
   ```

2. `65535`通过运行以下命令增加对文件的限制。如果您的站点文件较少，您可以选择设置较低的软 ( `65535`) 和硬 ( `200000`) 限制。

   ```shell
   sudo launchctl limit maxfiles 65535 200000
   ulimit -n 65535
   sudo sysctl -w kern.maxfiles=200000
   sudo sysctl -w kern.maxfilesperproc=65535
   ```

请注意，您可能需要为每个新 shell 设置这些限制。 [详细了解这些限制以及如何使它们永久化](https://www.google.com/search?q=mac+os+launchctl+limit+maxfiles+site%3Aapple.stackexchange.com&oq=mac+os+launchctl+limit+maxfiles+site%3Aapple.stackexchange.com)。

