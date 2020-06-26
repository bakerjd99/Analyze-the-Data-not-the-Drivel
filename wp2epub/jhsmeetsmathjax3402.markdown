 
[JHS meets MathJax](https://bakerjd99.wordpress.com/2012/11/25/jhs-meets-mathjax/)
---------------------------------------------------------------------------------

*Posted: 25 Nov 2012 07:19:21*

With the release of J 7.01 [Jsoftware](https://www.jsoftware.com)
“deprecated” COM. J 6.02 can run as a [COM automation
server](https://en.wikipedia.org/wiki/OLE\_Automation) but J 7.01 cannot.
Throwing COM [under the bus](https://www.youtube.com/watch?v=aix35ZSp46c)
is hardly radical. Microsoft, COM’s creator, has been holding COM’s head
underwater for years. Many `.Net` programmers cringe when they hear the
word “COM” and the greater nonwindows[^1x3402] world never *really* accepted
it. COM is a complex, over-engineered, proprietary dead-end. Yet despite
its bloated deficiencies a lot of useful software is COM based. So with
COM going away, at least for J programmers, the hunt is on for viable
replacements and while we’re hunting let’s rethink our entire approach
to building J GUI applications.

J GUI applications are traditional desktop applications. They’re built
on native GUIs like [Windows
Forms](https://msdn.microsoft.com/en-us/library/dd30h2yb.aspx) and
[GTK](https://www.gtk.org/) and when done well they look and act like GUI
applications coded in other languages. This is all good but there is a
fundamental problem with desktop GUIs. *There are many desktop GUIs and
they do not travel well.* Programmers have spent many dollars and days
creating so-called *cross-platform GUIs* but, if you wander off the
Windows, Mac and Linux reservation, the results are not particularly
portable. And, as portable GUIs rarely outperform native alternatives,
programmers tend to stick in their tribal silos. GUI programming is a
bitch, has always been a bitch and will always be a bitch. It’s time to
divorce the desktop GUI bitch.

All divorces, even the geeky GUI variety, are hard. When you finally cut
the knot you’re not entirely sure what you’re doing or where you’ll end
up. All you know is that there is a better way and with respect to J GUI
applications I believe that
[JHS](https://www.jsoftware.com/jwiki/NYCJUG/2011-02-08/HelloWorldInJHS)
is that way. JHS leverages the large CSS, HTML and JavaScript (CHJ)
world and in recent years some impressive browser-based applications
have emerged from that world. The application that changed my mind about
JavaScript and browser-based applications in general is something called
[MathJax](https://www.mathjax.org/).

MathJax typesets mathematics. It renders both LaTeX and MathML using
fully scalable browser fonts. This is better than what WordPress does.
The following
[Ramanujan](https://scienceworld.wolfram.com/biography/Ramanujan.html)
identity taken from [MathJax
examples](https://www.mathjax.org/demos/tex-samples/) renders on
WordPress as an *image.*

    $\frac{1}{\Bigl(\sqrt{\phi \sqrt{5}}-\phi\Bigr) e^{\frac25 \pi}} =
    1+\frac{e^{-2\pi}} {1+\frac{e^{-4\pi}} {1+\frac{e^{-6\pi}}
    {1+\frac{e^{-8\pi}} {1+\ldots} } } }$

MathJax renders the same expression with scalable fonts and supports
downloading the expression as LaTeX or MathML text. This is pretty
impressive for browser JavaScript. I wondered how hard it would be to
use MathJax with JHS and was pleased to find it’s *easy peasy.*

Writing a basic JHS application is a straightforward task of setting up
three JHS J nouns `HBS`, `CSS` and `JS`.[^2] `HBS` is a sequence of J
sentences where each sentence yields valid HTML when executed. JHS
generates a simple web page from `HBS` and returns it to the browser.
`MathJaxDemo` `HBS` is:

```J
HBS=: 0 : 0
    navul''           
    '<hr>','treset' jhb 'Reset'

    '<hr>',jhh1 'Typeset with MathJax and J'
    configjax
    oltypeset''
        
    '<hr>',jhh1 'Typeset Random Expression Tables'
    tabledesc
    '<br/>','ttable' jhb'Typeset Random Expression Array' 
    '<br/>','restable' jhspan''        
)
```

`CSS` is exactly what you expect: CSS style definitions. Finally, `JS`
is application specific JavaScript. `MathJaxDemo` `JS` matches `HBS`
page events with corresponding JHS server handlers. This demo uses
[ajax](https://code.google.com/edu/ajax/tutorials/ajax-tutorial.html) for
all event handlers.

```J
JS=: 0 : 0

    function ev_ttable_click(){jdoajax([],"");}
    function ev_tquad_click(){jdoajax([],"");}
    function ev_tmaxwell_click(){jdoajax([],"");}
    function ev_tramaujan_click(){jdoajax([],"");}
    function ev_tcrossprod_click(){jdoajax([],"");}
    function ev_treset_click(){jdoajax([],"");}

    function ev_ttable_click_ajax(ts){jbyid("restable").innerHTML=ts[0]; 
                MathJax.Hub.Typeset();}
    function ev_tquad_click_ajax(ts){jbyid("resquad").innerHTML=ts[0]; 
                MathJax.Hub.Typeset();}
    function ev_tmaxwell_click_ajax(ts){jbyid("resmaxwell").innerHTML=ts[0];
                MathJax.Hub.Typeset();}
    function ev_tramaujan_click_ajax(ts){jbyid("resramaujan").innerHTML=ts[0];
                MathJax.Hub.Typeset();}
    function ev_tcrossprod_click_ajax(ts){jbyid("rescrossprod").innerHTML=ts[0]; 
                MathJax.Hub.Typeset();}

    function ev_treset_click_ajax(ts){
    jbyid("restable").innerHTML=ts[0]; jbyid("resquad").innerHTML=ts[0];
    jbyid("resmaxwell").innerHTML=ts[0]; jbyid("resramaujan").innerHTML=ts[0];
    jbyid("rescrossprod").innerHTML=ts[0];
    }
)
```

Running the JHS `MathJaxDemo` is a simple matter of:

1.  Downloading the J scripts in the
    [`MathJaxDemo`](https://www.box.com/s/5ygk06zwvmdach6uds9w) folder
    to a local directory.

2.  Editing J’s `config/folders.cfg` file and pointing to your download
    directory with the name `MathJaxDemo`. You are set up correctly if
    `jpath ’MathJaxDemo’` returns your path.

3.  Loading the demo: `load ’MathJaxDemo/MathJaxDemo.ijs’`

4.  Browsing to the site: `https://127.0.0.1:65001/MathJaxDemo`

It’s not hard to use JHS as a general application web server. JHS
provides many common controls right out of the box but to compete with
desktop applications it’s necessary to supplement JHS with JavaScript
libraries like MathJax. In coming posts I will explore how to use
industrial strength JavaScript grids and graphics with JHS.

> *Bill Lam has pointed out that J 7.01 can function as a COM client.
> The [JAL addon](https://www.jsoftware.com/jwiki/JAL) `tables/wdooo`
> controls [OpenOffice](https://www.openoffice.org/) using Ole Automation
> which is one of the many manifestations of COM.*

[^1x3402]: On a purely numerical basis there is no greater nonwindows world.

[^2x3402]: To learn about JHS programming study the JHS demos and the JHS
    browser application.
