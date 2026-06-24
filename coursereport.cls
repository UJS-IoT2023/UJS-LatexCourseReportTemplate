% coursereport.cls
% 江苏大学课程小报告 LaTeX 模板
% 严格遵循课程报告格式要求
%
% 版本: 1.0.0
% 日期: 2026-05-25

\NeedsTeXFormat{LaTeX2e}[2017/04/15]
\ProvidesClass{coursereport}[2026/05/25 v1.0.0 UJS Course Report Template]

%% ============================================================================
%% 选项处理
%% ============================================================================

% 所有未知选项传递给 ctexbook
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ProcessOptions\relax

%% ============================================================================
%% 加载基础文档类
%% ============================================================================

\LoadClass[
  a4paper,
  oneside,
  openany,
  UTF8,
  fontset = none,
  zihao = -4,
  linespread = 1.0
]{ctexbook}[2017/04/01]

%% ============================================================================
%% 检查编译引擎
%% ============================================================================

\RequirePackage{iftex}
\ifXeTeX\relax\else
  \ifLuaTeX\relax\else
    \ClassError{coursereport}{%
      本模板必须使用 XeLaTeX 或 LuaLaTeX 编译。\MessageBreak
      请使用 `xelatex' 或 `lualatex' 而不是 `pdflatex'%
    }{}
  \fi
\fi

%% ============================================================================
%% 引入核心宏包
%% ============================================================================

% 基础工具
\RequirePackage{etoolbox}
\RequirePackage{xparse}
\RequirePackage{ulem}

% 页面设置
\RequirePackage{geometry}
\RequirePackage{fancyhdr}
\RequirePackage{titletoc}

% 数学支持
\RequirePackage{amsmath}
\RequirePackage{amssymb}

% 字体设置
\RequirePackage{fontspec}
\ifXeTeX
  \RequirePackage{xeCJK}
\fi

% 图表支持
\RequirePackage{graphicx}
\RequirePackage{caption}
\RequirePackage{booktabs}
\RequirePackage{longtable}
\RequirePackage{float}

% 参考文献
\RequirePackage[square,numbers,comma,sort&compress]{natbib}

% 超链接
\RequirePackage[colorlinks=true]{hyperref}
\RequirePackage{url}

% 其他工具
\RequirePackage{setspace}
\RequirePackage{enumitem}
\RequirePackage{tikz}

% 算法
\RequirePackage[ruled,linesnumbered,algochapter]{algorithm2e}
\SetAlgorithmName{算法}{算法}{算法列表}
\SetKwInput{KwIn}{输入}
\SetKwInput{KwOut}{输出}

% 代码
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

%% ============================================================================
%% 字体配置
%% ============================================================================

% 西文主字体: Times New Roman
\setmainfont{Times New Roman}
\setsansfont{Times New Roman}
\setmonofont{Courier New}[Scale=0.9]

% 数学字体
\RequirePackage{unicode-math}
\setmathfont{Latin Modern Math}

% 中文字体设置
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

%% ============================================================================
%% 页面设置
%% ============================================================================

% 页边距: 左、上2.5厘米；右、下2厘米
\geometry{
  paper = a4paper,
  left = 25mm,
  top = 25mm,
  right = 20mm,
  bottom = 20mm,
  headheight = 15pt,
  footskip = 10mm
}

%% ============================================================================
%% 行距与段落设置
%% ============================================================================

% 固定值22磅行距（正文区域）
% 在文档开始时设置，避免被 ctex 初始化覆盖
\AtBeginDocument{%
  \setlength{\baselineskip}{22pt}%
  \setlength{\lineskiplimit}{3pt}%
  \setlength{\lineskip}{3pt}%
}

% 首行缩进两字符
\setlength{\parindent}{2\ccwd}

% 段落间距为0，保持紧凑
\setlength{\parskip}{0pt}

% 两端对齐（默认）

%% ============================================================================
%% 标题格式设置
%% ============================================================================

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

%% ============================================================================
%% 页眉页脚设置
%% ============================================================================

\pagestyle{fancy}
\fancyhf{}

% 页脚居中显示页码，五号字
\fancyfoot[C]{\zihao{5}\thepage}
\renewcommand{\headrulewidth}{0pt}

% 目录页面样式（罗马数字）
\fancypagestyle{frontmatterstyle}{%
  \fancyhf{}
  \fancyfoot[C]{\zihao{5}\thepage}
  \renewcommand{\headrulewidth}{0pt}
}

% 正文页面样式（阿拉伯数字）
\fancypagestyle{mainmatterstyle}{%
  \fancyhf{}
  \fancyfoot[C]{\zihao{5}\thepage}
  \renewcommand{\headrulewidth}{0pt}
}

