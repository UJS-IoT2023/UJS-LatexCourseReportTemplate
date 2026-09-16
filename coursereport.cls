% 江苏大学课程小报告 LaTeX 模板。

\NeedsTeXFormat{LaTeX2e}[2017/04/15]
\ProvidesClass{coursereport}[2026/05/25 v1.0.0 UJS Course Report Template]

% 未识别选项交给 ctexbook。
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ProcessOptions\relax

% 正文行距：22bp / 小四号基线 14.4bp。
\LoadClass[
  a4paper,
  oneside,
  openany,
  UTF8,
  fontset = none,
  zihao = -4,
  linespread = 1.52778
]{ctexbook}[2017/04/01]

\RequirePackage{iftex}
\ifXeTeX\relax\else
  \ifLuaTeX\relax\else
    \ClassError{coursereport}{%
      本模板必须使用 XeLaTeX 或 LuaLaTeX 编译。\MessageBreak
      请使用 `xelatex' 或 `lualatex' 而不是 `pdflatex'%
    }{}
  \fi
\fi

\RequirePackage{etoolbox}
\RequirePackage{xparse}
% normalem 保留 \emph 的正常强调语义。
\RequirePackage[normalem]{ulem}

\RequirePackage{geometry}
\RequirePackage{fancyhdr}
\RequirePackage{titletoc}

\RequirePackage{amsmath}
\RequirePackage{amssymb}

\RequirePackage{fontspec}
\ifXeTeX
  \RequirePackage{xeCJK}
\fi

\RequirePackage{graphicx}
\RequirePackage{caption}
\RequirePackage{booktabs}
\RequirePackage{longtable}
\RequirePackage{float}

\RequirePackage[square,numbers,comma,sort&compress]{natbib}

\RequirePackage[colorlinks=true]{hyperref}
\RequirePackage{url}

\RequirePackage{enumitem}
\RequirePackage{tikz}

\RequirePackage[ruled,linesnumbered,algochapter]{algorithm2e}
\SetAlgorithmName{算法}{算法}{算法列表}
\SetKwInput{KwIn}{输入}
\SetKwInput{KwOut}{输出}

\RequirePackage{listings}
\lstset{
  basicstyle=\small\ttfamily,
  keywordstyle=\color{blue},
  commentstyle=\color{gray},
  stringstyle=\color{red},
  numbers=left,
  numberstyle=\tiny,
  numbersep=5pt,
  frame=single,
  breaklines=true,
  captionpos=b,
  tabsize=2
}

\setmainfont{Times New Roman}
\setmonofont{Courier New}[Scale=0.9]

\RequirePackage{unicode-math}
\setmathfont{Latin Modern Math}

\ifXeTeX
  \setCJKmainfont{SimSun}[
    AutoFakeBold = 2.5,
    ItalicFont = KaiTi
  ]
  \setCJKsansfont{SimHei}[AutoFakeBold = 2.5]
  \setCJKmonofont{FangSong}
  \newCJKfontfamily\heiti{SimHei}[AutoFakeBold = 2.5]
  \newCJKfontfamily\songti{SimSun}[AutoFakeBold = 2.5]
  \newCJKfontfamily\kaishu{KaiTi}[AutoFakeBold = 2.5]
\else
  \setCJKmainfont{SimSun}[AutoFakeBold = 2.5]
  \setCJKsansfont{SimHei}[AutoFakeBold = 2.5]
  \setCJKmonofont{FangSong}
\fi

\geometry{
  paper = a4paper,
  left = 25mm,
  top = 25mm,
  right = 20mm,
  bottom = 20mm,
  headheight = 15pt,
  footskip = 10mm
}

\setlength{\parindent}{2\ccwd}
\setlength{\parskip}{0pt}

% 一级标题（chapter）: 小三号黑体居中
% 二级标题（section）: 四号黑体靠左
% 三级标题（subsection）: 小四号黑体靠左
\ctexset{
  chapter = {
    format = \zihao{-3}\bfseries\heiti\centering,
    beforeskip = 24pt,
    afterskip = 18pt,
    pagestyle = plain
  },
  section = {
    format = \zihao{4}\bfseries\heiti\raggedright,
    beforeskip = 18pt,
    afterskip = 12pt
  },
  subsection = {
    format = \zihao{-4}\bfseries\heiti\raggedright,
    beforeskip = 12pt,
    afterskip = 6pt
  },
  subsubsection = {
    format = \zihao{-4}\bfseries\heiti\raggedright,
    beforeskip = 6pt,
    afterskip = 6pt
  }
}

\pagestyle{fancy}
\fancyhf{}

