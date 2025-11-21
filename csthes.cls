%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% CLASS METADATA
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Original Authors: Bettina Finzel & Michael Siebers
% Adapted by: Emilija Gjorgjevska
% Description: Thesis class for FINKI/FCSE (UKIM)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{csthes}[2025/02/20 Thesis class for UKIM FINKI]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% OPTION HANDLING
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{ifthen}

% Internal variables
\newcommand*{\selectedlanguage}{mk} % Default to Macedonian internal ID
\newcommand*{\babellanguage}{macedonian}

% Option: Draft vs Final
\DeclareOption{draft}{
    \PassOptionsToClass{draft}{report}
}
\DeclareOption{final}{
    \PassOptionsToClass{final}{report}
}

% Option: Language Selection
\DeclareOption{english}{
    \renewcommand*{\selectedlanguage}{en}
    \renewcommand*{\babellanguage}{english}
}
\DeclareOption{macedonian}{
    \renewcommand*{\selectedlanguage}{mk}
    \renewcommand*{\babellanguage}{macedonian}
}

% Process options (Default to Final + Macedonian)
\ExecuteOptions{final,macedonian}
\ProcessOptions\relax

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% BASE CLASS LOADING
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\LoadClass[10pt,a4paper,twoside,openany]{report}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% PACKAGE REQUIREMENTS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{ifxetex}

% Language Support
\ifxetex
  \RequirePackage{polyglossia}
  \setdefaultlanguage{\babellanguage}
\else
  \RequirePackage[\babellanguage]{babel}
\fi

% Layout & Formatting
\RequirePackage[numbers,sort&compress]{natbib}

\usepackage{enumitem}
\setlist{nosep} % no extra space before/after itemize/enumerate
\usepackage{setspace}

\RequirePackage{fancyhdr}
\RequirePackage{setspace}
\RequirePackage{changepage} % For bibliography margins
\RequirePackage{ragged2e}
\RequirePackage{graphicx}   % Required for logos
\RequirePackage{geometry}
\RequirePackage{titlesec}

% Hyperlinks (Always load last)
\RequirePackage[colorlinks=true, linkcolor=black, citecolor=black, urlcolor=blue]{hyperref}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% TYPOGRAPHY & SPACING
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Heading Spacing
\titlespacing*{\section}{0pt}{2.0ex plus .3ex minus .2ex}{1.0ex plus .2ex}
\titlespacing*{\subsection}{0pt}{1.5ex plus .2ex minus .2ex}{0.7ex plus .2ex}
\titlespacing*{\subsubsection}{0pt}{1.2ex plus .2ex minus .2ex}{0.5ex plus .2ex}

% Paragraph settings
\widowpenalty=10000
\clubpenalty=10000
\tolerance=2000
\emergencystretch=10pt
\hbadness=10000 
\hfuzz=0.5pt

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% FONT CONFIGURATION (Lora)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{fontspec}

% Checks if SkolaSansPro exists in the folder, otherwise falls back to system font or standard
\IfFileExists{fonts/SkolaSansPro/static/SkolaSans-Regular.otf}{ % Check uses .otf
    \setmainfont{SkolaSans}[ % <-- FIX 1: Base name should match font definition
        Path = fonts/SkolaSansPro/static/,
        Extension = .otf, % <-- FIX 2: Extension must be .otf
        UprightFont = *-Regular,
        BoldFont = *-Bold,
        ItalicFont = *-RegularItalic,
        BoldItalicFont = *-BoldItalic
    ]
}

% URL Font
\urlstyle{same}
\renewcommand{\UrlFont}{\small\ttfamily}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% PAGE STYLES (Headers/Footers)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Plain style (Just page numbers)
\fancypagestyle{plain}{
    \fancyhead{}
    \fancyfoot{}
    \fancyfoot[LE,RO]{\thepage}
    \renewcommand{\headrulewidth}{0pt}
}

% Default style
\fancypagestyle{default}{
    \fancyhead{}
    \fancyfoot{}
    \fancyfoot[LE,RO]{\thepage}
    \renewcommand{\headrulewidth}{0pt}
}

\fancypagestyle{blank}{
    \fancyhead{} \fancyfoot{}
    \renewcommand{\headrulewidth}{0pt}
}

