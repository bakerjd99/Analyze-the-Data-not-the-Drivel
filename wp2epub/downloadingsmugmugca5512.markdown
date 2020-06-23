 
[Downloading SmugMug Captions with Python and Jupyter](http://analyzethedatanotthedrivel.org/2017/12/24/downloading-smugmug-captions-with-python-and-jupyter/)
-----------------------------------------------------------------------------------------------------------------------------------------

*Posted: 24 Dec 2017 20:38:48*

*This blog post started out as an experimental rendering of a
[Jupyter](https://jupyter.org/) notebook. I wanted to see how difficult
it would be to convert a notebook to a WordPress.com blog post. Even
though Jupyter exports notebooks in HTML and Markdown they do not
display well “out of the box.” No doubt one could craft CSS that would
help but the entire point of Jupyter exports is to cut down on pointless
format thrashing. This post is a teaser. If you want to get to the
source notebook follow [this link to my GitHub
repositories](https://github.com/bakerjd99/smugpyter).*

**Why am I doing this?**

My [photo captions](https://conceptcontrol.smugmug.com) have evolved
into a form of *milliblogging*. *Milliposts* (milliblog posts) are terse
and tiny; many are single sentences or paragraphs. Taken one-at-a-time
milliposts seldom impress but when gathered in hundreds or thousands
accidental epics emerge. So, to prevent “epic loss” I want a simple way
of downloading and archiving my captions off-line.

**If you don’t control it you cannot trust it!**

When I started blogging I knew that you could not depend on blogging
websites to archive and preserve your documents. We had already seen
cases of websites mangling content, shutting down without warning, and
even worse, *censoring* bloggers. It was a classic case of, “If you
don’t control it you cannot trust it.” I resolved to keep complete
off-line *version controlled* copies of my blog posts.

Maintaining off-line copies was made easier by
[WordPress.com](https://wordpress.com/)’s excellent [blog export
utility](https://en.blog.wordpress.com/2006/06/12/xml-import-export/). A
simple button push downloads a large XML file that has all your blog
posts with embedded references to images and other inclusions. XML is
not my preferred archive format. I am a huge fan of LaTeX and Markdown:
two text formats that are directly supported in Jupyter Notebooks. I
wrote a little system that parses the WordPress XML file and [generates
LaTeX and
Markdown](https://analyzethedatanotthedrivel.org/2012/02/11/wordpress-to-latex-with-pandoc-and-j-prerequisites-part-1/)
files. Yet, despite milliblogging long before blogging, I don’t have a
similar system for downloading and archiving SmugMug *metadata*. [This
Jupyter notebook addresses this
omission](https://github.com/bakerjd99/smugpyter/blob/master/notebooks/Downloading%20Smugmug%20Captions%20with%20Jupyter.ipynb)
and shows how you can use Python and the SmugMug API to extract gallery
and image metadata and store it in version controlled local directories
as CSV files.
