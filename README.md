# zhbook

中文书籍 LaTeX 模板

**注意：** 本模板推荐安装 **texlive** 发行版，并且需要 **XeLaTeX** 编译运行！

```tex
\documentclass[openany,twoside,zihao=-4]{zhbook}
```

本模板为中文书籍 LaTeX 模板，主文件 **main.tex** 给出使用的指南和要求，也展示了论文排版中常用的例子，包括公式、定理、表格、插图、参考文献等。

在线 LaTeX 编辑可以使用 [TeXPage](https://www.texpage.com/)，设置字体 (`fontset=windows`) ，XeLaTeX 编译运行，推荐使用。

中文索引 (默认拼音排序) 使用 zhmakeindex, 参看文件 **索引使用说明.txt**

```latex
% 索引宏包与相关设置
\usepackage[noautomatic]{imakeidx}
\makeindex[columns=2,intoc=true,title={索~~引}]
```

TeX 文件编译顺序:
```bash
xelatex main
bibtex main
makeindex main
zhmakeindex main
xelatex main
xelatex main
```

快速编辑脚本:

makefiles.bat 和 makefiles.sh 包含索引生成的所有编译命令。

makezhindex.bat 和 makezhindex.sh 只包含索引生成的编译命令。

欢迎提出意见或建议。
