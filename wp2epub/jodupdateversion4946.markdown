 
[JOD Update: Version 0.9.97\*](https://bakerjd99.wordpress.com/2015/03/22/jod-update-version-0-9-97/) 
-----------------------------------------------------------------------------------------------------

*Posted: 22 Mar 2015 22:53:00*

In the last year much has changed in the J world.

1.  There are new [official J 8.0x](http://www.jsoftware.com/stable.htm)
    builds for all supported platforms.

2.  The [QT](http://www.qt.io/download/) based IDE JDE has matured and
    is in widespread use.

3.  The column oriented J database JD is drawing new users to J and
    enticing J veterans to reconsider how we use databases.

4.  There is a small group of J system builders experimenting with
    additions, extensions and revisions of core J source code.

In short, there are have been enough changes to revisit and update JOD.

JOD version `0.9.97*`[^a4946] is the first JOD update in many years that
mocks the god of software compatibility. In particular:

1.  The syntax of the `jodhelp` verb has changed.

2.  The `jodsource` addon no longer uses a zip file to distribute JOD
    dump files.

3.  JOD online help will no longer be supported or updated.

4.  Volume size is no longer checked before creating new JOD
    dictionaries.

5.  There is a new version of `jod.pdf.`

#### `jodhelp` changes (\#1, \#3 and \#5):

`jodhelp` has always been a *kludge.* In programmer speak a kludge is
some half-baked facility added to a system after more essential features
have stabilized. The original versions of `jodhelp` pointed at my rough
notes. It was all the “documentation” I needed! Then others stared using
JOD which resulted in an “evolved” online version of my notes. I
originally thought that hosting my notes online would simultaneously
serve user needs and cut the amount of time I spent maintaining
documentation. In retrospect this *wasn’t even wrong!*

I used Google Documents to host my notes. If you’ve ever wondered why
completely free Google Documents hasn’t obliterated expensive *Microsoft
Word* or hoary old excellent LaTeX I invite you to maintain a set of
*long-duration-documents* with Google Documents. During `jodhelp`’s
online lifetime the basic internal format of Google Documents changed in
a *screw-your-old-documents* upgrade which forced me to spend days
repairing broken hyper-links and reformatting. I was not amused; you
still get what you pay for!

I originally choose Google Documents because of its alleged global
accessibility. Sadly, Google Documents is now often blocked by corporate
and national firewalls. Even when it isn’t blocked it renders like a dog
peeing on a fire hydrant. All these problems forced me to rewrite JOD
documentation with a completely reliable tool: good old-fashioned LaTeX.
The result of my labors,
[`jod.pdf`](https://app.box.com/shared/gajfu50gc0), is now distributed
by the `joddocument` addon and is easily browsed with `jodhelp`.

After `jod.pdf`’s appearance another irritant surfaced: synchronizing
`jod.pdf` and the online version. I tried using
[pandoc](http://pandoc.org/) and
[markdown](http://daringfireball.net/projects/markdown/) to generate
both the online and PDF versions from the same source files but
`jod.pdf` is too complex for *not-to-fancy* portable approaches. I was
faced with a choice, lower my `jod.pdf` standards, or get rid of
something I never really liked. I opted to drown a child and abandon
online help. I don’t expect a lot of mourners at the funeral.

Using the new version of `jodhelp` requires installing the addon
`joddocument` and configuring a J PDF reader. It’s also good idea to
define a JQT PF key to pop up JOD help with a keystroke. To configure a
J PDF reader edit the configuration file:

     ~config/base.cfg

this file is directly available from the JQT `Edit\Configure` menu.
`base.cfg` defines a number of operating system dependent utilities.
Make changes to the systems you use, save your changes, and restart J.
The following example shows my `Win64` system settings.

    case. 'Win' do.   
       BoxForm=: 1   
       Browser=: 'c:/Program Files (x86)/Google/Chrome/Application/chrome.exe'   
       Browser_nox=: ''   
       EPSReader=: 'c:/program files/ghostgum/gsview/gsview64.exe'   
       PDFReader=: 'c:/uap/sumatra/SumatraPDF.exe'   
       XDiff=: 'c:/uap/WinMerge-2.14.0-exe/winmergeu.exe'   
       Editor=: 'c:/uap/notepad++/notepad++.exe %f'   
       Editor_nox=: '' 

I use [SumatraPDF](http://www.sumatrapdfreader.org/free-pdf-reader.html)
to read PDF files on Windows. It’s a fast, lightweight, program that
efficiently renders `jod.pdf`. Good PDF readers are available for all
commonly used platforms.

To define JQT PK keys edit the configuration file:[^b4946]

     ~config/userkeys.cfg 

This file is also directly available from the `Edit\Configure` menu. My JOD
specific PF keys are:

    F3;1;Require JOD;require 'general/jod' 
     Shift+F3;1;JOD Help;jodhelp 0 
     F6;1;Dev Dicts;od cut 'joddev jod utils' [ 3 od '' 
     Shift+F6;1;Fit Dev Dicts;od cut 'jodfit joddev jod utils' [ 3 od '' 
     Ctrl+Shift+F6;1;Test Dev Dicts;od cut 'jodtest joddev jod utils' [ 3 od '' 

Pressing `Shift+F3` executes `jodhelp 0` which pops up JOD help.

#### : `jodsource` changes (\#2):

The `jodsource` addon is a collection of JOD dump scripts. Dump scripts
are serialized versions of binary JOD dictionaries. When executed they
merge objects into the current JOD put dictionary. I use them primarily
to move dictionaries around but they [have other
uses](https://github.com/bakerjd99/joddumps) as well. Prior to this
version I distributed the three main JOD development dump scripts,
`joddev`, `jod`, and `utils` in one compressed zip file to reduce the
size of [JAL](http://www.jsoftware.com/jwiki/JAL) downloads.

The distributed script
[`jodsourcesetup.ijs`](https://github.com/bakerjd99/jod/blob/master/jodsource/jodsourcesetup.ijs)
used the `zfiles` addon to extract these scripts and rebuild JOD
development dictionaries. This worked on 32 bit Windows systems but
failed elsewhere. J now runs on 32/64 bit Windows, Mac, Linux, IOS and
Android systems. To better support all these variants I eliminated the
`zfiles` dependency and pruned the JOD development dictionaries. The
result is a more portable and smaller `jodsource` addon.

#### Bye bye volume sizing (\#4):

Early versions of JOD ran in the now bygone era of floppy disks. It was
possible to create *many* JOD dictionaries on a single standard 800
kilobyte 3.5 inch floppy. Compared to modern *porcine-ware* JOD, which
many J’ers consider a *huge* system, is lithe and lean. In floppy days
it was important to check if there was enough space on a floppy before
creating another *huge 48K* empty JOD dictionary. This is a bit
ridiculous today! If you don’t have 48K free on whatever device you are
running you have far more serious problems than not being able to create
JOD dictionaries.

Volume sizing code remained in JOD for years until it started giving me
problems. Returning the size of very large network volumes can be
time-consuming and there are serious portability issues. Every operating
system calls different facilities to return volume sizes. Even worse,
security settings on corporate networks and cloud architectures
sometimes refuse to divulge national secrets like free byte counts.

To eliminate all these headaches this version of JOD no longer checks
volume size when the `FREESPACE` noun is zero. To restore the previous
behavior you have to edit the file

     ~addons/general/jod.ijs`

and change the line `FREESPACE=:0` to whatever byte count you want.
Alternatively, you could *NGAF*[^c4946] and just assume you have 48K free on
your terabyte size volumes.

#### Still to come:

You may have surmised from JOD’s version number that the system is still
not *feature complete.* The JOD manual lists a few words that I am
planning to implement. I only develop JOD when I need something or I am
bored out of my mind at work and need a break. Such intermittent
motivators seldom insure project completion but I have found a new
reason to finish JOD. To list a book on
[Goodreads](http://www.goodreads.com/bakerjd99) or Amazon you need an
[ISBN number](https://www.isbn-international.org/). The [hardcopy
version](http://www.lulu.com/spotlight/bakerjd99) of the JOD manual is a
*sort-of-published* book. To complete the publishing process I need an
ISBN. If I am going to bother with such formalities I might as well
complete the system the manual describes. So there you have it a new
software development motivator: vanity.

[^a4946]: The version number is `*`’ed because you are always a point
    release from done!

[^b4946]: `userkeys.cfg` is only available for J 8.03 systems.

[^c4946]: *Not Give a Fuck!*
