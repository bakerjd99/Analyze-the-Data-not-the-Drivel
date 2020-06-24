 
[Soon we will all be Software Archaeologists](https://bakerjd99.wordpress.com/2010/12/06/soon-we-will-all-be-software-archeologists/)
-----------------------------------------------------------------------------------------------------------------------------------

*Posted: 06 Dec 2010 03:23:13*

One of my pet peeves is the ridiculously short lifetimes of digital
media. I remember 9 track mainframe tapes and 5.5 inch floppies:
technologies that thrived in an ancient bygone epoch known as the
[Eighties](https://www.google.com/images?hl=en\&q=the+eighties\&um=1\&ie=UTF-8\&source=univ\&ei=LrgCTfL1A4fEnAesmuTlDQ\&sa=X\&oi=image\_result\_group\&ct=title\&resnum=1\&ved=0CCkQsAQwAA\&biw=888\&bih=495).
Good luck trying to read 9 track tapes or 5.5 inch floppies today! You
will have better luck with older [paper punch
cards](https://www.computerhistory.org/collections/accession/102688725).
Punch card readers are hard to find these days but *you can see the damn
card holes with your own eyes!* In fact you don’t even need eyes to read
punch cards. I once knew a blind mainframe programmer that banged out
massive [FORTRAN](https://en.wikipedia.org/wiki/Fortran) programs by
feeling the holes on punch cards. Try that with a USB flash drive.

Of course I appreciate that you can stuff the data from an entire filing
cabinet of 5.5 inch floppies onto one modern USB flash drive but I am
*disturbed* by the fact that all those gigabytes will soon be *more
unreadable than
[cuneiform](https://en.wikipedia.org/wiki/Cuneiform\_script)*. I am not
the first to worry about our distressed digital data. [Kevin
Kelly](https://kk.org/) considers the word “storage” a dangerous misnomer
and advocates the use of
“[movage](https://www.kk.org/thetechnium/archives/2008/12/movage.php)”
instead. *You had better move your data from old to new formats or you
will lose it!*

Movage is one of the reasons I have not jumped on the *eReader*
bandwagon. Replacing myriagrams of books with one lightweight tablet is
appealing but **iPads and Kindles are not stable!** High quality [books
have shelf lives measured in
centuries](https://news.bbc.co.uk/2/hi/entertainment/3696333.stm). With
digital media you’re lucky to get through a decade. It’s a good bet you
won’t be able to read what’s on your *eReaders* in ten short years! You
poor dumb suckers will have to repurchase your library just like you
repurchased your record and movie collections. It’s not in Amazon’s or
Apple’s interest to worry too much about media durability. Fortunately
some people do worry about media stability. Check out [The Long Now’s
Rosetta project](https://www.rosettaproject.org/disk/concept/) for what I
consider a stable medium.

To belabor this point, while I was unpacking boxes of old-fashioned
books, (we recently moved again), I came across a notebook I put
together for a poster I presented at the [1994 APL conference in
Antwerp](https://www.sigapl.org/proceedings94.htm). My notebook contained
a paper version, *still eminently readable*, and four 3.5 inch disks. My
oldest computer has a vestigial 3.5 inch disk drive so I tried copying
these sixteen year old disks. Some of the disks were unreadable,
(surprise surprise), but I was able to recover a directory containing my
poster’s source. Some of these files were old Microsoft Word documents.
Word 2007 could not read them! Even when bits survive changes in
software can render them useless. Fortunately I loathed Word in 1994, a
sentiment I still maintain, and wrote my poster in LaTeX.

LaTeX source is dull ASCII text. Civilization will collapse before we
lose the ability to read it! Of course LaTeX, like Word, has changed
since 1994 so, [just for the hell of
it](https://www.youtube.com/watch?v=RK9sO7Cjy-8), I decided to compile
this old document with [MikTeK 2.9](https://miktex.org/). It didn’t
compile; I was missing some old graphics macros and a key style file. It
didn’t take me long to fix these problems. I replaced the graphics
macros with standard `\includegraphics{}` commands and converted all the
Windows [`*.bmp`](https://www.fileinfo.com/extension/bmp) files to
[`*.png`](https://www.fileinfo.com/extension/png) files. Google even
found the long-lost missing style file
[`qqaaelba.sty`](https://arxmliv.kwarc.info/macro\_sty\_detail.php?filename=qqaaelba.sty)
in [arxmliv](https://arxmliv.kwarc.info/). After making these trivial
changes `pdflatex.exe` gobbled my poster source and moved [Using FoxPro
and DDE to Store J
Words](https://docs.google.com/leaf?id=0B3hRbt360vl5NDliYzllMzYtMTc2Ni00YzVhLWIyNDAtYmUzN2I0OTkxYjEx\&sort=name\&layout=list\&num=50)
into the 21st century.
