\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{specs}[2014/11/08 A and E Specifications]

\LoadClass[twoside,openright]{report}

%This specifies the variables, I prefer this over options to the class because order would be hard to remember
\newcommand\consultant{Consultant Name}
\newcommand\projectName{Project Name}
\newcommand\projectNumber{Project Number}
\newcommand\issuedFor{Issue}
\newcommand\ownerName{The Owner}

%IF YOU EDIT BELOW

%References below
% A 'Section' actually refers to a latex 'Chapter'
% A 'Part' actually refers to a latex 'Section'
% A 'Paragraph' actually refers to a latex 'SubSection'
% A 'Sentance' actually refers to an enumeration value, NOTE:
%	if you reference something with && it will not show the number before it with &
%a 'Section' in the references is actually a Latex 'subsection'

\newcommand*{\createSpecSection}[2]{\chapter{Section #1 - #2}  \label{#1} %two spaces req'd before label
	\def\theSectionName{#2}%
	\def\theSectionNumber{#1}
	}



%This defines the subsections, just makes it easier to type and see
\newcommand{\subStart}[1]{\subsection {#1}\label{\theSectionNumber:\currentPart:#1}\def\currentSection{#1}\begin{easylist}[enumerate]}

\newcommand{\subEnd}{\end{easylist}}

%This defines the parts, just to make it easier to type and see
\newcommand{\partStart}[1]{\section {#1} \label{\theSectionNumber:#1}\def\currentPart{#1}}
\newcommand{\partEnd}{}



\RequirePackage[a4paper]{geometry}

\RequirePackage{fancyhdr}
%this package makes the references into hyperlinks
\RequirePackage{hyperref}

\RequirePackage{bookmark}
%used this package for testing only
%\RequirePackage{lipsum}
%this package is used for the numbered lists
\RequirePackage[ampersand]{easylist}
%This package is used so that each spec section can be a file independent of main.tex yet still compile
\RequirePackage{subfiles}

\RequirePackage{titlesec}
%this package makes the empty pages (so section does not start on back of page) truly blank, no headers and footers
\RequirePackage{emptypage}
\RequirePackage{lastpage}
%Used for time in the footer
\RequirePackage{datetime}
\RequirePackage{etoolbox}
%used to color text
\RequirePackage{color}


\newcommand{\red}[1]{\textcolor{red}{#1}}
\newcommand{\blue}[1]{\textcolor{blue}{#1}}

%This creates the \fullref{section number}{name} reference macro
%if you use /nameref(section number} it will give back the current section name, not the one in the reference.
%the use of hyperref gets rid of this. To test go into a section and \nameref{a diff section} and see what happens
\newcommand*{\sectionRef}[1]{\hyperref[{#1}]{\nameref*{#1}}}
\newcommand*{\partRef}[2]{\hyperref[{#1:#2}]{\nameref*{#1} - \nameref*{#1:#2}}}
\newcommand*{\paragraphRef}[3]{\hyperref[{#1:#2:#3}]{\nameref*{#1} - Part \ref*{#1:#2} \nameref*{#1:#2} - \ref*{#1:#2:#3} \nameref*{#1:#2:#3}}}
\newcommand*{\sentanceRef}[4]{\hyperref[{#1:#2:#3:#4}]{\nameref*{#1} - Part \ref*{#1:#2} \nameref*{#1:#2} - \ref*{#1:#2:#3} \nameref*{#1:#2:#3} - Sentance \ref*{#1:#2:#3:#4}}}

\newcommand*{\sentanceLabel}[1]{\label{\theSectionNumber:\currentPart:\currentSection:#1}}

%This makes the chapter number not appear in the section
\renewcommand*{\thesection}{\arabic{section}}

%This formats the title on the first page of a section
\titlespacing*{\chapter}{0in}{-0.25in}{0.25in}
\titleformat{\chapter}[block]{\filcenter\normalfont\huge\bfseries}{}{0in}{}

%This formats the sections as default + uppercase
\titleformat{\section}{\normalfont\Large\bfseries\uppercase}{Part \thesection}{1em}{}

%This formats the subsection titles
\titleformat*{\subsection}{\normalsize\bfseries}

\pagestyle{fancy}

%The next two lines make \leftmark and \righmark not show 'CHAPTER' and 'SECTION' when used
\renewcommand{\chaptermark}[1]{ \markboth{#1}{} }
\renewcommand{\sectionmark}[1]{ \markright{#1}{} }

%PDF META
\hypersetup{
  pdfcreator={github.com/astallaert},
  pdfinfo={
    author={\consultant},
  }
}

% This adds the headers and footers
\lhead{\consultant\\\textbf{Project No. \projectNumber}\\\projectName}
\chead{}
\rhead{Section \theSectionNumber{}\\\textbf{\theSectionName{}}\\Issued for: \issuedFor}
\lfoot{}
\cfoot{}
\rfoot{}
\fancyfoot[LE,RO]{\thepage{} of \pageref{LastPage}}
\fancyfoot[LO,RE]{Printed on: \today\ at \currenttime}

\renewcommand{\headrulewidth}{0.4pt}
\renewcommand{\footrulewidth}{0.4pt}

%used to only show the sections in the table of contents
\setcounter{tocdepth}{0}
