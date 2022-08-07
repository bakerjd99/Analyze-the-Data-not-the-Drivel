Fixing Table of Contents in `bm.epub`
-------------------------------------

NOTE: WARNING: do not wrap title text in `nav.xhtml` the calibre
eBook reader will preserve the breaks in the TOC. I have
no idea what other EPUB readers will do.

The default EPUB table of contents (TOC) for `bm.epub` is just one big 
list of posts. It's possible to add a year level to the TOC so it
looks more like the LaTeX PDF.  Everytime I do this I forget 
the exact sequence of steps I used previously. So here's
a check list.

1. Open calibre and remove the Analyze the Data Not The Drivel book. 
   This clears bm.epub and bm.mobi

2. Add `c:\pd\blog\wp2epub\bm.epub` to calibre.

3. Convert the EPUB to MOBI. MOBI does not support nested
   TOCs so you are done with `bm.mobi`.

4. Open the book in the calibre book editor.

5. Change the name of the root `xhtml` file to `bm.xhtml`

6. Copy any new lines in the default `nav.xhtml` to `c:\pd\blog\wp2epub\xhtml\nav.xhtml`
   Newer versions of calibre add `<li>` attribute ids - edit these out and take
   care to get the list item syntax right. Save `c:\pd\blog\wp2epub\xhtml\nav.xhtml`

7. In the calibre book editor replace the default `nav.xhtml` with `c:\pd\blog\wp2epub\xhtml\nav.xhtml`
   If you haven't screwed up your TOC will now have a year level. Save your changes.

8. Export `bm.xhtml` to ``c:\pd\blog\wp2epub\xhtml\bm.xhtml` 

See that wasn't so bad!