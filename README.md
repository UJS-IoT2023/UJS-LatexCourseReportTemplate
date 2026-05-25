# 江苏大学课程报告 LaTeX 模板

![wakapi](https://wakapi.arorms.cn/api/badge/Cacciatore/interval:any/project:UJS-LaTexCourseReportTemplate)

本模板按照江苏大学课程小报告的格式要求制作，包括封面、目录、正文、图表、参考文献等所有格式规范。**在使用本模板前请务必与老师沟通，是否可以接受 LaTex 排版。**

![image.png](https://minio.arorms.cn/notes/20260526002221_image.png)

## 格式要求对照

| 要求项 | 模板实现 |
|--------|----------|
| 页边距：左/上2.5cm，右/下2cm | `geometry` 精确设置 |
| 正文：小四宋体/Times New Roman，固定行距22磅 | `SimSun` + `Times New Roman`，`\baselineskip=22pt` |
| 首行缩进两字符 | `\parindent=2\ccwd` |
| 一级标题：小三号黑体居中 | `\ctexset{chapter/format}` |
| 二级标题：四号黑体靠左 | `\ctexset{section/format}` |
| 三级标题：小四号黑体靠左 | `\ctexset{subsection/format}` |
| 封面无页码，目录罗马数字，正文阿拉伯数字从1开始 | `\frontmatter` + `\mainmatter` |
| 目录标题：二号黑体居中 | `\zihao{2}\heiti` |
| 一级目录：四号宋体 | `\titlecontents{chapter}` |
| 二级目录：小四号宋体 | `\titlecontents{section}` |
| 图表标题五号字，居中无缩进 | `\captionsetup{font=zihao=5}` |
| 图标题在下方，表标题在上方 | `position=below/above` |
| 编号：图1.1、表1.1 | `\thechapter.\arabic{figure}` |
| 禁止页面下方大块留白 | `\raggedbottom` + 浮动体参数优化 |

## 文件结构

```
UJS-LaTexCourseReportTemplate/
├── coursereport.cls      % 模板类文件（核心）
├── main.tex              % 主文档
├── assets/               % 资源文件夹
│   ├── title.png         % 校名图片（可选）
│   └── logo.png          % 校徽图片（可选）
├── chapters/             % 章节文件
│   ├── chapter01.tex     % 第一章示例
│   ├── chapter02.tex     % 第二章示例
│   └── chapter03.tex     % 第三章示例
├── figures/              % 图片文件夹
├── refs/
│   └── references.bib    % 参考文献数据库
└── README.md
```

## 使用方法

### 1. 填写封面信息

在 `main.tex` 开头修改以下命令：

```latex
\course{物联网安全技术}                    % 课程名称
\reporttitle{你的报告题目}                  % 报告题目
\college{计算机科学与通信工程学院}          % 学院名称
\majorclass{物联网工程2301班}               % 专业班级
\author{张三}                              % 姓名
\studentid{3230611081}                     % 学号
\advisor{李四}                              % 指导教师
\date{2025年6月}                           % 日期
```

### 2. 编写正文

将各章节内容写入 `chapters/chapterXX.tex` 文件，然后在 `main.tex` 中引入：

```latex
\input{chapters/chapter01}
\input{chapters/chapter02}
```

### 3. 添加参考文献

在 `refs/references.bib` 中添加 BibTeX 格式的参考文献，正文中使用 `\cite{key}` 引用。

### 4. 编译文档

**推荐方式（自动处理交叉引用）：**

```bash
latexmk -xelatex main.tex
```

**手动方式：**

```bash
xelatex main.tex
xelatex main.tex
xelatex main.tex
```

需要编译三次以正确生成目录和引用。

## 插入图片

```latex
\begin{figure}[htbp]
\centering
\includegraphics[width=0.8\textwidth]{figures/your_figure.png}
\caption{图片标题}
\label{fig:example}
\end{figure}
```

图片会自动编号为 `图1.1`、`图1.2` 等。

## 插入表格

```latex
\begin{table}[htbp]
\centering
\caption{表格标题}
\label{tab:example}
\begin{tabular}{ccc}
\toprule
列1 & 列2 & 列3 \\
\midrule
数据1 & 数据2 & 数据3 \\
\bottomrule
\end{tabular}
\end{table}
```

表格会自动编号为 `表1.1`、`表1.2` 等。


## 参考

https://github.com/xtc-chen/UJS_Masterthesis

https://github.com/xtc-chen/UJS_Phdthesis

https://github.com/XCMB-haochi/UJS-Report-LaTeX-Template