
[Sympathy for Ptolemaic Epicyclers](http://analyzethedatanotthedrivel.org/2023/04/07/sympathy-for-ptolemaic-epicyclers/)
------------------------------------------------------------------------------------------------------------------------

*Posted: 07 Apr 2023 20:56:11*

Histories of science tend to cast "old theory holdouts" as uncouth,
backward, prejudiced, and stinky nitwits. If you don't immediately jump
on the shiny new science bandwagon you're on the *wrong side of history*
and doomed to a legacy of ridicule and disdain. Mind you, these *just
so* histories fail to mention that most new theories are dead-ass wrong
and that you need solid reasons for abandoning ideas that more or less
work. The classic "old theory people are morons" tale appropriately
revolves around astronomy's famous Earth-centered versus Sun-centered
debate. The standard tale casts Copernicus as a brave man of science
(even though he didn't fully publish while alive to avoid censure)
waging righteous war with hidebound doctrinaire church-sanctioned
[Ptolemaic
astronomers](https://microcosmos.uchicago.edu/ptolemy/astronomy.html)
and their idiotic notion that the sky spins around the Earth. How stupid
is that?

Actually, it wasn't stupid. The Ptolemaic system was complicated, lacked
a physical basis, and required constant tweaking and adjustment, (sounds
like modern software), but at its core, the system was *deeply
empirical*. It was based on watching the damn sky and here's the kicker;
it kind of worked. The epicylers predicted the planets' locations, the
moon's phases, when stars rose and set, and even some lunar and solar
eclipses. Ptolemaic calculations lacked modern precision but they were
good enough for naked-eye astronomers. When astronomers switched to
telescopes it quickly became apparent to anyone that cared to look that
Ptolemy's system was off and needed fixing. Kepler, Newton, and others
provided the fix and the new celestial regime was *demonstrably better*
than Ptolemy's, and, as a bonus, Newtonian gravity finally offered deep
reasons for why orbits took observed shapes.

This all happened centuries after Copernicus, and because his
heliocentric model was essentially correct, people have forgotten that
Copernicus Version 1.0 made crappy predictions. The first iterations of
the heliocentric model did not match the accuracy of the hidebound
doctrinaire old fart Ptolemaic system; this is what fueled resistance
to the new model. Far from being morons, the Ptolemians were just being
good skeptical philosophers. Sun-centered models were not new even in
the 15^th^ century. Aristarchus speculated about them around 200 BCE,
and I'd bet big bucks the idea was old even then. Sun-centered models
did not immediately catch on because *theories must pay their way.* A nice
idea that doesn't feed you, (I'm looking at you Multiverse, and you too
String Theory), will be tossed aside for ones that do! Ptolemaic
astronomy endured because it paid the bills and fed the hungry.
Copernicus Version 1.0 did not.

All of this was driven home by my recent development of a [J script
`riseset`](https://github.com/bakerjd99/jackshacks/blob/main/riseset.ijs)
for calculating when officially named [International Astronomical
Union](https://www.iau.org/) stars (IAU) culminate in my backyard. The
script is available on GitHub and can be installed and run on current J
systems with:

~~~~J
load 'pacman'
NB. files from https://github.com/bakerjd99/jackshacks
install 'github:bakerjd99/jackshacks'

load '~addons/jacks/riseset.ijs'
location_yellowstone 0
NB. IAU stars rising/setting over Old Faithful
fmt_today iau_today 0
~~~~

Most of the algorithms in `riseset` derive from Jean Meeus's book
[*Astronomical
Algorithms*](https://archive.org/details/astronomicalalgorithmsjeanmeeus1991)
with supplementary material from [Jay
Tanner](https://neoprogrammics.com/nutations/) and [NASA's eclipse
site](https://eclipse.gsfc.nasa.gov/SEhelp/deltatpoly2004.html). If you
peruse the code or browse the source books you will quickly see that
modern astronomical calculations are complicated and require constant
tweaking --- just like the old Ptolemaic system. The algorithms in Meeus
will need updating every century or so and it is the update process that
distinguishes modern calculations from the Ptolemaic system. Modern
calculations are based on solving *n-body* celestial mechanics problems.
The resulting, mostly series solutions, form the basis of working
algorithms like Tanner's [nutation
programs](https://neoprogrammics.com/nutations/). *N-body* problems are
grounded in gravitational theories and there was nothing like them in
Ptolemy, but from the perspective of a backyard amateur astronomer
rolling his own code, the differences between modern and Ptolemaic
calculations seem moot. While working out `riseset` I acquired a new
respect and sympathy for the ancient epicyclers. They carried out decent
approximations, without computers, or even place value arithmetic, and
came up with answers that almost matched what they saw. Not exactly the
work of morons.
