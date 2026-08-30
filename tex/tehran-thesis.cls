\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{tehran-thesis}
              [05/09/2017 v0.1
 Persian thesis document class in XeLaTeX for University of Tehran projects/theses/dissertations]
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions
\LoadClass[a4paper,12pt]{book}
\def\university#1{\gdef\@university{#1}}
\def\college#1{\gdef\@college{#1}}
\def\faculty#1{\gdef\@faculty{#1}}
\def\department#1{\gdef\@department{#1}}
\def\degree#1{\gdef\@degree{#1}}
\def\thesisdate#1{\gdef\@thesisdate{#1}}
\newcommand{\firstsupervisor}[1]{\def\@firstsupervisor{#1}}
\newcommand{\firstsupervisorrank}[1]{\def\@firstsupervisorrank{#1}}
\newcommand{\secondsupervisor}[1]{\def\@secondsupervisor{#1}}
\newcommand{\secondsupervisorrank}[1]{\def\@secondsupervisorrank{#1}}
\newcommand{\firstadvisor}[1]{\def\@firstadvisor{#1}}
\newcommand{\firstadvisorrank}[1]{\def\@firstadvisorrank{#1}}
\newcommand{\secondadvisor}[1]{\def\@secondadvisor{#1}}
\newcommand{\secondadvisorrank}[1]{\def\@secondadvisorrank{#1}}
\newcommand{\internaljudge}[1]{\def\@internaljudge{#1}}
\newcommand{\internaljudgerank}[1]{\def\@internaljudgerank{#1}}
\newcommand{\externaljudge}[1]{\def\@externaljudge{#1}}
\newcommand{\externaljudgerank}[1]{\def\@externaljudgerank{#1}}
\newcommand{\externaljudgeuniversity}[1]{\def\@externaljudgeuniversity{#1}}
\newcommand{\graduatedeputy}[1]{\def\@graduatedeputy{#1}}
\newcommand{\graduatedeputyrank}[1]{\def\@graduatedeputyrank{#1}}
\def\name#1{\gdef\@name{#1}}
\def\surname#1{\gdef\@surname{#1}}
\def\dedication#1{\gdef\@dedication{#1}}
\long\def\acknowledgement#1{\gdef\@acknowledgement{#1}}
\def\keywords#1{\gdef\@keywords{#1}}
\long\def\fa-abstract#1{\gdef\@fa-abstract{#1}}
\def\subject#1{\gdef\@subject{#1}}
\def\field#1{\gdef\@field{#1}}
\def\projectLabel#1{\gdef\@projectLabel{#1}}
\def\studentID#1{\gdef\@studentID{#1}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\latintitle#1{\gdef\@latintitle{#1}}
\def\latinauthor#1{\gdef\@latinauthor{#1}}
\def\latindegree#1{\gdef\@latindegree{#1}}
\def\latinuniversity#1{\gdef\@latinuniversity{#1}}
\def\latincollege#1{\gdef\@latincollege{#1}}
\def\latinfaculty#1{\gdef\@latinfaculty{#1}}
\def\latindepartment#1{\gdef\@latindepartment{#1}}
\def\latinthesisdate#1{\gdef\@latinthesisdate{#1}}
\def\latinsubject#1{\gdef\@latinsubject{#1}}
\def\latinfield#1{\gdef\@latinfield{#1}}
\def\firstlatinsupervisor#1{\gdef\@firstlatinsupervisor{#1}}
\def\secondlatinsupervisor#1{\gdef\@secondlatinsupervisor{#1}}
\def\firstlatinadvisor#1{\gdef\@firstlatinadvisor{#1}}
\def\secondlatinadvisor#1{\gdef\@secondlatinadvisor{#1}}
\def\latinname#1{\gdef\@latinname{#1}}
\def\latinsurname#1{\gdef\@latinsurname{#1}}
\def\en-abstract#1{\gdef\@en-abstract{#1}}
\def\latinkeywords#1{\gdef\@latinkeywords{#1}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newif\if@bscthesis
\@bscthesisfalse
\DeclareOption{bsc}{\@bscthesistrue}
\newif\if@mscthesis
\@mscthesisfalse
\DeclareOption{msc}{\@mscthesistrue}
\newif\if@irfonts
\@irfontsfalse
\DeclareOption{irfonts}{\@irfontstrue}
\ProcessOptions

\ifx\@projectLabel\undefined%
{
\if@mscthesis
{\projectLabel{پایان‌نامه}}
\else
 \if@bscthesis
 {\projectLabel{پروژه}}
 \else
{\projectLabel{رساله}}
\fi\fi
}\fi

\ifx\@degree\undefined%
{
\if@mscthesis
\degree{کارشناسی ارشد}
\else
\if@bscthesis
\degree{کارشناسی}
\else
\degree{دکتری}
\fi\fi
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% جلد زرکوب به فارسی (بدون اساتید مشاور)
\newcommand{\coverPage}{\begin{titlepage}
\vspace{-10mm}
\centering

% ۱. لوگوی دانشگاه تهران و نام دانشکده
\begin{center}
    \includegraphics[height=3.2cm]{logo}
    \par\vskip 0.4cm
    {\large\bfseries \@faculty \par}
\end{center}

\vskip 1.5cm

% ۲. مقطع، رشته و گرایش تحصیلی (رشته و گرایش در یک خط و زیر خطِ مقطع قرار می‌گیرند)
\begin{center}
\if@bscthesis 
    {\large\bfseries پروژهٔ کارشناسی \@subject 
    \ifx\@field\undefined\else\ \ گرایش \@field\fi \par}
\else
    {\large\bfseries \@projectLabel\ \writtenfor\ \@degree \par}
    \vskip 0.3cm
    {\large\bfseries در رشتهٔ \@subject\ \ifx\@field\undefined\else گرایش \@field\fi \par}
\fi	
\end{center}

\vskip 1.8cm

% ۳. عنوان پایان‌نامه (بزرگ و برجسته در وسط صفحه)
\begin{center}
    {\huge\titlefont\bfseries \@title \par}
\end{center}

\vskip 1.8cm

% ۴. مشخصات نویسنده (نگارنده)
{\large نگارنده \par}
\vskip 0.2cm
{\Large\bfseries \@name\ \ \@surname \par}

\vskip 1.5cm

% ۵. مشخصات اساتید راهنما (زیرِ هم و بدون حرف «و»)
\large
\ifx\@firstsupervisor\undefined%
    % در صورتی که تعریف نشده باشد، چیزی نمایش داده نمی‌شود
\else
    \ifx\@secondsupervisor\undefined%
        استاد راهنما
        \par\vskip 0.3cm
        {\Large\bfseries \@firstsupervisor \par}
    \else
        اساتید راهنما
        \par\vskip 0.3cm
        {\Large\bfseries \@firstsupervisor \par\vskip 0.3cm \@secondsupervisor \par}
    \fi
\fi

\par
\vskip 6mm
%\vfill
{\large \@thesisdate}
%\vfill
\end{titlepage}%
} % end of coverPage
%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\besmPage}{
%% بسم الله الرحمن الرحیم
\cleardoublepage
\thispagestyle{empty}
\hfill
\begin{center}
\includegraphics[width=10cm]{img/besm}
\end{center}
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% فرم داخلی جلد به فارسی (دارای استاد مشاور)
\newcommand{\titlePage}{\begin{titlepage}
\vspace{-10mm}
\centering

% ۱. لوگوی دانشگاه تهران و نام دانشکده
\begin{center}
    \includegraphics[height=3.2cm]{logo}
    \par\vskip 0.4cm
    {\large\bfseries \@faculty \par}
\end{center}

\vskip 1.5cm

% ۲. مقطع، رشته و گرایش تحصیلی (رشته و گرایش در یک خط و زیر خطِ مقطع قرار می‌گیرند)
\begin{center}
\if@bscthesis 
    {\large\bfseries پروژهٔ کارشناسی \@subject 
    \ifx\@field\undefined\else\ \ گرایش \@field\fi \par}
\else
    {\large\bfseries \@projectLabel\ \writtenfor\ \@degree \par}
    \vskip 0.3cm
    {\large\bfseries در رشتهٔ \@subject\ \ifx\@field\undefined\else گرایش \@field\fi \par}
\fi	
\end{center}

\vskip 1.8cm

% ۳. عنوان پایان‌نامه (بزرگ و برجسته در وسط صفحه)
\begin{center}
    {\huge\titlefont\bfseries \@title \par}
\end{center}

\vskip 1.8cm

% ۴. مشخصات نویسنده (نگارنده)
{\large نگارنده \par}
\vskip 0.2cm
{\Large\bfseries \@name\ \ \@surname \par}

\vskip 1.5cm

% ۵. مشخصات اساتید راهنما (زیرِ هم و بدون حرف «و»)
\large
\ifx\@firstsupervisor\undefined%
    % در صورتی که تعریف نشده باشد، چیزی نمایش داده نمی‌شود
\else
    \ifx\@secondsupervisor\undefined%
        استاد راهنما
        \par\vskip 0.3cm
        {\Large\bfseries \@firstsupervisor \par}
    \else
        اساتید راهنما
        \par\vskip 0.3cm
        {\Large\bfseries \@firstsupervisor \par\vskip 0.3cm \@secondsupervisor \par}
    \fi
\fi

\par
\vskip 6mm
%\vfill
{\large \@thesisdate}
%\vfill
\end{titlepage}%
} % end of titlePage
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\titlepage{\if@RTL\cleardoublepage\else\clearpage\fi
  \thispagestyle{empty}
  \parindent 0pt \parskip 10pt plus 1fil minus 1fil
  \def\baselinestretch{1}\@normalsize\vbox to \vsize\bgroup\vbox to 9in\bgroup}
\def\endtitlepage{\par\kern 0pt\egroup\vss\egroup}

\def\signature{\vspace{1cm}
\begin{flushleft}
{%\nastaliq \scriptsize 
\@name\ \@surname \\
\@thesisdate}
\end{flushleft}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% تاییدیه هیات داوران
\newcommand{\davaranPage}{
\cleardoublepage
%\setcounter{page}{1}
\thispagestyle{empty}

\begin{minipage}{4cm}
	\raggedleft
	\includegraphics[height=3cm]{logo}
\end{minipage}
\begin{minipage}{\textwidth - 8cm}
	\begin{center}
		\begin{onehalfspacing}
		{\normalsize \bf \@university \\}
		{\normalsize \bf \@college \\}
		{\large\bfseries\@faculty \\}
		%{\large\bfseries\@department}
		\end{onehalfspacing}
	\end{center}
\end{minipage}


\begin{center}
{\Large\bfseries
	گواهی دفاع از \@projectLabel{}ٔ \@degree{}
}
\end{center}
%\vspace{.5cm}
هیأت داوران \@projectLabel{}ٔ \@degree{} آقای \@name{} \@surname{} به شمارهٔ دانشجویی \@studentID{} در رشتهٔ \@subject{}~-~گرایش \@field{} را در تاریخ ............ با عنوان «\@title{}»\\
\makebox[\textwidth][l]{
\parbox{0.7\textwidth}{
\makebox[2cm]{}\hspace{1ex}\makebox[2cm]{به عدد}\makebox[5cm]{به حروف}\\
\makebox[2cm][l]{با نمرهٔ نهایی}\hspace{1ex}\framebox[2cm]{\strut}\framebox[5cm]{\strut}
\\
\\
\makebox[2cm][l]{و درجهٔ}\hspace{1ex}\framebox[3cm]{\strut}\hspace{1ex}
ارزیابی کرد.
}
}

\newcounter{davaranCounter}
\begin{table}[h]
\small
\begin{onehalfspacing}
\begin{tabular}{| >{\centering\arraybackslash}m{0.03\textwidth} | >{\centering\arraybackslash}m{.17\textwidth} | >{\centering\arraybackslash}m{.17\textwidth} |>{\centering\arraybackslash}m{.1\textwidth}|>{\centering\arraybackslash}m{.2\textwidth}|>{\centering\arraybackslash}m{.15\textwidth}|}
\hline
{\bfseries\begin{sideways}ردیف\end{sideways}} & {\bfseries مشخصات هیأت داوران} & {\bfseries نام و نام خانوادگی} & {\bfseries مرتبهٔ دانشگاهی} &	{\bfseries دانشگاه یا مؤسسه} & {\bfseries امضا} \\
\hline
\ifx\@firstsupervisor\undefined
\else \stepcounter{davaranCounter}
\arabic{davaranCounter} &	استاد راهنما & \@firstsupervisor & \@firstsupervisorrank & دانشگاه تهران & \rule[-.3\baselineskip]{0pt}{2\normalbaselineskip} \\
\fi
\ifx\@secondsupervisor\undefined%
\else \stepcounter{davaranCounter}
\arabic{davaranCounter} &	استاد راهنما & \@secondsupervisor & \@secondsupervisorrank & دانشگاه تهران & \rule[-.3\baselineskip]{0pt}{2\normalbaselineskip} \\
\fi
\hline
\ifx\@firstadvisor\undefined%
\else \stepcounter{davaranCounter}
\arabic{davaranCounter} & استاد مشاور & \@firstadvisor & \@firstadvisorrank & دانشگاه تهران & \rule[-.3\baselineskip]{0pt}{2\normalbaselineskip} \\
\fi
\ifx\@secondadvisor\undefined%
\else \stepcounter{davaranCounter}
\arabic{davaranCounter} & استاد مشاور & \@secondadvisor & \@secondadvisorrank & دانشگاه تهران & \rule[-.3\baselineskip]{0pt}{2\normalbaselineskip} \\
\fi
\hline
\ifx\@internaljudge\undefined%
\else \stepcounter{davaranCounter}
\arabic{davaranCounter} & استاد داور داخلی & \@internaljudge & \@internaljudgerank & دانشگاه تهران & \rule[-.3\baselineskip]{0pt}{2\normalbaselineskip} \\
\hline
\fi
\ifx\@externaljudge\undefined%
\else \stepcounter{davaranCounter}
\arabic{davaranCounter} & استاد مدعو & \@externaljudge & \@externaljudgerank & \@externaljudgeuniversity & \rule[-.3\baselineskip]{0pt}{2\normalbaselineskip} \\
\hline
\fi
\ifx\@graduatedeputy\undefined%
\else \stepcounter{davaranCounter}
\arabic{davaranCounter} & نمایندهٔ تحصیلات تکمیلی دانشکده & \@graduatedeputy & \@graduatedeputyrank &  دانشگاه تهران & \rule[-.3\baselineskip]{0pt}{2\normalbaselineskip} \\
\hline
\fi
\end{tabular}
\end{onehalfspacing}
\end{table}

\begin{center}
\noindent
	\begin{minipage}{0.45\textwidth}
		\begin{center}
			نام و نام خانوادگی معاون تحصیلات تکمیلی و پژوهشی دانشکده~/~گروه:\\
			تاریخ و امضا:
		\end{center}
	\end{minipage}
	\hspace{0.08\textwidth}
	\begin{minipage}{0.45\textwidth}
		\begin{center}
			نام و نام خانوادگی معاون آموزشی و تحصیلات تکمیلی پردیس دانشکده‌های فنی:\\
			تاریخ و امضا:
		\end{center}
	\end{minipage}
\end{center}
} % End of davaranPage
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% تأییدیه‌ی صحت و اصالت نتایج (تعهدنامهٔ اصالت اثر)
\newcommand{\esalatPage}{
\cleardoublepage
\thispagestyle{empty}

% ۱. لوگوی دانشگاه تهران، باسمه تعالی و عنوان تعهدنامه با ساختار هماهنگ
\begin{center}
    \includegraphics[height=2.8cm]{logo}
    \par\vskip .5cm
    {\large\bfseries باسمه تعالی}
    \par\vskip .5cm
    {\Large\bfseries تعهدنامهٔ اصالت اثر}
\end{center}

\vskip 1.2cm

% ۲. متن اصلی تعهدنامه با جایگذاری متغیرهای تحصیلی دانشجو (هماهنگ با گواهی دفاع)
اینجانب \@name{} \@surname{} به شمارهٔ دانشجویی \@studentID{} در رشتهٔ \@subject{}~-~گرایش \@field{} گواهی و تعهد می‌دهم که مطالب مندرج در این \@projectLabel{}ٔ \@degree{}، حاصل کار پژوهشی اینجانب است و به دستاوردهای پژوهشی دیگران که در این پژوهش از آنها استفاده شده، مطابق مقررات و اصول مرتبط با درج منابع و مآخذ، ارجاع داده‌ام. این \@projectLabel{}ٔ \@degree{} قبلاً برای دریافت هیچ مدرک تحصیلی دیگری ارائه نشده است. ضمن پایبندی به رعایت مقررات و اصول اخلاق در پژوهش، می‌پذیرم که در هر زمانی، خلاف این گواهی اثبات شود، دانشگاه تهران حق دارد مدرک تحصیلی صادرشده را از درجه اعتبار ساقط نماید.

\par\vskip 0.8cm
کلیه حقوق مادی و معنوی این اثر متعلق به دانشگاه تهران است.

\vspace{2cm}

% ۳. قالب‌بندی کادر امضاء و مشخصات دانشجو در سمت چپ صفحه
\begin{flushleft}
\parbox{6.5cm}{
    نام و نام خانوادگی دانشجو: \@name{} \@surname \\ [0.4cm]
    امضاء: \\ [0.4cm]
    تاریخ:
}
\end{flushleft}
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% مجوز بهره‌برداری از پایان‌نامه
\newcommand{\mojavezPage}
{
\cleardoublepage
\thispagestyle{empty}
\ \vfill
\vspace{-12cm}
\tikzstyle{tmpvip}=%
[ultra thick,rectangle,draw=black!72,rounded corners=2mm,%
inner xsep=-1.3cm,inner ysep=0.4cm]
\begin{center}
\begin{tikzpicture}
\node[tmpvip](mainbox){%
\begin{minipage}{0.7\textwidth}
\begin{persian}
\begin{center}

\textbf{کلیهٔ حقوق مادی  و معنوی این اثر}
 
\textbf{متعلّق به دانشگاه تهران است.}

\end{center}
\end{persian}
\end{minipage}};
%\node[viptitle] at (mainbox.west){\ding{'153}};
\end{tikzpicture}
\end{center}
\ \vfill
}

% \def\frame{\newpage
% \thispagestyle{empty}
% \begin{framed}\thispagestyle{empty}}
% \def\endframe{\thispagestyle{empty}\end{framed}
% \thispagestyle{empty}
% \newpage
% }
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% بخش تقدیم
%% پایان‌نامه خود را تقدیم کنید! %%
\newcommand{\taghdimPage}
{
\ifx\@dedication\undefined%
    \relax
\else
    \cleardoublepage
    \thispagestyle{empty}
    %\vspace{-40mm}
    \@dedication
\fi
}

%% قدردانی (فارسی)
\newcommand{\ghadrdaniPage}
{
\ifx\@acknowledgement\undefined%
	\relax
\else   
	\cleardoublepage
	\thispagestyle{empty}
	\centerline{\Large \bfseries قدردانی}
	\vspace{1cm}
	\par\noindent
	\@acknowledgement
% با استفاده از دستور زیر، امضای شما، به طور خودکار، درج می‌شود.
	\signature 
\fi
}

%% چکیده فارسی
\newcommand\abstractPage{
	\cleardoublepage
	\thispagestyle{empty}
	\section*{چکیده}
	% \addcontentsline{toc}{section}{چکیده}
	\@fa-abstract
	\par\noindent
	\paragraph{واژگان کلیدی}
	\@keywords
}

\def\latinabstract{
%% Latin abstract Page
\cleardoublepage\newpage
\thispagestyle{empty}
~
\newpage
\thispagestyle{empty}
\section*{Abstract}
% \addcontentsline{toc}{section}{چکیده}
\@en-abstract
\par
\noindent
\paragraph{Keywords}
\@latinkeywords
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Latin Abstract and Title pages

\font\supervisorfont=cmbxti10

\newcommand{\latinTitlePage}{%
%% Latin title page
\clearpage
\thispagestyle{empty}
\begin{titlepage}
\vspace{-10mm}
\centering

% ۱. لوگوی تکی و مشخصات دانشگاه و دانشکده (بدون نمایش College)
\begin{center}
    \includegraphics[height=3.2cm]{logo-en}
    \par\vskip 0.4cm
    {\large\bfseries \@latinuniversity \par}
    \vskip 0.2cm
    {\large\bfseries \@latinfaculty \par}
\end{center}

\vskip 1.5cm

% ۲. بیانیه درجه و مقطع تحصیلی بر اساس الگو
{\large
\if@bscthesis 
    A Thesis Submitted for the Degree of Bachelor of Science in \@latinsubject
\else
    \if@mscthesis
        A Thesis Submitted for the Degree of Master of Science in \@latinsubject
    \else
        A Dissertation Submitted for the Degree of Doctor of Philosophy in \@latinsubject
    \fi
\fi
\par}

\vskip 2cm

% ۳. عنوان انگلیسی پایان‌نامه
{\Huge\latintitlefont\bfseries \@latintitle \par}

\vskip 2cm

% ۴. نویسنده (نگارنده) به انگلیسی
{\large by \par}
\vskip 0.3cm
{\Large\bfseries \@latinname\ \@latinsurname \par}

\vskip 1.8cm

% ۵. اساتید راهنما (زیرِ هم بدون کلمه and)
{\ifx\@firstlatinsupervisor\undefined%
\else
    \ifx\@secondlatinsupervisor\undefined%
        {\large Supervisor: \par}
        \vskip 0.3cm
        {\Large\bfseries \@firstlatinsupervisor \par}
    \else
        {\large Supervisors: \par}
        \vskip 0.3cm
        {\Large\bfseries \@firstlatinsupervisor \par\vskip 0.3cm \@secondlatinsupervisor \par}
    \fi
\fi}

\vskip 1cm

% ۶. اساتید مشاور (زیرِ هم بدون کلمه and - در صورت وجود)
{\ifx\@firstlatinadvisor\undefined%
\else
    \ifx\@secondlatinadvisor\undefined%
        {\large Advisor: \par}
        \vskip 0.3cm
        {\Large\bfseries \@firstlatinadvisor \par}
    \else
        {\large Advisor(s): \par}
        \vskip 0.3cm
        {\Large\bfseries \@firstlatinadvisor \par\vskip 0.3cm \@secondlatinadvisor \par}
    \fi
\fi}

\vfill

% ۷. تاریخ فارغ‌التحصیلی به انگلیسی
{\large \@latinthesisdate \par}

\end{titlepage}
}

\def\onvan{عنوان}
\def\writtenfor{برای دریافت درجهٔ }
\def\by{پژوهشگر}
\def\latinby{By:}
\def\cleardoublepage{\clearpage\if@twoside \ifodd\c@page\else
\hbox{}
\thispagestyle{empty}
\newpage
\if@twocolumn\hbox{}\newpage\fi\fi\fi}

\AtBeginDocument{
\makeatletter
% تعیین مشخصات فایل PDF
\hypersetup{
pdftitle={\@latintitle},
pdfauthor={\@latinname \@latinsurname},
pdfsubject={Thesis in \@latinsubject},
pdfkeywords={\@latinkeywords},
pdfdirection={R2L}
}
\makeatother
}

%% Modified By: Matin Moradi
%%
%% Author: Sina Momken
%%
%% Base author: M.Amintoosi
%% 
%% Copyright © 2026      by Matin Moradi (customization for FNST)
%% Copyright © 2019-     by Hadi Safari (tehran-thesis)
%% Copyright © 2017-     by Sina Momken (tehran-thesis)
%% Copyright © 2012-2012 by Mahmood Amintoosi (IUST-Thesis)
%% Copyright © 2011-2012 by Vahid Damanafshan (Tabriz_thesis)
%% Copyright © 2008-2011 by Vafa Khalighi (xepersian-thesis.cls)
%% 
%% Distributable under GNU GENERAL PUBLIC LICENSE Version 3.
%% 
%% This work is "maintained" by Sina Momken & Hadi Safari.
%% 
%% Special thanks to Mahmood Amintoosi, Vahid Damanafshan and Vafa Khalighi for their invaluable work.
%%
%% End of file `tehran-thesis.cls'.
