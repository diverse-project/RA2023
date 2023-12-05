# Inria Annual Report: How to compile the PDF?

## What do you need to compile offline?

You need a decently recent [TeX distribution](https://www.latex-project.org/get/) to compile the PDF. 

Some of the required or suitable packages are included in the distribution, but may not be installed by default:

* The [Fourier package](https://ctan.org/pkg/fourier), to use the Utopia fonts
* [biber](https://ctan.org/pkg/biber) and [biblatex](https://ctan.org/pkg/biblatex), to process the report bibliographies
* (optionnal) [latexmk](https://ctan.org/pkg/latexmk) 

The required [biblatex-software](https://ctan.org/pkg/biblatex-software) package is probably too recent to be part of your distribution: it is provided within the exported content.

To get help on installing these tools on your system, create a ticket on [HelpDesk](https://helpdesk.inria.fr/categories/102/submit)

## Compile using latexmk

This is the easiest way to compile: just run `latexmk` in the report directory. 

## Compile without latexmk

Without `latexmk`, you will have to run the following commands (`<TEAM>` is your team acronym in uppercase) in this project directory:

```
pdflatex <TEAM>-RA-2020
biber <TEAM>-RA-2020
pdflatex  <TEAM>-RA-2020
pdflatex  <TEAM>-RA-2020
```

## Content of the exported sources

### The main latex file

> [TEAM]-RA-2020.tex

This read-only file contains header data and `\input{}` commands to include the report content. 

### The other _read only_ section files
The content of these sections are build from the IS DATA, and/or can only be modified using the RADAR web application. Modifying these files will have no effect on the published report.

File                                        |
--------------------------------------------|
00-READONLY-general-description.tex         |
00-READONLY-team-data.tex                   |
01-READONLY-team-members.tex               |
07\_01-READONLY-softwares.tex               |
12-READONLY-scientific-production.tex       |
12\_01-BIB-READONLY-major-publications.bib  |
12\_02-BIB-READONLY-year-publications.bib    |
12\_03-BIB-READONLY-year-other.bib           |



### The `MACRO.tex` file
This file should contain all your LaTeX macros and styles. 

__TODO:__ list of acceptable styles (see what tralics can handle) 

### The writable sections

The content of these sections must be typesetted in LaTeX. Your modification will be used for the published report. 

File                                        |
--------------------------------------------|
02-overal-objectives.tex                    |
03-reseach-program.tex                      |
04-application-domains.tex                  |
05-social-environment-resp.tex              |
06-highlights-year.tex                      |
07_02-platforms.tex                         |
07-softwares-platforms.tex                  |
08-new-results.tex                          |
09-contracts-grants.tex                     |
10-partnerships-cooperations.tex            |
11-dissemination.tex                        |



### The config and style files

File                 | Description 
---------------------|-------------------------------
inria-ra.cls         | LaTeX Class
inria-ra.bbx         | biber bibliographic style
inria-ra.dbx         | biber datamodel extension
biber.conf           | biber configuration file
software.bbx         | biblatex 'software' bibliographic style
software.dbx         | biblatex 'software' datamodel extension
english-software.lbx | biblatex language file for 'software' bib style 
french-software.lbx  | biblatex language file for 'software' bib style
xurl.sty             | package for extended URL breaks, use by biblatex software
latexmkrc            | latexmk configuration file
inr_logo_rouge_rvb.pdf| Inria logo


