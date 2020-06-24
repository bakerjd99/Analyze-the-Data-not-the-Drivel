 
[J 7.01 Now Playing in your Browser](https://bakerjd99.wordpress.com/2011/02/12/j-7-01-now-playing-in-your-browser/)
-------------------------------------------------------------------------------------------------------------------

*Posted: 12 Feb 2011 22:01:31*

Big changes are afoot for J programmers. With the release of [J
7.01](https://www.jsoftware.com/docs/help701/user/relhigh.htm)
[JSOFTWARE](https://www.jsoftware.com/) has taken the risky step of
[deprecating](https://en.wikipedia.org/wiki/Deprecation) two well
established user
[IDE’s](https://en.wikipedia.org/wiki/Integrated\_development\_environment)
and replacing them with brand new [GTK](https://www.gtk.org/) and Web
browser-based interfaces. As we all know new software is not necessarily
better software, (remember that risky bit), but in this case the changes
make sense.

Early J systems were largely Windows-Centric. Yes, J has run perfectly
well on strains of UNIX/Linux and the Mac for over a decade but I think
it’s fair to say that J IDE’s were biased toward Windows. JSOFTWARE was
well aware of this and tried to offer the features of their Windows IDE
with a portable Java based IDE. Unfortunately the Java IDE, like Java
itself, failed to live up to expectations.

Now that the many, if not the majority of J programmers, run J on
non-Windows, (mostly Linux and the Mac), systems it makes no sense to
treat them like second class citizens. So how do you provide a *state of
the art portable user IDE* that runs well on Windows, Linux, the Mac,
smart phones and various
[IGadgets](https://pinoytutorial.com/techtorial/iboard-and-imat-future-of-apple-products/).
There is no single answer so JSOFTWARE wisely decided to offer two IDEs:
JHS and
[JGTK](https://www.jsoftware.com/jwiki/System/Installation/J701/Gtk).

The JGTK IDE is a desktop application that is similar to the older
Windows IDE. JGTK is somewhat biased toward Linux but this his doesn’t
mean it doesn’t work well on other systems. I run it on WinXP and Win7
machines all the time. JGTK takes longer to load than the older Windows
IDE but once it’s up and running I don’t see significant performance
differences. The JGTK editor is superior to the older Windows editor and
I love the side bar and UNIX style code tagging. For a first version
JGTK is a nice bit of work that will only improve as J programmers and
users pound away on it.

JGTK is nice but JHS is radical. JHS abandons the desktop and turns your
favorite web browser into a stripped down J programming environment. I
was skeptical when I first heard about JHS but it has won me over. JHS
is amazingly effective under Google’s Chrome browser. It comes up in a
flash and is as zippy or faster than the older Windows IDE. Even better
this webby goodness imposes minimal burdens. The JHS web server is often
one of the smaller processes running on my machines. I have been doing
the bulk of my
[JOD](https://docs.google.com/View?docID=dhnms2p5\_80f4nj56c5\&revision=\_latest)
update work with JHS and I frequently forget I’m using a browser! *Good
user interfaces,* *[unlike
politicians](https://www.nationalreview.com/articles/225959/coming-obama-thugocracy/michael-barone),
get out of your face!*

As for my [J addon
JOD](https://www.jsoftware.com/jwiki/Addons/general/jod): J 7.01
introduced a number of system script changes that break JOD 0.8.0. I am
working on JOD 0.9.0, (a beta version is available in the files box
sidebar of this blog), that fixes these problems and implements some
planned changes. The biggest change so far: I have moved the JOD
interface out of the **z** locale into it’s own **ijod** interface
locale. How’s this for a marketing slogan? **JOD 0.9.x – now with less z
stomping!**
