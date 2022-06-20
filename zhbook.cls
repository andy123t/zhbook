%%
%%	This is file `zhbook.cls',
%%
%%	@author andy123t
%%	@date 2022/06/20
%%	@version v1.7
%%	@address https://github.com/andy123t/zhbook
%%

% ---------- 定义的新的Class ----------
\ProvidesClass{zhbook}[2022/06/20 v1.7]
\NeedsTeXFormat{LaTeX2e}

% ---------- 定义的新的Options ----------
\newif\ifprint
\DeclareOption{print}{\printtrue}
\DeclareOption{openany}{\PassOptionsToClass{openany}{ctexbook}}
\DeclareOption{openright}{\PassOptionsToClass{openright}{ctexbook}}
\DeclareOption{twoside}{\PassOptionsToClass{twoside}{ctexbook}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ProcessOptions\relax

% ---------- 载入Class ----------
\LoadClass[UTF8,a4paper]{ctexbook}[2017/04/01]%
\@ifclasslater{ctexbook}{2017/01/01}{}{%
    \ClassError{shnuthesis}{ctex >= 2017/01/01 is required ...}{}%
}

% ---------- 中文字体宏包 ----------
\PassOptionsToPackage{no-math}{fontspec}

% ---------- 定义页边距 ----------
\RequirePackage{geometry}
%\geometry{left=2.5cm,right=2.5cm,top=3.0cm,bottom=2.7cm}
\geometry{left=3cm,right=3cm,top=3.2cm,bottom=2.9cm}
\setlength{\headheight}{18pt}
\setlength{\headsep}{18pt}     % 页眉位置
\setlength{\footskip}{28pt}    % 页脚位置

% ---------- 常用宏包 ----------
\RequirePackage{amsmath,amssymb,amsthm,amsfonts}  % AMS公式
\RequirePackage{bm}         % 数学公式黑斜体
\RequirePackage{mathrsfs}   % 数学英文花体
\RequirePackage{graphicx}
\RequirePackage{tabularx}
\RequirePackage{booktabs}
\RequirePackage{float}
\RequirePackage{longtable}  % 长表格
\RequirePackage{multirow}   % 表格多行合并
\RequirePackage{color,xcolor}
\RequirePackage{fancyhdr}
\RequirePackage{makecell}
\RequirePackage{etoolbox}
\RequirePackage{titletoc}

% ------- 重新定义 cleardoublepage --------
\renewcommand{\cleardoublepage}{\clearpage
    \clearpage\if@twoside\ifodd\c@page\else%
    \thispagestyle{empty}%
    \hbox{}\newpage\if@twocolumn\hbox{}\newpage\fi\fi\fi%
}

% ----- 设置超链接 -----
\RequirePackage{hyperref}
\hypersetup{
	colorlinks = true,
	linkcolor = black,
	citecolor = blue,
	filecolor = blue,
    urlcolor =blue,
}

\ifprint
	\hypersetup{hidelinks} % remove link color and border
\fi

% --------设置图片的路径 ---------
\graphicspath{{./figure/}{./figures/}{./image/}{./images/}}

% ---------- 设置章节目录的深度 -------------
\setcounter{secnumdepth}{3}
\setcounter{tocdepth}{3}

\newcommand{\chpzihao}{\fontsize{20pt}{20pt}\selectfont}

% ---------- 定义章节标题格式 ------------
%--- chapter ---
\ctexset{
    chapter = {
        format = \linespread{1.0}\heiti\chpzihao\centering,
        nameformat = {},
        titleformat = {},
        number = \arabic{chapter},
        numberformat = {},
        aftername = \quad,
        beforeskip = {4pt},
        afterskip = {24pt},
        pagestyle = plain,
    }
}
%--- section ---
\ctexset{
    section = {
        format = \linespread{1.0}\heiti\zihao{-3}\raggedright,
        numberformat = {},
        aftername = \quad,
        beforeskip = {24pt},
        afterskip = {6pt},
    }
}
%--- subsection ---
\ctexset{
    subsection = {
        format = \linespread{1.0}\heiti\zihao{4}\raggedright,
        numberformat = {},
        aftername = \quad,
        beforeskip = {12pt},
        afterskip = {6pt},
    }
}
%--- subsubsection ---
\ctexset{
    subsubsection = {
        format = \linespread{1.0}\heiti\zihao{-4}\raggedright,
        numberformat = {},
        aftername = \quad,
        beforeskip = {12pt},
        afterskip = {6pt},
    }
}
%--- appendix ---
\ctexset{
    appendix = {
        numbering = true,
        number = \Alph{chapter},
    }
}

% ---------- 算法宏包及设置 ----------
\RequirePackage{algorithm}
\RequirePackage{algpseudocode}
\floatname{algorithm}{算法}
\algrenewcommand\algorithmicrequire{\textbf{输入:}}
\algrenewcommand\algorithmicensure{\textbf{输出:}}

% ------------- 设置附录 -----------
\RequirePackage{titletoc}
%\RequirePackage[title,titletoc]{appendix}
%\renewcommand{\appendixname}{附录}

% -------------- 定义页眉页脚 -------------------
% 定义页眉和页脚 使用 fancyhdr 宏包

% ------------ 设置分隔线宽度 ------------
\renewcommand{\headrulewidth}{0.4pt}    % 在页眉下0.5pt宽的分隔线
\renewcommand{\footrulewidth}{0pt}      % 在页脚不画分隔线。

% ------------ 设置页眉样式 ------------
\renewcommand{\headrule}{%
	\if@fancyplain\let\headrulewidth\plainheadrulewidth\fi
	\hrule\@height 1.5pt \@width\headwidth %上面线1pt粗
	\vskip 1.6pt %两条线的距离1pt
	\hrule\@height 0.4pt \@width\headwidth %下面线0.4pt粗
    \vskip-1.5pt 
}

% \renewcommand{\headrule}{%
% 	\if@fancyplain\let\headrulewidth\plainheadrulewidth\fi
% 	\hrule\@height 0.5pt \@width\headwidth %分割线0.5pt粗
%     \vskip-1.5pt 
% }

% ------------ 设置页眉样式 -----------
\newcommand{\headstyle}{
	% \fancyhead[R]{\fangsong\zihao{5} \leftmark}
	% \fancyhead[L]{\fangsong\zihao{5} 书籍的名字}
	\fancyhead[RO,LE]{\fangsong\zihao{5} \thinspace\thepage\thinspace}
	\fancyhead[LO,RE]{\fangsong\zihao{5} \thinspace\nouppercase{\leftmark}\thinspace}
}

% ------- 设置页脚样式 ----------
% \newcommand{\footstyle}{
% \fancyfoot[C]{\zihao{5} \thepage}
% %\fancyfoot[LE]{\zihao{5} \thepage}
% %\fancyfoot[RO]{\zihao{5} \thepage}
% }

\newcommand{\footstyle}{}
\pagestyle{empty}
\pagestyle{fancy}
\fancyhf{} %清空原有样式
\headstyle
\footstyle

% ------ 定义一种新的格式叫做main ------------
\fancypagestyle{main}{%
    \pagestyle{fancyplain} 
	\fancyhf{} %清空原有样式
	\headstyle
	\footstyle
}

% ----------- 中文段落缩进和行距 ------------
\setlength{\parindent}{2em}                 % 首行两个汉字的缩进量
\setlength{\parskip}{4pt plus 1pt minus 1pt}  % 段落之间的竖直距离
\linespread{1.35}  % line space setting
%\renewcommand{\baselinestretch}{1.35}        % 定义行距
%\topskip=15pt   % 书写区域顶部空白
%\setlength{\baselineskip}{24pt}

% ------------------- 浮动对象设置 ---------------------
% 浮动对象的缺省值稍微宽松一点，从而防止幅度对象占据过多的文本页面
% 也可以防止在很大空白的浮动页上放置很小的图形
\renewcommand{\textfraction}{0.15}
\renewcommand{\topfraction}{0.85}
\renewcommand{\bottomfraction}{0.65}
\renewcommand{\floatpagefraction}{0.60}

% ---------------- 设置图表格式 ---------------
\numberwithin{figure}{chapter}
\numberwithin{equation}{chapter}
%\renewcommand{\thetable}{\thechapter.\arabic{table}}
%\renewcommand{\thefigure}{\thechapter.\arabic{figure}}

% --------- 定制图形和表格标题的样式 --------------
\RequirePackage{caption}
\captionsetup{font={small,singlespacing},labelformat={default},labelsep=quad}
\captionsetup[figure]{position=bottom,skip={5pt},name={图}}
\captionsetup[table]{position=top,skip={2pt},name={表}}
\setlength{\textfloatsep}{12pt plus 2pt minus 2pt}
\setlength{\floatsep}{10pt plus 2pt minus 2pt}
\setlength{\intextsep}{10pt plus 2pt minus 2pt}
\setlength{\abovecaptionskip}{2pt plus 1pt minus 1pt}
\setlength{\belowcaptionskip}{3pt plus 1pt minus 2pt}
%\setlength{\itemsep}{3pt plus 1pt minus 2pt}

% ----- 重新设置图表autoref -------
\renewcommand{\figureautorefname}{图}
\renewcommand{\tableautorefname}{表}

% --- 使用tabularx库并定义新的左右中格式 ----
\newcolumntype{L}{X}
\newcolumntype{C}{>{\centering \arraybackslash}X}
\newcolumntype{R}{>{\raggedleft \arraybackslash}X}
\newcolumntype{P}[1]{>{\centering \arraybackslash}p{#1}}

% ------------ 设置三线表格式 ------
% \setlength{\heavyrulewidth}{1.5pt}
% \setlength{\lightrulewidth}{0.5pt}
% \setlength{\cmidrulewidth}{0.5pt}
% \setlength{\aboverulesep}{0pt}
% \setlength{\belowrulesep}{0pt}
% \setlength{\abovetopsep}{0pt}
% \setlength{\belowbottomsep}{0pt}

% -------- 重新定义图和表的浮动环境 ---------
\newenvironment{generalfig}[3][htbp]{
	\def \figcaption {#2}
	\def \figlabel {#3}
	\begin{figure}[#1]
		\centering
	}{
		\caption{\figcaption} \label{\figlabel}
	\end{figure}
}
\newenvironment{generaltab}[3][htbp]{
	\def \tabcaption {#2}
	\def \tablabel {#3}
	\begin{table}[#1]
		\caption{\tabcaption} \label{\tablabel}
		\zihao{5}
		\centering
	}{
	\end{table}
}

%------------- 数学定理设置 ---------------
\theoremstyle{plain} 
\newtheorem{definition}{定义}[chapter]
\newtheorem{proposition}{命题}[chapter]
\newtheorem{lemma}{引理}[chapter]
\newtheorem{theorem}{定理}[chapter]
\newtheorem{example}{例}[chapter]
\newtheorem{corollary}{推论}[chapter]
\newtheorem{remark}{注}[chapter]
\newtheorem{exercise}{练习}[chapter]
\newtheorem{assumption}{假设}[chapter]
\newtheorem{axiom}{公理}[chapter]
\newtheorem{property}{性质}[chapter]
\newtheorem{conjecture}{猜想}[chapter]
%\renewcommand{\qedsymbol}{$\blacksquare$}
\renewcommand{\proofname}{证明}
\renewenvironment{proof}[1][\proofname]{\par
  \pushQED{\qed}%
  \normalfont \topsep6\p@\@plus6\p@\relax
  \trivlist
  \item[\hskip\labelsep
        \bfseries
    #1\@addpunct{\,:\,}]\ignorespaces
}{%
	\popQED\endtrivlist\@endpefalse
}

% -------------- 数学公式设置 ---------------
\allowdisplaybreaks[4]   % 部分公式可以分页

% ----- 设置公式间距 ------
\AtBeginDocument{
	\setlength{\abovedisplayskip}{5pt plus 2pt minus 2pt}
	\setlength{\belowdisplayskip}{5pt plus 2pt minus 2pt}
	\setlength{\abovedisplayshortskip}{3pt plus 1pt minus 1pt}
	\setlength{\belowdisplayshortskip}{3pt plus 1pt minus 1pt}
	%\setlength{\arraycolsep}{2pt}   % array中列之间空白长度
}

% ------- 公式编号带章节 ----------
\numberwithin{equation}{chapter}
%\renewcommand{\theequation}{\arabic{chapter}.\arabic{equation}}

% 重新设置公式autoref
\renewcommand{\equationautorefname}{公式}

% ---- 定义列表项的样式 -----
\RequirePackage{enumitem}
\setlist{nolistsep}
% \setitemize{itemsep=3pt}

% ------------- 定义新的标题页面 -------------------

% ------ 添加几个新的文档属性 ------
\def \defsubtitle {}
\def \defcollege {}
\def \defpubyear {}
\def \defbioinfo {}
\def \defpublisher {}
\newcommand{\subtitle}[1]{\def \defsubtitle {#1}}
\newcommand{\college}[1]{\def \defcollege {#1}}
\newcommand{\pubyear}[1]{\def \defpubyear {#1}}
\newcommand{\publisher}[1]{\def \defpublisher {#1}}
\newcommand\bioinfo[1]{\def \defbioinfo {#1}}

% ------- 重置命令 maketitle -------
\renewcommand{\maketitle}[1][15em]{
	\phantomsection
	\pdfbookmark[0]{封~面}{cover}
	\begin{titlepage}
			\centering
			\scshape  % 对标题页上的所有文本使用小写字母

			\vspace*{20mm}

			\rule{\textwidth}{1.6pt}\vspace*{-\baselineskip}\vspace*{2pt}  % 粗水平线
    	    \rule{\textwidth}{0.4pt}   % 细水平线

			\vspace*{0.75\baselineskip} % 标题上方的空白

			\begin{center}
			\parbox[t]{15cm}{\centering \zihao{1} \heiti \@title}
			\end{center}

			\vspace*{0.75\baselineskip} % 标题下方的空白
	
			\rule{\textwidth}{0.4pt}\vspace*{-\baselineskip}\vspace{3.2pt} % 细水平线
			\rule{\textwidth}{1.6pt}   % 粗水平线

			\vspace*{1\baselineskip}  % 标题栏后的空白

    	\large 
    	\@author
    	\vspace*{0.1\baselineskip}

    	\defcollege
    	\vspace*{0.1\baselineskip}
    	
    	\defbioinfo
    	\vspace*{0.1\baselineskip}
    	
    	\vfill

    	\plogo % Publisher logo
	
		\vspace*{0.3\baselineskip} % Whitespace under the publisher logo
	
		\defpubyear % Publication year

		{\large \defpublisher} % Publisher

		\vspace*{0.3\baselineskip}

	\end{titlepage}
	\clearpage
	\if@openright
        \cleardoublepage
    \fi
}

% ------------ 定义新的声明页面 --------------

% 定义三个条件语句
% \newcommand{\encryption}[1]{
% 	\IfStrEqCase{#1}{{empty}{$\square$}
% 		{true}{$\text{\rlap{\checkmark}}\square$ }
% 		{false}{$\square$}}
% 	[$\square$]
% }
% \newcommand{\nonencryption}[1]{
% 	\IfStrEqCase{#1}{{empty}{$\square$}
% 		{true}{$\square$}
% 		{false}{$\text{\rlap{\checkmark}}\square$}}
% 	[$\square$]
% }
% \newcommand{\encryptionyear}[2]{
% 	\IfStrEqCase{#1}{{empty}{}
% 		{true}{#2}
% 		{false}{}}
% }

% ------------------ 中文摘要环境 -------------
\newenvironment{cnabstract}[1]{
	\def \cnkeyword {#1}
	\clearpage
	\phantomsection
	\addcontentsline{toc}{chapter}{摘~要}
	\chaptermark{摘~~要}
	\vspace*{-2ex}
	\begin{center} \heiti \字号 摘~~~要 \end{center}
	\vspace*{3ex}
	\par
}{
	\vspace{-1ex}
	\paragraph{\heiti 关键词：} \cnkeyword
	\clearpage
	\if@openright
        \cleardoublepage
    \fi
}

% ----------------- 英文摘要环境 ----------------
\newenvironment{enabstract}[1]{
	\def \enkeyword {#1}
	\clearpage
	\phantomsection
	\addcontentsline{toc}{chapter}{\textbf{Abstract}}
	\chaptermark{Abstract}
	\vspace*{-2ex}
	\begin{center} \chpzihao \bfseries Abstract \end{center} 
	\vspace*{3ex}
	\par
}{
	\vspace{-1ex}
	\paragraph{\bfseries Key Words: } \enkeyword
	\clearpage
	\if@openright
        \cleardoublepage
    \fi
}

% ------------------ 前言环境 -------------
\newenvironment{preface}{
	\clearpage
	\phantomsection
	\addcontentsline{toc}{chapter}{前~言}
	\chaptermark{前~言}
	\vspace*{-1ex}
	\begin{center} \chpzihao \bfseries 前~~言 \end{center} 
	\vspace*{3ex}
	%\chapter*{前~~言}
}{
	\clearpage
	\if@openright
        \cleardoublepage
    \fi
}

% ------------- 定义新的目录页面 ----------------
\RequirePackage{tocloft}
\renewcommand{\cfttoctitlefont}{\hfill \heiti \chpzihao}
\renewcommand{\cftaftertoctitle}{\hfill}
\renewcommand{\cftloftitlefont}{\hfill \heiti \chpzihao}
\renewcommand{\cftafterloftitle}{\hfill}
\renewcommand{\cftlottitlefont}{\hfill \heiti \chpzihao}
\renewcommand{\cftafterlottitle}{\hfill}
%\renewcommand{\cftchappresnum}{第}
%\renewcommand{\cftchapaftersnum}{章}
%\renewcommand{\cftchapaftersnumb}{\hspace{28pt}}
\renewcommand{\contentsname}{目~~录}
\renewcommand{\listfigurename}{插图清单}
\renewcommand{\listtablename}{表格清单}
\setlength{\cftbeforetoctitleskip}{8pt}
\setlength{\cftaftertoctitleskip}{20pt}
\setlength{\cftbeforechapskip}{12pt}
\setlength{\cftbeforesecskip}{3pt}
\setlength{\cftbeforesubsecskip}{3pt}
\renewcommand{\cftdot}{$\cdot$}
\renewcommand{\cftdotsep}{3}
\renewcommand{\cftchapdotsep}{\cftdotsep}
\renewcommand\cftchapleader{\cftdotfill{\cftchapdotsep}}
\renewcommand{\cftsecdotsep}{\cftdotsep}

% 使用条件语句
\RequirePackage{xstring}

% 定义两个新语句
% 第一个语句更改fancyhdr样式
\newcommand{\plainfooterstyle}[1]{
	\IfStrEqCase{#1}{{nopagenum}{}
		{pagenum}{\footstyle}
		{pagenumtoc}{\footstyle}}
}
% 第二个语句在目录中添加目录标签
\newcommand{\addtoctotoc}[1]{
	\IfStrEqCase{#1}{{nopagenum}{}
		{pagenum}{}
		{pagenumtoc}{\phantomsection
			\addcontentsline{toc}{chapter}{目~录}}}
}

% ----------- 设置新的生成目录命令 -------------
\let \oldtableofcontens \tableofcontents
\newcommand{\maketoc}[1][nopagenum]{
	% 修改hdr原plain格式
	\fancypagestyle{plain}{%
		\fancyhf{} %清空原有样式
		\headstyle
		\plainfooterstyle{#1}
	}
	% 设置目录hdr和页码选项
	\clearpage
	\pagestyle{plain}
	\addtoctotoc{#1}
	\tableofcontents
	\if@openright
        \cleardoublepage
    \fi
	\pagestyle{main}
}

% ----------- 设置插图清单和表格清单格式 ----------
\titlecontents{figure}[0pt]{}{
\figureautorefname\hspace*{0.5em}\thecontentslabel\quad}{}{
\titlerule*[8pt]{$\cdot$}\contentspage}
\titlecontents{table}[0pt]{}{
\tableautorefname\hspace*{0.5em}\thecontentslabel\quad}{}{
\titlerule*[8pt]{$\cdot$}\contentspage}

% ----------- 重定义插图清单和表格清单 ----------
\newcommand\makelof{
    \clearpage
	\phantomsection
	\addcontentsline{toc}{chapter}{\listfigurename}
    \chapter*{\listfigurename}
    \@starttoc{lof}
    \clearpage
    \if@openright
        \cleardoublepage
    \fi
}
\newcommand\makelot{
    \clearpage
    \phantomsection
    \addcontentsline{toc}{chapter}{\listtablename}
    \chapter*{\listtablename}
    \@starttoc{lot}
    \clearpage
    \if@openright
        \cleardoublepage
    \fi
}

% ---------- 定义主要符号表环境 -----------
\newenvironment{symbolpage}{
	\clearpage
	\phantomsection
	\addcontentsline{toc}{chapter}{主要符号表}
	\chapter*{主要符号表}
	\chaptermark{主要符号表}
}{
	\clearpage
	\if@openright
        \cleardoublepage
    \fi
}

% \let \oldappendix \appendix
% \renewcommand{\appendix}[1]{
% 	\clearpage
% 	\renewcommand{\theequation}{\Alph{chapter}\arabic{equation}}
% 	\renewcommand{\thefigure}{\Alph{chapter}\arabic{equation}}
% 	\renewcommand{\thetable}{\Alph{chapter}\arabic{equation}}
% 	\oldappendix{#1}
% }

% ----------- 重新定义参考文献页 -----------
%\bibliographystyle{plain}
\ctexset{bibname={参考文献}}

% 设置新的参考文献命令
\let \oldbibliography \bibliography
\renewcommand{\bibliography}[1]{
	% 添加到目录
	\clearpage
	\phantomsection
	\addcontentsline{toc}{chapter}{参考文献}
	\oldbibliography{#1}
}

% End of file `zhbook.cls'.
