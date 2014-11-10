%Copyright 2014 Adam Stallaert
%EngSpecLatex is free software: you can redistribute it and/or modify it under the terms of the GNU Affero General Public License as published by the Free Software Foundation, either version 3 of the License, or any later version.
%EngSpecLatex is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU Affero General Public License for more details.
%You should have received a copy of the GNU Affero General Public License along with EngSpecLatex.  If not, see <http://www.gnu.org/licenses/>.


\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{specs}[2014/11/08 A and E Specifications]

\LoadClass[twoside,openright]{report}

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
\newcommand{\paragraphStart}[1]{\subsection {#1}\label{\theSectionNumber:\currentPart:#1}\def\currentSection{#1}\begin{easylist}[enumerate]}

\newcommand{\paragraphEnd}{\end{easylist}}

%This defines the parts, just to make it easier to type and see
\newcommand{\partStart}[1]{\section {#1} \label{\theSectionNumber:#1}\def\currentPart{#1}}
\newcommand{\partEnd}{}



\RequirePackage[a4paper]{geometry}
\RequirePackage{fancyhdr}
\RequirePackage{hyperref}
\RequirePackage{bookmark}
\RequirePackage{lipsum}
\RequirePackage[ampersand]{easylist}
\RequirePackage{subfiles}
\RequirePackage{titlesec}
\RequirePackage{emptypage}
\RequirePackage{lastpage}
\RequirePackage{datetime}
\RequirePackage{etoolbox}
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
%\renewcommand*{\thesubsection}{\arabic{subsection}}

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
  pdfcreator={AdamTEX},
  pdfinfo={
    author={\consultant},
  }
}

% This adds the headers
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


\setcounter{tocdepth}{0}
