 
[Turn your Blog into an eBook](http://bakerjd99.wordpress.com/2012/03/04/turn-your-blog-into-an-ebook/)
-------------------------------------------------------------------------------------------------------

*Posted: 05 Mar 2012 02:44:38*

If you have worked through the exhausting procedure of converting your
blog to LaTeX: see posts
[(1)](http://bakerjd99.wordpress.com/2012/02/11/wordpress-to-latex-with-pandoc-and-j-prerequisites-part-1/),
[(2)](http://bakerjd99.wordpress.com/2012/02/18/wordpress-to-latex-with-pandoc-and-j-latex-directories-part-2-2/)
and
[(3)](http://bakerjd99.wordpress.com/2012/02/25/wordpress-to-latex-with-pandoc-and-j-using-texfrwpxml-ijs-part-3/),
you will be glad to hear that turning your blog into an image free eBook
is *almost effortless.* In this post I will describe how I convert my
blog into [EPUB](http://www.web-books.com/Publishing/epub.htm) and
[MOBI](http://wiki.mobileread.com/wiki/MOBI) eBooks.

#### eBooks how the cool kids are reading

eBook readers like
[Kindles](http://www.amazon.com/gp/feature.html?ie=UTF8\&docId=1000750701\&tag=googhydr-20\&hvadid=9562889797\&ref=pd\_sl\_1hhrk6zi46\_e),
[Nooks](http://www.barnesandnoble.com/u/nook/379003208?r=1\&utm\_source=google\&cm\_mmc=Google-\_-NOOK%20General-\_-NOOK%20(exact)-\_-Nook\&cm\_mmca1=1d6c97e6-5d23-2769-73f9-00005e04715e\&utm\_medium=cpc\&utm\_term=no),
iPads and many cell phones are optimized for plain old prose. They excel
at displaying
[reflowable](http://www.pcmag.com/encyclopedia\_term/0,2542,t=reflowable+text\&i=58163,00.asp)
text in a variety of fonts, sizes and styles. One eBook reader feature,
dear to my old fart eyes, is the ability to increase the size of text.
All eBooks are potentially large print editions. There are other
advantages: most readers can store hundreds, if not thousands of books,
making them portable libraries. It’s now technically possible to hand a
kindergarten student a little tablet that holds every single book he
will use from preschool to graduate school. The only obstacle is the
[rapacious textbook
industry](http://funny-about-money.com/2010/07/20/textbook-ripoffs-why-college-leaves-kids-in-debt/)
and their equally [rapacious eBook publishing
enablers](http://www.zdnet.com/blog/mobile-news/why-the-apple-textbook-program-will-never-work/6526).
But fear not [open source
man](http://www.techradar.com/news/software/why-is-open-source-dominated-by-men--1047390)
will save the day. *The days of overpriced digital goods are over!* I
will never pay more than a few bucks for an eBook because I can make my
own and so can you! Let’s get together and kill off another industry
that so has it coming!

#### PDFs, EPUBs and MOBIs

Native eBook file formats like EPUB and MOBI do not handle complex page
layouts well. If your document contains a lot of mathematics, figures
and well placed illustrations stick with PDF workflows.[^a2587] You will
save yourself and your readers a lot of grief. But, if your document is
a prose masterpiece, a veritable [great American
novel](http://www.thedailybeast.com/newsweek/2010/02/04/is-the-great-american-novel-destroying-novelists.html),
then “publishing” it as an EPUB or MOBI is a great way to
[target](http://www.counterpunch.org/2011/01/20/in-praise-of-incivility-in-politics/)
eBook readers. EPUBs and MOBIs can be compiled from many sources. I
start with the LaTeX files I created for the [PDF version of this
blog](http://www.box.com/s/8yvm27ag9agtm32nfahd) because I hate doing
the same boring task twice. By far the most time-consuming part of
converting WordPress export XML to LaTeX is editing the
[pandoc](http://johnmacfarlane.net/pandoc/) generated `*.tex` files to
resolve figures and fix odd run-together-words and paragraphs. To
preserve these edits I use pandoc to convert my edited `*.tex` to
`*.markdown` files.

#### Markdown

[Markdown](http://daringfireball.net/projects/markdown/) is a very
simple text oriented format. A markdown file is completely readable
exactly the way it is. All you need is a text editor. Even text editors
are overkill. You could compose markdown with early 20^th^ century
mechanical typewriters; it’s a low tech format for the ages: perfect for
prose.

The J verb
[`MarkdownFrLatex`](http://www.box.com/s/1k418f2y706ihlxnat4e)[^b2587] calls
pandoc and converts my `*.tex` files to `*.markdown`. I place my
markdown in the directory

    c:/pd/blog/wp2epub

and to track changes to my markdown files I [GIT](http://git-scm.com/)
this directory. `MarkdownFrLatex` strips out image inclusions and
removes typographic flourishes. When it succeeds it writes a simple
markdown file and when it fails it writes a `*.baddown` file. Baddown
files are `*.tex` files that contain
[`lstlistings`](http://en.wikibooks.org/wiki/LaTeX/Packages/Listings)
and complex figure environments that are best resolved with manual
edits. After removing such problematic LaTeX environments the J verb
[`FixBaddown`](http://www.box.com/s/sxmgq2copxot4ahnbzso) calls pandoc
and turns baddown files into markdown files.

#### Generating EPUB and MOBI files

When the conversion to markdown is complete I run
[`MainMarkdown`](http://www.box.com/s/36mzi78mt8tk6oygy2r8) to mash all
my files into one large markdown file with an eBook header. The eBook
header for this blog is:


    % Analyze the Data not the Drivel
    % John D. Baker

The first few lines of the consolidated `bm.markdown` file are:


    #[What’s In it for
    Facebook?](http://bakerjd99.wordpress.com/2009/09/05/whats-in-it-for-facebook/)

    --------------------------------------------------------------------------

    *Posted: 05 Sep 2009 22:44:50*

    [Facebook](http://www.facebook.com) is huge: they brag about a user
    count well north of one hundred million. If only 0.5% of their users are
    active that’s 500,000 *concurrent users.* How many expensive servers
    does it take to support such a load? .....

Generating an EPUB from `bm.markdown` is a simple matter of opening up
your favorite command line shell and issuing the pandoc command:

    pandoc -S --epub-cover-image=bmcover.jpg -o bm.epub bm.markdown

You can read the resulting EPUB file
[`bm.epub`](http://www.box.com/s/ep9cgmdu6r3s322z5xim) on any EPUB eBook
reader. Here’s a screen shot of `bm.epub` on my iPhone.

[Image Link: iPhone loaded with
`bm.epub`](http://conceptcontrol.smugmug.com/photos/i-BfnWMFz/0/M/i-BfnWMFz-M.png)


The last step converts `bm.epub` to
[`bm.mobi`](http://www.box.com/s/ttbyijqgmcnjzzsgfs0a). MOBI is a native
Kindle format. Pandoc can generate MOBI from `bm.markdown` but it
inexplicably omits a table of contents. *No problemo:* I use
[Calibre](http://calibre-ebook.com/) to convert `bm.epub` to `bm.mobi`.
Calibre properly converts the embedded EPUB table of contents to MOBI.
Here’s `bm.mobi` on a Kindle.

[Image Link: Kindle loaded 
with `bm.mobi`](http://conceptcontrol.smugmug.com/photos/i-dhqFDXQ/0/M/i-dhqFDXQ-M.jpg)


All the “published” versions of this blog are available on the
***[Download this
Blog](http://bakerjd99.wordpress.com/download-this-blog/)*** page so
please help yourself!

[^a2587]: LaTeX is usually compiled to PDF making it one of hundreds of PDF
    workflows.

[^b2587]: All the J verbs referenced in this post are in the script
    [`TeXfrWpxml.ijs`](http://www.box.com/s/9v5b6ub9cya108c03mr7)
