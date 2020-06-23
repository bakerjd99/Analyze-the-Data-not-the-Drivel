 
[The Return of APL Fingers](http://bakerjd99.wordpress.com/2010/11/12/the-return-of-apl-fingers-2/)
---------------------------------------------------------------------------------------------------

*Posted: 12 Nov 2010 03:34:29*

I am programming in
[APL](http://en.wikipedia.org/wiki/APL\_(programming\_language)) again
after a six-year hiatus. My APL fingers are rusty but it’s amazing how
deep muscle memory goes. I still know where all the beautiful APL
glyphs’ hide on standard keyboards. I’ve programmed in almost a dozen
programming languages but I maintain warm feelings for APL because I
lost my [coding
virginity](http://www.codesqueeze.com/the-ultimate-top-25-chuck-norris-the-programmer-jokes/)
to her.

APL was gentle: abstract, clean, austere and so intoxicatingly elegant.
I loved [Iverson
notation](http://en.wikipedia.org/wiki/Kenneth\_E.\_Iverson) and how it
manifested in what remains the most beautiful symbol set ever devised
for a programming language. Blinded by passion I overlooked APL’s faults
but as my ardor cooled I took notice of one glaring APL problem that
persists to this day. *Displaying, printing, emailing and now blogging
with APL is a pain!* Much has improved with the steady adoption of
Unicode but even today handling APL imposes burdens. For example,
without the [APL385 Unicode](http://www.vector.org.uk/?area=fonts) font
your browser will mangle the following APL characters.


            !*+-/<=>?\^|~¨¯×÷←↑→↓∆∇∊∘∨∩∪∵∼≠≡≢≤≥⊂⊃⊖⊢⊣⊤⊥⋄⌈⌊ 
            ⌶⌷⌹⌻⌽⌿⍀⍂⍇⍈⍉⍋⍎⍐⍒⍕⍗⍙⍝⍞⍟⍡⍢⍣⍤⍥⍨⍪⍫⍬⍱⍲⍳⍴⍵⍷⍸⍺⎕◊○


By the way, if you have not installed APL385 Unicode I highly recommend
downloading and installing it. You can get APL385 at
[Vector](http://www.vector.org.uk/?area=home). *Regrettably installing a
Unicode APL font will not fix all your APL character problems!* In
particular you cannot *reliably*:

1.  Copy and paste APL code between APL vendors or between APL and other
    languages.

2.  Typeset APL listings with ubiquitous LaTeX packages like
    [lstlisting](http://en.wikibooks.org/wiki/LaTeX/Packages/Listings).

3.  Post APL idioms on [Twitter](http://twitter.com/). Twitter’s 140
    character limit is not such a big deal for APL.

4.  Print on arbitrary network printers! It’s the 21^st^ century yet
    office printers are routinely limited by parochial IT policies to a
    small set of standard fonts.

APL’ers almost relish these irritants after all problem solving is what
APL’ers do! We don’t go crying to momma; we squash whatever is annoying
us and get on with deeper problems.

Currently I am dealing with how to display APL functions on WordPress.
WordPress supports a source code highlighting plug-in based on Alex
Gorbatchev’s excellent Javascript
[SyntaxHighlighter](http://alexgorbatchev.com/SyntaxHighlighter/). The
WordPress plug-in produces wonderful results for [well known languages
like
C\#](http://bakerjd99.wordpress.com/2010/05/28/a-c-net-class-for-calling-j/)
and by defining language specific Javascript classes you can highlight
languages like APL. [Eric
Lescasse](http://www.lescasse.com/UseAPLFromCSharpExample.aspx) has done
this for [APL+WIN](http://www.apl2000.com/) code so it is possible,
(given Unicode APL fonts), to render highlighted web friendly APL code.
Unfortunately WordPress does not support APL highlighting, (what a
surprise), and has banned user Javascript classes on their freebie
blogs. Apparently some programmers abuse JavaScript, (another surprise),
and
[uncontrolled](http://bakerjd99.wordpress.com/2010/06/11/the-real-problem-with-enterprise-software/)
Javascript’ing might endanger the WordPress business model.

This leaves the users of peculiar programming languages with a problem.
We can pester WordPress to support new languages or we can roll our own.
I am starting a campaign to get APL and J on WordPress’s list of
highlighted languages and while I am waiting for official support I will
roll my own. Fortunately, highlighting code for blogs is not difficult.
The much maligned MS Word (2007 and beyond) can crank out blog happy APL
provided you have [UTF-8](http://unicode.org/faq/utf\_bom.html) APL
Unicode text to format. Getting UTF-8’ed APL is the tricky bit. Some APL
systems like [Dyalog](http://www.dyalog.com/) directly support UTF-8 and
others are planning to do so. APL+WIN cannot spit out UTF-8 but it’s not
difficult to transform APL+WIN to UTF-8. The [APL
Wiki](http://aplwiki.com/AplToUnicodeII) contains some slick APL+WIN
functions to convert internal APL text to and from UTF-8.

To get a sense of why all this fuss is worthwhile consider the following
APL function taken from [Eugene
McDonnell’s](http://en.wikipedia.org/wiki/Eugene\_McDonnell) superb
essay [Life: Nasty, Brutish, and
Short](http://www.jsoftware.com/papers/eem/life.htm).


         ∇ z ← LifeKnuth ⍵;v
          v ← ⍵
          ⍵ ← ⍵ + (1 ⌽ ⍵) + ¯1 ⌽ ⍵
          ⍵ ← ⍵ + (1 ⊖ ⍵) + ¯1 ⊖ ⍵
          ⍵ ← ⍵ + ⍵ – v
          z ← ⍵ ∊ 5 6 7
         ∇


This little function is not the *shortest* APL Life function but in my
opinion it’s the clearest and most concise description of Life’s
generation rules out there. [Tool of
thought](http://www.jsoftware.com/papers/tot.htm) is not an empty APL
marketing slogan. It’s the real deal!
