\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{inria-ra}[2020/11/27 Inria class for activity reports v0.8]
\LoadClass[a4paper,onecolumn,titlepage,twoside]{article}

\DeclareOption{twocolumn}{\OptionNotUsed}
\DeclareOption{notitlepage}{\OptionNotUsed}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessOptions\relax
\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}
\RequirePackage{xcolor}
\RequirePackage{graphicx}
\RequirePackage{fancyhdr}
\RequirePackage{geometry}
\RequirePackage{xstring}
\RequirePackage[xcolor, tikz]{mdframed}
\RequirePackage{tikz}
\RequirePackage{moresize}
\RequirePackage[british]{babel}
\RequirePackage{csquotes}
\RequirePackage[hidelinks]{hyperref}
\RequirePackage{xparse}
\RequirePackage{xspace}
\RequirePackage{array}
\RequirePackage{fourier}
\RequirePackage{microtype}
\RequirePackage[backend=biber,
bibstyle=inria-ra,
defernumbers=true,
sorting=nty,
giveninits=true,
maxbibnames=50,
minbibnames=10,
isbn=false,
hyperref]{biblatex}
%%%%%%%%%% geometry layout
\geometry{
  a4paper,
  left=30mm,
  right=30mm,
  top=25mm,
  bottom=40mm
}
%% Inria color palette
\definecolor{inria-red}{HTML}{E63312}
\definecolor{inria-blue}{HTML}{384257}
\definecolor{inria-yellow}{HTML}{FFCD1C}
\definecolor{inria-orange}{HTML}{F07E26}
\definecolor{inria-lightGreen}{HTML}{C7D64F}
\definecolor{inria-darkGreen}{HTML}{95C11F}
\definecolor{inria-lightBlue}{HTML}{89CCCA}
\definecolor{inria-darkBlue}{HTML}{1488CA}
\definecolor{inria-violet}{HTML}{6561A9}
\definecolor{inria-lilas}{HTML}{9B004F}
\def\@notfinishedmsg{Preliminary layout!}
%%%%%%%%%% hyperref configuration
\hypersetup{
  colorlinks,
  citecolor=inria-red,
  linkcolor=inria-red,  
  urlcolor=inria-lilas
}
%%%%%%%%%%%% Document Header commands
\global\let\ra@year\@empty
\global\let\ra@teamacronym\@empty
\global\let\ra@rnsr\@empty
\global\let\ra@statusteam\@empty
\global\let\ra@teamtitle\@empty
\global\let\ra@teamUrl\@empty
\global\let\ra@cri\@empty
\global\let\ra@crisec\@empty
\global\let\ra@trigramme\@empty
\global\let\ra@nameMainCenter\@empty
\global\let\ra@nameSecondaryCenter\@empty
\global\let\ra@topic\@empty
\global\let\ra@domain\@empty
\global\let\ra@partnerships\@empty
\global\let\ra@collaborations\@empty
\newcommand\@teamStatusText{Inria teams are typically groups of researchers working on the definition of a common project, and objectives, with the goal to arrive at the creation of a project-team. Such project-teams may include other partners (universities or research institutions)}
\renewcommand\year[1]{\renewcommand{\ra@year}{#1}}
\newcommand\RAteam[2]{\renewcommand{\ra@teamacronym}{#1}\renewcommand{\ra@teamtitle}{#2}}
\newcommand\RAstatusTeam{\renewcommand{\ra@statusteam}{true}}
\newcommand\RAteamUrl[1]{\renewcommand{\ra@teamUrl}{#1}}
\newcommand\RArnsr[1]{\renewcommand{\ra@rnsr}{#1}}
%% \RAcri and \RAcrisec  shall be hopefully obsolete for 2024
\newcommand{\RAcri}[1]{\renewcommand{\ra@cri}{#1}}
\newcommand{\RAcrisec}[1]{\renewcommand{\ra@crisec}{#1}}%secondary center
% new 2023
\newcommand\RAmaincenter[2]{\renewcommand{\ra@trigramme}{#1}\renewcommand{\ra@nameMainCenter}{#2}}
\newcommand\RAsecondarycenter[2]{\renewcommand{\ra@trigramme}{#1}\renewcommand{\ra@nameSecondaryCenter}{#2}}
\newcommand{\RAtopic}[1]{\renewcommand{\ra@topic}{#1}}
\newcommand{\RAdomain}[1]{\renewcommand{\ra@domain}{#1}}
\newcommand{\RAPartnerships}[1]{\renewcommand{\ra@partnerships}{#1}}
\newcommand{\RACollaborations}[1]{\renewcommand{\ra@collaborations}{#1}}
%%%%%%%%%%%%% MEMBERS CMD %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\raMemberFirstname}[1]{#1}
\newcommand{\raMemberLastname}[1]{#1}
\newcommand{\raMemberTeamLeader}{Team leader}
\newcommand{\raMemberEmployer}[1]{#1}
\newcommand{\raMemberFunctionPro}[1]{#1}
\newcommand{\raMemberPeriod}[1]{#1}
\newcommand{\raMemberInfo}[1]{#1}
\newcommand{\raMemberHDR}{HDR}
%%%%%%%%%%%%%%  COVER PAGE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\coverpage}{
  \newgeometry{
  left=00mm,
  right=00mm,
  top=0mm,
  bottom=00mm,
  bindingoffset=-6mm,
}
\newenvironment{boxintitle}%
{\begin{flushleft}\color{white}\bf}{\end{flushleft}\normalcolor}
\begin{tikzpicture}
  \draw[help lines] (0,0) grid (21,29);
  \filldraw [color=white] (0,0) -- (21,0) -- (21, 29.67) -- (0, 29.67) -- cycle;
  \filldraw [color=inria-blue] (1.68,4.62) -- (19.32, 4.62) -- (19.32,28.02) -- (1.68,28.02) -- cycle;
  \filldraw [color=inria-red] (10.5, 19.2) -- (21.3,19.2) -- (21.3, 29.67) -- (10.5, 29.67) -- cycle;
  %\draw (13.86,1.68) circle [color=inria-red, radius=1];
  \node[right] at (13.86, 2.2) {\includegraphics[width=5.46cm]{inr_logo_rouge_rvb.pdf}};
  \node[right] at (11.00, 23.00) {\parbox{75mm}{\color{white}\begin{flushright}
     \Huge \ra@year \\ ACTIVITY REPORT \\[15mm] \ifx\ra@statusteam\@empty{Project-Team}\else{Team}\fi\\[2mm] \HUGE \ra@teamacronym
   \end{flushright}}};
\ifx\ra@cri\@empty{}\else\node[right] at (2.5, 25.00) {\parbox{70mm}{\Large\color{white}\textnormal{RESEARCH CENTRE\ifx\ra@crisec\@empty{}\else{S}\fi}
    \begin{flushleft}\textbf{\ra@cri\ifx\ra@crisec\@empty{}\else{\\[.5\baselineskip]\ra@crisec}\fi}\end{flushleft}}}\fi;
\ifx\ra@nameMainCenter\@empty{}\else\node[right] at (2.5, 25.00) {\parbox{70mm}{\Large\color{white}\textnormal{RESEARCH CENTRE\ifx\ra@nameSecondaryCenter\@empty{}\else{S}\fi}
    \begin{flushleft}\textbf{\ra@nameMainCenter\ifx\ra@nameSecondaryCenter\@empty{}\else{\\[.5\baselineskip]\ra@nameSecondaryCenter}\fi}\end{flushleft}}}\fi;
\ifx\ra@partnerships\@empty{}\else\node[right] at (2.5, 22.00) {\parbox{75mm}{\large\begin{boxintitle}IN PARTNERSHIP WITH:\\[2mm] \textbf{\large\ra@partnerships}\end{boxintitle}}};\fi
% team title + (status text if 'Team')
\node[right] at (5.00, 16.00) {\parbox{110mm}{ \begin{boxintitle}{\setlength{\baselineskip}{2\baselineskip}\LARGE\ra@teamtitle\par}\end{boxintitle}%
      \ifx\ra@statusteam\@empty{}\else{\small\color{white}\@teamStatusText\normalcolor}\fi
      \normalcolor \par
    \ifx\ra@collaborations\@empty{}\else\parbox{110mm}{\begin{boxintitle}IN COLLABORATION WITH:  \ra@collaborations\end{boxintitle}}\fi
  }};

  %\draw[help lines] (0,0) grid (21,29);
\node[right] at (3.00, 10.00) {\parbox{90mm}{\Large\begin{boxintitle}\textnormal{}{DOMAIN}\\[2mm] \ra@domain\end{boxintitle}}};
\node[right] at (3.00, 7.00) {\parbox{90mm}{\Large\begin{boxintitle}\textnormal{}{THEME}\\[2mm]\ra@topic\end{boxintitle}}};
  %\filldraw [color=inria-blue] (2.4, 2.4) -- (18.6, 2.4) -- (18.6, 27.3) -- (2.4, 27.3) -- cycle;
\end{tikzpicture}
}
\renewcommand\maketitle{%
  \pagenumbering{roman}
\begin{titlepage}
  \hyphenpenalty=100000% prevent hyphenation in title page
  \coverpage
  \end{titlepage}%
 \newpage
 \pagecolor{white}
 \pagestyle{empty}
 \restoregeometry
\tableofcontents\clearpage\pagestyle{fancy}
 \pagenumbering{arabic}\setcounter{page}{1}
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@thanks\@empty
  \global\let\@author\@empty
  \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\title\relax
  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
}
%%%%%%%%% page header %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\pagestyle{fancy}
\fancyhf{}
\fancyhead[LO]{Project \ra@teamacronym}
\fancyhead[LE, RO]{\thepage}
\fancyhead[RE]{Inria Annual Report \ra@year}
%%%%%%%%% bibliography %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% \bestcite{}
% Redefine entry macro so that the "Best paper" heading is printed in the bibliography
\renewbibmacro{begentry}{\ifcategory{bestcite}{{\color{inria-darkBlue}\bf{\textbf{\textit{Best Paper}}}}\\}{}}
\DeclareBibliographyCategory{bestcite}
\newcommand{\bestcite}[2][]{
  \addtocategory{bestcite}{#2}
  \cite[#1]{#2}
}
\DeclareBibliographyCategory{citedpub}
\renewcommand{\footcite}[2][]{%
\addtocategory{citedpub}{#2}%
\cite[#1]{#2}%
}
\let\refercite\cite% !! NEED TO BE TRANSLATE IN THE DOCUMENT !!
\let\bestrefercite\bestcite% !! NEED TO BE TRANSLATE IN THE DOCUMENT !!,
% .bib filenames, as defined in RADAR models
\def\@bib@major{12_01-BIB-READONLY-major-publications.bib}
\def\@bib@yearpub{12_02-BIB-READONLY-year-publications.bib}
\def\rabibyearprod{12_03-BIB-READONLY-year-other.bib}
\def\@bib@cited{12_04-BIB-cited-publications.bib}

\IfFileExists{\@bib@major}{%
\addbibresource[label=major-publications]{\@bib@major}}{}
\IfFileExists{\@bib@yearpub}{%
\addbibresource[label=year-publications]{\@bib@yearpub}}{}
\IfFileExists{\rabibyearprod}{%
\addbibresource[label=year-productions]{\rabibyearprod}}{}
\IfFileExists{\@bib@cited}{%
\addbibresource[label=cited-publications]{\@bib@cited}}{}
%%% Add keyword per bibtex file, for filtering by section
\DeclareSourcemap{
  \maps[datatype=bibtex]{
    \map[overwrite]{
      \perdatasource{\@bib@major}
      \step[fieldset=keywords, fieldvalue=majorpublication]
      \step[fieldsource=visible, fieldset=keywords, origfieldval=true, append]
    }
    \map[overwrite]{
      \perdatasource{\@bib@yearpub}
       \step[fieldset=keywords, fieldvalue=yearpublication]
       \step[fieldsource=type_number, fieldset=keywords, origfieldval=true, append]
       \step[fieldsource=visible, fieldset=keywords, origfieldval=true, append]
     }
     \map[overwrite]{
      \perdatasource{\rabibyearprod}
       \step[fieldset=keywords, fieldvalue=yearproduction]
       \step[fieldsource=type_number, fieldset=keywords, origfieldval=true, append]
       \step[fieldsource=visible, fieldset=keywords, origfieldval=true, append]
     }
     \map[overwrite]{
      \perdatasource{\@bib@cited}
      \step[fieldset=keywords, fieldvalue=citedpublication]
    }
  }
}
\defbibheading{subbibra}[\bibname]{
  \subsection{#1}%
}
\defbibheading{subsubbibra}[\bibname]{
  \subsubsection*{#1}%
}
% --------------------------------------
% RA specific commands and environments
% --------------------------------------
% Team History
\newcommand{\raTeamHistory}[1]{\par\noindent\textit{#1}\\[6mm]}
% Computer sciences keywords
\newcommand{\raKW}[2]{\item #1 -- #2}
\newenvironment{raKWCompList}{% https://radar.inria.fr/keywords/2022/computing
\textbf{\href{https://radar.inria.fr/keywords/\ra@year/computing}{Computer sciences and digital sciences}}
\begin{list}{}{\setlength\itemsep{.1em}}
}{\end{list}\raggedbottom}
% Other fields  keywords
\newenvironment{raKWAppList}{%
\needspace{4\baselineskip}%prevent disgracious page break
\textbf{\href{https://radar.inria.fr/keywords/\ra@year/other}{Other research topics and application domains}}
\begin{list}{}{\setlength\itemsep{.1em}}
}{\end{list}\newpage}
\newcommand{\emptysection}[1]{}
\newcommand{\emptysubsection}[1]{}
% Cmd to add alt text for image
% Right now this command in only used to generated img/@alt attribute value in the html version (using tralics)
% May be used later for PDF (see e.g. accsup packgage)
\newcommand{\altdesc}[1]{}
% --------------------------------------------------
% --- Members section ------------------------------
% --------------------------------------------------
\newenvironment{raMemberList}[1]
{\subsection*{#1}
\begin{itemize}}
{\end{itemize}}
\newcommand{\raMemberLine}[1]{\item #1}
% --------------------------------------------------
% ---- \pers cmd, participants env -----------------
% --------------------------------------------------
\gdef\@inparticipant{0}
\newcounter{part@counter}
\DeclareDocumentCommand{\pers}{ m o m o }{%
  \IfNoValueTF{#1}{\ClassError{inria-ra}{Mandatory argument is probably missing in \noexpand\pers BEFORE this line}{The minimun form of the \noexpand\pers command is \string\pers{firstname}{lastname}. You can use \noexpand\pers{}{lastname}}}
    \IfNoValueTF{#3}{\ClassError{inria-ra}{Mandatory argument is probably missing in \noexpand\pers BEFORE this line}{The minimun form of the \noexpand\pers command is \string\pers{firstname}{lastname}. You can use \string\pers{}{lastname}}}
\ifnum\@inparticipant=1%
\ifnum\thepart@counter=0\else, \fi#1\IfNoValueTF{#2}{~#3}{#2~#3}%
\IfNoValueTF{#4}{}{~\textit{(#4)}}%
\stepcounter{part@counter}\ignorespaces%
\else% inline \pers{} ie not in participant environment
#1\IfNoValueTF{#2}{~#3}{#2~#3}%
\IfNoValueTF{#4}{}{~\textit{(#4)}}%
\fi%
}
\NewDocumentEnvironment{participants}{ O{Participants} }%
{\gdef\@inparticipant{1}\setcounter{part@counter}{0}\hfill\\[.3em]\noindent{}\begin{tabular}{lp{.7\textwidth}}\textbf{#1:} & }
{.\\\end{tabular}\\[.3em]\gdef\@inparticipant{0}}
\NewDocumentEnvironment{participant}{}
{\begin{participants}[Participant]}
{\end{participants}}
\surroundwithmdframed[backgroundcolor=inria-blue!5, linewidth=0pt, nobreak=true]{participants}
% ---------glossary (formerly glossaire) --------------------------
\newcommand\glo[2]{\item[{#1}] #2}
\renewenvironment{glossary}
{\subsection*{Glossary}\begin{description}}
  {\end{description}}
\surroundwithmdframed[backgroundcolor=inria-red!5,linewidth=0pt]{glossary}
% ----------------------------------- other commands ------------------------------
\newcommand\ra@finpart{\unskip.\par\vspace{3mm}}
\newenvironment{moreinfo}%
{\par\noindent\it}
{\normalfont\\[1em]}
% Other stuff
\def\XMLaddatt*#1#2{\relax}
% ----------------------------------- Commands for partial compilation (single (sub-)section) -----------------------
\newcommand\setFirstSection[1]{\setcounter{section}{#1}}
\newcommand\setFirstSubsection[1]{\setcounter{subsection}{#1}}
% ----------------------------------- Command to be used in sections  -----------------------------------
\newenvironment{keywords}{\par {\bf Keywords:~}\nopagebreak}{\ra@finpart}% formerly 'motscles' environment
% ----------------------------------- Former raweb Commands (no more used) ------------------------------
\newenvironment{motscle} % note: traitement « en dur » dans tralics pour cet environement --> keywords environment
{\par{\bf Keywords}}{\ra@finpart}
\newcommand\moduleref[3]{\ref{#3}}% !! NEED TO BE TRANSLATE IN THE DOCUMENT !!
% ----------------------------------------------------------------------------
% Declare unicode greek characters, often meet in the exported HAL bib entries
% ----------------------------------------------------------------------------
% Uppercase
\DeclareUnicodeCharacter{02F8}{:}
\DeclareUnicodeCharacter{0391}{\ensuremath{A}}
\DeclareUnicodeCharacter{0392}{\ensuremath{B}}
\DeclareUnicodeCharacter{0393}{\ensuremath{\Gamma}}
\DeclareUnicodeCharacter{0394}{\ensuremath{\Delta}}
\DeclareUnicodeCharacter{0395}{\ensuremath{E}}
\DeclareUnicodeCharacter{0396}{\ensuremath{Z}}
\DeclareUnicodeCharacter{0397}{\ensuremath{H}}
\DeclareUnicodeCharacter{0398}{\ensuremath{\Theta}}
\DeclareUnicodeCharacter{0399}{\ensuremath{I}}
\DeclareUnicodeCharacter{039A}{\ensuremath{K}}
\DeclareUnicodeCharacter{039B}{\ensuremath{\Lambda}}
\DeclareUnicodeCharacter{039C}{\ensuremath{M}}
\DeclareUnicodeCharacter{039D}{\ensuremath{N}}
\DeclareUnicodeCharacter{039E}{\ensuremath{\Xi}}
\DeclareUnicodeCharacter{039F}{\ensuremath{O}}
\DeclareUnicodeCharacter{03A0}{\ensuremath{\Pi}}
\DeclareUnicodeCharacter{03A1}{\ensuremath{P}}
% NO 03A2
\DeclareUnicodeCharacter{03A3}{\ensuremath{\Sigma}}
\DeclareUnicodeCharacter{03A4}{\ensuremath{T}}
\DeclareUnicodeCharacter{03A5}{\ensuremath{\Upsilon}}
\DeclareUnicodeCharacter{03A6}{\ensuremath{\Phi}}
\DeclareUnicodeCharacter{03A7}{\ensuremath{X}}
\DeclareUnicodeCharacter{03A8}{\ensuremath{\Psi}}
\DeclareUnicodeCharacter{03A9}{\ensuremath{\Omega}}
% lowercase
\DeclareUnicodeCharacter{03B1}{\ensuremath{\alpha}}
\DeclareUnicodeCharacter{03B2}{\ensuremath{\beta}}
\DeclareUnicodeCharacter{03B3}{\ensuremath{\gamma}}
\DeclareUnicodeCharacter{03B4}{\ensuremath{\delta}}
\DeclareUnicodeCharacter{03B5}{\ensuremath{\varepsilon}}
\DeclareUnicodeCharacter{03B6}{\ensuremath{\zeta}}
\DeclareUnicodeCharacter{03B7}{\ensuremath{\eta}}
\DeclareUnicodeCharacter{03B8}{\ensuremath{\theta}}
\DeclareUnicodeCharacter{03B9}{\ensuremath{\iota}}
\DeclareUnicodeCharacter{03BA}{\ensuremath{\kappa}}
\DeclareUnicodeCharacter{03BB}{\ensuremath{\lambda}}
\DeclareUnicodeCharacter{03BC}{\ensuremath{\mu}}
\DeclareUnicodeCharacter{03BD}{\ensuremath{\nu}}
\DeclareUnicodeCharacter{03BE}{\ensuremath{\xi}}
\DeclareUnicodeCharacter{03BF}{\ensuremath{o}}
\DeclareUnicodeCharacter{03C0}{\ensuremath{\pi}}
\DeclareUnicodeCharacter{03C1}{\ensuremath{\rho}}
% 03C2 final sigma: no tex equiv
\DeclareUnicodeCharacter{03C3}{\ensuremath{\sigma}}
\DeclareUnicodeCharacter{03C4}{\ensuremath{\tau}}
\DeclareUnicodeCharacter{03C5}{\ensuremath{\upsilon}}
\DeclareUnicodeCharacter{03C6}{\ensuremath{\phi}}
\DeclareUnicodeCharacter{03C7}{\ensuremath{\chi}}
\DeclareUnicodeCharacter{03C8}{\ensuremath{\psi}}
\DeclareUnicodeCharacter{03C9}{\ensuremath{\omega}}
%% Other (non greek) UNICODE char
\DeclareUnicodeCharacter{0301}{`}
%% spaces, see http://hapax.qc.ca/Tableaux-15.0/U2000.pdf for explanation in french.
\DeclareUnicodeCharacter{2000}{\enspace}% en space.
\DeclareUnicodeCharacter{2001}{\quad}% em space
\DeclareUnicodeCharacter{2002}{\enspace}% en space
\DeclareUnicodeCharacter{2003}{\quad} % em space
\DeclareUnicodeCharacter{2004}{\;} % 1/3 em space (0.2777em for \;)
\DeclareUnicodeCharacter{2005}{\:} % 1/4 em space (0.2222em for \:)
\DeclareUnicodeCharacter{2006}{\,} % 1/6 em space
\DeclareUnicodeCharacter{2007}{ } % figure space (??)
\DeclareUnicodeCharacter{2008}{\,} % punctuation space (??)
\DeclareUnicodeCharacter{2009}{\,} % thin space
\DeclareUnicodeCharacter{200A}{\,} % ultrathin space
\DeclareUnicodeCharacter{200B}{} % zero with space (??)
%
\DeclareUnicodeCharacter{200E}{} % ctrl LEFT-TO-RIGHT MARK
\DeclareUnicodeCharacter{202A}{}
\DeclareUnicodeCharacter{202F}{~}
\DeclareUnicodeCharacter{2082}{\ensuremath{_2}}
\DeclareUnicodeCharacter{221E}{\ensuremath{\infty}}
\DeclareUnicodeCharacter{22C6}{\ensuremath{\star}}
