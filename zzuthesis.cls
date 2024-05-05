%%================================================
%% Filename: zzuthesis.cls
%% Encoding: UTF-8
%% Author: Yuan Xiaoshuai - yxshuai@gmail.com
%% Created: 2012-01-08 13:11
%% Last modified: 2020-04-05 20:27
%%================================================
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 标识节(Identification)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 禁止 CJK 警告
\PassOptionsToPackage{quiet}{fontspec}
\PassOptionsToPackage{quiet}{xeCJK}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{zzuthesis}
[2020/01/03 5.0.1 Zhengzhou University Thesis Template]
\hyphenation{Zzu-Thesis}
\def\zzuthesis{ZzuThesis}
\def\version{5.0.1}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 声明选项(Declaration options)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newif\ifzzu@bachelor\zzu@bachelorfalse
\newif\ifzzu@master\zzu@masterfalse
\newif\ifzzu@doctor\zzu@doctorfalse
\DeclareOption{bachelor}{\zzu@bachelortrue}
\DeclareOption{master}{\zzu@mastertrue}
\DeclareOption{doctor}{\zzu@doctortrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 选项处理 (Option processing)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\ProcessOptions\relax
\ifzzu@bachelor\relax\else
	\ifzzu@master\relax\else
		\ifzzu@doctor\relax\else
			\ClassError{zzuthesis}%Reporting errors
			{You have to specify one of thesis options:%
				bachelor, master or doctor.}{}
		\fi
	\fi
\fi
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 装载类与宏包 (Loading classes & packages)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\ifzzu@doctor%博士论文双面打印
	\LoadClass[zihao=-4,a4paper,UTF8,scheme=plain]{ctexbook}
\else%其它单面打印
	\LoadClass[zihao=-4,a4paper,UTF8,scheme=plain,openany]{ctexbook}
\fi
\RequirePackage{ifxetex}
\ifxetex\else
	\ClassError{zzuthesis}{You should use XeLaTeX}{}
	\end{document}
\fi
\RequirePackage{environ}
\RequirePackage{xparse}
\RequirePackage{tikz}
\RequirePackage{etoolbox}
\RequirePackage{calc}%算术运算
\RequirePackage[shortlabels]{enumitem}
\RequirePackage{titletoc}%目录格式
\RequirePackage{amsmath,amsthm}
\RequirePackage{unicode-math}
\unimathsetup{
	math-style = ISO,
	bold-style = ISO,
	nabla      = upright,
	partial    = upright,
}
\RequirePackage{geometry}%页边距设置
\RequirePackage{tabularx}%表格宽度控制
\RequirePackage{multirow}%跨行表格
\RequirePackage{longtable}%长表格，可替换supertabular
\RequirePackage{booktabs}%三线表格
\RequirePackage[labelformat=simple]{subcaption}
\RequirePackage{graphicx}%图形支持
\RequirePackage[numbers,super,sort&compress]{natbib}%参考文献引用
\RequirePackage{hyperref}%超链接、书签
\hypersetup{%
	linktoc=all,
	bookmarksnumbered=true,%节的标号放入标签
	bookmarksopen=true,
	bookmarksopenlevel=1,
	breaklinks=true,
	plainpages=false,
	hidelinks}
\urlstyle{same}%相同字体

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 英文配置
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{fontspec}
\setmainfont{Times New Roman}
\setmathfont[Path=assert/, Extension=.ttf]{cambriamath}
% \setmathfont{Cambria Math}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 中文配置
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\usepackage{xeCJK}
% 实现汉字加点
\usepackage{xeCJKfntef}
\setCJKmainfont[Path=assert/, Extension=.ttf]{SimSun} % 正文 宋体黑
\setCJKsansfont[Path=assert/, Extension=.ttf]{SimHei} % 标题 黑体
\setCJKmathfont[Path=assert/, Extension=.ttf]{SimSun}
\ctexset{%
	contentsname={目\hspace{\ccwd} 录},
	listfigurename={插图清单},
	listtablename={表格清单},
	figurename={图},
	tablename={表},
	appendixname={附录},
	bibname={参考文献},
	proofname={证明}
}
\newcommand\equation@name{公式}
\newcommand\zzu@definition@name{定义}
\newcommand\zzu@theorem@name{定理}
\newcommand\zzu@lemma@name{引理}
\newcommand\zzu@corollary@name{推论}
\def\zzu@schoolname{河南中医药大学}
\def\zzu@title@sep{：}
\ifzzu@bachelor
	\def\zzu@thesisno@title{论文编号}
	\def\zzu@subtitle{毕业设计（论文）}
	\def\zzu@bachelor@title@pre{论文题目}
	\def\zzu@supervisor@title{指导教师}
	\def\zzu@protitle@title{职称}
	\def\zzu@author@title{姓名}
	\def\zzu@stuno@title{学号}
	\def\zzu@grade@title{年级}
	\def\zzu@score@title{评定成绩}
	\def\zzu@major@title{专业}
	\def\zzu@department@title{院系}
\else
	\def\zzu@schoolcode@title{学校代码}
	\def\zzu@id@title{学号或申请号}
	\def\zzu@secretlevel@title{密级}
	\ifzzu@master
		\def\zzu@subtitle{硕士学位论文}
	\else
		\def\zzu@subtitle{博士学位论文}
	\fi
	\def\zzu@author@title{作者姓名}
	\def\zzu@supervisor@title{导师姓名}
	\def\zzu@subject@title{学科门类}
	\def\zzu@major@title{专业名称}
	\ifzzu@master
		\def\zzu@department@title{培养院系}
	\else\fi
\fi
\def\zzu@cdate@title{完成时间}
\let\CJK@todaysave=\today
\def\CJK@todaysmall@short{\the\year 年 \the\month 月}
\def\CJK@todaysmall{\CJK@todaysmall@short \the\day 日}
\def\CJK@todaybig@short{\CJKdigits{\the\year} 年 \CJKnumber{\the\month} 月}
\def\CJK@todaybig{\CJK@todaybig@short \CJKnumber{\the\day} 日}
\def\CJK@today{\CJK@todaysmall}
\renewcommand\today{\CJK@today}
\newcommand\CJKtoday[1][1]{%
	\ifcase#1\def\CJK@today{\CJK@todaysave}
	\or\def\CJK@today{\CJK@todaysmall}
	\or\def\CJK@today{\CJK@todaybig}
	\fi}
\newcommand{\cabstractname}{摘要}
\newcommand{\eabstractname}{ABSTRACT}
\def\zzu@ckeywords@separator{；}
\def\zzu@ekeywords@separator{; }
\newcommand{\zzu@ckeywords@title}{关键词：}
\newcommand{\zzu@ekeywords@title}{Keywords:\enskip}
\newcommand{\zzu@denotation@name}{主要符号对照表}
\newcommand{\zzu@ackname}{致谢}
\newcommand{\zzu@review@title}{综述}
\ifzzu@bachelor
	\newcommand{\zzu@resume@title}{在学期间参加课题的研究成果}
\else
	\newcommand{\zzu@resume@title}{个人简历、在学期间发表的学术论文与研究成果}
\fi
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  字号设置
%%  模板使用thuthesis论文模板的字号定义
%%  使用时可加入行距参数，如\chuhao[1.25]表示初号字体，1.25倍行距
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\zzu@def@fontsize#1#2{
	\expandafter\newcommand\csname #1\endcsname[1][1.3]{
		\fontsize{#2}{##1\dimexpr #2}\selectfont}}
\zzu@def@fontsize{chuhao}{42bp}
\zzu@def@fontsize{xiaochu}{36bp}
\zzu@def@fontsize{yihao}{26bp}
\zzu@def@fontsize{xiaoyi}{24bp}
\zzu@def@fontsize{erhao}{22bp}
\zzu@def@fontsize{xiaoer}{18bp}
\zzu@def@fontsize{sanhao}{16bp}
\zzu@def@fontsize{xiaosan}{15bp}
\zzu@def@fontsize{sihao}{14bp}
\zzu@def@fontsize{banxiaosi}{13bp}
\zzu@def@fontsize{xiaosi}{12bp}
\zzu@def@fontsize{dawu}{11bp}
\zzu@def@fontsize{wuhao}{10.5bp}
\zzu@def@fontsize{xiaowu}{9bp}
\zzu@def@fontsize{liuhao}{7.5bp}
\zzu@def@fontsize{xiaoliu}{6.5bp}
\zzu@def@fontsize{qihao}{5.5bp}
\zzu@def@fontsize{bahao}{5bp}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 正文字体及行距
%% 研究生：小四号 (12bp) 字，固定行距 20bp
%% 本科生：小四号 (12bp) 字，1.25倍行距
%% Word 小四号字 1.25 倍行距与固定行距 20bp 较接近
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand\normalsize{
	\@setfontsize\normalsize{12bp}{20bp}
	\abovedisplayskip=12bp \@plus 2bp \@minus 2bp
	\abovedisplayshortskip=12bp \@plus 2bp \@minus 2bp
	\belowdisplayskip=\abovedisplayskip
	\belowdisplayshortskip=\abovedisplayshortskip}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 页面设置
%% 研究生：页边距上下3.8cm，左右3.2cm，页眉页脚3.0cm，装订线0cm
%% 本科生：页边距上2.0cm，下2.2cm，左2.6cm，右2.0cm
%% TODO: 根据Word设置结果微调，另本科生规范中页边距太小，未采用
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% \ifzzu@bachelor
%   \geometry{left=2.6cm,right=2.0cm,top=2.0cm,bottom=2.2cm,includeheadfoot}
% \else
%   \geometry{left=3.2cm,right=3.2cm,top=3.8cm,bottom=3.8cm,includeheadfoot}
% \fi
\geometry{
	a4paper, % 210 * 297mm
	hcentering,
	vcentering,
	ignoreall,
	nomarginpar,
	left=32mm,
	footskip=17mm,
	top=30mm}
\ctexset{
	punct=quanjiao,
	space=auto,
	autoindent=true}
\let\zzu@cleardoublepage\cleardoublepage
\newcommand{\zzu@clearemptydoublepage}{%开始奇数新页面
	\clearpage{\pagestyle{empty}\zzu@cleardoublepage}}
\let\cleardoublepage\zzu@clearemptydoublepage

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 文前，正文，文后格式
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\usepackage{fancyhdr}
\usepackage{lastpage}

% 定义一个前言页面样式
\fancypagestyle{frontmatterstyle}{
	\fancyhf{}
	%  \fancyhead[C]{\xiaowu{河南中医药大学本科毕业论文}}
	% \fancyfoot[C]{\xiaowu \thepage}
	\renewcommand{\headrulewidth}{0pt} % 在这个样式中，页眉下方没有横线
}

\fancypagestyle{frontabstractstyle}{
	\fancyhf{}
	%  \fancyhead[C]{\xiaowu{河南中医药大学本科毕业论文}}
	\fancyfoot[C]{\xiaowu \thepage}
	\renewcommand{\headrulewidth}{0pt} % 在这个样式中，页眉下方没有横线
}

% 定义一个正文页面样式
\fancypagestyle{mainmatterstyle}{
	\fancyhf{}
	\fancyhead[C]{\vspace*{1.2mm}\xiaowu{河南中医药大学本科毕业论文}}
	\fancyfoot[C]{\xiaowu 第 \thepage 页\hspace*{1\ccwd} 共 \pageref{LastPage} 页}
	\renewcommand{\headrulewidth}{0.6pt} % 在这个样式中，页眉下方有横线
}

% 在前言部分使用这个样式
\renewcommand\frontmatter{%
	\ifzzu@doctor\cleardoublepage\else\clearpage\fi
	% 修复目录标题
	\ctexset{chapter/format+=\centering}
	\@mainmatterfalse
	\pagenumbering{Roman}
	\pagestyle{frontmatterstyle} % 在前言部分使用新的样式
}

% 在主体部分
\renewcommand\mainmatter{%
\ifzzu@doctor\cleardoublepage\else\clearpage\fi
\ctexset{chapter/format+={\raggedright}}% 所有章节标题都居左
\@mainmattertrue
\pagenumbering{arabic}
\pagestyle{mainmatterstyle}
}


% 在后记部分
\renewcommand\backmatter{%
	\ifzzu@doctor\cleardoublepage\else\clearpage\fi
	\ctexset{chapter/format+=\centering}
	\@mainmattertrue
	\pagestyle{fancy}
	\fancyhf{}
	\fancyhead[C]{\vspace*{1.2mm}\xiaowu{河南中医药大学本科毕业论文}}
	\fancyfoot[C]{\xiaowu 第 \thepage 页\hspace*{1\ccwd} 共 \pageref{LastPage} 页}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 页眉页脚
%% 页眉：居中显示章节名称；宋体10.5磅居中，Abstract用Roman字体
%% 页脚：居中显示页码；宋体10.5磅居中
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 定义了一个名为“zzu@empty”的页面样式，其中页眉（head）和页脚（foot）都是空的。
\def\ps@zzu@empty{ %%No head or foot line.
	\let\@oddhead\@empty\let\@evenhead\@empty%
	\let\@oddfoot\@empty\let\@evenfoot\@empty}

% 定义了一个名为“zzu@plain”的页面样式，其页眉为空，页脚页码始终居中。
\def\ps@zzu@plain{
	\let\@oddhead\@empty\let\@evenhead\@empty
	\def\@oddfoot{\hfil\xiaowu\thepage\hfil}
	\let\@evenfoot=\@oddfoot}

% 定义了一个名为“zzu@headings”的页面样式，其中页眉置于中心，页脚页码始终居中。
\def\ps@zzu@headings{
	\def\@oddhead{\vbox to\headheight{\vfill%
			\hb@xt@\textwidth{\wuhao\rmfamily\hfill\leftmark\hfill}%
			\vskip\tw@\p@\hbox{\vrule width\textwidth height.4\p@ depth\z@}}}
	\let\@evenhead=\@oddhead
	\def\@oddfoot{\xiaowu\hfil\thepage\hfil}
	\let\@evenfoot=\@oddfoot}

% 重定义了“chaptermark”，章节标识包括章节编号和资源标识的输入。
\renewcommand{\chaptermark}[1]{\@mkboth{\thechapter\  ~~#1}{}}

% 定义了命名为“zzu@textcircled”的命令，该命令将输入的文本封装为圆圈。
\newcommand*{\zzu@textcircled}[1]{\lower.7ex\hbox{\tikz\draw (0pt, 0pt)%
		circle (.5em) node {\makebox[1em][c]{\small #1}};}}

% 保护名为“zzu@textcircled”的命令，在编译过程中，不会展开（expand）此命令。
\robustify{\zzu@textcircled}
\setlist[enumerate,1]{label = (\arabic*)}
\setlist[enumerate,2]{label =  \arabic*)}
\setlist[enumerate,3]{label =  \zzu@textcircled{\arabic*}}
\setlist{leftmargin=*, nosep}
\setlist[1]{labelindent=\parindent} % Only the level 1
\let\zzu@footnotesize\footnotesize%脚注字体及行距
\renewcommand\footnotesize{\zzu@footnotesize\xiaowu[1.5]}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%    浮动对象、图片、表格、公式设置
%% 1. 若插入的图片未指定扩展名，则在指定文件路径搜索pdf，eps，png，jpg，jpeg文件
%%    搜索路径在主文件中定义；
%% 2. 定义tabularx环境中的Z选项，用于居中自动调整，定义命令\Xhline
%% 3. 公式、图片、表格编号分隔符为句号，即“3.1”的形式
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\setlength{\floatsep}{12bp \@plus4\p@\@minus\p@} %浮动对象和文字间的距离
\setlength{\intextsep}{12bp \@plus4\p@\@minus\tw@\p@} % 浮动对象与正文文字上下间距
\setlength{\textfloatsep}{12bp \@plus4\p@\@minus2\p@}
\setlength{\@fptop}{0bp \@plus1.0fil} % 页面顶部的浮动体与页面顶端的距离
\setlength{\@fpsep}{12bp \@plus2.0fil} % 两个浮动体之间或者一个浮动体与文本之间的距离
\setlength{\@fpbot}{0bp \@plus1.0fil} % 页面底部浮动体与页面底端的距离
\renewcommand{\textfraction}{0.15}%页面文本的最小比例(0.2)
\renewcommand{\topfraction}{0.85}%页顶浮动对象高/页高的最大值(0.7)
\renewcommand{\bottomfraction}{0.50}%页底浮动对象高/页高的最大值(0.3)
\renewcommand{\floatpagefraction}{0.80}%浮动页由浮动对象占用的最小比例(0.5)
\DeclareGraphicsExtensions{.pdf,.eps,.png,.jpg,.jpeg}%搜索指定扩展名
\DeclareCaptionLabelSeparator{zzu}{\hspace{\ccwd}}%图表序与图表名之间空一个汉字
\DeclareCaptionFont{zzu}{\ifzzu@bachelor\xiaosi[1.25]\kaishu%
	\else\wuhao[1.5]\fi}
\captionsetup{
	font           = zzu,
	labelsep       = zzu,
	figureposition = bottom,
	tableposition  = top,
}

\ifzzu@bachelor%段前空6磅，段后空12磅
	\captionsetup[table]{belowskip={12bp-\intextsep},aboveskip=6bp}
\else%段前空6磅，段后空6磅
	\captionsetup[table]{belowskip={6bp},aboveskip=6bp}
\fi
\captionsetup[figure]{%段前空6磅，段后空12磅
	belowskip={12bp-\intextsep},aboveskip=6bp}
\captionsetup[sub]{font=zzu,skip=6bp}
\renewcommand{\thesubfigure}{(\alph{subfigure})}%子图形编号：字母
\renewcommand{\thesubtable}{(\alph{subtable})}%子表格编号：字母
\let\old@tabular\@tabular
\def\zzu@tabular{\ifzzu@bachelor\xiaosi[1.25]\kaishu%
	\else\wuhao[1.5]\fi\old@tabular}%
\let\zzu@LT@array\LT@array%长表格
\def\LT@array{\ifzzu@bachelor\xiaosi[1.25]\kaishu%
	\else\wuhao[1.5]\fi\zzu@LT@array}
\newcolumntype{Z}{>{\centering\arraybackslash}X}%居中自动调整
\newcommand\Xhline[1]{\noalign{\ifnum0=`}\fi\arrayrulewidth#1%
	\ifx\hline\LT@hline\let\@xhline\LT@@hline\fi
	\hrule\@height\arrayrulewidth\futurelet\reserved@a\@xhline}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 数学相关
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand\theequation{%公式编号分隔符
	\ifnum \c@chapter>\z@ \thechapter.\fi\@arabic\c@equation}
\allowdisplaybreaks[4]%允许公式断行分页
\def\zzu@theorem@separator{：}%
\newtheoremstyle{theorem}%定理类型
{0.5ex}%Space above
{0.5ex}%Space below
{\rmfamily}%Body font
{}%Indent amount 
{\sffamily}%Theorem head font
{\zzu@theorem@separator}%Punctuation after theorem head
{1em}%Space after theorem head
{}%Theorem head spec
\renewenvironment{proof}[1][\proofname]{\par%证明
	\pushQED{\qed}%
	\normalfont \topsep6\p@\@plus6\p@\relax
	\trivlist
	\item[\hskip\labelsep
	            \sffamily
	            #1\@addpunct{\quad}]\ignorespaces}
{\popQED\endtrivlist\@endpefalse}
\theoremstyle{theorem}
\newtheorem{definition}{\zzu@definition@name}[chapter]
\newtheorem{theorem}{\zzu@theorem@name}[chapter]
\newtheorem{lemma}[theorem]{\zzu@lemma@name}
\newtheorem{corollary}[theorem]{\zzu@corollary@name}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 章节标题
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\ctexset{%
	chapter={%一级标题：黑体16磅，段前24磅，段后18磅
	  afterindent=true,
	  pagestyle={fancy},
	  beforeskip={\ifzzu@bachelor 12bp\else 5bp\fi},
	  aftername=\hskip\ccwd,
	  afterskip={\ifzzu@bachelor 12bp\else 24bp\fi},
	  format={\sffamily\sanhao[1]},
	  name=\relax,
	  nameformat=\relax,
	  titleformat=\relax,
	  lofskip=0pt,
	  lotskip=0pt,
	 },
	section={%二级标题：黑体14磅，段前24磅，段后6磅
	  afterindent=true,
	  beforeskip={\ifzzu@bachelor 8bp\else 24bp\fi\@plus .5ex \@minus .2ex},
	  afterskip={\ifzzu@bachelor 6bp\else 6bp\fi \@plus .2ex},
	  format={\sffamily\ifzzu@bachelor\xiaosan[1.286]\else\sihao[1.429]\fi},
	 },
	subsection={%三级标题：段前12磅，段后6磅
			afterindent=true,
			indent={0pt}, % 不缩进
			beforeskip={4bp \@plus .5ex \@minus .2ex},
			afterskip={2bp \@plus .2ex},
			format={\sffamily\ifzzu@bachelor\sihao[1.25]%本科
					\else\banxiaosi[1.538]\fi},%硕博黑体13磅
		},
	subsubsection={%四级标题：段前12磅，段后6磅
			afterindent=true,
			indent={0pt}, % 不缩进
			beforeskip={6bp \@plus .5ex \@minus .2ex},
			afterskip={4bp \@plus .2ex},
			format={\ifzzu@bachelor\xiaosi[1.25]%本科
					\else\sffamily\xiaosi[1.667]\fi},%硕博
		},
	paragraph/afterindent=true,
	subparagraph/afterindent=true}

\newcounter{zzu@bookmark}
\def\zzu@chapter*{%\zzu@chapter*[tocline]{title}[header]
%% \@ifnextchar peeks at the following character and compares it with its first argument. 
%% If both are the same it executes its second argument, otherwise its third.
\@ifnextchar [ % ]
{\zzu@@chapter}
	{\zzu@@chapter@}}
\def\zzu@@chapter@#1{\zzu@@chapter[#1]{#1}}
\def\zzu@@chapter[#1]#2{%
\@ifnextchar [ % ]
{\zzu@@@chapter[#1]{#2}}
	{\zzu@@@chapter[#1]{#2}[]}}
\def\zzu@@@chapter[#1]#2[#3]{%
	\ifzzu@doctor\cleardoublepage\else\clearpage\fi\phantomsection%
	\def\@tmpa{#1}
	\def\@tmpb{#3}
	\ifx\@tmpa\@empty
		\addtocounter{zzu@bookmark}\@ne
		\pdfbookmark[0]{#2}{zzuchapter.\thezzu@bookmark}
	\else
		\addcontentsline{toc}{chapter}{#1}
	\fi
	\chapter*{#2}
	\ifx\@tmpb\@empty
		\@mkboth{#2}{#2}
	\else
		\@mkboth{#3}{#3}
	\fi}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 目录及图表清单
%% 目录利用titletoc宏包对目录进行定制
%% 
%% 各章目录：宋体14磅，单倍行距，段前6磅，段后0磅
%%           两端对齐，页码右对齐
%% 一级标题：宋体12磅，单倍行距，段前6磅，段后0磅
%%           左缩进2字符，两端对齐，页码右对齐
%% 二级标题：宋体10.5磅，单倍行距，段前6磅，段后0磅
%%           左缩进4字符，两端对齐，页码右对齐
%% 图和附表清单：宋体10.5磅，行距16磅
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\setcounter{secnumdepth}{2}%章节编号深度：2
\setcounter{tocdepth}{1}%目录深度：2

\renewcommand\tableofcontents{%
	\pagestyle{frontmatterstyle}
	\zzu@chapter*[]{\contentsname} % 禁止将目录加进目录
	\@starttoc{toc}\normalsize}
\renewcommand\listoffigures{ %本科无图和附表清单
	\ifzzu@bachelor\relax\else
		\zzu@chapter*[]{\listfigurename}
		\@starttoc{lof}\fi}
\renewcommand\listoftables{%
	\ifzzu@bachelor\relax\else
		\zzu@chapter*[]{\listtablename}
		\@starttoc{lot}\fi}

\titlecontents{cabstracttoc}[\z@]
{\vspace{6bp}\xiaosi[1]}
{{\thecontentslabel}\quad}{}
{\titlerule*[0.5em]{$\cdot$}\xiaosi\contentspage}
[\addvspace{3bp}] % 下间距
\titlecontents{eabstracttoc}[\z@]
{\addvspace{4bp}\xiaosi[1]} % 上间距
{{\thecontentslabel}\quad}{}
{\titlerule*[0.5em]{$\cdot$}\xiaosi\contentspage}
[\addvspace{16bp}] % 下间距
\titlecontents{chapter}[\z@]{\vspace{6bp}\xiaosi[1]}
{{\thecontentslabel}\quad}{}
{\titlerule*[0.5em]{$\cdot$}\xiaosi\contentspage}
[\addvspace{3bp}] % 下间距
\titlecontents{section}[2\ccwd]{\vspace{6bp} \xiaosi[1]}
{\thecontentslabel\quad}{}
{\titlerule*[0.5em]{$\cdot$}\xiaosi\contentspage}
[\addvspace{3bp}] % 下间距
\titlecontents{subsection}[3\ccwd]{\vspace{6bp} \xiaosi[1]}
{\thecontentslabel\quad}{}
{\titlerule*[0.5em]{$\cdot$}\xiaosi\contentspage}
[\addvspace{3bp}] % 下间距
\titlecontents{figure}[\z@]{\xiaosi[1.524]}%10.5bp，16bp
{\makebox[3.5em][l]{\figurename~\thecontentslabel\quad}}{}
{\hspace{.5em}\titlerule*{.}\contentspage}
\titlecontents{table}[\z@]{\xiaosi[1.524]}%10.5bp，16bp
{\makebox[3.5em][l]{\tablename~\thecontentslabel\quad}}{}
{\hspace{.5em}\titlerule*{.}\contentspage}
\titlecontents{acktoc}[\z@]{\vspace{16bp}\xiaosi[1]}
{{\thecontentslabel}\quad}{}
{\titlerule*[0.5em]{$\cdot$}\xiaosi\contentspage}
\titlecontents{bibtoc}[\z@]{\vspace{16bp}\xiaosi[1]}
{{\thecontentslabel}\quad}{}
{\titlerule*[0.5em]{$\cdot$}\xiaosi\contentspage}
[\addvspace{16bp}] % 下间距
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 封面
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\zzu@def@term#1{%定义封面的一些替换命令
	\expandafter\gdef\csname #1\endcsname##1{%
		\expandafter\gdef\csname zzu@#1\endcsname{##1}}
	\csname #1\endcsname{}}
\zzu@def@term{schoolcode}
\zzu@def@term{thesisno}
\zzu@def@term{id}
\zzu@def@term{secretlevel}
\zzu@def@term{protitle}
\zzu@def@term{ctitle}
\zzu@def@term{cauthor}
\zzu@def@term{stuno}
\zzu@def@term{grade}
\zzu@def@term{score}
\zzu@def@term{csupervisor}
\zzu@def@term{csubject}
\zzu@def@term{cmajor}
\zzu@def@term{cdepartment}
\zzu@def@term{cdate}
\zzu@def@term{submitdate}
\zzu@def@term{etitle}
\zzu@def@term{eauthor}
\zzu@def@term{esupervisor}
\zzu@def@term{emajor}
\zzu@def@term{edepartment}
\zzu@def@term{edate}


\ifzzu@bachelor
	\submitdate{\CJK@todaysmall}%
	\cdate{\CJK@todaysmall}%
\else
	\cdate{\CJK@todaysmall@short}%
\fi

\edate{\ifcase \month \or January\or February\or March\or April\or May%
	\or June\or July \or August\or September\or October\or November
	\or December\fi\unskip,\ \ \the\year}


%  定义一个下划线命令，然后长度可以设置，并对下划线进行居中处理
\newcommand\zzu@underline[2][6em]{%
	\hskip\p@\underline{\hb@xt@ #1{\hss#2\hss}}\hskip3\p@}

% 定义长度，用于分配空间
\newlength{\zzu@title@width}

% 将 #1 居中于新定义的长度
\def\zzu@put@title#1{\makebox{\hb@xt@\zzu@title@width{#1}}}


\newcommand{\zzu@first@titlepage}{%论文中文封面
	\thispagestyle{zzu@empty}
	\begin{center}
		\ifzzu@bachelor%%本科毕业论文
			\begin{minipage}{1.2\textwidth}
				\begin{flushright}
					\wuhao
					\setlength{\zzu@title@width}{4em}
					\begin{tabular}{p{\zzu@title@width}@{~}l}
						\hfill\zzu@put@title{\zzu@thesisno@title} &
						\zzu@underline[9em]{\zzu@thesisno}          \\[1ex]\\
					\end{tabular}
				\end{flushright}
			\end{minipage}
			\vspace*{1cm}
			% 设置河中医 logo
			{\includegraphics{hactcm_logo}}
			\par\vskip1.4cm
			\heiti\xiaochu{本科毕业论文}\\
			\vspace*{\stretch{1}}

			% 设置论文题目
			% 创建一个宽度为8.5cm的文本盒子，在这个盒子内的内容会自动进行折行处理。"[t]"表示盒子内容的顶部和当前位置对齐。
			\songti\sihao\zzu@bachelor@title@pre\zzu@title@sep\parbox[t]{8.5cm}{
				% 将盒子0的内容设置为字符串"\heiti\sihao[1.55]\zzu@ctitle"。即将ctitle的内容设为黑体字，音译一号字(1.55倍普通字体大小)。
				\setbox0=\hbox{{\heiti\sihao[1.55]\zzu@ctitle}}
				% 开始一个picture环境，用于自定义绘图。该环境的四个参数(0,0)(0,0)表示画布的大小和位置，这里设置为(0,0)，不对画布大小做限制。
				\begin{picture}(0,0)(0,0)
					% 设置单位长度为1厘米。
					\setlength\unitlength{1cm}
					% 设置线条的粗细为0.5pt（p@表示点，TeX的长度单位之一）。
					\linethickness{.5\p@}
					% 在坐标(0,-0.25)处绘制一个由点出发，长度为10个单位长度（已经设置为1cm）的线段。线段的方向由坐标(1,0)决定，表示朝x轴正方向。
					\put(0,-0.25){\line(1,0){8.5}}
					\ifdim\wd0>8.5cm
						% 如果盒子0（用于存储ctitle）的宽度大于10cm，则在坐标(0,-1.12)处绘制第二条线段，与第一条线段平行且位置相对较低。
						\put(0,-1.12){\line(1,0){8.5}}
					\fi
				\end{picture}%
				% 输出盒子0的内容，并且在ctitle和后面的内容之间忽略任何空格。结束当前段落。
				\ignorespaces\sihao[1.55]\zzu@ctitle\par
				\vskip.5cm
			}\par % 结束 par 环境

			\parbox[t][4.0cm][t]{22em}{{\sihao[1.8]\rmfamily
						\setlength{\zzu@title@width}{4\ccwd}

						\zzu@put@title{\zzu@author@title}\zzu@title@sep
						\zzu@underline[17em]{\zzu@cauthor}\par

						\zzu@put@title{\zzu@department@title}\zzu@title@sep
						\zzu@underline[17em]{\zzu@cdepartment}\par

						\zzu@put@title{\zzu@major@title}\zzu@title@sep
						\zzu@underline[17em]{\zzu@cmajor}\par

						\zzu@put@title{\zzu@grade@title}\zzu@title@sep
						\zzu@underline[17em]{\zzu@grade}\par

						\zzu@put@title{\zzu@stuno@title}\zzu@title@sep
						\zzu@underline[17em]{\zzu@stuno}\par

						\zzu@put@title{\zzu@supervisor@title}\zzu@title@sep
						\zzu@underline[17em]{\zzu@csupervisor}\par

						\zzu@put@title{\zzu@score@title}\zzu@title@sep
						\zzu@underline[17em]{\zzu@score}\par}}

			% 底部日期居中		
			\vspace*{\stretch{1}}
			\begin{center}
				{\xiaosan\rmfamily\zzu@submitdate}
			\end{center}
			% \clearpage
			% \thispagestyle{zzu@empty}
			%原创性声明及授权声明 
			%上部分
			% \vspace*{\stretch{1}}
			% \begin{center}
			% 	\sffamily\sanhao \zzu@declarename
			% \end{center}
			% \songti\xiaosi[2]\zzu@declaretext
			% \vskip 20pt
			% \begin{tabular}{lll}
			%     \songti\zzu@authorsig & \zzu@signline{} & \zzu@declaredate\\
			%     \songti\zzu@teachersig & \zzu@signline{} & \zzu@declaredate
			% \end{tabular}
			% %下部分
			% \vspace*{\stretch{2}}
			% \begin{center}
			% 	\sffamily\sanhao \zzu@authtitle
			% \end{center}
			% \xiaosi[2]\zzu@authorization
			% \vskip 20pt
			% % 其实就是放在一个表格中
			% \begin{tabular}{lll}
			%     \songti\zzu@authorsig & \zzu@signline{} & \zzu@declaredate\\
			%     \songti\zzu@teachersig & \zzu@signline{} & \zzu@declaredate
			% \end{tabular}
			% \vspace*{\stretch{2}}


			%研究生学位论文
		\else
			\noindent\begin{minipage}{.49\textwidth}
				\begin{flushleft}
					\includegraphics[width=3.35cm]{zzulogo}
				\end{flushleft}
			\end{minipage}
			\hfill
			\noindent\begin{minipage}{.49\textwidth}
				\begin{flushright}
					\kaishu\sihao
					\setlength{\zzu@title@width}{6em}
					\begin{tabular}{p{\zzu@title@width}@{~}l}
						\zzu@put@title{\zzu@schoolcode@title}  &
						\zzu@underline[9em]{\zzu@schoolcode}     \\[1ex]
						\zzu@put@title{\zzu@id@title}          &
						\zzu@underline[9em]{\zzu@id}             \\[1ex]
						\zzu@put@title{\zzu@secretlevel@title} &
						\zzu@underline[9em]{\zzu@secretlevel}    \\
					\end{tabular}
				\end{flushright}
			\end{minipage}
			\vskip \stretch{1}
			\begin{center}
				{\includegraphics{zzu}}
				\par\vskip.6cm
				{\ziju{0.5}\xiaochu\sffamily\zzu@subtitle}
				\vskip \stretch{1}
				\kaishu\erhao[1.5] \zzu@ctitle
				\vskip \stretch{1}
				\setlength{\zzu@title@width}{4\ccwd}
				\kaishu\sanhao[1.25]
				\def\tabcolsep{\p@}%\tabcolsep：tabular环境中两列标准间隔的一半
				\def\arraystretch{1.5}%\arraystretch表格行距的缩放比例因子（缺省为1）
				\begin{tabular}{p{\zzu@title@width}l@{}l}
					\zzu@put@title{\zzu@author@title}     & \zzu@title@sep &
					\zzu@underline[150pt]{\zzu@cauthor}
					\\
					\zzu@put@title{\zzu@supervisor@title} & \zzu@title@sep &
					\zzu@underline[150pt]{\zzu@csupervisor\hspace{\ccwd}\zzu@protitle}
					\\
					\zzu@put@title{\zzu@subject@title}    & \zzu@title@sep &
					\zzu@underline[150pt]{\zzu@csubject}
					\\
					\zzu@put@title{\zzu@major@title}      & \zzu@title@sep &
					\zzu@underline[150pt]{\zzu@cmajor}
					\\
					\ifzzu@doctor\else
					\zzu@put@title{\zzu@department@title} & \zzu@title@sep &
						\zzu@underline[150pt]{\zzu@cdepartment}
					\\
					\fi
					\zzu@put@title{\zzu@cdate@title}      & \zzu@title@sep &
					\zzu@underline[150pt]{\zzu@cdate}
				\end{tabular}\\
				\vskip \stretch{1}
			\end{center}
		\fi
	\end{center}} % end of titlepage
\newcommand{\zzu@engcover}{%硕士和博士论文英文封面
	\thispagestyle{zzu@empty}
	\vspace*{1cm}
	\begin{center}
		\parbox[t][5.8cm][t]{\paperwidth-7.2cm}{
			\renewcommand{\baselinestretch}{1.5}
			\ifzzu@master
				\begin{center}
					\sanhao A thesis submitted to\\
					{\bfseries Zhengzhou University}\\
					for the degree of Master\\
				\end{center}
			\else
				\begin{center}
					\sanhao A dissertation submitted to\\
					{\bfseries Zhengzhou University}\\
					for the degree of Doctor\\
				\end{center}
			\fi}
		\vskip \stretch{1}
		\parbox[t][5.2cm][t]{\paperwidth-7.2cm}{
			\renewcommand{\baselinestretch}{1.5}
			\begin{center}
				\sanhao\bfseries\zzu@etitle
			\end{center}}
		\vskip \stretch{2}
		\parbox[t][3.6cm][b]{\paperwidth-7.2cm}{
			\renewcommand{\baselinestretch}{1.5}
			\begin{center}
				\sanhao
				By\quad{}\zzu@eauthor\par
				Supervisor :\quad\zzu@esupervisor\par
				\zzu@emajor\par
				\zzu@edepartment\par
				\zzu@edate
			\end{center}}
		\vfill
	\end{center}}

% 承诺书
\newcommand{\zzu@declarename}{毕业设计（论文）诚信声明书}
\newcommand{\zzu@authtitle}{毕业设计（论文）版权使用授权书}
\newcommand{\zzu@authorsig}{论文作者}
\newcommand{\zzu@teachersig}{指导教师已阅}
\newcommand{\zzu@signline}[1]{\underline{\makebox[3cm][l]{#1}}（已阅）}

\usepackage{ragged2e}
% 毕业设计（论文）诚信声明书
\newcommand{\zzu@declaretext}{\justifying{\hspace{2\ccwd}本人声明：
		我将提交的毕业论文（设计）《\uline{\hspace{12em}}》，是我在指导教师指导下独立研究、写作的成果，
		论文中所引用他人的无论以何种方式发布的文字、研究成果，均在论文中加以说明；
		有关教师、同学和其他人员对本文的写作、修订提出过并为我在论文中加以采纳的意见、建议，均已在我的致谢辞中加以说明并深致谢意。}}

\newcommand{\zzu@declaredate}{时间：\hspace{4\ccwd} 年\hspace{2\ccwd} 月\hspace{2\ccwd} 日}

% 毕业设计（论文）版权使用授权书
\newcommand{\zzu@authorization}{\hspace{2\ccwd}本毕业论文《\uline{\hspace{12em}}》是本人在校期间所完成学业的组成部分，
	是在河南中医药大学教师的指导下完成的，因此，本人特授权对河南中医药大学可将本毕业论文的全部或部分内容编入有关书籍、
	数据库保存，可采用复制、印刷、网页制作等方式将论文文本和经过编辑、批注等处理的论文文本提供给读者查阅、参考，
	可向有关学术部门和国家有关教育主管部门呈送复印件和电子文档。本毕业论文无论做何种处理，必须尊重本人的著作权，署明本人姓名。}

\newcommand{\zzu@authdate}{时间：\hspace{4\ccwd} 年\hspace{2\ccwd} 月\hspace{2\ccwd} 日}


\def\zzu@setup@pdfinfo{%pdf文档信息
	\hypersetup{%
		pdftitle={\zzu@ctitle},
		pdfauthor={\zzu@cauthor},
		pdfsubject={\zzu@schoolname\zzu@subtitle},
		pdfkeywords={\zzu@ckeywords},
		pdfcreator={\zzuthesis-v\version}}}


\newcommand{\makecover}{%制作封面
	\zzu@setup@pdfinfo
	\phantomsection
	\pdfbookmark[-1]{\zzu@ctitle}{ctitle}
	\normalsize%
	\begin{titlepage}
		\zzu@first@titlepage
		\ifzzu@bachelor\clearpage
		\else
			\ifzzu@doctor\cleardoublepage\else\clearpage\fi
			\zzu@engcover
			\ifzzu@doctor\cleardoublepage\else\clearpage\fi
			\zzu@authorization@mk
		\fi%
	\end{titlepage}
	\normalsize
	% \zzu@makeabstract
	% \let\@tabular\zzu@tabular
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 中英文摘要及关键词
%% 中文摘要部分的标题为"摘要"(本科为"中文摘要"，黑体三号字)
%%   关键词之间空两个汉字符宽度，悬挂缩进
%% 英文摘要部分的标题为 Abstract，用 Arial 体三号字
%%   关键词之间空四个英文字符宽度，悬挂缩进
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\zzu@@cabstract}[1]{\long\gdef\zzu@cabstract{#1}}
\newenvironment{cabstract}{\Collect@Body\zzu@@cabstract}{}
\newcommand{\zzu@@eabstract}[1]{\long\gdef\zzu@eabstract{#1}}
\newenvironment{eabstract}{\Collect@Body\zzu@@eabstract}{}

% 根据关键词定义，并创建无初始定义的命令
\def\zzu@parse@keywords#1{
	\define@key{zzu}{#1}{\csname #1\endcsname{##1}}
	\expandafter\gdef\csname zzu@#1\endcsname{}
	\expandafter\gdef\csname #1\endcsname##1{
		\@for\reserved@a:=##1\do{
			\expandafter\ifx\csname zzu@#1\endcsname\@empty\else
				\expandafter\g@addto@macro\csname zzu@#1\endcsname{%
					\ignorespaces\csname zzu@#1@separator\endcsname}
			\fi
			\expandafter\expandafter\expandafter\g@addto@macro%
			\expandafter\csname zzu@#1\expandafter\endcsname\expandafter{\reserved@a}}}}
\zzu@parse@keywords{ckeywords}
\zzu@parse@keywords{ekeywords}
%新建一个盒子来存储关键词，并创建格式化函数
\newbox\zzu@kw
\newcommand\zzu@put@keywords[2]{%
	\begingroup
	\setbox\zzu@kw=\hbox{#1}
	\ifzzu@bachelor\indent\else\noindent\hangindent\wd\zzu@kw\hangafter1\fi%
	\box\zzu@kw#2\par
	\endgroup}


% 摘要的相关配置
\newcommand{\zzu@makeabstract}{%
	\ifzzu@doctor\cleardoublepage\else\clearpage\fi
	\pagestyle{frontabstractstyle}
	% \phantomsection
	% \addcontentsline{toc}{cabstracttoc}{\cabstractname} % 添加中文摘要到目录
	\begin{center}
		\sffamily \xiaoer{\zzu@ctitle}
	\end{center}
	\begin{center}
		\rmfamily \xiaosan{\zzu@cauthor}
	\end{center}
	% \phantomsection
	% \addcontentsline{toc}{cabstracttoc}{\cabstractname} % 添加中文摘要到目录
	\begin{center}
		\phantomsection
		\addcontentsline{toc}{cabstracttoc}{\cabstractname} % 添加中文摘要到目录
		\sffamily \sanhao{\cabstractname}
	\end{center}

	% \zzu@chapter*[]{\cabstractname} % no tocline
	\pagestyle{frontabstractstyle}
	\pagenumbering{Roman}
	\zzu@cabstract
	\vskip12bp
	\zzu@put@keywords{\textbf\zzu@ckeywords@title}{\zzu@ckeywords}
	\newpage % 在这里加入新的页面分隔
	\begin{center}
		\rmfamily \textbf{\xiaoer{\zzu@etitle}}
	\end{center}
	\begin{center}
		\rmfamily \xiaosan{\zzu@eauthor}
	\end{center}
	% \phantomsection
	% \addcontentsline{toc}{eabstracttoc}{\eabstractname} % 添加英文摘要到目录
	\begin{center}
		\phantomsection
		\addcontentsline{toc}{eabstracttoc}{\eabstractname} % 添加英文摘要到目录
		\rmfamily \textbf{\xiaosan{\eabstractname}}
	\end{center}
	% \zzu@chapter*[]{\eabstractname} % no tocline
	\zzu@eabstract
	\vskip12bp
	\zzu@put@keywords{%
		\textbf{\ifzzu@bachelor Keywords:\else Key Words:\fi\enskip}}{\zzu@ekeywords}%
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 主要符号对照表
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newenvironment{denotation}[1][2.5cm]{
	\ifzzu@doctor\cleardoublepage\else\clearpage\fi
	\zzu@chapter*[]{\zzu@denotation@name}
	\noindent\begin{list}{}%
		{\vskip-30bp\wuhao[1.524]%宋体五号(10.5磅)，行距16磅
			\renewcommand\makelabel[1]{##1\hfil}
			\setlength{\labelwidth}{#1}%标签盒子宽度
			\setlength{\labelsep}{0.5cm}%标签与列表文本距离
			\setlength{\itemindent}{0cm}%标签缩进量
			\setlength{\leftmargin}{\labelwidth+\labelsep}%左边界
			\setlength{\rightmargin}{0cm}
			\setlength{\parsep}{0cm}%段落间距
			\setlength{\itemsep}{0cm}%标签间距
			\setlength{\listparindent}{0cm}%段落缩进量
			\setlength{\topsep}{\z@}%标签与上文的间距
		}}{\end{list}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 致谢
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newenvironment{ack}{%
	\ifzzu@doctor\cleardoublepage\else\clearpage\fi
	\zzu@chapter*[]{\zzu@ackname}
	\addcontentsline{toc}{acktoc}{\zzu@ackname} % 添加中文摘要到目录
	\songti\xiaosi[1.524]%仿宋五号，固定行距16磅
}{
	\begin{center}
		{\xiaosi\rmfamily\zzu@cauthor}\\
		{\xiaosi\rmfamily\zzu@submitdate}
	\end{center}
	%      {\xiaosi\rmfamily\zzu@submitdate}
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 综述
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newenvironment{review}{%
	\ifzzu@doctor\cleardoublepage\else\clearpage\fi
	\ctexset{chapter/format+=\raggedright}
	\zzu@chapter*{\zzu@review@title}
	\begin{center}
		\sanhao[1.55]
		\zzu@ctitle \\
		综述 \zzu@cauthor\hspace{2em} 审校 \zzu@csupervisor
	\end{center}
	\fangsong\xiaosi[1.524]%仿宋五号，固定行距16磅
}{}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%    参考文献环境
%% 1. 文献作者不超过3位时，全部列出；超过时只列前3位，后面加“等”或相应外文；
%% 2. 作者姓名之间用“,”分开，建议根据《中国高校自然科学学报编排规范》的要求
%%    书写参考文献，并按引用顺序将其附于文末，该规范建议根据国标书写参考文献。
%% 3. 引用参考文献的位置，上标标注[参考文献序号]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\bibpunct{[}{]}{,}{s}{}{,}
\renewcommand\NAT@citesuper[3]{\ifNAT@swa%
	\unskip\kern\p@\textsuperscript{\NAT@@open #1\NAT@@close}%
	\if*#3*\else\ (#3)\fi\else #1\fi\endgroup}
\DeclareRobustCommand\onlinecite{\@onlinecite}
\def\@onlinecite#1{
	\begingroup\let\@cite\NAT@citenum\citep{#1}
	\endgroup
}
\renewenvironment{thebibliography}[1]{%
	\zzu@chapter*[]{\bibname}%
	\addcontentsline{toc}{bibtoc}{\bibname} % 添加中文摘要到目录
	\wuhao[1.524]%宋体五号，行距16磅
	\list{\@biblabel{\@arabic\c@enumiv}}%
	{\renewcommand{\makelabel}[1]{##1\hfill}
		\settowidth\labelwidth{1.1cm}
		\setlength{\labelsep}{0.4em}
		\setlength{\itemindent}{\z@}
		\setlength{\leftmargin}{\labelwidth+\labelsep}
		\addtolength{\itemsep}{-0.7em}
		\usecounter{enumiv}%
		\let\p@enumiv\@empty
		\renewcommand\theenumiv{\@arabic\c@enumiv}}%
	\sloppy\frenchspacing
	\clubpenalty4000
	\@clubpenalty \clubpenalty
	\widowpenalty4000%
	\interlinepenalty4000%
	\sfcode`\.\@m}
{\def\@noitemerr
	{\@latex@warning{Empty `thebibliography' environment}}%
	\endlist\frenchspacing}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 附录 以后再改
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\let\zzu@appendix\appendix
\renewenvironment{appendix}{%
	\zzu@appendix
	\gdef\@chapapp{\appendixname~\thechapter}
	\renewcommand\theequation{%
		\ifnum \c@chapter>\z@ \thechapter\fi\@arabic\c@equation}
}{}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 个人简历、在学期间发表的学术论文及研究成果
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newenvironment{resume}[1][\zzu@resume@title]{%
	\zzu@chapter*{#1}\wuhao[1.524]}{}
\newcommand{\resumeitem}[1]{\vspace{2em}{\sihao\sffamily{#1}}\vspace{.5em}\par}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 延迟的代码 (Delaying code)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\AtEndOfClass{\sloppy}
\endinput
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% End of file `zzuthesis.cls'.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