\fancyfoot[C]{\zihao{5}\thepage}
\renewcommand{\headrulewidth}{0pt}

\fancypagestyle{frontmatterstyle}{%
  \fancyhf{}
  \fancyfoot[C]{\zihao{5}\thepage}
  \renewcommand{\headrulewidth}{0pt}
}

\fancypagestyle{mainmatterstyle}{%
  \fancyhf{}
  \fancyfoot[C]{\zihao{5}\thepage}
  \renewcommand{\headrulewidth}{0pt}
}

\fancypagestyle{emptypage}{%
  \fancyhf{}
  \renewcommand{\headrulewidth}{0pt}
}

% 重定义 frontmatter：罗马数字页码
\renewcommand{\frontmatter}{%
  \clearpage
  \@mainmatterfalse
  \pagenumbering{Roman}
  \pagestyle{frontmatterstyle}
}

% 重定义 mainmatter：阿拉伯数字页码从1开始
\renewcommand{\mainmatter}{%
  \clearpage
  \@mainmattertrue
  \pagenumbering{arabic}
  \pagestyle{mainmatterstyle}
  \setcounter{page}{1}
}

\renewcommand{\contentsname}{目\quad 录}

\renewcommand{\tableofcontents}{%
  \clearpage
  \thispagestyle{frontmatterstyle}
  \begin{center}
    {\zihao{2}\bfseries\heiti 目\quad 录}
    \vspace{22pt}
  \end{center}
  \@starttoc{toc}
}

\titlecontents{chapter}[0em]
  {\zihao{4}\songti}
  {\thecontentslabel\quad}
  {}
  {\titlerule*[0.5em]{.}\contentspage}

\titlecontents{section}[2em]
  {\zihao{-4}\songti}
  {\thecontentslabel\quad}
  {}
  {\titlerule*[0.5em]{.}\contentspage}

\titlecontents{subsection}[4em]
  {\zihao{-4}\songti}
  {\thecontentslabel\quad}
  {}
  {\titlerule*[0.5em]{.}\contentspage}

\DeclareCaptionFont{wuhau}{\zihao{5}}
\captionsetup{
  font = wuhau,
  labelsep = space,
  justification = centering,
  skip = 5pt
}

\captionsetup[figure]{position=below}

\captionsetup[table]{position=above}

\renewcommand{\thefigure}{\thechapter.\arabic{figure}}
\renewcommand{\thetable}{\thechapter.\arabic{table}}

\setlength{\textfloatsep}{12pt plus 2pt minus 2pt}
\setlength{\floatsep}{12pt plus 2pt minus 2pt}
\setlength{\intextsep}{12pt plus 2pt minus 2pt}

\renewcommand{\topfraction}{0.85}
\renewcommand{\bottomfraction}{0.65}
\renewcommand{\textfraction}{0.15}
\renewcommand{\floatpagefraction}{0.60}

\setcounter{topnumber}{3}
\setcounter{bottomnumber}{3}
\setcounter{totalnumber}{5}

\raggedbottom

\def\coursereport@value@title{}
\def\coursereport@value@course{}
\def\coursereport@value@college{}
\def\coursereport@value@majorclass{}
\def\coursereport@value@author{}
\def\coursereport@value@studentid{}
\def\coursereport@value@advisor{}
\def\coursereport@value@date{}

