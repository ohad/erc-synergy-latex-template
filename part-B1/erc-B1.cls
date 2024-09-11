\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{erc-B1}[2019/02/26 erc-B1]

\DeclareOption{guidance}{%
  \PassOptionsToClass{guidance}{erc}
}
\DeclareOption{stricterc}{%
  \PassOptionsToClass{stricterc}{erc}
}
\ProcessOptions{}

\LoadClass{../erc}

\RequirePackage[left=2cm,top=1.5cm,bottom=1.7cm,right=2cm,headsep=.45cm,footskip=.6cm]{geometry}


%% Enforce structure of document
% Assume \HasAbstract has been created by erc.cls
\newif\ifHasSynopsis
\newif\ifHasCV

\AtEndDocument{%
  %% Check synopsis is present
  \ifHasSynopsis
  \else
  \ClassError{Part B1}{Missing synopsis section.
    Add the {synopsis} environment after the abstract and before the
    CV sections}
  \fi
  %% Check CVs section is present
  \ifHasCV
  \else
  \ClassError{Part B1}{Missing curriculum vitae section.
    Add the {cvs} environment after the abstract and before the CV sections}
  \fi
}


\chead[Part B1]{Part B1}

\def\maketitle{\vspace*{.45cm}{\centering\bfseries%
{\large ERC \erctype{} Grant \ercyear{}}\\
{\Large Research proposal [Part B1]}\\
\ercguidanceInline{
\textit{(Part B1 is evaluated both in Step 1, Step 2, and Step 3,\\
     Part B2 is only evaluated in Step 2 and Step 3)}}
\\[.3\baselineskip]
\normalfont\huge
\@title\\
\@acronym\\
\normalfont\normalsize\raggedright\vspace{2cm}\begin{compactitem}
\item \@author, \@institution
\item \begin{tabular}[t]{@{}l@{, }l@{}}
      \@otherauthors
      \end{tabular}
\item \textbf{Proposal duration:} \@monthcount{} months%
\end{compactitem}
\par\vspace{1.2em}}}

\renewcommand\thesection{Section~\alph{section}:}
\newcommand\bonesection[1]{%
  \pagebreak%
  \refstepcounter{section}
  \section*{\thesection{} %
    #1%
  }%
}
\newcommand{\secsynopsis}{\bonesection{%
    \textit{\underline{Extended Synopsis of the scientific proposal}
            (max. 5 pages, references do not count towards the page limit)}}}
\newcommand{\seccv}{\bonesection{%
    \textit{\underline{Curriculum vitae and Track Record}
           (max. 4 pages per each Principal Investigator)}}}

