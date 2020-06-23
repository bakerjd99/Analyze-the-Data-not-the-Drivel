 
[WordPress to LaTeX Hack](http://bakerjd99.wordpress.com/2010/04/12/wordpress-to-latex-hack/)
---------------------------------------------------------------------------------------------

*Posted: 12 Apr 2010 16:48:58*

I have stumbled on another coding nuisance. Last weekend I spent a few
moments exploring ways to export and print this blog in a nice typeset
fashion. I first tried
[Blurb’s](http://www.blurb.com/?ce=google\_brand\_blurb\&gclid=CPWP3fHHgaECFQhinAodnw-Twg)
book making software. It has a nice feature that automatically downloads
blog posts and formats them as ready to print books. Sounds great ehh?
Download your precious blog rants, press a few buttons, generate a slick
PDF, upload it to a site like [Lulu](http://www.lulu.com/) and then wait
a few days for your blog to appear in hardcover. As usual the devil is
in the details.

Blurb’s book making software makes a mess of:

1.  Any LaTeX inclusions. All LaTeX code is echoed verbatim as ASCII. I
    suppose we should be grateful that it’s not deleted.

2.  Source code listings are mangled beyond repair. Your elegantly
    formatted code comes out worse than HEX dumps.

3.  Embedded images are improperly placed. When it comes to blogs
    restricting image inclusions to *simple center of the page layouts*
    pays big dividends. Wrapping text around images may *look ok on your
    blog* but RSS software like Google Reader will wreck it. Apparently
    simple center of the page layouts is too much for Blurb. The default
    layout stuffs square thumbnails in the margins: *arghhhh……*

4.  Web Links are inserted as verbatim footnotes at the end of each
    posting. The link footnotes often sprawl onto extra pages that have
    only one or two lines. I can see why book publishers might not care
    about efficient page allocation ($$$) but I certainly do.

After hitting all these shortcomings on my first test I abandoned Blurb
and started searching for ways to export WordPress blogs as LaTeX. There
are a number of useful tools for converting LaTeX to WordPress. Some of
these tools are used by [Fields
Medal](http://mathworld.wolfram.com/FieldsMedal.html) winners: see
[Terence Tao’s blog](http://terrytao.wordpress.com/). Unfortunately
going the other way does not appear to be well supported. Damn!

After failing to come up with an acceptable WordPress to LaTeX freebie I
downloaded this blog in WordPress’s XML export format and took a look.
To my surprise WordPress XML is what I call *good XML.* Good XML is
designed to be read and understood by human beings! This contrasts with
*bad XML.* Bad XML is essentially a binary format that some idiot
decided should be rendered as XML. Bad XML is useful when you want to
slow down computers.

Converting WordPress XML to LaTeX looks simple enough to make a nice C\#
coding exercise. When I have hacked up a converter that panders to my
idiosyncratic tastes I will post the source code.
