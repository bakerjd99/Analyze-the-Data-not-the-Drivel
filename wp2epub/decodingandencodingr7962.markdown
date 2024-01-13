
[Decoding and Encoding RSV Files with J](http://analyzethedatanotthedrivel.org/2024/01/12/decoding-and-encoding-rsv-files-with-j/)
----------------------------------------------------------------------------------------------------------------------------------

*Posted: 12 Jan 2024 22:36:44*

Another year has come and gone, and my failures continue to accumulate.
I'll stop failing when I'm dead. For the nonce, I will stew in my abyss
of hubris, biting off more than I can ever hope to chew. But there will
be plenty of time for self-abasement later (at least if my health
holds). Today, I am commenting on an interesting little YouTube video
that [*the
algorithm*](https://www.technologyreview.com/2022/09/20/1059709/youtube-algorithm-recommendations/)
shoved in my face.

You can peruse the video by clicking on [RSV Rows of String
Values](https://www.youtube.com/watch?v=tb_70o6ohMA). The author
([Stenway](https://github.com/Stenway)) introduces another standard data
format. He knows that advocates of new standards often run afoul of the
[XKCD curse](https://xkcd.com/927/).

Usually, I would ignore such things, at least until I can no longer
ignore them. But what caught my attention was his solution to the
*[dreaded delimiter collision](https://en.wikipedia.org/wiki/Delimiter)*
problem. Data formats like
[CSV](https://en.wikipedia.org/wiki/Comma-separated_values) have long
suffered from delimiter collisions. I use the TSV (TAB-separated values)
format to *reduce* delimiter collisions. For humdrum data, TAB
collisions are less frequent than COMMA collisions. Sadly, less frequent
means collisions still occur, and when they do, your little parser must
run down the n^th^ layered Hell of escape characters rabbit hole.
Wouldn't it be nice if delimiter collisions could be completely
side-stepped?

The RSV format exploits a feature of UTF8 encodings to eliminate
delimiter collisions for UTF8 encoded string values. Until I watched
[RSV Rows of String
Values](https://www.youtube.com/watch?v=tb_70o6ohMA), I was unaware that
UTF8 encoders should not emit specific bytes.
[Stenway](https://github.com/Stenway) notes that proper UTF8 encoders
should never emit these bytes.

~~~~
  Binary     Hex   Decimal
  ---------- ----- ---------
  11111111   FF    255
  11111110   FE    254
  11111101   FD    253
  11111100   FC    252
  11111011   FB    251
  11111010   FA    250
  11111001   F9    249
  11111000   F8    248
~~~~

If you are content to pass UTF8 strings around, you can delimit them
with any of these bytes without collisions. This is precisely what the
RSV format does. RSV uses the three bytes.

~~~~
  Name    Hex   Decimal
  ------- ----- ---------
  REOV    FF    255
  RNULL   FE    254
  REOR    FD    253
~~~~


Even better, the bytes are value *terminators*, which makes RSV easy to
parse in J with the [cut
conjunction](https://code.jsoftware.com/wiki/Vocabulary/semidot)
`<;._2`. The following J verbs encode and decode RSV: two lines of J
code suffice.

~~~~J
NB. decode RSV bytes.
rsvdec=:  {{]`(NULLMARK"_)@.((,RNULL)&-:)L:0 <;._2&.> <;._2 y}}

NB. encode RSV bytes
rsvenc=: {{(0=#y)}. ;,&REOR&.> ;&.> REOV -.&.>~ ,&REOV L: 0 (]`(RNULL"_))@.(NULLMARK&-:) L: 0 y}}
~~~~

I have added
[rsv.ijs](https://github.com/bakerjd99/jackshacks/blob/main/rsv.ijs) to
my collection of [JACKSHACKS](https://github.com/bakerjd99/jackshacks) J
addons. You can install the addons on your own J system with:

~~~~J
NB. J package manager
load 'pacman'

NB. files from https://github.com/bakerjd99/jackshacks
install 'github:bakerjd/jackshacks'
dir '~addons/jacks'

NB. load script
load '~addons/jacks/rsv.ijs'
~~~~

Enjoy the hack!
