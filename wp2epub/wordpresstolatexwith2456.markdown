[WordPress to LaTeX with Pandoc and J: LaTeX Directories
(2)](http://bakerjd99.wordpress.com/2012/02/18/wordpress-to-latex-with-pandoc-and-j-latex-directories-part-2-2/)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------

*Posted: 19 Feb 2012 00:32:46*

In this post I will describe the LaTeX directory structure the J script
[`TeXfrWpxml.ijs`](http://www.box.com/s/9v5b6ub9cya108c03mr7) is
expecting. To convert WordPress export XML to LaTeX with this script you
will have to set up similar directories.

LaTeX documents are built from `*.tex`[^a2456] files. This makes LaTeX more
like a compiled programming language than a word processing program.
There are advantages and disadvantages to the LaTeX way. In LaTeX’s
favor, the system is enormously adaptable, versatile and powerful. There
is very little that LaTeX/TeX and
[associates](http://www.amazon.com/LaTeX-Companions-Third-Revised-Boxed/dp/0321514432)
cannot do. Unfortunately, “[with great power comes great
responsibility.](http://www.youtube.com/watch?v=IKmQW7JTb6s)” LaTeX is
demanding! You have to study LaTeX like any other programming language.
It’s not for everyone but for experienced users it’s the best way to
produce documents with the highest typographic standards.

#### LaTeX directory structure

To use LaTeX efficiently it’s wise to pick a document directory
structure and *stick with it.* I use a simple directory layout. Each
document has a root directory. The root directory used by
`TeXfrWpxml.ijs `is:


                                            
       Windows   c:/pd/blog/wp2latex        
       Linux     /home/john/pd/blog/wp2latex
                                            



I put my document specific `*.tex`, `*.bib`, `*.sty` and other
LaTeX/TeX files in the root. To handle graphics I create an immediate
subdirectory called `inclusions`.

    c:/pd/blog/wp2latex/inclusions

The inclusions directory holds the document’s `*.png`, `*.jpg`, `*.pdf`,
`*.eps` and other graphics files. To reference files in the inclusions
directory with the standard LaTeX `graphicx` package insert

    \usepackage{color,graphicx,subfigure,sidecap}
    \graphicspath{{./inclusions/}}

in your preamble. Finally, to track document changes I create a
[GIT](http://git-scm.com/) repository in the root directory.

    c:/pd/blog/wp2latex/.git

#### Self contained directories

I take care to keep my document directories *self-contained*. Zipping up
the root and inclusions directory collects *all* the document’s files.
This means that I sometimes have to copy files that are used in more
than one document. Many LaTeX users maintain a common directory for such
files but I’ve found that common directories complicate moving documents
around. You’re always forgetting something in the damn common directory
or you are copying a
[buttload](http://www.urbandictionary.com/define.php?term=buttload) of
mostly irrelevant files from one big confusing common directory to
another.

#### TeXfrWpxml.ijs files

The `TeXfrWpxml.ijs `script searches for these files in the root
directory.


    bm.tex       Main LaTeX root file
    bmamble.tex  LaTeX preamble


`bm.tex` references `bmtitlepage.tex`. I prefer a separate title page
file; simply comment out this file if you create titles in other ways.
**The zip file
[`wp2latex.zip`](http://www.box.com/s/nioua15kpdod5lvruaxe) contains a
test directory in the format expected by `TeXfrWpxml.ijs`.** It also has
a subset of my blog posts already converted to LaTeX. To get ready for
[WordPress to LaTeX with Pandoc and J: Using TeXfrWpxml.ijs
(3)](http://bakerjd99.wordpress.com/2012/02/25/wordpress-to-latex-with-pandoc-and-j-using-texfrwpxml-ijs-part-3/)
download `wp2latex.zip` and attempt to compile `bm.tex`. You might have
to download a number of LaTeX packages. Once you have successfully
compiled `bm.tex `you are ready for the next step.

[^a2456]: LaTeX uses many other file types but key files are usually `*.tex`
    files.
