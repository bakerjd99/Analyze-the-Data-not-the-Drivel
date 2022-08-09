
["Managing" a SQLite Database with J (Part 2)](http://analyzethedatanotthedrivel.org/2022/08/08/managing-a-sqlite-database-with-j-part-2/) 
-----------------------------------------------------------------------------------------------------------------------------------------

*Posted: 09 Aug 2022 04:58:06*

When faced with unfamiliar program code [Roger
Hui](https://rogerhui.rip/), the cocreator of the [J Programming
Language](https://code2.jsoftware.com/wiki/Main_Page) would sometimes
wipe out all the code comments. He told me this forced him to
concentrate on the actual code and not the *opinions* of previous
developers. Roger was an exceptional programmer; he knew that program
comments are often dated, misleading and wrong. And, the only way to
"correct the comments" is to read the code; so why not just read the
code and skip the philosophy? Roger's comment purges underscore an
important point. However you document your code, *it must be better than
the null or empty document.*

With this in mind, I wrote a few versions of this post, but I hated them
all. Then I realized that
[`jodliterate`](https://github.com/bakerjd99/jacks/blob/master/jodliterate/UsingJodliterate.pdf)
PDF documents *mostly* do what I want. So, instead of rewriting
[`MirrorXref.pdf`](https://github.com/bakerjd99/jacks/blob/master/mirrorxref/MirrorXref.pdf),
I will make a few comments about jodliterate group documents in general.
If you're interested in using [SQLite](https://sqlite.org/index.html)
with J, download the self-contained [GitHub files `MirrorXref.ijs` and
`MirrorXref.pdf`](https://github.com/bakerjd99/jacks/tree/master/mirrorxref)
and have a look.

**jodliterate Group Documents**

`jodliterate` group documents are directly generated from [JOD
dictionaries](https://analyzethedatanotthedrivel.org/the-jod-page/)
using J, [pandoc](https://pandoc.org/), and LaTeX. Group documents have
three major parts.

1.  An overview.

2.  Complete typeset source code.

3.  A global word index.

The source code and index sections are self-explanatory, but a few
remarks about overviews are warranted.

The *overview* might have several subsections. There's usually a
hyperlinked **Interface** subsection. J doesn't have formal interfaces
like many programming languages. The words listed in the **Interface**
section are words you will use when running the script. The
**Interface** section highlights where to get started.

For complex scripts, there is usually a **Using** subsection.
[`MirrorXref.pdf`](https://github.com/bakerjd99/jacks/blob/master/mirrorxref/MirrorXref.pdf)'s
**Using** subsection is typical.

Finally, there might be a **Code Hints** subsection. Code Hints are
lists of hyperlinked words that you should heed.

For more, take Roger's advice and read the code.