% 封面无页眉页脚
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

%% ============================================================================
%% 目录格式设置
%% ============================================================================

% 目录标题: 二号黑体居中，段前段后1行
\renewcommand{\contentsname}{目\quad 录}

% 目录标题格式通过重定义 \tableofcontents 实现
\let\oldtableofcontents\tableofcontents
\renewcommand{\tableofcontents}{%
  \clearpage
  \thispagestyle{frontmatterstyle}
  \begin{center}
    \vspace*{0pt} % 顶格开始，但通过段前距控制
    {\zihao{2}\bfseries\heiti 目\quad 录}
    \vspace{22pt}
  \end{center}
  \@starttoc{toc}
}

% 一级目录: 四号宋体
\titlecontents{chapter}[0em]
  {\zihao{4}\songti}
  {\thecontentslabel\quad}
  {}
  {\titlerule*[0.5em]{.}\contentspage}

% 二级目录: 小四号宋体
\titlecontents{section}[2em]
  {\zihao{-4}\songti}
  {\thecontentslabel\quad}
  {}
  {\titlerule*[0.5em]{.}\contentspage}

% 三级目录: 小四号宋体
\titlecontents{subsection}[4em]
  {\zihao{-4}\songti}
  {\thecontentslabel\quad}
  {}
  {\titlerule*[0.5em]{.}\contentspage}

%% ============================================================================
%% 图表格式设置
%% ============================================================================

% 图和表标题均为五号字，居中，无缩进
\DeclareCaptionFont{wuhau}{\zihao{5}}
\captionsetup{
  font = wuhau,
  labelsep = space,
  justification = centering,
  skip = 5pt
}

% 图的标题在下方
\captionsetup[figure]{position=below}

% 表的标题在上方
\captionsetup[table]{position=above}

% 图编号: 图1.1, 图1.2...
\renewcommand{\thefigure}{\thechapter.\arabic{figure}}
\renewcommand{\thetable}{\thechapter.\arabic{table}}

% 每个章节重置计数器
\@addtoreset{figure}{chapter}
\@addtoreset{table}{chapter}

%% ============================================================================
%% 浮动体参数设置（禁止页面下方大块留白）
%% ============================================================================

% 减少浮动体导致的空白
\setlength{\textfloatsep}{12pt plus 2pt minus 2pt}
\setlength{\floatsep}{12pt plus 2pt minus 2pt}
\setlength{\intextsep}{12pt plus 2pt minus 2pt}

% 允许浮动体占据更多页面
\renewcommand{\topfraction}{0.85}
\renewcommand{\bottomfraction}{0.65}
\renewcommand{\textfraction}{0.15}
\renewcommand{\floatpagefraction}{0.60}

% 允许每页更多浮动体
\setcounter{topnumber}{3}
\setcounter{bottomnumber}{3}
\setcounter{totalnumber}{5}

% 禁止页面下方大块留白（避免LaTeX自动拉伸填充）
\raggedbottom

%% ============================================================================
%% 用户配置接口
%% ============================================================================

% 定义值存储
\def\coursereport@value@title{}
\def\coursereport@value@course{}
\def\coursereport@value@college{}
\def\coursereport@value@majorclass{}
\def\coursereport@value@author{}
\def\coursereport@value@studentid{}
\def\coursereport@value@advisor{}
\def\coursereport@value@date{}

