# 安装hugo博客
在 macOS 上可使用 Homebrew 套件管理安裝

```bash
brew install hugo
```
### Generate new site

要產生一個新的 web site 內容，可直接執行

```bash
hugo new site ssg-site
```

執行後會建立一個名為 `ssg-site` 的資料夾，包含以下內容

```bash
.
├── archetypes
│   └── default.md
├── config.toml
├── content
├── data
├── layouts
├── static
└── themes
```

其中

-   archetypes: 放置生成文件的基礎樣板資料夾（可先暫時不管）。
-   **config.toml**: 控制 hugo 產生網頁內容的設定檔，預設使用 toml 格式。(也支援 yaml 與 json 格式)
-   **content**: 放置 Markdown 文章與網頁內容的資料夾。
-   data: 儲存一些 configuration 檔案的地ㄌㄌ方，協助建構靜態網頁(也先不管)。
-   layouts: 儲存產生的網頁 layout 樣板(之後範例使用其他的 theme，先不管)。
-   **static**: 放置靜態內容，如圖片，CSS 以及 *.js 等內容。
-   **themes**: 從外部引入的 theme 檔案。

目前只要知道 **config.toml**, **content**, **static** 與 **themes** 這幾個部分即可。

### Import Hugo themes

Hugo 並沒有預設的 theme，所以在建立好內容資料夾後，需自行建立 theme 或使用其他 theme，在這我們已 [Mainroad](https://github.com/Vimux/mainroad) theme 做範例。

```Bash
# 將 mainroid theme 加入 themes/ 中
cd /Users/xinqinew/ssg-site
git clone https://github.com/Vimux/Mainroad.git themes/mainroad
```

> 除了使用 git 指令外，直接從 Github 上下載最新原始檔案壓縮檔，解壓縮後放到 themes 資料夾中。此外對 git 熟悉的是使用者也可用 `git submodule` 或 `git subtree` 等方式管理外部引入的 theme repo。

 ### Configuration

Hugo 在生成 SSG 時會使用到 config.toml 檔案的設定內容。我們可以將之前 Mainroad theme 中的 config.toml 修改後加以使用

```bash
# 將 mainroid 的 config.toml 覆蓋原先的預設值
cp themes/mainroad/exampleSite/config.toml .
```

之後編輯 config.toml 內容，將其修改為自己想要的內容。更詳細的 configuration 設定可參考 [Hugo 官方文件](https://gohugo.io/getting-started/configuration/)

### 新增 Blog 文章

我們可以手動新增 Markdown 文件

```bash
hugo new post/hello-world.md
```

之後會在 `./content/post/hello-world.md` 的位置新增一個 Markdown 文件，其中預設內容會根據 `archetype/default.md` 這個樣板檔案內容加以建立。

### 預覽內容

先將 `./content/post/hello-world.md` 內容修改為

```markdown
---
title: "Hello World"
date: 2018-07-06T16:00:21+08:00
categories:
  - "Blog"
tags:
  - "Hugo"
draft: true
---

# Hello World.

Post example
```

之後執行以下指令

```bash
hugo server --buildDrafts
```

> 若在 Markdown 的 Front Matter，加入 `draft: true`，代表該篇文章為草稿不會被 Hugo 轉換為網頁。因此可在指令後加入 `--buildDrafts` 來轉換草稿文件。

執行成功後會在 `localhost:1313` 建立一個暫時的網頁，可接載在瀏覽器網址列輸入預覽結果。

![hugo-preview](https://blog.yeshuanova.com/images/2018/jekyll-to-hugo/hugo-preview.png)_Hugo Mainroad theme 結果預覽_

> 1313 為 Hugo 的預設 Port，可以使用 `--port xxx` 來指定使用其他 Port

### 生成靜態內容

Hugo 要生成靜態網頁內容只執行 `hugo` 指令即可

```bash
hugo
```

執行後生成的網頁內容會自動加入 `public` 資料夾中。

> `public` 為預設資料夾，若要修改可在 config 檔案中設定 `publishDir` 參數指定輸出位置。

## 從 Jekyll 轉移到 Hugo

如果要從其他的 SSG 轉換到 Hugo，官方也提供了一些[轉換方式](https://gohugo.io/tools/migrations/)。以從 Jekyll 轉換到 Hugo 為例，只要執行

```bash
hugo import jekyll [jekyll_root_path] [target_path]
```

就會將 Jekyll 轉換為 Hugo 格式資料夾。但這方式也不是沒問題，原先在的 Jekyll 的 theme 無法直接在 Hugo 使用，且有部分 Front Matter 無法正確轉換，因此建議還是手動轉移較好。而因爲個人轉移時選用的 theme 為 Mainroad，在過程中也遇到了一些問題，在此提出來以供參考。

### Markdown Front Matter

由於 Hugo 與 Jekyll 所使用的 Front Matter 設定不同，有些部分需要每個檔案逐一修改內容，如 `categories` 或 `tags` 的內容，之前使用的 [voyager](https://github.com/redVi/voyager) theme 在執行時會成格式不對，需修改將其改為 List 結構，如在 Jekyll 中，

```markdown
categories: posts
```

是可行的，但換到 Hugo 的 Mainroad theme 時，需使用 List 結構才行，如

```markdown
categories: ["posts"]
```

才可正常產生靜態網頁，否則會出現錯誤。

### Math equation support

在加入數學式的支援花了一些時間去解決，主要分為兩個問題 - **Markdown 轉換成 HTML** 以及 Mainroad theme 的 **CSS conflict** 問題。

#### Markdown parser support

在加入數學式時，我們習慣直接使用 Latex 語法在 Markdown 中，這樣可以更容易寫出方便的數學式。而 Hugo 預設的 Markdown parser [Blackfriday](https://github.com/russross/blackfriday)(使用 Go 語言實作的 Markdown parser) 會進行某些預先處理，造成 MathJax 無法正確顯示內容以及斷行的問題。因此需要將原先的 Blackfriday parser 更換成 [Mmark](https://github.com/miekg/mmark)，即在 Markdown 文件中使用 Latex 數學式語法。方法為將檔案副檔名命名為 `*.mmark`，或是在 Markdown Front Matter 中加入 `markup: "mmark"` 來指定使用 Mmark 處理 Markdown 文件。更詳細的內容可參考[官網](https://gohugo.io/content-management/formats/)說明。

#### Katex support

雖然 Mainroad theme 雖然有支援 [MathJax](https://www.mathjax.org/)，但該 theme 的 CSS style 中有部分和 [Katex](https://khan.github.io/KaTeX/) 的 CSS 設定衝突，造成當把 Mainroad 中的 MathJax 部分的樣板原始碼換成支援 Katex 後，在顯示 Matrix 時會造成跑版。詳情狀況可參考個人發在 GitHub 上的 [Issue #1445](https://github.com/Khan/KaTeX/issues/1445)。在 Katex 小組了解問題並經過 Mainroad 作者修改樣板後即解決了該問題。

### Syntax highlighting

要在 Hugo 中讓程式碼有高亮效果，可在 config 檔案中加入以下設定

```toml
# use Chroma for syntax highlight
pygmentsCodeFences = true # 啟動 Code Fence 區域的高亮效果
pygmentsCodefencesGuessSyntax = true # 對沒有指定程式類型的 Code Fence 自行推導語言類型
pygmentsStyle = "fruity" # 指定使用的高亮風格，如 vim 或 fruity 等(預設為 "monokai")
```

若想換成其他風格可參考[這裡](https://help.farbox.com/pygments.html)的格式，將 `pgmentsStyle` 的設定修改為該風格 Hugo 就會用該風格顯示 Markdown 中 Code Fence 區段的內容。其他設定可參考 Hugo 官網關於 [Syntax Hightlighting](https://gohugo.io/content-management/syntax-highlighting/) 的章節。

> pygment 為原先 Hugo 所使用的 Syntax Hightlighting 工具， 在 Hugo 0.28 版後改為 Chroma 為預設內容，但設定檔仍維持原先的格式。

### 首頁大綱內容

Mainroad 的 Markdown 文件顯示在列表中的大綱內容，會是最前面段落開始一直延續到預設長度為止，這在排版上會很難看，因此可以手動在 Markdown 文件中加入 `<!--more-->` 標籤隔開大綱與主題內容，如下範例

```markdown

...{大綱內容}...

<!--more-->

...{文章內容}...
```

這樣在首頁的列表中就只會顯示**大綱內容**的部分。

### Disqus Support

Hugo 本身所產生的內容為靜態網頁，若要有像留言板之類的動態內容就必須藉助外部服務。Hugo 本身支援 [Disqus](https://disqus.com/) 這個知名的 Blog 留言服務樣板，只要建立帳號取得 shortname，在 config 檔案中設定完成即可。若使用的 theme 有支援應該能正確顯示

```toml
disqusShortname = "yourdiscussshortname"
```

### Google Analysis support

和 Disqus 相同，Hugo 也有內部支援 [Google Analysis](https://analytics.google.com/) 來統計你網站的流量與人潮。只要去 Google Analysis 申請一組 Tracking Id 並在 config 中加入設定。如 使用的 theme 有支援該功能則會自動設定

```toml
googleAnalytics = "yourtrackingid"
```

## Reference

-   [Hugo](https://gohugo.io/)
-   [Mainroad theme](https://github.com/Vimux/mainroad)
-   [Disqus](https://disqus.com/)
-   [Katex](https://khan.github.io/KaTeX/)
-   [从Jekyll迁移到Hugo，Hugo不完全指南](http://cjting.me/golang/migrate-to-hugo-from-jekyll/)