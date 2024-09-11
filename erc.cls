\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{../erc}[2019/02/26 erc]
\LoadClass[oneside, a4paper, onecolumn, fontsize=11pt]{scrartcl}

\PassOptionsToPackage{svgnames}{xcolor}
\newif\ifguidance
\DeclareOption{guidance}{%
  \guidancetrue
}

\newif\ifstricterc
\DeclareOption{stricterc}{%
  \stricterctrue
}

%%%% LaTeX 11pt is not the same as 11pt of word, adobe etc.
%%%% See here:
%%%% https://tex.stackexchange.com/questions/264624/where-and-why-does-lualatex-scale-down-the-requested-base-font-size
%%%% Make sure font sizes are accurate:
\def\@xpt{10}
\def\@xipt{11.0396}
\def\@xiipt{12.040133779}
\def\@xivpt{14.050179211}
\def\@xviipt{17}
\def\@xxpt{20.071684588}%(14/14.95)*20
\def\@xxvpt{25}


\ProcessOptions{}
\RequirePackage{mathptmx}
\RequirePackage{graphicx}
\graphicspath{{../img/}}
\RequirePackage{amssymb}
\RequirePackage{paralist}
\RequirePackage{microtype}
\RequirePackage[pdfborder={0 0 0},colorlinks,citecolor=Violet, linkcolor=Red, urlcolor=blue]{hyperref}
\RequirePackage[dvipsnames]{xcolor}
\RequirePackage{longtable}
\RequirePackage{booktabs}
\RequirePackage{textcomp}
\RequirePackage{array}
\RequirePackage[TS1,T1]{fontenc}
\RequirePackage[most]{tcolorbox}
\RequirePackage{xcolor}


\newsavebox{\@abstract}
\renewenvironment{abstract}
{\begin{lrbox}{\@abstract}\begin{minipage}{0.945\textwidth}}
{\end{minipage}\end{lrbox}\fbox{\usebox{\@abstract}}}

\setkomafont{section}{\normalsize\normalfont\bfseries}
\setkomafont{subsection}{\normalsize\normalfont\bfseries}
\setkomafont{subsubsection}{\normalsize\normalfont\bfseries}
\renewcommand{\thesection}{Section~\alph{section}}
\renewcommand\thesubsection{\arabic{subsection}}
\renewcommand\subsectionformat{\thesubsection) }
\renewcommand\subsubsectionformat{\thesubsubsection) }

\RequirePackage{ifthen}

\RequirePackage[style=authoryear]{biblatex}
\ExecuteBibliographyOptions{maxnames=8,giveninits,parentracker=true,uniquename=init}
\defbibnote{bolditalics}{My name appears in bold, names of PhD students I supervised in italics.}

\RequirePackage{xpatch}
\RequirePackage{xstring}
% Adapted from
% http://tex.stackexchange.com/questions/73136/make-specific-author-bold-using-biblatex
\newbibmacro*{name:bold}[2]{%
  \edef\blx@tmp@name{\expandonce#1, \expandonce#2}%
  \def\do##1{\edef\blah{##1\bibinitperiod}\ifdefstrequal{\blx@tmp@name}{\blah}{\itshape\listbreak}{}}%
  \dolistloop{\italicnames}%
  \def\do##1{\edef\blah{##1\bibinitperiod}\ifdefstrequal{\blx@tmp@name}{\blah}{\bfseries\listbreak}{}}%
  \dolistloop{\boldnames}%
}
\newcommand*{\boldnames}{}
\newcommand*{\italicnames}{}

\xpretobibmacro{name:family}{\begingroup\usebibmacro{name:bold}{#1}{#2}}{}{}
\xpretobibmacro{name:given-family}{\begingroup\usebibmacro{name:bold}{#1}{#2}}{}{}
\xpretobibmacro{name:family-given}{\begingroup\usebibmacro{name:bold}{#1}{#2}}{}{}
\xpretobibmacro{name:delim}{\begingroup\normalfont}{}{}

\xapptobibmacro{name:family}{\endgroup}{}{}
\xapptobibmacro{name:given-family}{\endgroup}{}{}
\xapptobibmacro{name:family-given}{\endgroup}{}{}
\xapptobibmacro{name:delim}{\endgroup}{}{}

\RequirePackage{scrlayer-scrpage}
\pagestyle{scrheadings}
\clearpairofpagestyles
\renewcommand{\headfont}{\normalfont}
\ihead[\emph{\@authorshort}]{\emph{\@authorshort}}

\ohead[\@acronym]{\@acronym}
\cfoot[\pagemark]{\pagemark}

\newcommand{\acronym}[1]{\def\@acronym{#1}}
\newcommand{\institution}[1]{\def\@institution{#1}}
\renewcommand{\author}[2][]{\def\@authorshort{#1}\def\@author{#2}}
\newcommand\monthcount[1]{\def\@monthcount{#1}}

\newcommand\oauthor[1]{#1 &}
\newcommand\oinstitution[1]{#1 \\}

\newcommand\otherauthors[1]{%
\def\@otherauthors{#1}
}

\definecolor{sectionrectanglecolor}{rgb}{0.25,0.5,0.75}
\definecolor{sectiontitlecolor}{rgb}{0.2,0.4,0.65}
\definecolor{subsectioncolor}{rgb}{0,0,0}

\newcommand*{\sectionfont}{\large\sffamily\mdseries\upshape}
\newcommand*{\hintfont}{\small\sffamily}
\newcommand*{\subsectionfont}{\normalsize\sffamily\mdseries\upshape}

\providecommand*{\sectionstyle}[1]{{\sectionfont\color{sectiontitlecolor}#1}}
\providecommand*{\subsectionstyle}[1]{{\subsectionfont\color{subsectioncolor}#1}}

\DeclareBibliographyCategory{self}
\AtEveryCitekey{%
  \ifcategory{self}{%
  }{%
  \defcounter{maxnames}{2}%
  }%
}

\newcommand*{\mknamesignature}[5]{\xdef#1{#2|||}}

\DeclareIndexNameFormat{byname}%
 {%
  \mknamesignature{\currentsignature}{\namepartfamily}{\namepartgiven}{\namepartprefix}{\namepartsuffix}%
  \ifdefequal{\highlightname}{\currentsignature}%
    {\addtocategory{self}{\thefield{entrykey}}}%
    {}%
}

\AtDataInput{\indexnames[byname]{author}}

\newif\ifbone

\let\cite\autocite
\setlength{\parindent}{0pt}

\ifstricterc
\tcbset{
    frame code={},
    center title,
    left=0pt,
    right=0pt,
    top=0pt,
    bottom=0pt,
    colback=gray!70,
    colframe=white,
    width=\dimexpr\textwidth\relax,
    enlarge left by=0mm,
    boxsep=5pt,
    arc=0pt,outer arc=0pt,
    }
\fi

\ifguidance
\newenvironment{ercguidance}%
               {\begin{center}\begin{tcolorbox}[width=0.95\textwidth]}
               {\end{tcolorbox}\end{center}}
\newcommand{\ercguidanceInline}[1]%
           {\textcolor{Gray}{#1}}
\else
\RequirePackage{environ}
\NewEnviron{ercguidance}{}
\newcommand{\ercguidanceInline}[1]%
           {}
\fi

\renewcommand\labelitemi{-}
