 
[More on Kindle Oriented LaTeX](http://bakerjd99.wordpress.com/2011/07/22/more-on-kindle-oriented-latex/)
---------------------------------------------------------------------------------------------------------

*Posted: 22 Jul 2011 16:09:01*

I’ve been compiling LaTeX [PDFs](http://www.fileinfo.com/extension/pdf)
for the Kindle. If you like LaTeX typefaces, especially mathematical
fonts, you’ll love how they render on the Kindle. It’s a good thing
because *you won’t like the Kindle’s cramped page dimensions.* For
simple flow-able text this isn’t a big deal but for complex LaTeX
documents it is!

There are two basic LaTeX to Kindle workflows.

1.  Convert your LaTeX to [HTML](http://www.fileinfo.com/extension/html)
    and then convert the HTML to
    [mobi](http://pcsupport.about.com/od/fileextensions/f/mobifile.htm).

2.  Compile your LaTeX for Kindle page dimensions.

For *simple math and figure free documents* mobi is the best choice
because *it’s a native Kindle format*. You will be able to re-flow text
and change font sizes on the fly. There are many LaTeX to HTML
converters. [This is a good summary](http://enc.com.au/docs/latexhtml/)
of your options. You can also find a variety of HTML to mobi converters.
I’ve used [Auto Kindle](http://sourceforge.net/projects/autokindle/);
it’s slow but produces decent results.

Compiling LaTeX for Kindle page dimensions is more work. First decide
what works best for your document: *landscape* or *portrait*. Portrait
is the Kindle default but I’ve found that landscape is better for math
and figure rich documents. You can flip back and forth between landscape
and portrait on the Kindle but it will not re-paginate PDFs. Of course
with mobi this is [no
problemo](http://www.youtube.com/watch?v=4QWfrxYt9DQ\&NR=1)!

After choosing a basic layout expunge all hard-coded lengths from your
source `*.tex` files. Replace all fixed lengths with *relative page*
lengths. For example, 4 inches might become `0.75\textwidth`. If you
have hundreds of figures and images to adjust write a little program to
replace fixed lengths. I did this while [preparing a Kindle
version](http://bakerjd99.wordpress.com/2011/07/12/open-source-hilbert-for-the-kindle/)
of Hilbert’s *Foundations of Geometry.*

The next hurdle to overcome is the Kindle’s blase attitude about length
units. LaTeX is extremely precise: an inch is an inch to six decimals.
This is not the case on the Kindle! You will have to load your PDFs on
the Kindle and inspect margins for text overflows. Be prepared for a few
rounds of page dimension tweaking! For more details about preparing
LaTeX source check out [LaTeX Options for
Kindle](http://www.faqoverflow.com/tex/16735.html).

Finally, after you have compiled your PDF and loaded it on your Kindle,
there are some Kindle options you should set to optimize your PDF
reading experience. My next post will walk you through setting these
options.

The following `*.tex` file loads packages that are useful for Kindle
sizing. It also shows how to print out LaTeX dimensions with the
[printlen](http://www.ctan.org/pkg/printlen) package.

    \documentclass[12pt]{article}

    \usepackage{graphicx}
    \graphicspath{{./image/}}

    \usepackage[usenames,dvipsnames]{color}

    \usepackage[colorlinks, linkcolor=OliveGreen, urlcolor=blue,
                pdfauthor={your name}, pdftitle={your title},
                pdfsubject={your subject},
                pdfcreator={MikTeX+LaTeXe with hyperref package},
                pdfkeywords={your,key,words},
                ]{hyperref}

    \usepackage{breqn}      % automatic equation breaking
    \usepackage{microtype}  % microtypography, reduces hyphenation


    \usepackage[papersize={3.6in,4.8in},
                hmargin=0.1in,vmargin={0.1in,0.255in}]{geometry}


    \usepackage{fancyhdr}
    \pagestyle{fancy}
    \fancyhead{}      % clear page header
    \fancyfoot{}      % clear page footer

    \setlength{\abovecaptionskip}{2pt} % space above captions
    \setlength{\belowcaptionskip}{0pt} % space below captions

    \setlength{\textfloatsep}{2pt} 
    \setlength{\floatsep}{2pt}  % space left between floats
    \setlength{\intextsep}{2pt} % space left on top and bottom of an in-text float

    \usepackage{printlen}

    \setlength{\footskip}{14pt}

    \renewcommand*{\thepage}{\footnotesize\arabic{page}}

    \begin{document}

    The \verb|\textwidth| is \printlength{\textwidth} which is also
    \uselengthunit{in}\printlength{\textwidth} and
    \uselengthunit{mm}\printlength{\textwidth}.

    \uselengthunit{pt}
    The \verb|\textheight| is \printlength{\textheight} which is also
    \uselengthunit{in}\printlength{\textheight} and
    \uselengthunit{mm}\printlength{\textheight}.

    \end{document}
