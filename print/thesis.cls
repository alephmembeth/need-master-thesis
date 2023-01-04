\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{thesis}
\LoadClass[12pt,parskip=false]{scrartcl}

% Optionen
\setkomafont{sectioning}{\normalfont\bfseries}
\renewcommand{\descriptionlabel}[1]{%
\hspace{\labelsep}\textrm{\textbf{#1}}}
\DeclareOption{sansserifheadings}{\setkomafont{sectioning}{\sffamily\bfseries}
\renewcommand{\descriptionlabel}[1]{%
\hspace{\labelsep}\textsf{\textbf{#1}}}}
\DeclareOption{sansserifheadings}{\setkomafont{sectioning}{\sffamily\bfseries}}
\newif\ifacroindex
\acroindexfalse
\DeclareOption{acroindex}{\acroindextrue}
\newcommand{\acrosetup}{
\ifacroindex
\acsetup{hyperref=true,
   list-style=longtabu,
   list-long-format=\makefirstuc,
   foreign-format=\itshape,
   list-foreign-format=\itshape\acroenparen,
   index
}%
\else%
\acsetup{hyperref=true,%
   list-style=longtabu,%
   list-long-format=\makefirstuc,%
   foreign-format=\itshape,%
   list-foreign-format=\itshape\acroenparen,%
}%
\fi}
\DeclareOption{acrosingle}{
\renewcommand{\acrosetup}{
\ifacroindex
\acsetup{hyperref=true,
   list-style=longtabu,
   list-long-format=\makefirstuc,
   foreign-format=\itshape,
   list-foreign-format=\itshape\acroenparen,
   single=true,
   single-form=first,
   index
}%
\else%
\acsetup{hyperref=true,
   list-style=longtabu,
   list-long-format=\makefirstuc,
   foreign-format=\itshape,
   list-foreign-format=\itshape\acroenparen,
   single=true,
   single-form=first%
}%
\fi
}
}
\newcommand{\Sprachwahl}{\selectlanguage{ngerman}}
\DeclareOption{englisch}{\renewcommand{\Sprachwahl}{\selectlanguage{english}}}
\newif\ifabbreviationstoc
\abbreviationstocfalse
\DeclareOption{abbreviationstoc}{\abbreviationstoctrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{scrartcl}}
\ProcessOptions\relax

%Pakete
\RequirePackage[greek,english,ngerman]{babel}
\RequirePackage[T1]{fontenc}
\RequirePackage{xcolor}
\RequirePackage[utf8]{inputenc}
\RequirePackage{microtype}
\RequirePackage{blindtext}
\RequirePackage{lmodern}
\RequirePackage{mathptmx}
\RequirePackage[scaled=.92]{helvet}
\RequirePackage[pdftex]{graphicx}
\RequirePackage{float}
\RequirePackage[onehalfspacing]{setspace}
\RequirePackage{textcomp}
\RequirePackage[numbers]{natbib}
\RequirePackage[nottoc]{tocbibind}
\RequirePackage{eurosym}
\RequirePackage{enumitem}
\RequirePackage{amsmath,amssymb}
\RequirePackage{etoolbox}
\RequirePackage{xpatch}
\RequirePackage{tikz}
\RequirePackage{longtable,tabu}
\RequirePackage{simplecd}
\RequirePackage{acro}
\RequirePackage{imakeidx}
\RequirePackage[all]{nowidow}
\RequirePackage{mfirstuc}
\RequirePackage[autostyle=true,german=guillemets]{csquotes}
\RequirePackage{tabularx}
\RequirePackage{wasysym}
\RequirePackage[]{pdfpages}
\RequirePackage[automark,headsepline,footsepline,markcase=nouppercase]{scrlayer-scrpage}
\RequirePackage{geometry}
\RequirePackage[hyphens]{url}
\AtEndPreamble{\RequirePackage[colorlinks=true,urlcolor=black,linkcolor=black,citecolor=black,pdftex,bookmarksopen=true]{hyperref}}
\AtEndPreamble{\RequirePackage[unbalanced,totoc]{idxlayout}}

\usepackage{pgfplots} \pgfplotsset{compat=1.9}
\usepackage{endnotes}
\usepackage{epigraph}
\usepackage[hang]{footmisc}
\usepackage{GoudyIn}
\usepackage{lettrine}
\usepackage{graphicx,adjustbox}

\usepgfplotslibrary{colorbrewer}

% Einstellungen
\AtBeginDocument{\Sprachwahl}

\newcommand{\bilingual}[3]{%
   \newcommand{#1}{%
      \iflanguage{english}{#2}{%
      \iflanguage{ngerman}{#3}{%
      }}%
   }%
}
\let\mynewcommand\bilingual

% Stichwortverzeichnis
\bilingual{\NameIndex}{Index}{Stichwortverzeichnis}
\bilingual{\SymboleGross}{Symbols}{Symbole}
\bilingual{\SymboleKlein}{symbols}{symbole}
\bilingual{\ZahlenGross}{Numbers}{Zahlen}
\bilingual{\ZahlenKlein}{numbers}{zahlen}

\begingroup\newif\ifmy
\IfFileExists{index_style.ist}{}{\mytrue}
\ifmy
\begin{filecontents}{index_style.ist}
headings_flag 1
heading_prefix "{\\bfseries "
heading_suffix "}\\nopagebreak\n"
delim_0 " \\dotfill "
delim_1 " \\dotfill "
delim_2 " \\dotfill "
symhead_positive "\\SymboleGross"
symhead_negative "\\SymboleKlein"
numhead_positive "\\ZahlenGross"
numhead_negative "\\ZahlenKlein"
\end{filecontents}
\fi\endgroup

\indexsetup{firstpagestyle=scrheadings} \makeindex[columns=2,title=\NameIndex, options={-s index_style.ist}]

% Kopf- und Fußzeilen
\renewcommand*{\sectionmarkformat}{}
\renewcommand*{\subsectionmarkformat}{}
\renewcommand*{\headfont}{\normalfont}
\automark[section]{section}
\cohead{\rightmark}
\cehead{\lefttopmark}
\cfoot*{\pagemark}
\ihead*{}
\ohead*{}
\ifoot*{}
\ofoot*{}
\pagestyle{scrheadings}

\setlength{\headheight}{2em}
\setlength{\footheight}{2em}
\setlength{\footskip}{13.5mm}

% Seitenränder
\AtEndPreamble{
\providecommand{\SeitenrandLinks}{3cm}
\providecommand{\SeitenrandRechts}{3cm}
\providecommand{\SeitenrandOben}{2.5cm}
\providecommand{\SeitenrandUnten}{2.5cm}
\geometry{a4paper,left=\SeitenrandLinks, right=\SeitenrandRechts, top=\SeitenrandOben, bottom=\SeitenrandUnten} 
}

% Literaturverzeichnis
\urlstyle{same}
\renewcommand\harvardurl[1]{\url{#1}}
\setcitestyle{aysep={},notesep={: },yysep={, }}
\AtBeginDocument{\renewcommand{\harvardand}{\bbland}}
\renewcommand{\UrlBreaks}{\do\/\do\a\do\b\do\c\do\d\do\e\do\f\do\g\do\h\do\i\do\j\do\k\do\l\do\m\do\n\do\o\do\p\do\q\do\r\do\s\do\t\do\u\do\v\do\w\do\x\do\y\do\z\do\A\do\B\do\C\do\D\do\E\do\F\do\G\do\H\do\I\do\J\do\K\do\L\do\M\do\N\do\O\do\P\do\Q\do\R\do\S\do\T\do\U\do\V\do\W\do\X\do\Y\do\Z}
\renewcommand{\autodot}{}

% Fußnoten
\deffootnote{2em}{1em}{\makebox[2em][l]{\thefootnotemark}}
\setlength{\skip\footins}{1.5em}
\setlength{\footnotesep}{1em}

% Abbildungen
\addto\captionsenglish{\renewcommand{\figurename}{Fig.}}
\addto\captionsngerman{\renewcommand{\figurename}{Abb.}}

% Seitenzahlen
\newcounter{savepage}

% Abbildungs- und Tabellenverzeichnis
\makeatletter
\renewcommand*\l@figure{\@dottedtocline{1}{0em}{2.3em}}% Default: 1.5em/2.3em
\let\l@table\l@figure
\makeatother

% Parameter für PDF-Dokumente
\makeatletter
\AtBeginDocument{
\date{\Datum}
\title{\TitelDerArbeit}
\ifdefined\Praxisinstitution
\ifdefined\Praktikumszeitraum
   \def\Untertitel{Praxisinstitution: \Praxisinstitution. Praktikumszeitraum: \Praktikumszeitraum}
\else
\def\Untertitel{Praxisinstitution: \Praxisinstitution.}
\fi
\else
\ifdefined\Praktikumszeitraum
   \def\Untertitel{Praktikumszeitraum: \Praktikumszeitraum}
\else
\providecommand\Untertitel{ }
\fi
\fi
\subtitle{\Untertitel}
   \hypersetup{
      pdftitle={\@title},
      pdfauthor={\@author},
      pdfkeywords={\Stichwoerter},
      pdfsubject={\Thema},
   }
}
\makeatother

% Zeilenabstand 
\makeatletter
\newcommand{\MSonehalfspacing}{%
   \setstretch{1.44}
   \ifcase\@ptsize\relax
      \setstretch{1.448}
   \or
      \setstretch{1.399}
   \or
      \setstretch{1.433}
   \fi
}
\newcommand{\MSdoublespacing}{%
   \setstretch {1.92}
   \ifcase \@ptsize \relax
      \setstretch{1.936}
   \or
      \setstretch{1.866}
   \or
      \setstretch{1.902}
   \fi
}
\makeatother   

\MSonehalfspacing

% Abstand vor Longtables
\setlength{\LTpre}{0.75em}

% Quote-Umgebung
\renewenvironment{quote}{\list{}{\leftmargin=1em\singlespacing}\item[]}{\endlist}

\newenvironment{literatur}{%
   \parskip6pt\parindent0pt\raggedright
   \def\lititem{\hangindent=2cm\hangafter1}}{%
   \par\ignorespaces}

% Makros %%
\makeatletter
\newcommand*{\centerfloat}{
   \parindent\z@
   \leftskip\z@\@plus 1fil\@minus\textwidth
   \rightskip\leftskip
   \parfillskip\z@skip}
\makeatother

\newcolumntype{L}[1]{>{\raggedright\arraybackslash}p{#1}}
\newcolumntype{C}[1]{>{\centering\arraybackslash}p{#1}}
\newcolumntype{R}[1]{>{\raggedleft\arraybackslash}p{#1}}

\newcommand{\ltab}{\raggedright\arraybackslash}
\newcommand{\ctab}{\centering\arraybackslash}
\newcommand{\rtab}{\raggedleft\arraybackslash}

\let\anf\enquote
\let\anff\enquote

\newcommand{\Monospace}[1]{
\ttfamily
\fontdimen2\font=0.4em
\fontdimen3\font=0.2em
\fontdimen4\font=0.1em
\fontdimen7\font=0.1em
\hyphenchar\font=`\-
{#1}
\normalfont}

\addtocontents{toc}{\vspace{-0.75em}}

\def\Inhaltsverzeichnis{
\cleardoublepage
\pagenumbering{Roman}
\setcounter{page}{\thesavepage}
\pagestyle{plain.scrheadings}
\onehalfspacing
\pdfbookmark[1]{\contentsname}{toc}\tableofcontents    
\MSonehalfspacing    
\cleardoublepage
\pagestyle{scrheadings}
\setcounter{savepage}{\arabic{page}}
\pagenumbering{arabic}}
\addto\captionsenglish{
   \renewcommand{\contentsname}%
      {Table of Contents}%
}

\providecommand*{\donothing}[1]{}
\providecommand*{\printsecond}[2]{#2}

\bilingual{\NameAbkuerzungsverzeichnis}{List of Abbreviations}{Abkürzungsverzeichnis}

\def\Abkuerzungsverzeichnis{\cleardoublepage 
\pagenumbering{Roman}
\setcounter{page}{\thesavepage}
\pagestyle{plain.scrheadings}
\ifabbreviationstoc
\addcontentsline{toc}{section}{\NameAbkuerzungsverzeichnis}
\phantomsection
\else
\pdfbookmark[1]{\NameAbkuerzungsverzeichnis}{Abkuerzungsverzeichnis}
\fi%
\printacronyms[name={\NameAbkuerzungsverzeichnis},exclude-classes={noprint}]
\cleardoublepage
\pagestyle{scrheadings}
\setcounter{savepage}{\arabic{page}}
\pagenumbering{arabic}

\addtocounter{table}{-1}
}

\def\Literaturverzeichnis{
\cleardoublepage

\bibliography{bibo}}

\def\Stichwortverzeichnis{\hbadness=10000 \cleardoublepage \printindex}

\def\Abbildungsverzeichnis{
\cleardoublepage

\listoffigures}

\def\Tabellenverzeichnis{
\cleardoublepage

\listoftables}

\newcounter{Anhang}

\bilingual{\NameAnhang}{Appendix}{Anhang}

\makeatletter
\patchcmd{\appendix}{\@Alph}{\@Roman}{}{}
\makeatother

\newcommand{\sectionanhang}[1]{\cleardoublepage 
{\ifnum\theAnhang=0%
\appendix
\fi}
\renewcommand*{\sectionformat}{}
\renewcommand\addsectiontocentry[2]{\addtocentrydefault{section}{}{##2}}
\stepcounter{Anhang} \section{\NameAnhang{} \Roman{Anhang}: {#1}}}

\newcommand{\sectionanhangplain}[1]{\cleardoublepage 
{\ifnum\theAnhang=0%
\appendix
\fi}
\renewcommand*{\sectionformat}{}
\renewcommand\addsectiontocentry[2]{\addtocentrydefault{section}{}{##2}}
\stepcounter{Anhang} \section{{#1}}}

\newcommand\invisiblesection[1]{%
\addcontentsline{toc}{section}{#1}
\sectionmark{#1}}
\bilingual{\Anhang}{
\cleardoublepage
\phantomsection
\invisiblesection{Appendix}}{
\cleardoublepage
\phantomsection
\invisiblesection{Anhang}}

\newcommand{\AnhangSubsection}[1]{
\phantomsection
\addcontentsline{toc}{subsection}{#1}
\section*{#1}}

\bilingual{\NameDanksagung}{Acknowledgements}{Vorwort und Dank}
 
\newcommand{\Danksagung}[1]{
\pagenumbering{Roman}
\setcounter{page}{\thesavepage}
\pagestyle{plain.scrheadings}
\pdfbookmark[1]{\NameDanksagung}{\NameDanksagung}\section*{\NameDanksagung}

{#1}
 
\cleardoublepage
\setcounter{savepage}{\arabic{page}}
\pagenumbering{arabic}
}

\bilingual{\NameZitate}{Citations}{Zitate}
 
\newcommand{\Zitate}[1]{
\cleardoublepage
\pagenumbering{Roman}
\setcounter{page}{\thesavepage}
\pagestyle{plain.scrheadings}
\pdfbookmark[1]{\NameZitate}{\NameZitate}

{#1}
 
\cleardoublepage
\setcounter{savepage}{\arabic{page}}
\pagenumbering{arabic}
}

\bilingual{\NameZitateText}{Citations Text}{Zitate Text}
 
\newcommand{\ZitateText}[1]{
\cleardoublepage
\pagestyle{plain.scrheadings}
}

\bilingual{\NameDaten}{Data}{Daten}
 
\newcommand{\Daten}[1]{
\cleardoublepage
\pagenumbering{Roman}
\setcounter{page}{\thesavepage}
\pagestyle{plain.scrheadings}
\pdfbookmark[1]{\NameDaten}{\NameDaten}

{#1}
 
\cleardoublepage
\setcounter{savepage}{\arabic{page}}
\pagenumbering{arabic}
}

\bilingual{\NameWidmung}{Dedication}{Widmung}

\newcommand{\Widmung}[1]{
\pagestyle{empty}
\cleardoublepage
\pagenumbering{Roman}
\setcounter{page}{\thesavepage}
\pdfbookmark[1]{\NameWidmung}{\NameWidmung}
\vspace*{75mm}

\begin{center}
\textit{{#1}}
\end{center}

\vspace*{\fill}
\cleardoublepage
\setcounter{savepage}{\arabic{page}}
\pagenumbering{arabic}
\pagestyle{scrheadings}
}

\setlength{\DefaultNindent}{0.2777em}
\setcounter{DefaultLines}{3}
\renewcommand{\LettrineFontHook}{\GoudyInfamily{}}
\LettrineTextFont{\itshape}

\newtheorem{Definition}{Definition}
\newtheorem{Axiom}{Axiom}

\newcommand\blfootnote[1]{
   \begingroup
   \renewcommand\thefootnote{}\footnote{#1}
   \addtocounter{footnote}{-1}
   \endgroup
}

\bibliographystyle{plain}  

\renewcommand{\notesname}{Endnoten}

\renewcommand{\makeenmark}{\hbox{$^{\theenmark}$}}
\makeatletter
\def\enoteformat{%
   \rightskip\z@\leftskip\z@\parindent=1.8em
   \leavevmode{\setbox\z@=\lastbox}\llap{\theenmark.\enskip}%
}
\makeatother
