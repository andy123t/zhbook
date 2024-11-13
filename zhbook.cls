%%
%% This is file `zhbook.cls',
%%
%% @author andy123t
%% @date 2024/11/13
%% @version v2.5
%% @address https://github.com/andy123t/zhbook
%%

%---------- 定义的新的Class ----------
\ProvidesClass{zhbook}[2024/11/13 v2.5]
\NeedsTeXFormat{LaTeX2e}

%---------- 定义的新的Options ----------
\newif\ifprint
\DeclareOption{print}{\printtrue}
\DeclareOption{openany}{\PassOptionsToClass{openany}{ctexbook}}
\DeclareOption{openright}{\PassOptionsToClass{openright}{ctexbook}}
\DeclareOption{twoside}{\PassOptionsToClass{twoside}{ctexbook}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ProcessOptions\relax

%---------- 中文字体宏包 ----------
\PassOptionsToPackage{no-math}{fontspec}

%---------- 载入Class ----------
\LoadClass[UTF8,a4paper]{ctexbook}
\@ifclasslater{ctexbook}{2017/01/01}{}{%
    \ClassError{zhbook}{ctex >= 2017/01/01 is required ...}{}%
}

%---------- 定义页边距 ----------
\RequirePackage{geometry}
\geometry{left=3.0cm,right=3.0cm,top=3.0cm,bottom=2.8cm}
%\geometry{centering,body={16cm,22cm}}
%\geometry{left=2.5cm,right=2.5cm,top=2.8cm,bottom=2.6cm}
\setlength{\headheight}{18pt}
\setlength{\headsep}{18pt}     % 页眉位置
\setlength{\footskip}{28pt}    % 页脚位置

%---------- 常用宏包 ----------
\RequirePackage{amsmath,amssymb,amsthm}
\RequirePackage{mathrsfs}
\RequirePackage{graphicx}
\RequirePackage{tabularx}
\RequirePackage{booktabs}
\RequirePackage{float}
\RequirePackage{longtable}
\RequirePackage{multirow}
\RequirePackage{multicol}
\RequirePackage{makecell}
\RequirePackage{color,xcolor}
\RequirePackage{fancyhdr}
\RequirePackage{etoolbox}
\RequirePackage{anyfontsize}
\RequirePackage{titletoc}
\RequirePackage{pdfpages}
\RequirePackage[numbered]{bookmark}

%---------- 定义文档属性格式 ----------
\global\let\@title\@empty
\global\let\@author\@empty
\global\let\@date\@empty
\newcommand\subtitle{\gdef\@subtitle}
%\newcommand\institute{\gdef\@institute}
\newcommand\version{\gdef\@version}
\newcommand\extrainfo{\gdef\@extrainfo}
\newcommand\bioinfo[2]{\gdef\@bioinfo{{#1}：#2}}

%---------- 重新定义 cleardoublepage ----------
\renewcommand{\cleardoublepage}{%
    \clearpage\if@twoside\ifodd\c@page\else%
    \thispagestyle{empty}%
    \hbox{}\newpage\if@twocolumn\hbox{}\newpage\fi\fi\fi
}

%---------- 设置超链接 ----------
\RequirePackage{hyperref}
\hypersetup{%
    colorlinks=true,
    linkcolor=black,
    citecolor=blue,
    filecolor=blue,
    urlcolor=blue
}

\ifprint
    \hypersetup{hidelinks} % remove link color and border
\fi

%---------- 设置正文前页码为小写罗马数字 ----------
\renewcommand\frontmatter{%
    \ifprint\cleardoublepage\else\clearpage\fi
    \@mainmatterfalse
    \pagenumbering{roman}%
}

%---------- 设置正文页码为阿拉伯数字 ----------
\renewcommand\mainmatter{%
    \ifprint\cleardoublepage\else\clearpage\fi
    \pagenumbering{arabic}%
    \@mainmattertrue
}

%---------- 设置图片的路径 ----------
\graphicspath{{./figure/}{./figures/}{./image/}{./images/}}

%---------- 设置章节目录的深度 ----------
\setcounter{secnumdepth}{3}
\setcounter{tocdepth}{3}

%---------- 设置章节字号 ----------
\newcommand{\chapfont}{\fontsize{20bp}{28bp}\selectfont}

%---------- 定义章节标题格式 ----------
%--- chapter ---
\ctexset{
    chapter = {
        format = \linespread{1.0}\sffamily\heiti\chapfont\centering,
        nameformat = {},
        titleformat = {},
        number = \arabic{chapter},
        numberformat = {},
        aftername = \quad,
        beforeskip = {6pt},
        afterskip = {24pt},
        %pagestyle = main,
    },
    section = {
        format = \linespread{1.0}\sffamily\heiti\zihao{-3}\raggedright,
        numberformat = {},
        aftername = \quad,
        beforeskip = {18pt},
        afterskip = {6pt},
    },
    subsection = {
        format = \linespread{1.0}\sffamily\heiti\zihao{4}\raggedright,
        numberformat = {},
        aftername = \quad,
        beforeskip = {12pt},
        afterskip = {6pt},
    },
    subsubsection = {
        format = \linespread{1.0}\sffamily\heiti\zihao{-4}\raggedright,
        numberformat = {},
        aftername = \quad,
        beforeskip = {12pt},
        afterskip = {6pt},
    },
    appendix = {
        numbering = true,
        number = \Alph{chapter},
    },
}

%---------- 算法宏包及设置 ----------
\RequirePackage{algorithm,algorithmicx}
\RequirePackage{algpseudocode}
\floatname{algorithm}{算法}
\algrenewcommand\algorithmicrequire{\textbf{输入:}}
\algrenewcommand\algorithmicensure{\textbf{输出:}}

%------------- 设置附录 -----------
%\renewcommand{\appendixname}{附录}

%---------- 定义页眉页脚 ----------
% 定义页眉和页脚 使用 fancyhdr 宏包

%---------- 设置页眉样式 ----------
\newcommand{\headstyle}{%
    %\fancyhead[C]{\fangsong\zihao{5} \@title}
    \fancyhead[RO,LE]{\fangsong\zihao{5}$\cdot$\:\thepage\:$\cdot$}
    \fancyhead[LO,RE]{\fangsong\zihao{5}\nouppercase{\leftmark}}
}

%---------- 设置页脚样式 ----------
\newcommand{\footstyle}{%
    \fancyfoot[C]{\zihao{5}\thepage}
    %\fancyfoot[LE]{\zihao{5}\thepage}
    %\fancyfoot[RO]{\zihao{5}\thepage}
}

%---------- 重定义plain样式 ----------
\fancypagestyle{plain}{%
    \fancyhf{}
    %\footstyle
    \renewcommand{\headrulewidth}{0pt}
    \renewcommand{\footrulewidth}{0pt}
}

%---------- 定义main样式 ----------
\fancypagestyle{main}{%
    \fancyhf{}
    \headstyle
    \renewcommand{\headrulewidth}{0.5pt}
    \renewcommand{\footrulewidth}{0pt}
}

\pagestyle{main}

%---------- 中文段落缩进和行距 ----------
\setlength{\parindent}{2em}
\setlength{\parskip}{4pt plus 1pt minus 1pt}
\linespread{1.35}  % line space setting
%\renewcommand{\baselinestretch}{1.35}
%\topskip=15pt   % 书写区域顶部空白
%\setlength{\baselineskip}{24pt}

%---------- 浮动对象设置 ----------
% 浮动对象的缺省值稍微宽松一点
\renewcommand{\textfraction}{0.15}
\renewcommand{\topfraction}{0.85}
\renewcommand{\bottomfraction}{0.65}
\renewcommand{\floatpagefraction}{0.60}

%---------- 设置图表格式 ----------
\numberwithin{figure}{chapter}
\numberwithin{equation}{chapter}
%\renewcommand{\thetable}{\thechapter.\arabic{table}}
%\renewcommand{\thefigure}{\thechapter.\arabic{figure}}

%--------- 定制图形和表格标题的样式 ----------
\RequirePackage{caption}
\captionsetup{font={small,singlespacing},labelformat={default},labelsep=quad}
\captionsetup[figure]{position=bottom,skip={6pt},name={图}}
\captionsetup[table]{position=top,skip={3pt},name={表}}
\setlength{\textfloatsep}{12pt plus 2pt minus 2pt}
\setlength{\floatsep}{10pt plus 2pt minus 2pt}
\setlength{\intextsep}{10pt plus 2pt minus 2pt}
%\setlength{\abovecaptionskip}{2pt plus 1pt minus 1pt}
%\setlength{\belowcaptionskip}{3pt plus 1pt minus 2pt}

%---------- 重新设置图表autoref ----------
\renewcommand{\figureautorefname}{图}
\renewcommand{\tableautorefname}{表}

%---------- 使用tabularx库并定义新的左右中格式 ----------
\newcolumntype{L}{X}
\newcolumntype{C}{>{\centering \arraybackslash}X}
\newcolumntype{R}{>{\raggedleft \arraybackslash}X}
\newcolumntype{P}[1]{>{\centering \arraybackslash}p{#1}}

%---------- 设置三线表格式 ----------
% \setlength{\heavyrulewidth}{1.5pt}
% \setlength{\lightrulewidth}{0.5pt}
% \setlength{\cmidrulewidth}{0.5pt}
% \setlength{\aboverulesep}{0pt}
% \setlength{\belowrulesep}{0pt}
% \setlength{\abovetopsep}{0pt}
% \setlength{\belowbottomsep}{0pt}

%---------- 数学定理设置 ----------
\newtheoremstyle{zhbook}{0.5\topsep}{0.5\topsep}%
{\itshape}{}{\bfseries}{.}{5pt plus 1pt minus 1pt}{}
%\theoremstyle{plain}
\theoremstyle{zhbook}
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
\renewenvironment{proof}[1][\proofname]{%
    \par\pushQED{\qed}%
    %\normalfont \topsep6\p@\@plus6\p@\relax
    \normalfont \topsep3\p@\@plus3\p@\relax
    \trivlist\item[\hskip\labelsep
    \bfseries #1\@addpunct{\,:\,}]\ignorespaces
}{%
    \popQED\endtrivlist\@endpefalse
}

%---------- 数学公式设置 ----------
\allowdisplaybreaks[4]

%---------- 设置公式间距 ----------
\AtBeginDocument{%
    \setlength{\abovedisplayskip}{6pt plus 2pt minus 2pt}
    \setlength{\belowdisplayskip}{6pt plus 2pt minus 2pt}
    \setlength{\abovedisplayshortskip}{3pt plus 1pt minus 1pt}
    \setlength{\belowdisplayshortskip}{3pt plus 1pt minus 1pt}
    %\setlength{\arraycolsep}{2pt}
}

%------- 公式编号带章节 ----------
\numberwithin{equation}{chapter}
%\renewcommand{\theequation}{\arabic{chapter}.\arabic{equation}}

% 重新设置公式autoref
\renewcommand{\equationautorefname}{公式}

%---------- 定义列表项的样式 ----------
\RequirePackage{enumitem}
\setlist{nolistsep}

%---------- 定义新的标题页面 ----------
\renewcommand{\maketitle}[1][15em]{%
    \clearpage
    \phantomsection
    \pdfbookmark[0]{封~~面}{cover}
    \begin{titlepage}
        \centering

        \vspace*{3.0\baselineskip}%

        \rule{\textwidth}{1.6pt}\vspace*{-\baselineskip}\vspace*{2pt}  % thick line
        \rule{\textwidth}{0.5pt}   % thin line

        \vspace*{0.75\baselineskip} % blank space above the title

        \parbox[t]{15cm}{\centering\zihao{1}\sffamily\heiti\@title%
        \ifx\@subtitle\undefined{}\else
        \par
        \vspace*{0.25\baselineskip}%
        \zihao{2}\sffamily\heiti\@subtitle
        \fi
        }%

        \vspace*{0.75\baselineskip} % blank space under the title
    
        \rule{\textwidth}{0.5pt}\vspace*{-\baselineskip}\vspace{3.2pt} % thin line
        \rule{\textwidth}{1.6pt}   % thick line

        \vspace*{1\baselineskip}  % blank space after title

        {\large\kaishu\renewcommand{\arraystretch}{1.2}%
        \begin{tabular}{c}
        \ifx\@author\empty{}\else 作者：\@author \\ \fi
        %\ifx\@institute\undefined{}\else 机构：\@institute \\ \fi
        \ifx\@date\empty{}\else 日期：\@date \\ \fi
        \ifx\@version\undefined{}\else 版本：\@version \\ \fi
        \ifx\@bioinfo\undefined{}\else \@bioinfo \\ \fi
        \end{tabular}}

        \vspace*{\fill}%

        {\large \ifx\@extrainfo\undefined{}\else \@extrainfo \fi} % extra info

        \vspace*{0.1\baselineskip}%
    \end{titlepage}
    \ifprint
        \cleardoublepage
        \hypersetup{hidelinks} % remove link color and border
    \else
        \clearpage
    \fi
    \if@openright
        \cleardoublepage
    \fi
}

%---------- 定义中英文关键词 ----------
%--- 中文关键词
\newcommand{\cnkeywords}[1]{%
    \vspace*{0.8\baselineskip}\par
    \noindent {\bfseries 关键词:~} #1%
}
%--- 英文关键词
\newcommand{\enkeywords}[1]{%
    \vspace*{0.8\baselineskip}\par
    \noindent {\bfseries Key Words:~} #1%
}

%---------- 中文摘要环境 ----------
\newenvironment{cnabstract}{%
    \clearpage
    \pagestyle{main}
    \phantomsection
    \addcontentsline{toc}{chapter}{摘~~要}
    \chapter*{摘~~要}
    \chaptermark{摘~~要}
}{%
    \clearpage
}

%---------- 英文摘要环境 ----------
\newenvironment{enabstract}{%
    \clearpage
    \pagestyle{main}
    \phantomsection
    \addcontentsline{toc}{chapter}{Abstract}
    \chapter*{Abstract}
    \chaptermark{Abstract}
}{%
    \clearpage
}

%---------- 前言环境 ----------
\newenvironment{preface}[1][前~~言]{%
    \clearpage
    \pagestyle{main}
    \phantomsection
    \addcontentsline{toc}{chapter}{#1}
    \chapter*{#1}
    \chaptermark{#1}
}{%
    \clearpage
    \if@openright
        \cleardoublepage
    \fi
}

%---------- 定义新的目录页面 ----------
\RequirePackage{tocloft}
\renewcommand{\cfttoctitlefont}{\hfill \heiti \chapfont}
\renewcommand{\cftaftertoctitle}{\hfill}
\renewcommand{\cftloftitlefont}{\hfill \heiti \chapfont}
\renewcommand{\cftafterloftitle}{\hfill}
\renewcommand{\cftlottitlefont}{\hfill \heiti \chapfont}
\renewcommand{\cftafterlottitle}{\hfill}
\renewcommand{\contentsname}{目~~录}
\renewcommand{\listfigurename}{插图清单}
\renewcommand{\listtablename}{表格清单}
\setlength{\cftbeforetoctitleskip}{8pt}
\setlength{\cftaftertoctitleskip}{20pt}
\setlength{\cftbeforechapskip}{10pt plus 2pt minus 2pt}
\setlength{\cftbeforesecskip}{3pt}
\setlength{\cftbeforesubsecskip}{3pt}
\renewcommand{\cftdot}{$\cdot$}
\renewcommand{\cftdotsep}{3}
\renewcommand{\cftchapfont}{\sffamily\heiti}
\renewcommand{\cftchapdotsep}{\cftdotsep}
\renewcommand\cftchapleader{\cftdotfill{\cftchapdotsep}}
\renewcommand{\cftsecdotsep}{\cftdotsep}
\renewcommand{\cftfigpresnum}{\figurename~}
\setlength{\cftfigindent}{0pt}
\setlength{\cftfignumwidth}{3.5em}
\renewcommand{\cfttabpresnum}{\tablename~}
\setlength{\cfttabindent}{0pt}
\setlength{\cfttabnumwidth}{3.5em}

%---------- 设置新的生成目录命令 ----------
\newcommand{\maketoc}{%
    % 设置目录hdr和页码选项
    \clearpage
    \pagestyle{main}
    \phantomsection
    \addcontentsline{toc}{chapter}{\contentsname}
    \tableofcontents%
    \clearpage
}

%---------- 重定义插图清单 ----------
\newcommand\makelof{%
    \clearpage
    \phantomsection
    \addcontentsline{toc}{chapter}{\listfigurename}
    \chapter*{\listfigurename}
    \chaptermark{\listfigurename}
    \@starttoc{lof}%
    \clearpage
}

%---------- 重定义表格清单 ----------
\newcommand\makelot{%
    \clearpage
    \phantomsection
    \addcontentsline{toc}{chapter}{\listtablename}
    \chapter*{\listtablename}
    \chaptermark{\listtablename}
    \@starttoc{lot}%
    \clearpage
}

%---------- 定义主要符号表环境 ----------
\newenvironment{denotation}{%
    \clearpage
    \phantomsection
    \addcontentsline{toc}{chapter}{主要符号表}
    \chapter*{主要符号表}
    \chaptermark{主要符号表}
}{%
    \clearpage
    \if@openright
        \cleardoublepage
    \fi
}

%---------- 重新定义附录命令 ----------
% \let \oldappendix \appendix
% \renewcommand{\appendix}[1]{%
%     \clearpage
%     \renewcommand{\theequation}{\Alph{chapter}\arabic{equation}}
%     \renewcommand{\thefigure}{\Alph{chapter}\arabic{figure}}
%     \renewcommand{\thetable}{\Alph{chapter}\arabic{table}}
%     \oldappendix{#1}%
% }

%---------- 重新定义参考文献页 ----------
\renewcommand{\bibname}{参考文献}
%--- 设置新的参考文献命令 ---
\let \oldbibliography \bibliography
\renewcommand{\bibliography}[1]{%
    % 添加到目录
    \clearpage
    \phantomsection
    \addcontentsline{toc}{chapter}{\bibname}
    \oldbibliography{#1}%
}

% End of file `zhbook.cls'.
