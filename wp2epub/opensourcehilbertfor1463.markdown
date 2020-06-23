 
[Open Source Hilbert for the Kindle](http://bakerjd99.wordpress.com/2011/07/12/open-source-hilbert-for-the-kindle/)
-------------------------------------------------------------------------------------------------------------------

*Posted: 13 Jul 2011 04:02:12*

While searching for free
[Kindle](http://www.amazon.com/Kindle-Wireless-Reader-Wifi-Graphite/dp/B002Y27P3M)
books I found [Project
Gutenberg](http://www.gutenberg.org/wiki/Main\_Page). Project Gutenberg
offers free Kindle books but they also have something better! Would you
believe LaTeX source code for some mathematical classics.

The best book I’ve found so far is an English translation of David
Hilbert’s *[Foundations of
Geometry](http://www.gutenberg.org/ebooks/17384)*. Hilbert’s
*Foundations* exposed some flaws in the ancient treatment of Euclidean
geometry and recast the subject with modern axioms. Because it’s
relatively easy to follow, compared to Hilbert’s more recondite
publications, this little book exercised disproportionate influence on
20th century mathematics. We still see its style aped, but rarely
matched, in mathematics texts today.

I couldn’t resist the temptation of compiling a mathematical classic so
I eagerly downloaded the source and ran it through LaTeX. *Foundations*
compiled without problems and generated a nice
[letter-sized](http://en.wikipedia.org/wiki/Letter\_(paper\_size)) PDF.
Letter-size is fine but I was looking for free Kindle books! I decided
to invest a little energy modifying the source to produce a Kindle
version. Project Gutenberg makes it clear that we are free to modify the
source. Isn’t open source wonderful!

Converting *Foundations* was simple. The main LaTeX file included 52
`*.png` illustrations with hard-coded widths in `\includegraphics`
commands. I wrote a [J script that converted all these fixed
widths](http://www.box.net/shared/prbdlqpysa2zmugelzye) to relative
`\textwidth`’s. This lets LaTeX automatically resize images for
arbitrary page geometries. When compiled with Kindle page dimensions
this fixed most of the illustrations. I had to tweak a few `wragfig`’s
to better typeset images surrounded by text. The result is a very
readable [Kindle oriented PDF version of Hilbert’s
book](http://www.box.net/shared/7gzg1ssu5gddr953et6h). There are still a
few problems. The Table of Contents is a plain `tabular` that does not
wrap well and one table rolls off the right Kindle margin. Neither of
these deficiencies seriously impair the readability of the text. If
these defects annoy you download the [Project Gutenberg source with my
modifications](http://www.box.net/shared/p6zmknarsscnrci8vj8o) and build
your own version.

This little experiment convinced me that providing free classic books,
in source code form, is a service to
[mankind](http://www.articlesbase.com/writing-articles/is-mankind-sexist-1836076.html).
Not only does it allow you to “publish” classics on new media it also
fundamentally changes your attitude toward books. Hilbert was one of the
great mathematical geniuses of the 19th and 20th century. It’s hard to
suppress [we are not worthy](http://www.youtube.com/watch?v=-FucbvoFFy0)
moments and maintain a sharp critical eye when reading his “printed”
works. You don’t get the same vibe when reading raw LaTeX. Source code
puts you in a, *it’s just another bug infested program*, frame of mind.
You expect errors in code and you typically find them. This is exactly
the hard-nosed attitude you need when reading mathematics.