\newcommand{\reporttitle}[1]{\def\coursereport@value@title{#1}}
\newcommand{\course}[1]{\def\coursereport@value@course{#1}}
\newcommand{\college}[1]{\def\coursereport@value@college{#1}}
\newcommand{\majorclass}[1]{\def\coursereport@value@majorclass{#1}}
\newcommand{\advisor}[1]{\def\coursereport@value@advisor{#1}}
\renewcommand{\author}[1]{\def\coursereport@value@author{#1}}
\newcommand{\studentid}[1]{\def\coursereport@value@studentid{#1}}
\renewcommand{\date}[1]{\def\coursereport@value@date{#1}}

\newcommand{\coverinfolabel}[1]{\makebox[6em][s]{#1}}

\newcommand{\coverinfoitem}[2]{%
  \coverinfolabel{#1}：\underline{\makebox[8cm]{\hfill #2\hfill}}\\[0.8cm]%
}

% 用 \ifx 比较字面量宏，避免宏展开带来的比较问题。
\def\coursereport@value@coverstyle{center}
\def\coursereport@coverstyle@center{center}
\def\coursereport@coverstyle@leftlogo{leftlogo}
\newcommand{\coverstyle}[1]{\def\coursereport@value@coverstyle{#1}}

\newcommand{\makecover}{%
  \begin{titlepage}
    \thispagestyle{emptypage}

    \ifx\coursereport@value@coverstyle\coursereport@coverstyle@leftlogo
      % leftlogo：左校徽、右校名，英文托底。

      \noindent
      \begin{minipage}[b]{0.18\textwidth}
        \IfFileExists{assets/logo.png}{%
          \includegraphics[width=3cm]{assets/logo.png}
        }{}
      \end{minipage}
      \hspace{1cm}
      \begin{minipage}[b]{0.6\textwidth}
        \centering
        \IfFileExists{assets/title.png}{%
          \includegraphics[height=3cm, keepaspectratio]{assets/title.png}
        }{}
      \end{minipage}

      \begin{center}
        {\fontsize{20pt}{36pt}\selectfont\bfseries
          \underline{J\ I\ A\ N\ G\ S\ U\quad\quad U\ N\ I\ V\ E\ R\ S\ I\ T\ Y}%
        }
      \end{center}

      \begin{center}
        {\zihao{2}\bfseries\songti \coursereport@value@course}
      \end{center}

      \vspace{0.6cm}

      \begin{center}
        {\zihao{3}\bfseries\heiti \uline{\coursereport@value@title}}
      \end{center}

      \vspace{5.5cm}

      \begin{center}
        {\zihao{4}\songti
          \coverinfoitem{学院名称}{\coursereport@value@college}
          \coverinfoitem{专业班级}{\coursereport@value@majorclass}
          \coverinfoitem{姓\quad\quad 名}{\coursereport@value@author}
          \coverinfoitem{学\quad\quad 号}{\coursereport@value@studentid}
          \coverinfoitem{指导教师}{\coursereport@value@advisor}
        }
      \end{center}

      \vfill
      \begin{center}
        {\zihao{4}\songti \coursereport@value@date}
      \end{center}

    \else
      % 默认居中风格。
      \begin{center}
        \IfFileExists{assets/title.png}{%
          \includegraphics[width=15cm]{assets/title.png}\\[0.3cm]
        }{%
          {\zihao{1}\bfseries\heiti 江\quad 苏\quad 大\quad 学}\\[0.3cm]
        }

        {\fontsize{24pt}{22pt}\selectfont\bfseries
          \underline{J\ I\ A\ N\ G\ S\ U\quad\quad U\ N\ I\ V\ E\ R\ S\ I\ T\ Y}%
        }

        \vspace{1.5cm}

        {\zihao{2}\bfseries\heiti \coursereport@value@course}

        \vspace{1cm}

        \IfFileExists{assets/logo.png}{%
          \includegraphics[height=4.2cm]{assets/logo.png}
        }{}

        \vspace{1cm}

        {\zihao{3}\heiti 题目：\uline{\coursereport@value@title}}

        \vspace{2cm}
      \end{center}

      \begin{center}
        {\zihao{4}\songti
          \coverinfoitem{学院名称}{\coursereport@value@college}
          \coverinfoitem{专业班级}{\coursereport@value@majorclass}
          \coverinfoitem{姓\quad\quad 名}{\coursereport@value@author}
          \coverinfoitem{学\quad\quad 号}{\coursereport@value@studentid}
          \coverinfoitem{指导教师}{\coursereport@value@advisor}
        }
      \end{center}

      \vfill

      \begin{center}
        {\zihao{4}\songti \coursereport@value@date}
      \end{center}

      \vspace{1cm}
    \fi
  \end{titlepage}
  \clearpage
}

\newenvironment{cabstract}{%
  \chapter*{摘\quad 要}
  \addcontentsline{toc}{chapter}{摘要}
}{%
  \clearpage
}

\newenvironment{eabstract}{%
  \chapter*{ABSTRACT}
  \addcontentsline{toc}{chapter}{ABSTRACT}
}{%
  \clearpage
}

\bibliographystyle{gbt7714-numerical}

\renewcommand{\bibname}{参考文献}
\renewcommand{\bibsection}{%
  \clearpage
  \phantomsection
  \addcontentsline{toc}{chapter}{参考文献}
  \chapter*{参考文献}
}

\AtBeginDocument{%
  \hypersetup{
    linkcolor = black,
    citecolor = black,
    urlcolor = blue,
    bookmarksnumbered = true,
    bookmarksopen = true,
    pdftitle = {\coursereport@value@title},
    pdfauthor = {\coursereport@value@author}
  }
}

\newcommand{\emptypage}{%
  \clearpage
  \thispagestyle{empty}
  \mbox{}
  \clearpage
}

\endinput
