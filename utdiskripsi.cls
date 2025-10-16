%-------------------------------------------------------------------------------
% Template TA Skema Skripsi untuk FTI UTDI
%
% Dibuat oleh @RikieKartadie.2025
% Hasil Folk berbagai sumber
% Silahkan edit dan sesuaikan
%
% (c)RikieKartadie-UTDI 2025
%-------------------------------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}
%
\ProvidesClass{utdiskripsi}

\RequirePackage[english,bahasa]{babel}
\RequirePackage{indentfirst}
\RequirePackage{setspace}
\RequirePackage[T1]{fontenc}
\RequirePackage{times}
\RequirePackage{graphicx,latexsym}

\setlength{\paperwidth}{210mm}
\setlength{\paperheight}{297mm}
\usepackage[pass]{geometry}
\usepackage{verbatim,enumerate}
\usepackage{multicol,multirow}


\usepackage{booktabs}
\usepackage{mfirstuc} %<===ini aneh dikit ya.. hehe
\usepackage[table]{xcolor}
\usepackage{multirow}
\usepackage{float}
\usepackage{indentfirst}
\usepackage{transparent}
\usepackage{eso-pic}


%----------------
%%%%%%% Untuk menuliskan Coding %%%%%%
% ------------------------------------
\RequirePackage[newfloat]{minted}
\usepackage{tcolorbox}
\usepackage{etoolbox}
\usepackage{courier}
\setminted[html]{breaklines, fontfamily=Courier,  framesep=2pt, frame=lines}
\setminted[c]{breaklines, fontfamily=Courier,  framesep=2pt, frame=lines}
\setminted[python]{breaklines, fontfamily=Courier,  framesep=2pt, frame=lines}
\setminted[c++]{breaklines, fontfamily=Courier,  framesep=2pt, frame=lines}
\setminted[php]{breaklines, fontfamily=Courier,  framesep=2pt, frame=lines}

%-----------------------------------------------------------------
\newenvironment{code}{\captionsetup{type=listing}}{}
\SetupFloatingEnvironment{listing}{name=Modul Program}
\AtBeginEnvironment{minted}{\dontdofcolorbox \singlespacing%
	\fontsize{10}{10}\selectfont}
%\BeforeBeginEnvironment{minted}{\begin{tcolorbox}}%
	%	\AfterEndEnvironment{minted}{\end{tcolorbox}}%
