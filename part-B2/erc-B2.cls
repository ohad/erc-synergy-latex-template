\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{erc-B2}[2019/02/26 erc-B2]

\DeclareOption{guidance}{%
  \PassOptionsToClass{guidance}{erc}
}
\DeclareOption{stricterc}{%
  \PassOptionsToClass{stricterc}{erc}
}
\ProcessOptions{}


\LoadClass{../erc}
\RequirePackage[left=2cm,top=1.5cm,bottom=1.5cm,right=2cm,headsep=.45cm,footskip=.8cm]{geometry}
\RequirePackage{colortbl}
\RequirePackage{eurosym}

\chead[Part B2]{Part B2}

\def\maketitle{\vspace*{.45cm}{\centering\bfseries
\large ERC \erctype{} Grant \ercyear{}\\
\Large Research proposal [Part B2]\\
\large \textit{(\underline{not} evaluated in Step 1)}\par
%% Looks like title is removed in this version
\normalfont\normalsize\raggedright\vspace{2cm}\begin{compactitem}
\item \@author, \@institution
\item \begin{tabular}[t]{@{}l@{, }l@{}}
      \@otherauthors
      \end{tabular}
\end{compactitem}
\par\vspace{1.2em}}}

\bonefalse

\newcommand\OngoingHeading[1]{\normalsize\textit{#1}}

\newcommand\NoneItem[2]{
\def\arraystretch{1.5}
\begin{tabular}{@{}%
    |>{\large}l%
    |>{\large}l%
    |>{\large\euro}l%
    |>{\large}l%
    |>{\large}l%
    |>{\large}l%
    |}%
  \multicolumn{6}{l}{%
  \begin{minipage}[t]{\textwidth}
    #1
  \end{minipage}
  }\\
  \multicolumn{6}{l}{
    #2
  }
\end{tabular}
\par
\bigskip
}

\newenvironment{ongoing item}[1]{
\def\arraystretch{1.5}
\begin{tabular}{@{}%
    |>{\large}l%
    |>{\large}l%
    |>{\large\euro}l%
    |>{\large}l%
    |>{\large}l%
    |>{\large}l%
    |}%
  \multicolumn{6}{l}{%
  \begin{minipage}[t]{\textwidth}
    #1
  \end{minipage}
  }\\
  \hline%
  \rowcolor{Gray}%
  \OngoingHeading{Project Title}  &
  \OngoingHeading{Funding source} &
  \multicolumn{1}{|l|}{\textit{Amount}} &
  \OngoingHeading{Period} &
  \OngoingHeading{Role of the PI} &
  \OngoingHeading{\begin{minipage}[t]{2.9cm}
      Relation to current\\
      ERC proposal
    \end{minipage}
  }
  \\
  \hline
}{%
    \hline
\end{tabular}
\par
\bigskip
}
\newenvironment{existing}{%
  \global\HasExistingtrue%
    \begin{ongoing item}%
          {\textbf{Ongoing grants} (Please indicate `No funding' as applicable)\textbf{:}}
}{%
    \end{ongoing item}
}
\newcommand\NoGrant{%
  \global\HasExistingtrue%
\NoneItem%
    {\textbf{Ongoing grants} (Please indicate `No funding' as applicable)\textbf{:}}
    {No funding}%
}

\newenvironment{baking}{%
  \global\HasBakingtrue%
    \begin{ongoing item}%
    {\textbf{Ongoing/submitted grant applications} --- still in evaluation at the time of this application (Please indicate'None' as applicable)\textbf{:}}
}{%
    \end{ongoing item}
}

\newcommand\NoApplication{%
  \global\HasBakingtrue%
  \NoneItem%
    {\textbf{Ongoing/submitted grant applications} --- still in evaluation at the time of this application (Please indicate'None' as applicable)\textbf{:}}
    {None}%
}

\newenvironment{grants}[1]{%
  \section{PI: #1}
  \newif\ifHasExisting%
  \newif\ifHasBaking%
  \def\@current@PI{#1}
}{%
  \checkSection\ifHasExisting{\@current@PI: Missing {existing} environment or
                              NoGrant if none existing}%
  \checkSection\ifHasBaking{\@current@PI: Missing {baking} environment or
                            NoApplication if none in progress}%
}

\AtBeginDocument{%
\maketitle

\textbf{Part B2: The scientific proposal (max. 15 pages, excluding the Resources and time commitment section and References)}

\begin{ercguidance}
Please delete all text highlighted in grey in this template.

Please respect the following formatting constraints: Times New Roman,
Arial or similar, at least font size 11, margin sizes (2.0 cm side and
1.5 cm top and bottom), single line spacing. \underline{The Resources
  section, the Budget table and References do not count towards the
  page limit.}
\end{ercguidance}
}

%% Enforce structure
\newif\ifHasObjectives
\newif\ifHasMethodology
\newif\ifHasResources
\newif\ifHasOngoing

\newcommand\checkSection[2]{#1\else\ClassError{Part B2}{#2}\fi}

\AtEndDocument{
  \checkSection\ifHasObjectives{Missing {objectives} environment}%
  \checkSection\ifHasMethodology{Missing {methodology} environment}%
  \checkSection\ifHasResources{Missing {methodology} environment}%
  \checkSection\ifHasOngoing{Missing {ongoing grants and applications} environment}%
}

\newenvironment{objectives}{%
  \global\HasObjectivestrue%
  \section{State-of-the-art and objectives}
}{%
}

\newenvironment{methodology}{%
  \global\HasMethodologytrue%
  \section{Methodology}
}{%
}

\newenvironment{resources}{%
  \global\HasResourcestrue%
  \section{Resources}
  \begin{ercguidance}
  (Note: Describe the resources needed according to the indications in
  the Information for \textit{Applicants to the Synergy Grant 2025
    call, section 2.3 The research proposal}.

  Please complete the separate file downloaded from the submission
  system according to the indications in the template
  `\textbf{Annex\_Budget\_table\_B2\_SyG2025.xlsx}'. You should fill
  in the time commitment and, if applicable, the justification of
  additional funding above the normal EUR 10 million in the
  file. \textbf{Save this annex as an excel file and upload it in the
    submission system} together with the rest of the proposal (part
  B1, part B2, host support letter(s)). The annex containing the
  budget table, the time commitment and the additional funding
  justification will be made available to reviewers in step 2 and step
  3).

  Here, in this Section c, \textbf{describe and fully justify the amount of
  funding requested for each PI} that is considered necessary to fulfil
  the objectives throughout the duration of the project. \textbf{Justify the
  estimated costs for each cost category and for each
  beneficiary/affiliated entity. Ensure that the narrative description
  is consistent with the financial information in the budget table.}

  Take into consideration the following:
  \begin{compactitem}
  \item In case you have team members belonging to partner organisations
    (i.e. not Host Institutions), include their amounts under a PI’s
    budget.
  \item Specify if you will use third parties giving in-kind
    contributions to the action.
  \item Specify the cost items covered by the 'Other personnel costs'
    category if applicable. Also specify the cost items covered by the
    'Other additional direct costs' category if applicable.
  \item Include a justification in case you request equipment, or other
    assets needed specifically for the action (or developed as part of
    the action tasks) to be declared in the Grant Agreement as full
    capitalised costs.
  \item Specify as well if you will have funding from other sources.
    The evaluation panels assess the estimated costs and the
    justification carefully; unjustified budgets will be consequently
    reduced.)
  \end{compactitem}
\end{ercguidance}
}{%
}

\newenvironment{ongoing grants and applications}{%
  \global\HasOngoingtrue%
  \pagebreak
  \printbibliography[prenote=bolditalics]

  \appendix
  {\large\textbf{\textit{Appendix\\
   All ongoing grants and submitted grant applications of each of the PIs (Funding ID)}}\\
    \textit{\underline{Mandatory information} (not counted towards page limits)}}\par

  \begin{ercguidance}
    Please include as many tables as participating Principal
    Investigators in the group.
  \end{ercguidance}
}{%
  %
}
