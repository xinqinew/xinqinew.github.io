# 安装hugo_ learn主题
[learn主题](https://themes.gohugo.io/themes/hugo-theme-learn/)
## 安装
### 创建您的项目

```
cd /Volumes/video/GitHub
hugo new site learn
```
      
### 安装主题
```BASH
cd /Volumes/video/GitHub/learn/themes
git clone https://github.com/matcornic/hugo-theme-learn.git

```

### 基本配置
在建站时，可以通过使用`--theme`选项。但是，我们建议您修改配置文件（`config.toml`）并将主题设置为默认。您还可以添加`[outputs]`启用搜索功能的部分。

```toml
# Change the default theme to be use when building the site with Hugo
theme = "hugo-theme-learn"

# For search functionality
[outputs]
home = [ "HTML", "RSS", "JSON"]
```

### 创建第一章页面

```
cd /Volumes/video/GitHub/learn/
hugo new --kind chapter basics/_index.md
```
通过打开给定的文件，您应该看到属性`chapter=true`在上面，这意味着这一页是一个_章节_。

默认情况下，所有章节和页面都创建为草稿。如果您想渲染这些页面，请删除属性`draft: true`来自元数据。

### 创建您的第一个内容页面

然后，在之前创建的章节中创建内容页面。以下为以下两种创建章节内容的方法：

```
hugo new basics/first-content.md
hugo new basics/second-content/_index.md
```

通过添加一些示例内容并替换文件开头的标题值，可以随意编辑这些文件。

### 在本地启动网站

使用以下命令启动：

```
hugo serve
```

去`http://localhost:1313`

你应该注意三件事：

1.  您有一个左侧的 **Basics** 菜单，其中包含两个子菜单，其名称与之前创建的文件中的 `title` 属性相同。
2.  主页解释了如何通过按照说明进行定制。
3.  当你跑步时`hugo serve`，当文件内容发生变化时，页面会自动随着更改刷新。整洁！


### 建立网站

当您的网站准备部署时，运行以下命令：

```
hugo
```

`public`将生成文件夹，其中包含您网站的所有静态内容和资产。它现在可以部署在任何Web服务器上。

## 配置
### 全球站点参数

在[雨果全球配置](https://gohugo.io/overview/configuration/)，**Hugo-theme-learn**允许您在您的`config.toml`（此处，值为默认值）。

请注意，其中一些参数在本文档的其他部分中进行了详细解释。

```toml
[params]
  themeVariant = "blue" #red green blue //主题颜色 默认为紫色
   	# 前缀 URL 以编辑当前页面。 将在每个页面的右上角显示“编辑此页面”按钮。
   	# 有助于让人们有机会为您的文档创建合并请求。
   	# 请参阅此文档站点中的 config.toml 文件以获取示例。
  editURL = ""
	# 站点的作者，将用于元信息
  author = ""
	# 站点描述，将用于元信息
  description = ""
  	# 在菜单上显示已访问页面的复选标记
  showVisitedLinks = false
  	# 禁用搜索功能。 它将隐藏搜索栏
  disableSearch = false
   	# 新版本站点生成时，Javascript 和 CSS 缓存会自动破坏。
  	# 将此设置为 true 以禁用此行为（某些代理不能很好地处理此优化）
  disableAssetsBusting = false
	# 将此设置为 true 以禁用内联代码的复制到剪贴板按钮。
  disableInlineCopyToClipBoard = false
   	# 默认设置菜单中快捷方式的标题。 将此设置为 true 以禁用它。
  disableShortcutsTitle = false
	# 如果设置为false，则菜单上的搜索栏下方将出现一个主页按钮。
   	# 如果指定，则重定向到当前语言的登录页面。 （默认为“/”）
  disableLandingPageButton = true
	# 使用多语言网站时，禁用切换语言按钮。
  disableLanguageSwitchingButton = false
 	# 隐藏页眉中的面包屑，只显示当前页面标题
  disableBreadcrumb = true
	# 如果设置为 true，则在不需要时阻止 Hugo 包含美人鱼模块（将减少加载时间和流量）
  disableMermaid = false
  	# 指定美人鱼js的远程位置
  customMermaidURL = "https://unpkg.com/mermaid@8.8.0/dist/mermaid.min.js"
  	# 隐藏下一页和上一页按钮通常在内容旁边全高显示
  disableNextPrev = true
  	# 按“重量”或“标题”对菜单中的部分进行排序。 默认为“重量”
  ordersectionsby = "weight"
  	# 使用变体更改默认配色方案。 可以是“红”、“蓝”、“绿”。
  themeVariant = ""
	# 提供自定义 css 文件列表以从站点根目录的 `static/` 文件夹中加载相关文件。
  custom_css = ["css/foo.css", "css/bar.css"]
  	# 更改标题分隔符。 默认为“::”。
  titleSeparator = "-"
```
### 激活搜索

如果尚未出现，请在同一行中添加以下行`config.toml`文件。

```toml
[outputs]
home = [ "HTML", "RSS", "JSON"]
```
Learn主题使用hugo 20+版本中可用的最后一个改进来生成一个json索引文件，准备被lunr.js javascript搜索引擎使用。

> 雨果在公用文件夹的根部生成lunrjs index.json。当您使用`hugo server`，Hugo在内部生成它，当然它不会显示在文件系统中

### 美人鱼

美人鱼配置参数也可以在特定页面上设置。在这种情况下，全局参数将被本地参数覆盖。

> 示例：
> 
> 美人鱼是全球残疾人。默认情况下，它不会被任何页面加载。  
> 在“架构”页面上，您需要一个类图。您可以将美人鱼参数设置在本地，仅在此页面上加载美人鱼（而不是在其他页面上）。

您还可以在全局启用时禁用特定页面的美人鱼。

### 主屏幕按钮配置

如果`disableLandingPage`选项设置为`false`，左侧菜单上将显示一个主屏幕按钮。是点击标志的替代方案。要编辑外观，您必须为定义的语言配置两个参数：

```toml
[Lanugages]
[Lanugages.en]
...
landingPageURL = "/en"
landingPageName = "<i class='fas fa-home'></i> Redirect to Home"
...
[Lanugages.fr]
...
landingPageURL = "/fr"
landingPageName = "<i class='fas fa-home'></i> Accueil"
...
```

如果这些参数没有为特定语言配置，它们将获得默认值：

```toml
landingPageURL = "/"
landingPageName = "<i class='fas fa-home'></i> Home"
```

主屏幕按钮会是这样的：

[![默认主屏幕按钮](https://learn.netlify.app/en/basics/configuration/images/home_button_defaults.jpg?width=100%25)](https://learn.netlify.app/en/basics/configuration/images/home_button_defaults.jpg?width=100%25)

[](https://learn.netlify.app/en/basics/installation/ "安装")

### 前置物质配置

每个雨果页面必须定义一个[前物质](https://gohugo.io/content/front-matter/) in _yaml_, _toml_ or _json_.

**Hugo-theme-learn**在Hugo参数的基础上使用以下参数：

```toml
+++

disableToc = "false"
# 默认情况下启用目录 (toc)。 将此参数设置为 true 以禁用它。
# 注意：章节页面的 Toc 始终处于禁用状态

menuTitle = ""
# 如果设置，这将用于页面的菜单项（而不是`title` 属性）

pre = ""
# 菜单中页面的标题将以此 HTML 内容为前缀

post = ""
# 菜单中页面的标题将被此 HTML 内容后缀

chapter = false
# 将页面设置为章节，改变其显示方式

hidden = false
# 通过将其设置为 true 来隐藏菜单项

LastModifierDisplayName = ""
# 该页面修饰符的显示名称。 如果设置，它将显示在页脚中。

LastModifierEmail = ""
# 此页面修改器的电子邮件。 如果使用 LastModifierDisplayName 设置，它将显示在页脚中
+++
```

### 向菜单条目添加图标

在页面 frontmatter 中，添加一个 `pre` 参数以在菜单标签之前插入任何 HTML 代码。 下面的示例使用 Github 图标。

```toml
+++
title = "Github repo"
pre = "<i class='fab fa-github'></i> "
+++
```

[![带图标的标题](http://localhost:57318/en/cont/pages/images/frontmatter-icon.png)](http://localhost:57318/en/cont/pages/images/frontmatter-icon.png)

### 订购兄弟姐妹菜单/页面条目

雨果提供了一个[灵活的方式](https://gohugo.io/content/ordering/)处理页面的订单。

最简单的方法是设置`weight`参数到一个数字。

```toml
+++
title = "My page"
weight = 5
+++
```

### 对菜单条目使用自定义标题

默认情况下，Hugo-theme-learn 将使用页面的标题属性作为菜单项（或链接标题如果定义）。

但页面的标题必须本身具有描述性，而菜单是层次结构。我们添加了`menuTitle`为此目的的参数：

例如（对于名为`content/install/linux.md`):

```toml
+++
title = "Install on Linux"
menuTitle = "Linux"
+++
```

### 主页

要配置您的主页，您基本上有三个选择：

1.  创建一个`_index.md`文档在`content`文件夹并用_Markdown内容_填充文件
2.  创建一个`index.html`文件在`static`文件夹并用_HTML内容_填充文件
3.  配置服务器以自动将主页重定向到文档页面

### 章节

要创建章节页面，请运行以下命令

```
hugo new --kind chapter <name>/_index.md
```

它将创建一个包含预定义前事项的页面：

```markdown
+++
title = "{{ replace .Name "-" " " | title }}"
date = {{ .Date }}
weight = 5
chapter = true
pre = "<b>X. </b>"
+++

### Chapter X

# Some Chapter title

Lorem Ipsum.
```

### 默认

要创建默认页面，请运行以下命令之一

```
# Either
hugo new <chapter>/<name>/_index.md
# Or
hugo new <chapter>/<name>.md
```

它将创建一个包含预定义前事项的页面：

```markdown
+++
title = "{{ replace .Name "-" " " | title }}"
date =  {{ .Date }}
weight = 5
+++

Lorem Ipsum.
```

###  笔记图片

```markdown
![Alt text][id]
```

[![原文](https://octodex.github.com/images/dojocat.jpg "Dojocat")](https://octodex.github.com/images/dojocat.jpg)

在文档后面引用定义URL位置：

```
[id]: https://octodex.github.com/images/dojocat.jpg  "The Dojocat"
```

### 调整图像大小

将 HTTP 参数 `width` 和/或 `height` 添加到链接图像以调整图像大小。 值为 CSS 值（默认为 `auto`）。

```markdown
![Minion](https://octodex.github.com/images/minion.png?width=20px)
```


[![人](https://octodex.github.com/images/minion.png?width=20px)](https://octodex.github.com/images/minion.png?width=20px)

```markdown
![Minion](https://octodex.github.com/images/minion.png?height=50px)
```

[![人](https://octodex.github.com/images/minion.png?height=50px)](https://octodex.github.com/images/minion.png?height=50px)

```markdown
![Minion](https://octodex.github.com/images/minion.png?height=50px&width=300px)
```

[![人](https://octodex.github.com/images/minion.png?height=50px&width=300px)](https://octodex.github.com/images/minion.png?height=50px&width=300px)

### 添加CSS类
添加HTTP`classes`参数到链接映像中添加CSS类。`shadow`和`border`可用，但您可以定义其他。

```markdown
![stormtroopocat](https://octodex.github.com/images/stormtroopocat.jpg?classes=shadow)
```

[![风暴 ??](https://octodex.github.com/images/stormtroopocat.jpg?width=40pc&classes=shadow)](https://octodex.github.com/images/stormtroopocat.jpg?width=40pc&classes=shadow)

```markdown
![stormtroopocat](https://octodex.github.com/images/stormtroopocat.jpg?classes=border)
```

[![风暴 ??](https://octodex.github.com/images/stormtroopocat.jpg?width=40pc&classes=border)](https://octodex.github.com/images/stormtroopocat.jpg?width=40pc&classes=border)

```markdown
![stormtroopocat](https://octodex.github.com/images/stormtroopocat.jpg?classes=border,shadow)
```

[![风暴 ??](https://octodex.github.com/images/stormtroopocat.jpg?width=40pc&classes=border,shadow)](https://octodex.github.com/images/stormtroopocat.jpg?width=40pc&classes=border,shadow)

### 灯箱

添加HTTP`featherlight`参数到链接图像以禁用灯箱。默认情况下，使用 featherlight.js 插件启用灯箱。您可以通过定义来禁用它`featherlight` to `false`.

```markdown
![Minion](https://octodex.github.com/images/minion.png?featherlight=false)
```

### 禁用语言切换

在浏览器中切换语言是一项很棒的功能，但出于某些原因，您可能希望禁用它。

刚刚设置`disableLanguageSwitchingButton=true`在你的`config.toml`

```toml
[params]
  # When using mulitlingual website, disable the switch language button.
  disableLanguageSwitchingButton = true
```

[![I18n菜单](http://localhost:57318/en/cont/i18n/images/i18n-menu.gif)](http://localhost:57318/en/cont/i18n/images/i18n-menu.gif)

## 标签

_学习主题_支持gohugo的一个默认分类：_标签_功能。

### 配置

只需在任何页面添加标签：

```markdown
---
date: 2018-11-29T08:41:44+01:00
title: Theme tutorial
weight: 15
tags: ["tutorial", "theme"] 
---
```

### 行为

标签按插入顺序显示在页面顶部。

每个标签都是指向_分类_页面的链接，该页面显示所有带有给定标签的文章。

### 列出所有标签

在`config.toml`文件，您可以添加一个快捷方式来显示所有标签

```toml
[[menu.shortcuts]]
name = "<i class='fas fa-tags'></i> Tags"
url = "/tags"
weight = 30
```

## 子目录

Parameter|Default|Description
----|----|----
page|_current_|指定页面名称（部分名称）以显示其子项
style|“li”|选择用于显示后代的样式。 它可以是任何 HTML 标签名称
showhidden|“false”|当为 true 时，将显示从菜单中隐藏的子页面
description|“false”|允许您在列表中的每个页面下包含一个简短的文本。 当页面不存在描述时，儿童简码会占用您内容的前 70 个单词。 在 gohugo.io 上阅读有关摘要的更多信息.[Read more info about summaries on gohugo.io](https://gohugo.io/content/summaries/)
depth|1|输入一个数字以指定要显示的后代的深度。 例如，如果值为 2，则简码将显示 2 级子页面。 Tips：设置999获取所有后代
sort|none|按权重排序子项 - 按菜单顺序排序，名称 - 按菜单标签的字母顺序排序，标识符 - 按设置在 frontmatter 中的标识符的字母顺序排序，以及 URL - 按 URL 排序

{{% children %}}

{{% children description="true" %}}

{{% children depth="3" showhidden="true" %}}

{{% children style="h2" depth="3" description="true" %}}

{{% children style="div" depth="999" %}}

{{% children depth="5" description="true" %}}

手动添加描述
```bash
<!--more-->
```

### 扩展
此短代码恰好需要一个可选参数来定义显示在展开/折叠图标旁边的文本。（默认值为“展开我......”）

```markdown
{{%expand "外层" %}}内层{{% /expand%}}
```
{{%expand "外层" %}}内层{{% /expand%}}

### 显示`config.toml`变量的值
```markdown
{{% siteparam "editURL" %}}
{{% siteparam "description" %}}
```
