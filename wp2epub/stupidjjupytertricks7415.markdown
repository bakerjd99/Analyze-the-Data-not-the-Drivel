
[Stupid J Jupyter Tricks](http://analyzethedatanotthedrivel.org/2022/07/24/stupid-j-jupyter-tricks/)
----------------------------------------------------------------------------------------------------

*Posted: 24 Jul 2022 23:29:27*

Continuing with my software irritant dispatching theme: today's
irritant - including *syntax colored code* in blogs, LaTeX, Word, and
other documents. This one is a persistent pain in the ass; especially
for users of idiosyncratic programming languages. We all have our
favorite hacks and workarounds; today I am sharing one of mine: using
[jupyter](https://jupyter.org/) to syntax color J code.

A few years ago [Martin Saurer](https://github.com/martin-saurer) made
an outstanding contribution to the [J programming
language](https://code2.jsoftware.com/wiki/Main_Page) community. He
created a [jupyter kernel for
J.](https://github.com/martin-saurer/jkernel) If you don't know what
jupyter is please crawl out from under your rock and join the rest of us
in the 21<sup>st</sup> century.

As I have said before jupyter notebooks are simply the *correct* way to
present complex "executable" technical documents that contain heavy
doses of mathematics, program code, and graphics. I'm not the only one
that holds this opinion: many concur. It would be an understatement to
say that jupyter has been a success. It's now a dominant tool in many
disciplines. If you're not using it you are missing out on one of the
most useful open-source programming tools available.

I came to jupyter from the *pythonverse*. The JSON based `ipynb`
notebook format originated there and initially stood for **I**nteractive
**PY**thon **N**ote**B**ook, but in one of the best software design
decisions ever made, the creators of jupyter decided to make it
*programming language agnostic.* This means any programming language can
plug into jupyter if it implements a well-defined kernel interface. This
is what Martin implemented. Now, many programming languages support
jupyter. It's become an expected facility, and if it's missing, well
that's a good reason to use another programming language.

Martin's J kernel works very well and I use it all the time, but there
are a few ways the J kernel, and jupyter kernels in general, could be
improved.

#### Debugging notebook code

Debugging notebook code is not as polished as it could be. Kernels are
typically "invisible" executables that respond to requests sent from the
notebook server. Most kernels stay in the background and do not provide
standard language-specific programming environments. Usually, this isn't
much of a problem, but when debugging complex programs it would be handy
to push a button and pop up a standard debugger. In J's case, a JQt or
JHS session would appear containing all the code loaded or created by
the notebook. You could then debug and modify your code, then pop over
to the notebook session to try it out.

Right now the J kernel does not "pop up" visible J sessions but you can
achieve something similar by extracting J notebook code as a J script
and executing it in another JQt or JHS session. jupyter makes this easy!

#### Stupid J Jupyter Trick #1 - export notebook code as a J script

jupyter can download notebooks in a variety of formats. One of the
formats provided by the J kernel is `ijs` or J script. Go to the
**File** menu, select **Download as**, then pick **J (.ijs)**. jupyter
will extract all the *J code cells* in the notebook *in cell order* and
write a script file to wherever you want it. I usually save such scripts
in the J temp directory `jpath ~temp` where they can be conveniently
loaded and run.

When you run a downloaded J notebook script in another J session it
*essentially*[^7415x1] recreates the notebook kernel state.

#### Inserting J code into notebooks

Extracting J code from notebooks for debugging is useful but oddly the
inverse, inserting J code into notebooks, is even more useful. As
previously noted, jupyter can export notebooks in many formats. In
particular, it can generate HTML, LaTeX, Markdown, and PDF versions of
notebooks. I've found the generated LaTeX, HTML, and Markdown formats
extremely handy.

#### Stupid J Jupyter Trick #2 - J code notebook insertion

If you're looking for *a quick and dirty way to syntax color J code* do
the following:

1.  Create a blank jupyter notebook.

2.  Open a J script in your favorite editor.

3.  Cut and Paste the script into a jupyter code cell.

4.  Download the notebook as HTML or PDF.

jupyter will nicely syntax color your code. It even does a decent job of
breaking lines. [The GitHub
files](https://github.com/bakerjd99/jacks/tree/master/brandxmp/jupyter)
`brandxmp.ijs.pdf` and `brandxmp.ijs.html` are examples of what you get
right out of the box.

#### Stupid J Jupyter Trick #3 - smarter J code notebook insertion

The quick and dirty method is simple and handy but it's of limited use
when preparing complex LaTeX documents. With LaTeX, you want more than
just code. You want cross-references, web links, footnotes, mathematical
expressions, graphics, indexes, appendices, and other [*literate
programming*](https://www-cs-faculty.stanford.edu/~knuth/lp.html)
goodies. It's much easier to achieve such ends if your J code is split
over many cells. The following verb does this.

```J
ipynbfrjod=:3 : 0

NB.*ipynbfrjod v-- extract J  words from JOD  and insert in blank
NB. jupyter notebook.
NB.
NB. monad:  clIpynb =. ipynbfrjod blclNames
NB.
NB.   NB. examples use docs and utils
NB.   require 'general/jod'
NB.   od ;:'docs utils'
NB.
NB.   nbj=: ipynbfrjod ;:'sha1 sha1dir'
NB.   nbj write 'C:\Users\baker\jupyter_notebooks\test0.ipynb'
NB.
NB.   nbj=: ipynbfrjod }. grp 'ipynb'
NB.   nbj write 'C:\Users\baker\jupyter_notebooks\ipynb_onself.ipynb'

NB. require 'general/jod' !(*)=. disp
jc=. disp&.> y

NB. markdown sections with word name
sec=. dblquote (<MDSECTION,JWORDMARK) ,&.> y
sec=. (<NBJCELLBEGst) ,&.> sec ,&.> <NBJCELLBEGen

NB. j code to quoted list of python strings notebook format
nbj=. <;._2@(REVPYESCAPECHRS&changestr)@tlf&.> jc
nbj=. ;&.> '"' , L: 0 (<'\n",',LF) ,~ L: 0 nbj
nbj=. ,&'"'&.> '\n",'&beforelaststr&.> nbj
nbj=. sec ,&.> nbj ,&.> <NBJCELLEND
toJ NBHEADER , (LF ,~ ','&beforelaststr ;nbj) , NBTRAILER
)
```


After loading J words into cells all the jupyter export facilities are
immediately available. Examples of jupyter outputs exploiting this hack
are [available on
GitHub:](https://github.com/bakerjd99/jacks/tree/master/ipynbfrjod) see
`ipynb_onself.ipynb` and `ipynb_onself.pdf`.

To use `ipynbfrjod` download `ipynb.ijs` and the corresponding document
`ipynb.pdf`. All these files [are on
GitHub](https://github.com/bakerjd99/jacks/tree/master/ipynbfrjod). Help
yourself!

**Postscript:** If you already have a recent version of J installed you 
can directly install this script as a J `addon` by typing the following 
commands in a JQt or JHS session.

```J
NB. install addon files in ~addons/jacks
install 'github:bakerjd99/jackshacks'

NB. installed files
dir '~addons/jacks'

NB. load script
load '~addons/jacks/ipynb.ijs'
```

[^7415x1]: Some care must be taken when developing J jupyter notebooks to
    guarantee exported scripts accurately recreate kernel states.