\def\dontdofcolorbox{\renewcommand\fcolorbox[4][]{##4}}
%--------------------------------------------------

\newif\if@msthesis
%\newif\if@msproposal
\DeclareOption{skripsi}{\@msthesistrue\@msproposalfalse}
%\DeclareOption{proposal}{\@msthesisfalse\@msproposaltrue}

\newif\if@singlesp
\newif\if@doublesp
\DeclareOption{satuspasi}{\@singlesptrue\@doublespfalse}
\DeclareOption{duaspasi}{\@singlespfalse\@doublesptrue}
\newif\if@onehalfsp
\@onehalfspfalse
\DeclareOption{satusetengahspasi}{\@onehalfsptrue}

\newif\if@langindo
\newif\if@langeng
\DeclareOption{indonesia}{\@langindotrue\@langengfalse}
\DeclareOption{inggris}{\@langindofalse\@langengtrue}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
%\ExecuteOptions{skripsi,satusetengahspasi,indonesia}

\ProcessOptions
\LoadClass[a4paper,12pt]{report}

\RequirePackage[style=apa, backend=biber]{biblatex} 
\addbibresource{daftar-pustaka.bib}
%\bibliographystyle{IEEEtran}
\DeclareBibliographyDriver{entry}{%
	\usedriver
	\vspace{1\baselineskip}% Tambahkan jarak setelah setiap entri
	\finentry}




%------------------------------------------------------------
%Layout
%------------------------------------------------------------
\setlength{\topmargin}{-0.9cm}
\setlength{\headheight}{12pt}
\setlength{\headsep}{2.3cm}
\setlength{\topskip}{1ex}
\setlength{\oddsidemargin}{1.46cm}
\setlength{\evensidemargin}{1.46cm}
\setlength{\textwidth}{14.3cm}
\setlength{\textheight}{22cm}
\setlength{\footskip}{1.5cm}
\setlength{\marginparsep}{0pt}
\setlength{\marginparwidth}{0pt}

\setlength{\parindent}{3em} %Indent approx 6 character

%------------------------------------------------------------
%The form of page numbering
%------------------------------------------------------------
\pagestyle{myheadings}
\markright{}

%------------------------------------------------------------
%Define page numbering in the first chapter
%------------------------------------------------------------
\def\ps@chapterheading{%
  \let\@evenhead\@empty\let\@oddhead\@empty
  \def\@oddfoot{\hfil\thepage\hfil}%
  \def\@evenfoot{\hfil\thepage\hfil}
  }

%------------------------------------------------------------
%Redefine chapter and sections
%------------------------------------------------------------
\setcounter{secnumdepth}{2}
\renewcommand \thepart {\@Roman\c@part}
\renewcommand \thechapter {\@Roman\c@chapter}
%\renewcommand \thesection {\@arabic\c@section.}
\renewcommand \thesection {\@arabic\c@chapter.\@arabic\c@section}
%\renewcommand\thesubsection {\@alph\c@subsection.}
\renewcommand\thesubsection {\@arabic\c@chapter.\@arabic\c@section.\@arabic\c@subsection}
%\renewcommand\thesubsubsection{\@roman\c@subsubsection.}
%\renewcommand\thesubsubsection{}
\renewcommand\appendix{\par
  \setcounter{chapter}{0}%
  \setcounter{section}{0}%
  \gdef\@chapapp{\appendixname}%
  \gdef\thechapter{\@Alph\c@chapter}}
\renewcommand{\chapter}{\clearpage\thispagestyle{chapterheading}%
  \global\@topnum\z@ %Prevents figures from going at top of page
  \@afterindenttrue %Indent the 1st paragraph
  \secdef\@chapter\@schapter}
\renewcommand{\@makechapterhead}[1]{%
  {\parindent \z@ \centering \normalfont
    \ifnum \c@secnumdepth >\m@ne
        \large\bfseries \@chapapp\space \thechapter
        \par\nobreak
        \vskip 5\p@
    \fi
    \interlinepenalty\@M
    \large \bfseries #1\par\nobreak
    \vskip 20\p@
    }}
\renewcommand{\@makeschapterhead}[1]{%
  {\parindent \z@ \centering \normalfont
    \interlinepenalty\@M \large \bfseries #1\par\nobreak \vskip 20\p@ }}
%\renewcommand{\section}{\@startsection {section}{1}{\z@}%
%                                   {-3.5ex \@plus -1ex \@minus -.2ex}%
%                                   {2.3ex \@plus.2ex}%
%                                   {\normalfont\normalsize\bfseries\centering}}
\renewcommand{\section}{\@startsection {section}{1}{\z@}%
                                   {-3.5ex \@plus -1ex \@minus -.2ex}%
                                   {2.3ex \@plus.2ex}%
                                   {\normalfont\normalsize\bfseries}}
\renewcommand{\subsection}{\@startsection{subsection}{2}{\z@}%
                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
                                     {1.5ex \@plus .2ex}%
                                     {\normalfont\normalsize\bfseries}}
%\renewcommand{\subsubsection}{\@startsection{subsubsection}{3}{\parindent}%
%                                    {3.25ex \@plus1ex \@minus.2ex}%
%                                    {-1em}%
%                                    {\normalfont\normalsize\bfseries}}
\renewcommand{\subsubsection}{\@startsection{subsubsection}{3}{\z@}%
                                    {3.25ex \@plus1ex \@minus.2ex}%
                                    {-1em}%
                                    {\normalfont\normalsize\bfseries}}
\renewcommand{\paragraph}{\subparagraph}

\@addtoreset {equation}{chapter}
\renewcommand\theequation
  {\ifnum \c@chapter>\z@ \@arabic\c@chapter.\fi \@arabic\c@equation}
\renewcommand \thefigure
     {\ifnum \c@chapter>\z@ \@arabic\c@chapter.\fi \@arabic\c@figure}
\renewcommand \thetable
     {\ifnum \c@chapter>\z@ \@arabic\c@chapter.\fi \@arabic\c@table}

%------------------------------------------------------------
%Redefine caption names
%------------------------------------------------------------
\def\captionsbahasa{%
	\def\prefacename{KATA PENGANTAR}%
	\def\bebasname{PERNYATAAN KEASLIAN TUGAS AKHIR}
	\def\contentsname{DAFTAR ISI}%
	\def\listfigurename{DAFTAR GAMBAR}%
	\def\listtablename{DAFTAR TABEL}%
	\def\listlistingname{DAFTAR MODUL PROGRAM}%
	\def\listappendixname{DAFTAR LAMPIRAN}%
	\def\nomenclaturename{DAFTAR SINGKATAN}%
	\def\abstractname{INTISARI}%
	\def\acknowledgmentname{HALAMAN PERSEMBAHAN}%
	\def\approvalname{HALAMAN PENGESAHAN PEMBIMBING}
	\def\ujiname{HALAMAN PENGESAHAN PENGUJI}
	\def\partname{BAGIAN}%
	\def\chaptername{BAB}%
	\def\appendixname{LAMPIRAN}%
	\def\refname{DAFTAR PUSTAKA}%
	\def\bibname{DAFTAR PUSTAKA}%
	\def\indexname{Indek}%
	\def\figurename{Gambar}%
	\def\tablename{Tabel}%
	\def\pagename{Halaman}%
	\def\lstlistingname{Modul Program}
}


%English
\def\captionsenglish{%
	\def\prefacename{KATA PENGANTAR}%
	\def\contentsname{CONTENTS}%
	\def\listfigurename{LIST OF FIGURES}%
	\def\listtablename{LIST OF TABLES}%
	\def\listappendixname{LIST OF APPENDICES}%
	\def\nomenclaturename{NOMENCLATURE}%
	\def\abstractname{\emph{ABSTRACT}}%
	\def\partname{PART}%
	\def\chaptername{CHAPTER}%
	\def\appendixname{APPENDIX}%
	\def\refname{REFERENCES}%
	\def\bibname{REFERENCES}%
	\def\indexname{Index}%
	\def\figurename{Figure}%
	\def\tablename{Table}%
	\def\pagename{Page}%
}
%------------------------------------------------------------]
%Define thesis's inputs
%------------------------------------------------------------
\gdef\@university{Universitas Teknologi Digital Indonesia}
\gdef\@faculty{Fakultas Teknologi Informasi}
\gdef\@city{Yogyakarta}
\newcommand{\titleind}[1]{\gdef\@titleind{#1}}
\newcommand{\@titleind}{}
\newcommand{\fullname}[1]{\gdef\@fullname{#1}}
\newcommand{\@fullname}{}
\newcommand{\idnum}[1]{\gdef\@idnum{#1}}
\newcommand{\@idnum}{}
\newcommand{\examdate}[1]{\gdef\@examdate{#1}}
\newcommand{\approvaldate}[1]{\gdef\@approvaldate{#1}}
\newcommand{\@examdate}{\number\day~\ifcase\month\or
    Januari\or Pebruari\or Maret\or April\or Mei\or Juni\or
    Juli\or Agustus\or September\or Oktober\or Nopember\or Desember\fi
    \space \number\year}
\newcommand{\degree}[1]{\gdef\@degree{#1}}
\newcommand{\@degree}{}
\newcommand{\yearsubmit}[1]{\gdef\@yearsubmit{#1}}
\newcommand{\@yearsubmit}{}
\newcommand{\program}[1]{\gdef\@program{#1}}
\newcommand{\@program}{}

\newcommand{\Semester}[1]{\gdef\@Semester{#1}}
\newcommand{\@Semester}{}

\newcommand{\kaprodi}[1]{\gdef\@kaprodi{#1}}
\newcommand{\@kaprodi}{}
%nidnkapro
\newcommand{\nidnkapro}[1]{\gdef\@nidnkapro{#1}}
\newcommand{\@nidnkapro}{}

\newcommand{\pengujipertama}[1]{\gdef\@pengujipertama{#1}}
\newcommand{\@pengujipertama}{}
%\nidnpengsatu
\newcommand{\nidnpengsatu}[1]{\gdef\@nidnpengsatu{#1}}
\newcommand{\@nidnpengsatu}{}

\newcommand{\pengujikedua}[1]{\gdef\@pengujikedua{#1}}
\newcommand{\@pengujikedua}{}

\newcommand{\nidnpengdua}[1]{\gdef\@nidnpengdua{#1}}
\newcommand{\@nidnpengdua}{}

\newcommand{\TAakademik}[1]{\gdef\@TAakademik{#1}}
\newcommand{\@TAakademik }{}

\newcommand{\tanggalujian}[1]{\gdef\@tanggalujian {#1}}
\newcommand{\@tanggalujian }{}

\newcommand{\headprogram}[1]{\gdef\@headprogram{#1}}
\newcommand{\@headprogram}{}
\newcommand{\dept}[1]{\gdef\@dept{#1}}
\newcommand{\@dept}{}
\newcommand{\firstsupervisor}[1]{\gdef\@firstsupervisor{#1}}
\newcommand{\@firstsupervisor}{}
\newcommand{\secondsupervisor}[1]{\gdef\@secondsupervisor{#1}}
\newcommand{\@secondsupervisor}{}
\newcommand{\firstnip}[1]{\gdef\@firstnip{#1}}
\newcommand{\@firstnip}{}
\newcommand{\secondnip}[1]{\gdef\@secondnip{#1}}
\newcommand{\@secondnip}{}

%------------------------------------------------------------
%Define cover in Indonesian
%------------------------------------------------------------
\def\cover{%
  \thispagestyle{empty}%
  \pagenumbering{roman}
  \setcounter{page}{1}
    \begin{center}
      \begin{singlespace}
      %\fontsize{14pt}{16pt}\selectfont\MakeUppercase{\normalfont\bfseries\@titleind}\par\nobreak
      \fontsize{14pt}{16pt}\selectfont\MakeUppercase{\normalfont\bfseries TUGAS AKHIR}\\
      \fontsize{14pt}{16pt}\selectfont\MakeUppercase{\normalfont\bfseries SKEMA SKRIPSI}\\
      \vspace{1.5cm}
      \fontsize{14pt}{16pt}\selectfont\MakeUppercase{\normalfont\bfseries\@titleind}\par\nobreak
      \vspace{1.0cm}
       \vfill
       \includegraphics[width=0.5\textwidth]{gambar/logoUTDI.png}
       \vfill
       {\normalfont
        %\bfseries Disusun oleh:\\
        \MakeUppercase{\normalfont\bfseries\underline \@fullname}\\
        \textbf{NIM}~\textbf{:}~\MakeUppercase{\normalfont\bfseries \@idnum}}\\
       \vspace{1.5cm}
       {\normalfont 
         \MakeUppercase{\normalfont\bfseries PROGRAM STUDI \@dept}\\
         \MakeUppercase{\normalfont\bfseries PROGRAM \@program}\\
         \MakeUppercase{\normalfont\bfseries\@faculty}\\ \MakeUppercase{\normalfont\bfseries\@university}\\
         \MakeUppercase{\normalfont\bfseries\@city}\\
         \vspace{0.5cm}
         {\normalfont\bfseries\@yearsubmit}}\\
      \end{singlespace}
      \end{center}
}

%------------------------------------------------------------
%                     HALAMAN PENGAJUAN
%------------------------------------------------------------
%------------------------------------------------------------

%------------------------------------------------------------
\def\ajuanpage{%
\pagenumbering{roman}
\setcounter{page}{1}
\begin{titlepage}
		%%%%%%%%%%%%%%%%%%%%%%%%% background
	\newcommand\BackgroundPic{%
		\put(15,25){%
			\parbox[b][\paperheight]{\paperwidth}{%
				\vfill
				\centering
				{\transparent{0.5} \includegraphics[width=0.6\textwidth]{gambar/logo-UTDI-kuning.png}}
				
				%{\transparent{0.5} \includegraphics[width=\paperwidth,height=\paperheight,%
					%keepaspectratio]{cover.png}}
				\vfill
	}}}
	
	
	%%%%%%%%%%%%%%%
	\begin{center}
			\AddToShipoutPicture*{\BackgroundPic}
		\begin{singlespace}
			\fontsize{14pt}{16pt}\selectfont\MakeUppercase{\normalfont\bfseries TUGAS AKHIR}\\
			\fontsize{14pt}{16pt}\selectfont\MakeUppercase{\normalfont\bfseries SKEMA SKRIPSI}\\
			\vspace{1.5cm}
			\fontsize{14pt}{16pt}\selectfont\MakeUppercase{\normalfont\bfseries\@titleind}\par\nobreak
			\vspace{1.0cm}
			\vfill
			%\includegraphics[width=0.5\textwidth]{gambar/logoUTDI.png}
			{\normalfont
				{\normalfont\bfseries\underline Diajukan sebagai salah satu syarat untuk menyelesaikan studi pada }\\
				{\normalfont\bfseries Program {\@program}}}\\
				%{\normalfont\bfseries Program \expandafter\capitalisewords\expandafter{\@program}}\\
					{\normalfont\bfseries Program Studi \@dept}\\
					{\normalfont\bfseries\@faculty}\\ 
					{\normalfont\bfseries\@university}\\
			\vfill
			{\normalfont\nidnpengsatu
				\bfseries Disusun oleh:\\
				\MakeUppercase{\normalfont\bfseries\underline \@fullname}\\
				\textbf{NIM}~\textbf{:}~\MakeUppercase{\normalfont\bfseries \@idnum}}\\
			\vspace{1.5cm}firstnip
			{\normalfont 
				\MakeUppercase{\normalfont\bfseries PROGRAM STUDI \@dept}\\
				\MakeUppercase{\normalfont\bfseries PROGRAM \@program}\\
				\MakeUppercase{\normalfont\bfseries\@faculty}\\ 
				\MakeUppercase{\normalfont\bfseries\@university}\\
				\MakeUppercase{\normalfont\bfseries\@city}\\
				\vspace{0.5cm}
				{\normalfont\bfseries\@yearsubmit}}\\
		\end{singlespace}
	\end{center}
	\thispagestyle{empty} % <- PASTIKAN INI DILETAKKAN DI DALAM \begin{titlepage}
	\end{titlepage}
}
%------------------------------------------------------------

%------------------------------------------------------------
%                     HALAMAN PERSETUJUAN
%------------------------------------------------------------
%------------------------------------------------------------

%------------------------------------------------------------
\def\halsetuju{%
	\thispagestyle{empty} 
	\pagenumbering{roman}
	\setcounter{page}{1}
	\begin{titlepage}
		%%%%%%%%%%%%%%%%%%%%%%%%% background
		\newcommand\BackgroundPic{%
			\put(15,25){%
				\parbox[b][\paperheight]{\paperwidth}{%
					\vfill
					\centering
					{\transparent{0.5} \includegraphics[width=0.6\textwidth]{gambar/logo-UTDI-kuning.png}}
					
					%{\transparent{0.5} \includegraphics[width=\paperwidth,height=\paperheight,%
						%keepaspectratio]{cover.png}}
					\vfill
		}}}
		
		
		%%%%%%%%%%%%%%%
		\begin{center}
			\AddToShipoutPicture*{\BackgroundPic}
			\begin{singlespace}
				\fontsize{14pt}{16pt}\selectfont\MakeUppercase{\normalfont\bfseries HALAMAN PERSETUJUAN UJIAN TUGAS AKHIR}\\
			%	\fontsize{14pt}{16pt}\selectfont\MakeUppercase{\normalfont\bfseries SKEMA SKRIPSI}\\
				\vspace{0.5cm}
				%\fontsize{14pt}{16pt}\selectfont\MakeUppercase{\normalfont\bfseries\@titleind}\par\nobreak
			%	\vspace{1.0cm}
				\vfill
				%\includegraphics[width=0.5\textwidth]{gambar/logoUTDI.png}
				{\normalfont
				\begin{tabular}{lcp{11cm}}
				Judul&:& {\normalfont\bfseries \@titleind}\\
				Nama&:& {\normalfont\bfseries \@fullname}\\
				NIM&:& {\normalfont\bfseries\@idnum}\\
				Program Studi&:& {\normalfont\bfseries\@dept}\\
				Program&:&{\normalfont\bfseries\@program}\\
				Semester&:&{\normalfont\bfseries\@Semester}\\
				Tahun Akademik &:& {\normalfont\bfseries\@TAakademik}
				\end{tabular}	
					%{\normalfont\bfseries\underline Diajukan sebagai salah satu syarat untuk menyelesaikan studi pada }\\
					%{\normalfont\bfseries Program {\@program}}
					}\\
				%{\normalfont\bfseries Program \expandafter\capitalisewords\expandafter{\@program}}\\
				%{ Program Studi \@dept}\\
				%{\normalfont\bfseries\@faculty}\\ 
				%{\normalfont\bfseries\@university}\\
				\vfill
				{\normalfont
					\bfseries Telah diperiksa dan disetujui untuk diujikan \\
					di hadapan Dewan Penguji Tugas Akhir\\
					}
				\vspace{0.5cm}
				{\normalfont
					{\normalfont Yogyakarta, \@approvaldate}\\
					Dosen Pembimbing,  \\
					  \begin{singlespace}
					 \vfill 	
\begin{tabular}{c}
	\rule{0pt}{1cm} \\ % sebagai pengganti \vspace dalam tabular
	\textbf{\underline{\@firstsupervisor}} \\
	{\normalfont NIDN. \@firstnip} \\
\end{tabular}
\end{singlespace}
				}
			\end{singlespace}
		\end{center}
	
		\end{titlepage}
	}
	%-----------------------------------------------------------


%------------------------------------------------------------
%Approval Page
%------------------------------------------------------------
\def\approvalpage{%
  \chapter*{\approvalname}%
  	%%%%%%%%%%%%%%%%%%%%%%%%% background
  \newcommand\BackgroundPic{%
  	\put(15,25){%
  		\parbox[b][\paperheight]{\paperwidth}{%
  			\vfill
  			\centering
  			{\transparent{0.5} \includegraphics[width=0.6\textwidth]{gambar/logo-UTDI-kuning.png}}
  			
  			%{\transparent{0.5} \includegraphics[width=\paperwidth,height=\paperheight,%
  				%keepaspectratio]{cover.png}}
  			\vfill
  }}}
  
  
  %%%%%%%%%%%%%%%
  \begin{center}
  	\AddToShipoutPicture*{\BackgroundPic}
  \begin{singlespace} %TODO \begin{singlespace} 
        \MakeUppercase{\normalfont\bfseries\@titleind}\par\nobreak
    \vspace{1.0cm}
    %\MakeUppercase{\normalfont\bfseries\expandafter{Skripsi}}\\
    \vspace{1.0cm}
    Telah dipertahankan di depan Dewan Penguji  dan dinyatakan diterima untuk\\
    memenuhi sebagian persyaratan guna memperoleh \\
    Gelar \@degree\\
    Program Studi \@dept \\ \@faculty \\
    \@university

    \vspace{1.0cm}
    \textbf{Yogyakarta, \@tanggalujian}\\
    %TODO KOLOM TTD PENGUJI
    \typeout{DEBUG: NIDN Penguji Satu = \@nidnpengsatu}
    \begin{doublespace}
    	\begin{tabular}{lcp{5cm}}
    	\multicolumn{1}{c}{\textbf{Dewan Penguji}}& \textbf{NIDN }& \textbf{Tandatangan} \\
    	&&\\
    	1.~\@pengujipertama~(Ketua) & \@secondnip & \dots\dots\dots\dots \\
    	&&\\
    	2.~\@firstsupervisor~(Sekertaris) & \@firstnip & \dots\dots\dots\dots \\
    	&&\\
    	3.~\@pengujikedua~(anggota) & \@nidnpengdua & \dots\dots\dots\dots \\
    	\end{tabular}
     \end{doublespace}
    %=========================
    \vspace{1.0cm}
    Mengetahui\\
  Ketua Program Studi \@dept
    \vspace{2.5cm}

%TODO ttd kaprodi
    \begin{singlespace}
    \begin{tabular}{c}
%      Dosen Pembimbing I & & Dosen Pembimbing II \\
%      \vspace{1cm} & \vspace{1cm} & \vspace{1cm}\\
      \textbf{\underline{\@kaprodi}}\\
%      \textbf{\underline{\@secondsupervisor}} \\
      NIP. \@nidnkapro   
    \end{tabular}
    \end{singlespace}

  \end{singlespace} %TODO \end{singlespace}
  \end{center}
\addcontentsline{toc}{chapter}{\approvalname}
}

\def\bebasplagiat{%
	\chapter*{\bebasname}%
	\addcontentsline{toc}{chapter}{\bebasname}
}

%------------------------------------------------------------
%Acknowlegment
%------------------------------------------------------------
\def\acknowledgment{%
  \chapter*{\acknowledgmentname}%
%\null\vfill%Force the content of acknowledment to bottom page 
\addcontentsline{toc}{chapter}{\acknowledgmentname}
}

%------------------------------------------------------------
%Preface
%------------------------------------------------------------
\def\preface{%
  \chapter*{\prefacename}\selectlanguage{bahasa}%
\addcontentsline{toc}{chapter}{\prefacename}
}

%------------------------------------------------------------
%Nomenclature
%------------------------------------------------------------
\def\singkatan{%
  \chapter*{\nomenclaturename}%
  \thispagestyle{plain}
  %\chapter*{\nomenclaturename}%
  %\printglossary
\addcontentsline{toc}{chapter}{\nomenclaturename}
}

%------------------------------------------------------------
%Redefine Abstract in Indonesian
%------------------------------------------------------------
\def\abstractind{%
	\clearpage\thispagestyle{chapterheading}\selectlanguage{bahasa}%
	\chapter*{\abstractname}%
	{\parindent \z@ \centering \normalfont
		%{\large\textbf{\abstractname}} \\
		\vspace{1.0cm}
	}
	\begin{singlespacing}%
		\vskip 20\p@
		\addcontentsline{toc}{chapter}{\abstractname}
	}
	\def\endabstractind{\par\vfil\null\end{singlespacing}}

%------------------------------------------------------------
%Redefine Abstract in English
%------------------------------------------------------------
\def\abstracteng{%
	\clearpage\thispagestyle{chapterheading}\selectlanguage{english}
	\chapter*{\abstractname}%
	{\parindent \z@ \centering \normalfont
		%{\large\textbf{\abstractname}} \\
		\vspace{1.0cm}
	}
	\begin{singlespacing}%
		\vskip 20\p@
		\addcontentsline{toc}{chapter}{\abstractname}
	}
	\def\endabstracteng{\par\vfil\null\end{singlespacing}%
	
	
\selectlanguage{bahasa}\clearpage\pagenumbering{arabic}\setcounter{page}{1}}

%Tabularization
\newcommand{\itab}[1]{\hspace{0em}\rlap{#1}}
\newcommand{\tab}[1]{\hspace{.2\textwidth}\rlap{#1}}


\AtBeginDocument{%
\if@doublesp%
\doublespacing%
\else\if@singlesp%
\singlespacing%
\else
\onehalfspacing%
\fi%
\fi
}

\AtBeginDocument{%
\if@langindo%
\selectlanguage{bahasa}%
\else
\selectlanguage{english}%
\fi
}

\endinput