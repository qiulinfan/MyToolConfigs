# 本地 compile & build Latex project

从 0 开始.

## 安装 Tex Live / MacTex

https://tug.org/texlive/ -> install on Windows -> [install-tl-windows.exe](https://mirror.ctan.org/systems/texlive/tlnet/install-tl-windows.exe).

这个完整版

mac也在这个链接里: https://tug.org/mactex/ -> [**MacTeX Download**](https://tug.org/mactex/mactex-download.html).



这个东西会安装很久. 我这里装了 接近两个小时. 内容是 latex 全家桶. 

可以用

```bash
tlmgr info scheme-full
```

来验证装的是不是 full version.

安装包含了:

- 几乎所有 LaTeX 宏包 (几千个)
- 语言支持 (中文, 日文, 韩文, 阿拉伯文等)
- 引擎: pdfTeX, XeTeX, LuaTeX, MetaPost, BibTeX, Biber
- 各种字体
- 文档, 示例, 索引文件



另一种选择是 MikTex. 但是我觉得不如安装这个完整的 Texlive. 这相当于轮椅, 后续用 VSCode 的 Latex Workshop 的时候只需要配置 .vscode/settings.json 就可以直接用了. 如果用 MikTex 的话还得配置, 比如安装 strawberry perl, 安装各种小 packages 等.
(既然有免费的全家桶那就用呗



## VSCode Latex workshop.

VSCode 最好的 Latex 支持. 

不用配置文件路径, 它能找到我们的  texlive 安装的引擎和 packages



配置文件 settings.json: lualatex, 生成文件放入 build/, 自动 compile

```json
{
  "latex-workshop.latex.tools": [
    {
      "name": "lualatex",
      "command": "lualatex",
      "args": [
        "-interaction=nonstopmode",
        "-synctex=1",
        "-output-directory=build",
        "%DOC%"
      ]
    }
  ],
  "latex-workshop.latex.recipes": [
    {
      "name": "lualatex",
      "tools": ["lualatex", "lualatex"]
    }
  ],
  "latex-workshop.latex.recipe.default": "lualatex",
  "latex-workshop.latex.outDir": "build",
  "latex-workshop.latex.auxDir": "build",
  "latex-workshop.view.pdf.viewer": "tab",
  "latex-workshop.view.pdf.internal.synctex.keybinding": "double-click",
  "latex-workshop.latex.autoBuild.run": "onSave",
  "latex-workshop.latex.autoClean.run": "onFailed",
  "latex-workshop.view.pdf.refresh.viewer": "auto"
}

```