% 定义用户命令
\newcommand{\reporttitle}[1]{\def\coursereport@value@title{#1}}
\newcommand{\course}[1]{\def\coursereport@value@course{#1}}
\newcommand{\college}[1]{\def\coursereport@value@college{#1}}
\newcommand{\majorclass}[1]{\def\coursereport@value@majorclass{#1}}
\newcommand{\advisor}[1]{\def\coursereport@value@advisor{#1}}
\renewcommand{\author}[1]{\def\coursereport@value@author{#1}}
\newcommand{\studentid}[1]{\def\coursereport@value@studentid{#1}}
\renewcommand{\date}[1]{\def\coursereport@value@date{#1}}

%% ============================================================================
%% 封面设置
%% ============================================================================

% 信息标签（自动分散对齐）
\newcommand{\coverinfolabel}[1]{\makebox[6em][s]{#1}}

% 下划线信息项
\newcommand{\coverinfoitem}[2]{%
  \coverinfolabel{#1}：\underline{\makebox[8cm]{\hfill #2\hfill}}\\[0.8cm]%
}

% 封面风格：默认居中式 (center)，可选左对齐并排式 (leftlogo)
% 注意：不能用 \ifstrequal 比较 \coursereport@value@coverstyle 和字面量，
% 因为 etoolbox 的 \ifstrequal 在 \edef 内部用 \detokenize 处理参数，
% \detokenize 不会展开宏，只把宏名 detokenize 成字符串，所以比较会失败。
% 改用 \ifx 比较两个都展开为相同字面量的宏，更可靠。
\def\coursereport@value@coverstyle{center}
\def\coursereport@coverstyle@center{center}
\def\coursereport@coverstyle@leftlogo{leftlogo}
\newcommand{\coverstyle}[1]{\def\coursereport@value@coverstyle{#1}}

% 生成封面
\newcommand{\makecover}{%
  \begin{titlepage}
    \thispagestyle{emptypage}

    \ifx\coursereport@value@coverstyle\coursereport@coverstyle@leftlogo
      %% ==========================================
      %% 风格一：左徽标+右Title（等高并排，英文托底）
      %% ==========================================

      \noindent
      \begin{minipage}[b]{0.18\textwidth}
        % 左侧校徽：底部对齐，宽度占满小栏
        \includegraphics[width=3cm]{assets/logo.png}
      \end{minipage}
      \hspace{1cm}
      \begin{minipage}[b]{0.6\textwidth}
        \centering
        % \flushright
        \includegraphics[height=3cm, keepaspectratio]{assets/title.png}
      \end{minipage}

      % 下方的英文托底：用一个独立的 center 环境紧跟其后，加下划线
      \begin{center}
        % \vspace{0.1cm} % 控制英文与上方图片的紧凑间距
        {\fontsize{20pt}{36pt}\selectfont\bfseries
          \underline{J\ I\ A\ N\ G\ S\ U\quad\quad U\ N\ I\ V\ E\ R\ S\ I\ T\ Y}%
        }
      \end{center}

      % 课程报告名称（紧跟英文）
      \begin{center}
        {\zihao{2}\bfseries\songti \coursereport@value@course}
      \end{center}

      \vspace{0.6cm} % 课程名与题目的间距

      % 题目区域
      \begin{center}
        {\zihao{3}\bfseries\heiti \uline{\coursereport@value@title}}
      \end{center}

      % 中间留出大段空白
      \vspace{5.5cm}

      % 下方详细信息
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
      %% ==========================================
      %% 风格二：默认居中风格（图二效果）
      %% ==========================================
      \begin{center}
        % 校名图片
        \IfFileExists{assets/title.png}{%
          \includegraphics[width=15cm]{assets/title.png}\\[0.3cm]
        }{%
          {\zihao{1}\bfseries\heiti 江\quad 苏\quad 大\quad 学}\\[0.3cm]
        }

        % JIANGSU UNIVERSITY
        {\fontsize{24pt}{22pt}\selectfont\bfseries
          \underline{J\ I\ A\ N\ G\ S\ U\quad\quad U\ N\ I\ V\ E\ R\ S\ I\ T\ Y}%
        }

        \vspace{1.5cm}

        % 课程名称
        {\zihao{2}\bfseries\heiti \coursereport@value@course}

        \vspace{1cm}

        % 学校Logo
        \IfFileExists{assets/logo.png}{%
          \includegraphics[height=4.2cm]{assets/logo.png}
        }{}

        \vspace{1cm}

        % 题目区域
        {\zihao{3}\heiti 题目：\uline{\coursereport@value@title}}

        \vspace{2cm}
      \end{center}

      % 信息区域
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

      % 日期
      \begin{center}
        {\zihao{4}\songti \coursereport@value@date}
      \end{center}

      \vspace{1cm}
    \fi
  \end{titlepage}
  \clearpage
}

%% ============================================================================
%% 摘要环境
%% ============================================================================

% 中文摘要
\newenvironment{cabstract}{%
  \chapter*{摘\quad 要}
  \addcontentsline{toc}{chapter}{摘要}
}{%
  \clearpage
}

% 英文摘要
\newenvironment{eabstract}{%
  \chapter*{ABSTRACT}
  \addcontentsline{toc}{chapter}{ABSTRACT}
}{%
  \clearpage
}

%% ============================================================================
%% 参考文献设置
%% ============================================================================

\bibliographystyle{gbt7714-numerical}

% 参考文献标题格式
\renewcommand{\bibname}{参考文献}
\renewcommand{\bibsection}{%
  \clearpage
  \phantomsection
  \addcontentsline{toc}{chapter}{参考文献}
  \chapter*{参考文献}
}

%% ============================================================================
%% 超链接配置
%% ============================================================================

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

%% ============================================================================
%% 其他命令
%% ============================================================================

% 空白页命令
\newcommand{\emptypage}{%
  \clearpage
  \thispagestyle{empty}
  \mbox{}
  \clearpage
}

\endinput
