
[J `graphviz`'s Euclid's *Elements*](https://analyzethedatanotthedrivel.org/2023/06/28/j-graphvizs-euclids-elements/)
---------------------------------------------------------------------------------------------------------------------

*Posted: 28 June 2023 16:12:10*

In Sarah Hart's new book [*Once Upon a
Prime*](https://www.theguardian.com/books/2023/apr/25/once-upon-a-prime-sarah-hart-review-why-maths-and-literature-make-a-winning-formula)
she relays [John Aubrey's](https://en.wikipedia.org/wiki/John_Aubrey)
account of the philosopher John Hobbes's[^7864x1] first exposure to Euclid's
*Elements*.

> Being in a gentleman's library Euclid's *Elements* lay open, and 'twas
> the forty-seventh proposition in the first book. He read the
> proposition. "By God," said he, "this is impossible!" So he reads the
> demonstration of it, which referred him back to such a proof; which
> referred him back to another, which he also read. . .. At last he was
> demonstratively convinced of the truth. This made him in love with
> geometry.

She goes on to say that in the 17^th^ century knowledge of Euclid's
*Elements* was considered part of a well-rounded education and that
gentlemen were expected to know Euclid's 47^th^ proposition. Well, there
aren't a lot of "gentlemen" around in the 21^st^ century. We have lots
of obese Chads and [decorated
truck-driving](https://www.youtube.com/watch?v=yOCJkSlnjG0) bands of
[*trumptards*](https://www.urbandictionary.com/define.php?term=Trumptard%27s),
but no gentlemen. But, even in our advanced state of social and
intellectual decay, most of us have heard of Euclid's 47^th^
proposition. We call it the [*Pythagorean
Theorem*](https://analyzethedatanotthedrivel.org/2022/09/28/on-eponymous-erasure/).

Lately, as part of a larger delusional project, I have been studying the
first six books of The *Elements*. I haven't turned into a geometry
fanboy like Hobbes, but I must confess that reading great classics like
Euclid's *Elements* is surprisingly delightful. One delight is the
canonical numbering of propositions.[^7864x2] It helps when comparing
different versions of The *Elements*; I've been reading three.

1.  [The Green Lion
    *Elements*](https://www.greenlion.com/books/EuclidsElements.html).

2.  [Oliver Byrne's 1847 illustrated
    *Elements*](https://www.c82.net/euclid/)*.*

3.  [David Joyce's excellent online
    version](https://mathcs.clarku.edu/~djoyce/elements/aboutText.html).

My main text is the Green Lion *Elements*. The Green Lion version is
based on [Thomas
Heath's](https://www.perseus.tufts.edu/hopper/text?doc=Euc.+1)
monumental and definitive three-volume English translation. It dispenses
with Heath's copious footnotes and commentary and coalesces all thirteen
original *Elements* books into a single attractive volume. The Green
Lion *Elements* is indeed a superb book that should be in every
gentleman's library.

After reading the Green Lion version of a proposition, I pop over to
Byrne's illustrated version and read his presentation of the same
canonically numbered proposition. Byrne sought to make The *Elements*
more accessible by replacing tedious proofs with striking, beautiful
colored illustrations. He wrote:

> This work has a greater aim than mere illustration; we do not
> introduce colours for the purpose of entertainment, or to amuse by
> certain combinations of tint and form, but to assist the mind in its
> researches after truth.

You got to love 19^th^-century authors; the poor dears believed there
was such a thing as "truth" and that the mind is better filled with it
than the relative rubbish we call "our truth" nowadays.

When first published, Byrne's book was hailed as a graphic masterpiece,
[a verdict that persists to this
day](https://www.maa.org/press/periodicals/convergence/oliver-byrne-the-matisse-of-mathematics-byrnes-euclid-geometry-understood-via-color-coded-diagrams),
but unfortunately, the high-quality printing required to render hundreds
of colored images made his book too expensive for its intended audience.
Consequently, Byrne's book didn't impact mathematics education much, but
it deeply influenced generations of artists and graphic designers and is
still widely revered today. Byrne's book only covers the first six books
of The *Elements*. This is the main reason I am confining my study to
the first six books. Modern admirers of Byrne have completed his work.
You can now read [all thirteen books in Byrne's
style](https://www.kroneckerwallis.com/product/euclids-elements-completing-oliver-byrnes-work/).

I can personally attest to the effectiveness of Byrne's style. For me,
Byrne's illustrated proofs are easier to understand than the standard
verbose versions. Byrne's 19^th^-century illustrations work for the same
reasons the graphic proofs shown on the magnificent YouTube channel
[Mathematical Visual
Proofs](https://www.youtube.com/c/MicroVisualProofs) work.
[Horace](https://www.britannica.com/biography/Horace-Roman-poet) said it
best:

> A feebler impress through the ear is made, Than what is by the
> faithful eye conveyed.

To keep focused on my larger project I've been slowly building up a
[directed graph](https://en.wikipedia.org/wiki/Directed_graph) (digraph)
of the proof "justifications" found in Euclid's first six books.
"Justifications" are the references John Aubrey called out in his story
about Hobbes in the gentleman's library. Typically, proofs refer to
prior proofs, which again refer to earlier proofs, and so on right back
to what Euclid called postulates, common notions, and definitions. It is
this organized comprehensive logical structure that makes The *Elements*
so important. Most of Euclid's results were known long before him, and
"solitary proofs" in many forms, are found in many cultures, sometimes
thousands of years before Euclid, but as far as we know, the idea of
organizing everything known about a subject, geometry in Euclid's case,
into a coherent deductive logical structure was a unique innovation.
It's not exaggerating to say this logical organizing idea changed
mathematics and the world forever. We're still living in Euclid's vision
and we're not even sure there is a rational alternative.

After digraph'ing the first two books of The *Elements*, I decided I
needed to compare my handcrafted squiggles to someone else's. This is
what led me to [David Joyce's online
*Elements*](https://mathcs.clarku.edu/~djoyce/elements/aboutText.html).
If you browse any of Joyce's pages, say [Proposition
47](https://mathcs.clarku.edu/~djoyce/elements/bookI/propI47.html), you
will notice the explicit marginal justifications that set Hobbes on his
way. Unlike Hobbes, we can peek under the hood. If you look at the HTML
page code, you'll see the justifications are marked in \<div\> elements.
With such clearly marked references, it's a simple matter to extract
Joyce's \<div\>'s and generate a [graphviz](https://graphviz.org/)
digraph of Euclid's first six books. Mining web pages is a dark art
practiced by geeky nerds wielding magic software tools like the
wonderfully named [Beautiful
Soup](https://beautiful-soup-4.readthedocs.io/en/latest/). I've used
Beautiful Soup but sometimes, just sometimes, it's easier to write a few
lines of code than wrestle with frameworks like Beautiful Soup. The
following [J verb](https://code.jsoftware.com/wiki/Main_Page) sucks out
Joyce's web page justifications.

~~~~J
eucjoycejust=:3 : 0

NB.*eucjoycejust v-- extract justifications from Joyce proposition html.
NB.
NB. monad:  blcl =. eucjoycejust clHtml
NB.
NB.   hdr=. 'https://mathcs.clarku.edu/~djoyce/elements/' 
NB.   htm0=. gethttp hdr,'bookI/propI47.html'
NB.   eucjoycejust htm0

NB. justifications in html
cc=. CR,LF,TAB
(,'a'&geteleattrtext"1 (] '</div>'&beforestr;.1~ '<div class="just">' E. ]) y -. cc) -. a:
)
~~~~

By blowing over all the web pages with verbs like:

~~~~J
eucjoycebkdeps=:3 : 0

NB.*eucjoycebkdeps v-- justifications from Joyce book html files.
NB.
NB. NOTE: use (wget) or (curl) to download the files at:
NB.
NB. https://mathcs.clarku.edu/~djoyce/elements/
NB.
NB. monad:  btcl =. eucjoycebkdeps blclHtmlFiles
NB.
NB.   NB. justifications in first two books
NB.   bks=. 'bookI/propI*html';'bookII/propII*.html'
NB.   eucjoycebkdeps ; 1&dir&.> (<'~temp/elements/') ,&.> bks

;(<@justfile@winpathsep ,. eucjoycejust@read)&.> y
)
~~~~

You can build [graphviz code like this file on
GitHub](https://github.com/bakerjd99/jacks/blob/master/eucgvuts/euclid_digraph_books_1_6.gv)
that collects the justifications in the first six books of The
*Elements*. By loading this graphviz code into [J's graphviz
addon](https://wiki.jsoftware.com/wiki/Addons/graphics/graphviz) you can
generate SVG digraphs like
[euclid_digraph_books_1\_6.svg](https://github.com/bakerjd99/jacks/blob/master/eucgvuts/euclid_digraph_books_1_6.svg).
SVGs can be easily converted to PDFs. Here is a PDF of [all the
postulates, common notions, definitions, and propositions found in the
first six books of The
*Elements*](https://bakerjd99.files.wordpress.com/2023/06/euclid_digraph_books_1_6-1.pdf).
The nodes are color-coded to distinguish postulates from propositions,
definitions, and common notions easily. Large digraphs quickly lose
their informative nature.
[euclid_digraph_books_1\_6.pdf](https://bakerjd99.files.wordpress.com/2023/06/euclid_digraph_books_1_6-1.pdf)
looks more like the work of [spiders on
acid](https://www.theguardian.com/science/2014/oct/04/spiders-lsd-drugs-experiment-1971)
than anything else. Still, the web links embedded in the document are
handy. Clicking on any graph node will take you directly to the relevant
page on Joyce's *Elements* site.

The following J verb follows digraph connections back to their source.

~~~~J
eucpropback=:4 : 0

NB.*eucpropback v-- generate reverse proposition digraph.
NB.
NB. dyad:  cl =. clNode eucpropback clGv
NB.
NB.   path=. jpath '~JACKS/eucgvuts/'
NB.   gv=. read path,'euclid_digraph_books_1_6_dependencies.gv'
NB.
NB.   NB. typical use
NB.   gt=. 'I.47' eucpropback gv
NB.   gf=. jpath '~temp/euclid_i_47_dependencies.gv'
NB.   (toHOST gt) write gf
NB.   graphview gf

gs=. s: gc [ 'gpr gpo gc'=. eucnctsparse y
'no such node' assert (rn=. s: <x) e. 1 {"1 gs

NB. work backwards in dependencies
dn=. 0 2 $ s:<''
whilst. #rn do.
  sn=. gs #~ (1 {"1 gs) e. rn
  dn=. dn , |."1 sn
  rn=. (0 {"1 sn) -. 0 {"1 dn
end.

title=. 'Proposition ',x,' Dependencies'
title fmteucgv gpr;gpo;<5 s: |."1 dn
)
~~~~

Running this verb on Proposition 47 generates this [reverse
sub-digraph](https://bakerjd99.files.wordpress.com/2023/06/euclid_i_47_dependencies-1.pdf)
that retraces the steps Hobbes took back in his 17^th^-century
gentleman's library.

The code referenced in this post is available on GitHub at:
<https://github.com/bakerjd99/jacks/tree/master/eucgvuts>

For more information read the jupyter notebook
[eucgvuts_notebook.ipynb](https://github.com/bakerjd99/jacks/blob/master/eucgvuts/eucgvuts_notebook.ipynb).

[^7864x1]: Hobbes is famous for the
    [*Leviathan*](https://www.britannica.com/topic/Leviathan-by-Hobbes)
    and the dead-on observation that life is "nasty, brutish and short".

[^7864x2]: Hobbes' 17^th^-century Proposition 47 is still called Proposition
    47 in Oliver Byrne's 19^th^-century book. It remains Proposition 47
    in Thomas Heath's early 20^th^-century *magnum opus* and is again
    called Proposition 47 in David Joyce's 21^st^-century online
    *Elements*. The *Elements'* proposition, or theorem numbering,
    scheme has been stable for centuries.