\newenvironment{synopsis}{%
  \global\HasSynopsistrue%
  \begin{ercguidance}
  \textbf{\textit{\textcolor{DarkRed}{Do NOT split the sections and/or references
      in Part B1 and do NOT upload them as separate documents. The
      peer reviewers will only receive one single document for
      evaluation at Step 1. Hence, Part B1 should contain all elements
      as explained in this template. If some parts of Part B1 are
      uploaded in the submission system as separate attachments, the
      peer reviewers will not have access to them.}}}
\end{ercguidance}


  \secsynopsis{}%
  \begin{ercguidance}
  [The Extended Synopsis should give a concise presentation of the
    scientific proposal, with particular attention to the
    ground-breaking nature of the research project, which will allow
    evaluation panels to assess, in Step 1 of the evaluation, the
    feasibility of the outlined scientific approach. Describe the
    proposed work in the context of the state of the art of the
    field. It is important that the extended synopsis contains minimum
    information relevant to the evaluation criteria, since the
    \textbf{Step 1 panel will have access only to part B1}.

  References to literature should also be included. Please use a
  reference style that is commonly used in your discipline such as
  American Chemical Society (ACS) style, American Medical Association
  (AMA) style, Modern Language Association (MLA) style, etc. and that
  allows the evaluators to easily retrieve each reference.

  \bigskip

  \textbf{Please respect the following formatting constraints: Times
    New Roman, Arial or similar, at least font size 11, margin sizes
    (2.0 cm side and 1.5 cm top and bottom), single line spacing.}]
\end{ercguidance}
}{%
\begin{refsection}
  \pagebreak
\defbibheading{subsection}[\bibname]{\subsection*{##1}}
\printbibliography[prenote=bolditalics,heading=subsection]
\end{refsection}
}
% CV
\providecommand*{\listitemsymbol}{\textbullet}

\newlength{\quotewidth}
\newlength{\hintscolumnwidth}
\newlength{\separatorcolumnwidth}
\setlength{\separatorcolumnwidth}{0.025\textwidth}
\newlength{\maincolumnwidth}
\newcommand*{\sethintscolumnlength}[1]{
  \setlength{\hintscolumnwidth}{#1}%
  \setlength{\maincolumnwidth}{\textwidth}%
  \addtolength{\maincolumnwidth}{-\separatorcolumnwidth}%
  \addtolength{\maincolumnwidth}{-\hintscolumnwidth}}
\newcommand*{\sethintscolumntowidth}[1]{
  \settowidth{\hintscolumnwidth}{#1}%
  \setlength{\maincolumnwidth}{\textwidth}%
  \addtolength{\maincolumnwidth}{-\separatorcolumnwidth}%
  \addtolength{\maincolumnwidth}{-\hintscolumnwidth}}
% doubleitem lengths
\newlength{\doubleitemmaincolumnwidth}
% listitem lengths
\newlength{\listitemsymbolwidth}
\settowidth{\listitemsymbolwidth}{\listitemsymbol{}~}
% listdoubleitem lengths
\newlength{\listdoubleitemmaincolumnwidth}
% recompute all the lengths that depends on the text width
\newcommand*{\recomputelengths}{%
  \setlength{\quotewidth}{0.65\textwidth}%
  \sethintscolumnlength{\hintscolumnwidth}%
  % doubleitem lengths
  \setlength{\doubleitemmaincolumnwidth}{\maincolumnwidth}%
  \addtolength{\doubleitemmaincolumnwidth}{-\hintscolumnwidth}%
  \addtolength{\doubleitemmaincolumnwidth}{-\separatorcolumnwidth}%
  \setlength{\doubleitemmaincolumnwidth}{0.5\doubleitemmaincolumnwidth}%
  % listdoubleitem lengths
  \setlength{\listdoubleitemmaincolumnwidth}{\maincolumnwidth}%
  \addtolength{\listdoubleitemmaincolumnwidth}{-\listitemsymbolwidth}%
  \setlength{\listdoubleitemmaincolumnwidth}{0.475\listdoubleitemmaincolumnwidth}}
\sethintscolumnlength{0.15\textwidth}
\recomputelengths

\newif\if@sectionopen\@sectionopenfalse
\newif\if@firstcvline\@firstcvlinefalse % bug if initially set to true...

\newcommand*{\cvsection}{%
  \section*{PERSONAL DETAILS \textit{(max. 1 page per each Principal Investigator)}}%
  \addcontentsline{toc}{subsection}{Personal Details}%
}

\newenvironment{cvs}{%
  \global\HasCVtrue%
  \newif\ifHasAnyCVs%
  \seccv{}
  \begin{ercguidance}
    [You may modify the below template if necessary.]
  \end{ercguidance}
}{%
  \ifHasAnyCVs
  \else
  \ClassError{Part B1}{No curriculum vitae entered.
    Add a {cv}{first name}{family name} environment}
  \fi
}


\newcommand\NameCV[2]{#2, #1:\\}
\newcommand\UniqueID{%
  \global\HasUniqueIDtrue%
  Researcher unique identifier(s):}
\newcommand\NoUniqueID{%
  \global\HasUniqueIDtrue%
  \ClassWarning{\@current@CV{} chose not to use a unique researcher identifier.}
}
\newcommand\ORCID[1]{%
  \raisebox{-2pt}{\includegraphics[height=1em]{orcid}}
  \url{https://orcid.org/#1}}
\newcommand\ResearchID[1]{%
  \raisebox{-2pt}{\includegraphics[height=1em]{rid.png}}
  \url{https://researchid.co/#1}
}
\newcommand\WebsiteCV[1]{%
  \HasWebsitetrue%
  \\URL for web site: %
  \url{#1}\\%
}

\newcommand\CVitem[1]{\par\textbf{\textbullet\qquad#1}\par\bigskip}

\newcommand\EducationCV{\CVitem{Education and key qualifications}}
\newcommand\CurrentPosititionCV{\CVitem{Current position(s)}}
\newcommand\PreviousPosititionCV{\CVitem{Previous position(s)}}
\newcommand\YearRange[2]{#1--#2}
\newcommand\PhDDate[3]{#3/#2/#1} % Format: {YYYY}{MM}{DD}
\newcommand\Position[4]{%
  \begin{tabular}[t]{@{}l@{}}
    #1\\
    #2, #3, #4
  \end{tabular}
}

\newcommand\checkCV[2]{#1\else\ClassError{Part B1}{#2}\fi}

\newenvironment{cv}[2]{
  \global\HasAnyCVstrue%
  \def\@current@CV{#1 #2}
  \newif\ifHasAnyCVs%
  \newif\ifHasUniqueID%
  \newif\ifHasWebsite%
  \newif\ifHasEducation%
  \newif\ifHasCurrentPositions%
  \newif\ifHasPreviousPositions%
  \newif\ifHasAchievements%
  \newif\ifHasRecognition%
  \newif\ifHasBreaks%
  \newif\ifHasOtherContributions%
  \cvsection{}
  \begin{ercguidance}
  [Provide your personal details, your education and key qualifications,
  current position(s) and relevant previous positions you have held.]
  \end{ercguidance}

  \NameCV{#1}{#2}
}{%
  \newpage
  \checkCV\ifHasUniqueID{\@current@CV{}: Please add unique researcher ID using
    \string{\UniqueID} and \string{\ORCID} or \string{ResearchID} or
    choose not to using \string{\NoUniqueID}}%
  %
  \checkCV\ifHasWebsite{\@current@CV: Please add your website with \string{\WebsiteCV{url}}}
  \checkCV\ifHasEducation{\@current@CV: Please add an {education} environment}
  \checkCV\ifHasCurrentPositions{\@current@CV: Please add a {current position(s)} environment}
  \checkCV\ifHasPreviousPositions{\@current@CV: Please add a {previous position(s)} environment}
  \checkCV\ifHasAchievements{\@current@CV: Please add a {research achievements} environment}
  \checkCV\ifHasRecognition{\@current@CV: Please add a {peer recognition} environment}
  \checkCV\ifHasBreaks{\@current@CV: Please add a {breaks etc} environment}
  \checkCV\ifHasOtherContributions{\@current@CV: Please add a {other contributions} environment}
}

\newenvironment{education}{%
  \global\HasEducationtrue%
  \EducationCV{}%
  \begin{tabular}{@{}l@{\ \ }l}%
}{%
  \end{tabular}
}

\newenvironment{current position(s)}{%
  \global\HasCurrentPositionstrue%
  \par\bigskip
  \CurrentPosititionCV{}%
  \begin{tabular}{@{}l@{--}l@{\ \ }l}%
}{%
  \end{tabular}%
}

\newenvironment{previous position(s)}{%
  \global\HasPreviousPositionstrue%
  \par\bigskip
  \PreviousPosititionCV{}%
  \begin{tabular}{@{}l@{--}l@{\ \ }l}%
}{%
  \end{tabular}%
}


\newenvironment{research achievements}{%
  \global\HasAchievementstrue%
  \section*{RESEARCH ACHIEVEMENTS AND PEER RECOGNITION}
  \bigskip
  \subsection*{Research achievements}
  \bigskip
  \begin{ercguidance}
  [Provide a list of up to ten research outputs that demonstrate how you
  have advanced knowledge in your field with an emphasis on more
  recent achievements, such as publications, articles deposited in a
  publicly available preprint server, books, book chapters, conference
  proceedings, data sets, software, patents, licenses, standards,
  start-up businesses or any other research outputs you deem relevant
  in relation to your research field and your project.

  You may include a short, factual explanation of the significance of
  the selected outputs, your role in producing each of them, and how
  they demonstrate your capacity to successfully carry out your
  proposed project.]
\end{ercguidance}

}{%
%
}

\newenvironment{peer recognition}{%
  \global\HasRecognitiontrue%
  \subsection*{Peer recognition}
  \bigskip
  \begin{ercguidance}
  [Provide a list of selected examples of significant recognition by
  your peers if applicable, such as prizes, awards, fellowships,
  elected academy memberships, invited presentations to major
  conferences or any other examples of significant recognition you
  deem relevant in relation to your research field and project.

  You may include a short explanation of the significance of the
  listed examples.]
\end{ercguidance}
}{%
%
}

\newenvironment{breaks etc}{
  \global\HasBreakstrue%
  \section*{ADDITIONAL INFORMATION}
  \bigskip
  \begin{ercguidance}
   In this section you may provide relevant additional information on
   your research career to provide context to the evaluation panels
   when assessing your research achievements and peer recognition as
   described above.
  \end{ercguidance}
  \subsection*{Career breaks, unconventional career paths and major life events}
  \bigskip
  \begin{ercguidance}
  [You may include a short, factual explanation of career breaks or
    diversity in your career paths such as secondments, volunteering,
    part-time work, time spent in different sectors or the effects of
    major life events such as long term illness as well as the effects
    of pandemic restrictions on research productivity.]
  \end{ercguidance}
}{%
  %
}

\newenvironment{other contributions}{%
  \global\HasOtherContributionstrue%
  \subsection*{Other contributions to the research community}
  \bigskip
  \begin{ercguidance}
    [You may include a list of particularly noteworthy contributions to
  the research community you have made other than research
  achievements and peer recognition and a short explanation of these
  contributions. The purpose of this section is to allow the panels to
  take a more rounded view of your career and achievements and to
  ensure that any additional responsibilities, commitments and
  leadership roles that you have taken on beyond your individual
  research activities are recognised and taken into account.]
\end{ercguidance}
}{%
\begin{ercguidance}
(for more information see ‘Information for Applicants to the Synergy Grant 2025 Call’)]
\end{ercguidance}
}




\newcommand*{\cvitem}[2]{%
  \if@firstcvline
  \else
    \\[-0.75em]\fi
  \cvline{#1}{#2}}

\newcommand*{\cventry}[6]{%
  \cvitem{#1}{%
    {\bfseries#2}%
    \ifthenelse{\equal{#3}{}}{}{, {\itshape#3}}%
    \ifthenelse{\equal{#4}{}}{}{, #4}%
    \ifthenelse{\equal{#5}{}}{}{, #5}%
    .%
    \ifthenelse{\equal{#6}{}}{}{\\\begin{minipage}[t]{\textwidth}\small#6\end{minipage}}}}

\newcommand*{\cvline}[2]{%
  \if@firstcvline%
    \@firstcvlinefalse%
    \\[-1em]% ugly hack to remove spaces before the first line
  \else%
    \\[-.2em]\fi%
  \begin{minipage}[t]{\hintscolumnwidth}\raggedleft\hintfont{#1}\end{minipage}&\begin{minipage}[t]{\maincolumnwidth}#2\end{minipage}}

\newcommand*{\weblink}[2][]{%
  \ifthenelse{\equal{#1}{}}%
    {\def\@linktext{#2}}%
    {\def\@linktext{#1}}%
  \href{#2}{\@linktext{}}}

\newcommand*{\cvlistitem}[1]{%
  \cvline{}{\makebox[0pt]{\listitemsymbol{}\hspace*{1cm}}#1}}
\renewcommand*{\bibfont}{\small}

\renewcommand\section{\@startsection{section}{1}{\z@}%
  {-2ex \@plus -1ex \@minus -.2ex}%
  {0.3ex \@plus.2ex}%
  {\ifnum \scr@compatibility>\@nameuse{scr@v@2.96}\relax
    \setlength{\parfillskip}{\z@ plus 1fil}\fi
    \raggedsection\normalfont\sectfont\nobreak\size@section}%
}
\renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
  {-1.25ex\@plus -1ex \@minus -.2ex}%
  {0.3ex \@plus .2ex}%
  {\ifnum \scr@compatibility>\@nameuse{scr@v@2.96}\relax
    \setlength{\parfillskip}{\z@ plus 1fil}\fi
    \raggedsection\normalfont\sectfont\nobreak\size@subsection
  }%
}
\renewcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
  {1.25ex \@plus1ex \@minus.2ex}%
  {-1em}%
  {\raggedsection\normalfont\sectfont\nobreak\size@paragraph}%
}

\bonetrue

\let\itemize\compactitem
\let\enditemize\endcompactitem
\let\enumerate\compactenum
\let\endenumerate\endcompactenum
\let\description\compactdesc
\let\enddescription\endcompactdesc