% Clear Double Page logic
\let\cleardoublepage\clearpage

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% TITLE PAGE VARIABLES
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% These commands capture data from your main.tex
\newcommand*{\subtitle}[1]{\def\@subtitle{#1}}
\newcommand*{\degree}[1]{\def\@degree{#1}}
\newcommand*{\supervisor}[1]{\def\@supervisor{#1}}
\newcommand*{\thesistype}[1]{\def\@thesistype{#1}}

% Defaults to generate warnings if user forgets to set them
\def\@subtitle{}
\def\@degree{\@latex@warning@no@line{Degree not defined! Use \noexpand\degree{...}}}
\def\@supervisor{\@latex@warning@no@line{Supervisor not defined! Use \noexpand\supervisor{...}}}
\def\@thesistype{Master Thesis} 

% Matriculation handling
\newcommand{\@matr}{}
\newcommand{\matr}[1]{\def\@matr{\unskip{} (\matriculationnumbername ~#1)}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% LANGUAGE STRINGS (Dictionary)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Define the strings based on \selectedlanguage (mk or en)

% --- MACEDONIAN (Default) ---
\newcommand*{\matriculationnumbername@mk}{индекс бр.}
\newcommand*{\faculty@mk}{Факултет за информатички науки и компјутерско инженерство}
\newcommand*{\university@mk}{Универзитет „Св. Кирил и Методиј“ во Скопје}
\newcommand*{\supervisortext@mk}{Ментор}
\newcommand*{\facultyprefix@mk}{при}

% --- ENGLISH ---
\newcommand*{\matriculationnumbername@en}{Index No.}
\newcommand*{\faculty@en}{Faculty of Computer Science and Engineering}
\newcommand*{\university@en}{Ss. Cyril and Methodius University in Skopje}
\newcommand*{\supervisortext@en}{Supervisor}
\newcommand*{\facultyprefix@en}{at}

% Helper macros to select the string
\newcommand*{\matriculationnumbername}{\csname matriculationnumbername@\selectedlanguage\endcsname}
\newcommand*{\facultyname}{\csname faculty@\selectedlanguage\endcsname}
\newcommand*{\universityname}{\csname university@\selectedlanguage\endcsname}
\newcommand*{\supervisortext}{\csname supervisortext@\selectedlanguage\endcsname}
\newcommand*{\facultyprefix}{\csname facultyprefix@\selectedlanguage\endcsname}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% TITLE PAGE LAYOUT
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\renewcommand\maketitle{
    \begin{titlepage}
    \begin{center}
        
        % 1. TOP SECTION: LOGOS
        % Centered simply by placing them in the flow
        \vspace*{1cm}
        
        % UKIM Logo (Left)
        % We use \raisebox to fine-tune vertical alignment if needed, 
        % but standard includegraphics usually aligns by baseline.
        \IfFileExists{images/logo-ukim.png}{%
            \includegraphics[height=28mm]{images/logo-ukim.png}%
        }{[UKIM]}%
        % Space between logos (Adjust this if you want them closer/further)
        \hspace{1cm}% 
        % FINKI Logo (Right)
        \IfFileExists{images/logo-finki.jpg}{%
            \includegraphics[height=28mm]{images/logo-finki.jpg}%
        }{[FINKI]}

        \vspace{2em}

        % 2. INSTITUTION INFO
        {\scshape \large \universityname \par}
        \vspace{0.3em}
        {\scshape \large \facultyname \par}

        \vfill

        % 3. HERO SECTION: TITLE
        \rule{\linewidth}{1pt} 
        \vspace{0.8em}
        
        {\fontsize{24pt}{28pt}\selectfont \bfseries \@title \par}
        
        \ifx\@subtitle\empty\else
            \vspace{0.5em}
            {\Large \itshape \@subtitle \par}
        \fi
        
        \vspace{0.8em}
        \rule{\linewidth}{0.5pt}

        \vspace{2.5em}

        % 4. THESIS TYPE & DEGREE
        {\Large \textsc{\@thesistype} \par}
        \vspace{0.5em}
        {\large \@degree \par}

        \vfill

        % 5. AUTHOR & SUPERVISOR
        \begin{minipage}[t]{0.5\textwidth}
            \begin{flushleft}
                \textit{Кандидат:} \\
                {\large \textbf{\@author}} \\
                {\small \@matr}
            \end{flushleft}
        \end{minipage}%
        \begin{minipage}[t]{0.5\textwidth}
            \begin{flushright}
                \textit{\supervisortext:} \\
                {\large \textbf{\@supervisor}}
            \end{flushright}
        \end{minipage}

        \vfill

        % 6. DATE
        {\large \@date \par}
        \vspace{1cm}

    \end{center}
    \end{titlepage}
    
    \setcounter{page}{1}
    \global\let\maketitle\relax
}