# zhbook

中文书籍 LaTeX 模板

本模板为中文书籍 LaTeX 模板，主文件 **main.tex** 给出使用的指南和要求，也展示了论文排版中常用的例子，包括公式、定理、表格、插图、参考文献等。

```tex
\documentclass[openany,twoside,zihao=-4]{zhbook}
```

zhbook 文档类可指定的自定义选项包括
- print 用于打印版，隐藏超链接颜色，并按双面打印需要处理空白页
- fonts 调用 `fonts/` 目录下的本地中文字体

**注意：** 本模板推荐安装 **texlive** 发行版，并且需要 **XeLaTeX** 编译运行！

在线 LaTeX 编辑可以使用 [TeXPage](https://www.texpage.com/)，设置字体 (`fontset=windows`) ，XeLaTeX 编译运行，推荐使用。

中文索引推荐使用 拼音@汉字 (如`\index{pinyin@拼音}`) 实现按拼音排序

```latex
%----- 制作索引 -----
% 自动编译 (默认字符编码排序)
% 推荐使用 \index{pinyin@拼音} 命令实现按拼音排序
\usepackage{imakeidx}
\makeindex[columns=2,intoc=true,title={索~~引}]
```

也可以 zhmakeindex 程序改变索引排序，参看 `索引使用说明.txt`

TeX 文件编译顺序:
```bash
xelatex main
bibtex main
makeindex main
xelatex main
xelatex main
```

快速编译脚本:

makefiles.bat 和 makefiles.sh 包含索引生成的所有编译命令。

欢迎提出意见或建议。
