 
[JOD comes to Linux](https://bakerjd99.wordpress.com/2011/06/10/jod-comes-to-linux/)
-----------------------------------------------------------------------------------

*Posted: 10 Jun 2011 13:00:52*

For years I have distributed a [J
Addon](https://www.jsoftware.com/jwiki/Addons) called
[JOD](https://bakerjd99.wordpress.com/the-jod-page/). JOD stands for
**J** **O**bject **D**ictionary. JOD is a code database for the J
programming language. Instead of storing my J programs in text files,
*like every other programmer in the world*, I break them down into the
smallest reusable units. In J parlance I split my scripts into *words.*

If you are an experienced programmer I wouldn’t blame you for
questioning my sanity. What could possibly be gained by discounting good
old-fashioned, superbly supported, ASCII/UTF8 text files? The short
answer, *in trendy software [engineer
speak](https://ee.cleversoul.com/fun/engspeak.html),* is
[refactoring](https://c2.com/cgi/wiki?WhatIsRefactoring). JOD is a
refactoring engine that works at the J word level.

What does *the word level* mean? Program text files are collections of
many “words.” They roughly correspond to sentences, paragraphs, sections
and chapters in ordinary books. When you *reuse*, or quote, a book you
typically copy passages and paste them into new contexts. Programmers
call this cut and paste programming. We have all cut and pasted; it’s a
software sin [our](https://c2.com/cgi/wiki?CopyAndPasteProgramming)
[prophets are constantly
nagging](https://c2.com/cgi/wiki?CopyAndPasteProgramming) us about! JOD
minimizes cut and paste programming. You no longer cut and paste or
*include* you simply
[get](https://docs.google.com/document/d/1Vk-PQrdPEISp0SL4eDaGDgg5HpATarPPvXHryC12I8M/edit?hl=en\_US\&pli=1#)
lists of words. J words are closer to English words than you might
expect: hence this dictionary approach pays big dividends!

With the [release of J
7.01](https://bakerjd99.wordpress.com/2011/02/12/j-7-01-now-playing-in-your-browser/)
it’s become clear that Windows is no longer the preeminent J platform.
The new
[JGTK](https://www.jsoftware.com/jwiki/System/Installation/J701/Gtk#Install)
interface works well on Windows but it *sings* on Linux. This is hardly
surprising. [GTK](https://www.gtk.org/) originated in the Linux/Unix
world and still performs best there. Porting JOD to Linux has been on my
to-do list for years. The arrival of J 7.01 got me off my butt.

JOD 0.9.3 is the first publicized Linux release. JOD code is 99% J and
makes limited use of OS facilities. The port consisted of finding Linux
equivalents for a handful of Windows API calls. The always helpful J
community provided useful pointers. Joey Tuttle and Bill Lam basically
solved my Linux
[GUID](https://en.wikipedia.org/wiki/Globally\_unique\_identifier) and
file handling problems. Thanks guys.

My biggest chore was updating [JOD online
documentation](https://docs.google.com/document/d/1pR1kc27OwTEGZ4BavhYT4RVvAtlEEUzueT9T-URY9t0/edit?hl=en\_US).
In recent months [Google Documents](https://docs.google.com) changed the
format of their word processing documents. Google provided an upgrade
tool to convert old documents to the new format but it:

1.  Did not remap scores of old URLs to new URLs. I had to go through
    every document doing this one link at a time!

2.  Totally wrecked a few documents. I reconstructed [JOD Release
    Notes](https://docs.google.com/document/d/1aBdt8rwdOq\_CQ52qRQ-js1MwiaovC2pxlQq-Z9VosOg/edit?hl=en\_US)
    from version control logs.

Despite these irritants the new format is better. You can attach
comments and download documents in
[ODT](https://www.coolutils.com/Formats/ODT), PDF, Word, HTML and ZIP
formats. If you find problems with my documents please leave notes.

I am not completely satisfied with some restrictions imposed by JOD
0.9.3.

1.  JOD creates dictionaries in user home directories like
    `/home/user/jod/...` and assumes it has the rights to create, write,
    copy and erase JOD files and directories.

2.  No blanks in file paths, i.e.,
    `/home/i like blanks/but jod doesnt/...` will not work.

3.  Dictionary paths must begin with a forward slash, i.e.,
    `/home/is/ok/` but $\sim$`is/nada`

4.  Volume sizing reports the smallest amount of free space on all
    mounted volumes and not the free space on the volume containing JOD
    directories. I just don’t know how to do this on Linux.

5.  [jod.pdf](https://www.box.net/shared/gajfu50gc0) has not been
    updated.

I am sure there are other problems and limitations that I have missed.
For more see: [Linux
Notes](https://docs.google.com/document/d/18pwvvpeuJiU\_HCsuReiKyOxmZORrlMRe45OYE\_cWq0w/edit?hl=en\_US).
I will be releasing fixes and upgrades via
[JAL](https://www.jsoftware.com/jwiki/JAL/User%20Guide) and on [the JOD
page](https://bakerjd99.wordpress.com/the-jod-page/). Give JOD a whirl.
It might change your J ways.
