 
[Semi-Literate JOD](http://bakerjd99.wordpress.com/2012/10/01/semi-literate-jod/)
---------------------------------------------------------------------------------

*Posted: 02 Oct 2012 04:08:52*

Despite seven decades of programming experience documenting software
remains a challenge. There are many reasons for this sorry state of
affairs with the most important being that programmers simply do not
agree on the *need* for documentation. As pathetic as this sounds it’s
not without merit. It all depends on what you call “documentation.”

Writing technical documents for management, marketing or users usually
results in excruciating rounds of
[Dilbertian](http://search.dilbert.com/comic/Documentation) critiques.
Everyone understands your code better than you do. If you provide too
much detail, you get complaints. If you use unfamiliar words, you get
complaints. If you point out limitations, assumptions or caveats, you
get complaints. If you assume basic 8th grade reading levels, you get
complaints. If you use nonstandard fonts or *unauthorized style
templates,* you get complaints. No wonder many programmers hate
“documentation” and blow off the entire problem by making ludicrous
claims about “self documenting code.” The self documenting cabal may
have fooled management but they’re not fooling the rest of us. The need
for *illuminating* program documentation is as pressing today as it was
for [ENIAC](http://inventors.about.com/od/estartinventions/a/Eniac.htm)
coders in the 1940’s and, when in it comes to illuminating documentation,
the best overall approach was pioneered by [Donald
Knuth](http://www-cs-faculty.stanford.edu/~uno/) over twenty-five years
ago and goes by the moniker [*literate
programming.*](http://en.wikipedia.org/wiki/Literate\_programming)

Providing basic literate programming support in JOD has been on my to-do
list for ages. I’ve held off until recently because I have never been
happy with my [mark up](http://en.wikipedia.org/wiki/Markup\_language)
options. JOD directly supports simple J
[scriptdoc](http://www.jsoftware.com/help/user/scriptdoc.htm) compatible
leading comment block formatting. For example many of my J verbs start
with a comment block like:

    betweenstrs=:4 : 0
    
    NB.*betweenstrs v-- select sublists between  nonnested delimiters
    NB. discarding delimiters.
    NB.
    NB. dyad:  blcl =. (clStart;clEnd) betweenstrs cl
    NB.        blnl =. (nlStart;nlEnd) betweenstrs nl
    NB.
    NB.   ('start';'end') betweenstrs 'start yada yada end boo hoo start ahh end'
    NB.
    NB.   NB. also applies to numeric delimiters
    NB.   (1 1;2 2) betweenstrs 1 1 66 666 2 2 7 87 1 1 0 2 2
    
    's e'=. x
    llst=. ((-#s) (|.!.0) s E. y) +. e E. y
    mask=. ~:/\ llst
    (mask#llst) <;.1 mask#y
    )

Even if you can’t spell J I bet you have a good idea about what this
“program” does and, if you doubt my claims, I’ve left you with some
examples to try the next time you find yourself in J. Stupid comments
may [be for losers](http://php.dzone.com/news/comments-are-losers-2) but
telling comments, especially example laden ones, really help! And, if
you really find comments distracting, JOD has a deal for you!

       ;1{compj 'betweenstrs'
    betweenstrs=:4 :0
    's e'=.x
    a=.((-#s )(|.!.0)s E.y)+.e E.y
    b=.~:/\a
    (b#a)<;.1 b#y
    )

`compj` purges pesky comments and reduces tedious long identifiers like
`mask` to pure compact J. Getting rid of comments is trivial, putting
them back in: not so much! JOD’s simple comment block formatting has
been very effective but it’s hardly literate programming.

Literate programming requires more muscle. Knuth used his own TeX.
TeX and LaTeX are certainly up to the job, as are many HTML and XML
approaches. Unfortunately, all these mark up formats suffer from
“distracting taggyness.” I can tolerate LaTeX but HTML and XML drives me
nuts. Yes, there are perfectly fine editors for all these formats, but
remember, we are inserting the resulting text into code that we will be
looking at for the *rest of our miserable coding lives!* We need a mark
up format that’s stable, readable, versatile, easy to use and, *this is
very important*, easy to ignore!
[Markdown](http://daringfireball.net/projects/markdown/) is such a
format. It’s almost ideal for program comments and is capable of much
more. I’ve started using markdown in JOD and it’s already paying its
way.

[`jodliterate.ijs`](https://www.box.com/s/1fcil5s5zhvlxzzwpjqn) is a J
utility script that can generate *semi-literate* LaTeX documents directly
from JOD groups. It uses a version of pandoc with J syntax highlighting,
see [Pandoc based J Syntax
Highlighting](http://bakerjd99.wordpress.com/2012/09/20/pandoc-based-j-syntax-highlighting/)
for details. I consider `jodliterate` semi-literate because it’s
completely at the mercy of the programmer. If you don’t store coherent
markdown text fragments in JOD all you get is a nice syntax highlighted
listing. But, if you actually *write* about your group, `jodliterate`
can produce essential documents.
[`jodliterate.pdf`](https://www.box.com/s/rhs9kfmim65vm6sv5p8y) is an
example of this tool being used on itself. Self reference always makes
an excellent test case. `jodliterate` will be included in the next JOD
release. Until then you can download the J script from [this
directory](https://www.box.com/s/eb537470b25ab230a0ab). As always
referenced files are available in the files sidebar. Enjoy!
