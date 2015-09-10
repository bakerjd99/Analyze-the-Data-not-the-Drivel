[JHS with the 
DHTMLX Grid](http://bakerjd99.wordpress.com/2012/12/03/jhs-with-the-dhtmlx-grid/)
-----------------------------------------------------------------------------------------------

*Posted: 04 Dec 2012 05:27:15*

Grids are the most important GUI user object. It’s hard to think of a
user-friendly data munching application that doesn’t have a grid beating
at its heart. Consequently, any serious *GUI interface contender* must
support grids. My [previous
post](http://bakerjd99.wordpress.com/2012/11/25/jhs-meets-mathjax/)
showed how to use [MathJax](http://www.mathjax.org/) with
[JHS](http://www.jsoftware.com/jwiki/NYCJUG/2011-02-08/HelloWorldInJHS).
MathJax is an impressive and important JavaScript library; it clearly
demonstrates the potential of CHJ[^1] GUI interfaces but let’s face it,
mathematical typesetting will not win many consulting contracts. Grids
won’t seal the deal either but their *absence* is a huge “next” signal.
To support serious business and technical applications JHS needs grids.

Fortunately, the JavaScript world is [grid
saturated](http://www.hotscripts.com/blog/15-javascript-data-grids-enhance-html-tables/).
The difficulty is not finding a grid but choosing among dozens of
candidates. For this demo I Googled around and found
[DHTMLX](http://dhtmlx.com/docs/products/dhtmlxGrid/). According to this
[probably biased article](http://www.dhtmlx.com/blog/?p=1525) the DHTMLX
grid performs well on large inputs and, more importantly, there is an
[open
source](http://www.dhtmlx.com/docs/products/dhtmlxGrid/license.shtml?gpl)
version.

You have to start somewhere so I opted to use DHTMLX to build a simple
CSV file editor. The CSV files I am going to edit are `TAB` delimited
text files. Each file has a fixed number of columns with column names in
the first row. Here is [an
example](https://www.box.com/s/0sm9bjgclnqu0czlpal6) `TAB` delimited
file. The idea is to load the file data into the grid. Tweak a few rows
and save the result. By increasing the size of the CSV file we can gauge
the performance of the grid. Let’s get started.

Using the DHTMLX grid requires some preparation.

1.  Create a local directory and edit J’s `config/folders.cfg` to
    reference the directory with the name `GridDemo`. `jpath ’GridDemo’`
    should return the full directory path.

2.  Download the files in the
    [GridDemo](https://www.box.com/s/n7ty82nv6nslia4drphs) folder and
    copy them to `GridDemo`.

3.  Download the Standard Edition (Version 3.5) of
    [DHTMLX](http://dhtmlx.com/docs/products/dhtmlxGrid/index.shtml).
    The distribution file `dhtmlxGrid.zip` contains the grid source and
    supporting files.

4.  Extract the `/dhtmlxGrid/codebase/` directory from `dhtmlxGrid.zip`
    and copy the entire directory tree to `GridDemo`.

5.  Also extract `/dhtmlxGrid/samples/common` from `dhtmlxGrid.zip` and
    copy the directory to `GridDemo`.

When you’re finished the top-level of `GridDemo` will look like the
following where names without extensions are directories.

    calendar           dhtmlxgrid.js         GridDemo.ijs   t100rows.txt
    common             dhtmlxgrid_skins.css  imgs           t5000rows.txt
    dhtmlxcommon.js    excells               jodoval.png
    dhtmlxgridcell.js  ext                   skins
    dhtmlxgrid.css     favicon.ico           t1000rows.txt

The main J script is `GridDemo\GridDemo.ijs`. Start JHS and load this
file.

        load '~GridDemo/GridDemo.ijs'

Then browse to this site.

        http://127.0.0.1:65001/GridDemo

If all goes well you will see the following `GridDemo` page after
pressing the `Edit Grid` button.

To load and edit files enter their fully qualified names in the `Input`
and `Output` boxes and press `Edit Grid`. To edit a cell double-click
it. To save changes press `Save Grid.`[^2] There are more sophisticated
ways to pick files on JavaScript pages. It’s easy to pop up standard
host OS file dialogs but it’s not particularly easy to determine host
directory paths. [This
post](http://robertnyman.com/2010/12/16/utilizing-the-html5-file-api-to-choose-upload-preview-and-see-progress-for-multiple-files/)
outlines the demons web programmers must slay to select host files. JHS
circumvents these difficulties by asking the J server, which is a
typically a *local console process*, to do the dirty work. JavaScript’s
access to local files is limited for security reasons but J has no such
restrictions. [Use the force
Luke!](http://www.youtube.com/watch?v=-fSj6LxsZes)

Three test files `t100rows.txt`, `t1000rows.txt`, and `t5000rows.txt`
are included with the demo. On my test machines load times vary from
fractions of a second for the smaller files to nine seconds for the
largest. This is competitive with the basic `C#` grid control and fast
enough for serious work.

In subsequent posts I will explore JavaScript/JHS graphics options and
start the process of integrating, grids, graphs and MathJax with JHS.

[^1]: CSS, HTML and JavaScript.

[^2]: The freebie version of DHTMLX does not support grid serialization.
    [Here is how to roll your
    own](http://bakerjd99.wordpress.com/2012/12/04/more-about-jhs-with-dhtmlx-the-grid/).
