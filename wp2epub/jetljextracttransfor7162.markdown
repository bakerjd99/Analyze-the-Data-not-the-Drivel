
[JETL - J Extract Transform and Load](https://analyzethedatanotthedrivel.org/2021/08/11/jetl-j-extract-transform-and-load/)
---------------------------------------------------------------------------------------------------------------------------

*Posted: 11 Aug 2021 21:02:55*

I have been surreptitiously using the [J programming
language](https://code.jsoftware.com/wiki/NuVoc) on the job for many
years. With rare exceptions, I haven\'t advertised my clandestine use of
J simply because it\'s strange and scary and nonstandard, and IT
departments are filled with cowardly little bedwetters that run away
like [Brave Sir Robin](https://www.youtube.com/watch?v=BZwuTo7zKM8) when
confronted with something really different! At first, I tried to
convince the bedwetters that J is a fabulous tool: a spear in a world of
bent spoons! But, if you\'ve ever tried convincing an *academic Marxist*
that, yes [\"communism has been
tried\"](https://www.quora.com/Why-do-communists-insist-that-real-communism-has-never-been-tried?share=1),
or a UFO-olgist that funny lights in the sky are almost certainly not
aliens, or a 9-11 *troofer* that the twin towers were *absolutely not
brought down by controlled demolition*, then you have a pretty good idea
what it\'s like getting IT departments to buy into unsanctioned
technologies.

It\'s sad, but some of the most pig-headed and closed-minded people I
have ever run into are fellow programmers and IT professionals. As a
*self-anointed* elite, ITites (IT people), can be insufferably sure of
themselves. Hubris is still very much a thing! *As a general rule,
always consider the possibility that you are full of it!*

With that said, what\'s so great about J and why should anyone use it
for database [ETL](https://www.ibm.com/cloud/learn/etl) (Extract
Transform and Load) jobs?

#### ETL unavoidable grunt work and an IT Achilles heel

ETL jobs are never glamorous! You\'re not going to win any [Turing
Awards](https://amturing.acm.org/) for converting dumpster-fire data
into well-structured database tables. Nor will you garner accolades and
[\"We are not worthies\"](https://www.youtube.com/watch?v=jjaqrPpdQYc)
from peers. Most ITites simply assume the ETL will be done while they
dream of all the shiny things the polished data will enable. *Precisely
because ETL is dull, any moron can do it, grunt work, it\'s frequently
discounted.* I\'ve watched many IT projects sink after being torpedoed
by incomplete and crappy ETL. ETL is an IT Achilles heel; it can and has
brought the mighty down.

Standard ETL jobs always consist of odd combinations of:

1. Gather data in all its unstructured messy glory.
2. Pick and choose the [good
    bits](https://www.youtube.com/watch?v=wPiHQ37gXnE).
3. Hack and standardize your selection into rows and tables.
4. Load the tables into mostly SQL databases.
5. Finish the job with SQL transformations.

Every single item on this list can drain your [precious bodily
fluids](https://www.youtube.com/watch?v=N1KvgtEnABY).

This is where J can help!

#### Slay the Annoyances and Sack the Irritants with J

It\'s not an exaggeration to say that ETL is a long tiresome sequence of
annoyances and irritants. It\'s easy to see where you need to go, and
it\'s just *N*, where *N* is an arbitrarily large number of picayune and
irritating steps between you and the pure database of your dreams.

Anything you can do to quickly slay the annoyances and sack the
irritants will move you closer to your dream. The last thing you want is
to write a lot of code to dispatch trivialities, but sadly, this is
often the fate of ETL programmers. Like Sisyphus, they laboriously push
one damn rock up the hill only to watch another roll down and take its
place. When it comes to moving rocks, you want a bulldozer, not a garden
spade. J is a bulldozer!

You can install Windows, MacOS or Linux versions of J from
[jsoftware.com](https://www.jsoftware.com/#/). Install J with all the
[standard addons](https://code.jsoftware.com/wiki/Pacman).

Let\'s take the J bulldozer for a spin.

#### Pimping your J bulldozer with JOD

J scripts are simple ASCII text files with an `.ijs` file extension.
Edit them with any standard editor. Two of J\'s standard development
environments [JQT](https://code.jsoftware.com/wiki/Guides/Qt_IDE) and
[JHS](https://code.jsoftware.com/wiki/Guides/JHS) have built-in editors
that provide expected goodies like syntax highlighting. Many editor
extensions provide J syntax highlighting. One of my favorites is the *J
Language Support* Visual Studio Code extension. It can be found in
[GitHub here](https://github.com/tikkanz/j-vscode) and installed from
the standard Visual Studio Code Marketplace.

Despite the ubiquity of J oriented text editors and script handling
tools I store all my J code, test cases, and documentation in a coding
tool I developed called JOD. [JOD is a refactoring
tool](https://bakerjd99.files.wordpress.com/2020/11/jod.pdf). It lets
you easily reuse J words in arbitrary contexts without error-prone
*cut-and-pasting* or rampant *over-inclusion*. I use JOD from three J
environments, jconsole, JHS, and JQT. [JOD is one of many J
addons](https://code.jsoftware.com/wiki/Addons/general/jod). It can be
installed with the [J pacman
utility](https://code.jsoftware.com/wiki/Pacman). JOD has been entirely
programmed in J and is a good example of using J to build larger
systems. [JOD source code is on
Github](https://github.com/bakerjd99/jod). See [The JOD
Page](https://analyzethedatanotthedrivel.org/the-jod-page/) for more
about JOD.

In the following examples I am going to assume JOD is installed and the
utilities *dictionary* `utils` is available. The latest version of
`utils` is on [GitHub here](https://github.com/bakerjd99/joddumps).

```J
load 'general/jod'
get 'portchars' [ od 'utils' [ 3 od ''
NB. use ASCII box characters - simplifies blog formatting
portchars 0
```

#### Start your JETL engine

Let\'s slay some annoyances.

**Annoyance \#1:** For reasons best not discussed in civil society, many
websites, point-of-sale systems, spreadsheets, and so forth encourage
users to compose not-so-great novels in text entry fields. When these
\"novels\" land in data feeds you see crap like this:

```J
textfield =: 0 : 0
  Leading and trailing
       white     space, tabs,
 line    feeds,
and bytes @*!!
      of crap.
)
```

It\'s easy to fix crap once its loaded into a SQL table but it\'s crap
like this that get\'s in the way of loading the table in the first
place. The following J expression cleans `textfield`.

```J
(] #~ [: -. '  '&E.) textfield -. CRLF,TAB,'@#*!'
```

     Leading and trailing white space, tabs, line feeds, and bytes of crap.

The `utils` dictionary contains many character list verbs.

```J
get ;:'reb allwhitetrim'
allwhitetrim reb textfield -. CRLF,TAB,'@#*!'
```

    Leading and trailing white space, tabs, line feeds, and bytes of crap.

**Annoyance \#2:** Here\'s another way too common
[*Excel*](https://www.spreadsheetsmadeeasy.com/understanding-csv-files-in-excel/)
enabled irritant.

```J
quotecomma=: 0 : 0
"how often",1,2,"have quoted , commas","screwed ,,, line parsing?"
)
```

```J
getrx 'parsecsv'  NB. load parsecsv and words it calls
',' parsecsv quotecomma
```

    +-----------+-+-+----------------------+---------------------------+
    |"how often"|1|2|"have quoted , commas"|"screwed ,,, line parsing?"|
    +-----------+-+-+----------------------+---------------------------+

For example this 63MB `csv` file contains dreaded commas in quotes.

```J
smoutput dir '\\jfsdev04\Shares\SwiftIQPreprocess\SwiftZipCsv\Item*.csv'
smoutput fi=: ;1 dir '\\jfsdev04\Shares\SwiftIQPreprocess\SwiftZipCsv\Item*.csv'
```

    ItemSales-0810202163523.csv    63958716 10-Aug-21 18:37:42
    //jfsdev04/Shares/SwiftIQPreprocess/SwiftZipCsv/ItemSales-0810202163523.csv

A simple J *verb* can flip the offenders to semi-colons.

```J
getrx ;:'repdqchars read'
#txt=: ',;' repdqchars read fi NB. flip commas - return byte count
```

    63958716

Here\'s the definition of `repdqchars`.

```J
repdqchars=:4 : 0

NB.*repdqchars v-- replace double quoted (0{x) characters with (1{x).
NB.
NB. dyad:  cl =. clPair repdqchars cl
NB.
NB.   s=. '"go ahead, replace","quoted commas,,,,"'
NB.   ',;' repdqchars s
NB.   s -: ',,' repdqchars s

if. 2 <: #y do.
  msg=. 'unbalanced quotes'
  msg assert 0 = 2 | +/b=. '"'=y

  NB. mask of quoted characters
  q=. +/\ _1 (1 { |: _2 ]\ I. b)} b
  msg assert 0 1 -: (<./ , >./) q

  NB. replace quoted (0{x) with (1{x)
  (1{x) (I. q #^:_1 (0{x) = q#y) } y
else.
  y
end.
)
```

Much of `repdqchars` consists of comments and assertions. Not having to
write a lot of code is a big plus when slaying annoyances and sacking
irritants.

**Annoyance \#3:** When defining database tables, it helps to understand
how data is distributed \-\-- *duh!* Before creating tables, it\'s
helpful to run quick-and-dirty analyses. One useful summary is *column
cardinality*, the number of unique column items.

```J
NB. read and parse TAB delimited text - first row column names
get 'readtd2'
f=: '\\jfsdev04\Shares\DailyXMLPreprocess\DailyTsv\raw_RetailItemGroup_RMI.txt'
d=: readtd2 f
NB. compute column cardinalities
smoutput 'row count: ',":#d
(>0{d) ;~ ,. #@~.&> <"1 |: }. d
```

    row count: 68604
    +-----+------------------------+
    | 2975|retailItemGrpID         |
    | 2784|retailItemGrpName       |
    |  316|retailItemGrpDescription|
    |  283|orgUnitOwnerID          |
    |22260|rmiID                   |
    |21930|rmiName                 |
    |  255|rmiExtID                |
    |    1|ZipFileName             |
    |    1|ZipRunNumber            |
    |    1|XMLFileName             |
    |    1|XMLFileDate             |
    |    1|CreateDatetime          |
    +-----+------------------------+

J is hardly unique in its ability to subdue ETL irritants. I\'ve
personally used Python, Powershell, and SQL scripts as well but for me J
administers the biggest bang per byte! **Adding J to your coding arsenal
will make you a more versatile programmer and a better person. Do it!**

#### The Joys of JOD and other code databases

One of the many advantages of storing code in tools like JOD is that
it\'s easy to run ad hoc code analysis.

```J
load 'general/jod'
od ;:'jacksons utils' [ 3 od '' NB. open JOD dictionaries
```

    +-+-----------------+--------+-----+
    |1|opened (rw/ro) ->|jacksons|utils|
    +-+-----------------+--------+-----+

Here\'s some basic information about the JOD group `swiftprep`. J scripts are easily generated from
groups with JOD\'s `mls`, (make load script) verb.

```J
smoutput (":#}. grp 'swiftprep'),': words in script'
smoutput (":#;{:2 mls 'swiftprep'),': size of commented script'
smoutput (":#;{:compj }.2 grp 'swiftprep'),': size of minimized script'
NB. a single static "noun" of tables and column names
tcl=: (}.2 grp 'swiftprep') -. <'SwiftLandTableHeaders'
smoutput (":#;{:compj tcl),': minimized script without largest noun'
smoutput (":(+/ % #);1{0 15 get }. grp 'swiftprep'),': mean bytes per word'
smoutput (":#;: ;1{2 mls 'swiftprep'),': total commented J token count'
```

    106: words in script
    42221: size of commented script
    23403: size of minimized script
    16492: minimized script without largest noun
    529.91509: mean bytes per word
    5945: total commented J token count

As you can see there isn\'t a lot of code, roughly 17K.

As nice as off-the-cuff code statistics are, the biggest advantage of
code databases is how they simplify code recycling and document
generation. The ETL `swiftprep` group currently contains 106 J words. 69
of those words are specific to `swiftprep`. The rest are common
utilities and recycled words. When `swiftprep.ijs` is generated with
JOD\'s `mls` verb all of `swiftprep`\'s words are collected into a
single stand-alone script. For such stand-alone scripts, I include an
*interface noun* that lists group words you
should be aware of.

```J
get 'IFACEWORDSswiftprep'
hlpnl IFACEWORDSswiftprep
```

    +-------------------+-------------------------------------------------------+
    |dailyswift         |daily SwiftIQ zip loading and maintenance tasks        |
    |fullheaderscan     |scan SwiftIQ zips and build complete table headers     |
    |loadswiftcsvs      |copies zip to working directory and extracts csvs      |
    |loadswifttabs      |convert SwiftIQ csvs to TAB delimited table files      |
    |procqueuezips      |processes queued zips from file                        |
    |procswiftzip       |process a SwiftIQ zip                                  |
    |queueswiftSizes    |file sizes: queueswiftSizes SwiftAuxDir,'swift2.txt'   |
    |queueswiftZips     |write (y) line file of queued zips                     |
    |runswiftssis       |runs SwiftIQ SSIS batch scripts                        |
    |showswiftUnload    |list never loaded zips in load order                   |
    |showswiftlog       |show SwiftIQ log entries                               |
    |swiftLoaded        |loaded swift zips with return code: swiftLoaded '<1000'|
    |swiftMissingColumns|list missing SwiftIQ landing table columns             |
    |swiftZips          |sorted SwiftIQ zip files                               |
    +-------------------+-------------------------------------------------------+

Finally, code databases typically contain far more than code!
Documentation is also stored. Stored documentation can be used to
generate [*literate
programming*](https://en.wikipedia.org/wiki/Literate_programming)
documents. In JOD\'s case
[jodliterate](https://analyzethedatanotthedrivel.org/2020/05/25/using-jodliterate/)
applied to `swiftprep` creates this [indexed and annoted
PDF](https://bakerjd99.files.wordpress.com/2021/08/swiftprep.pdf).
Enjoy!

#### Let J tell SSIS where to get off

I hope I\'ve convinced you that J can help with ETL irritants. It can
help, but it cannot do the entire job. At some point you will have to
bring in tools like
[bcp](https://docs.microsoft.com/en-us/sql/tools/bcp-utility?view=sql-server-ver15),
[SSIS](https://docs.microsoft.com/en-us/sql/integration-services/sql-server-integration-services?view=sql-server-ver15)
or [Talend](https://www.talend.com/). SSIS and Talend are typically the
drivers of ETL processes; they call other specialized tools as needed,
but I\'ve found that it\'s easier to use scripting tools like J as
drivers. In this blog post I outline how easy it is to [control SSIS
with
Python](https://analyzethedatanotthedrivel.org/2021/06/05/running-ssis-packages-with-python/).
You can use the same trick with J.

The `swiftprep` ETL script does:

1.  Finds a large daily FTP\'ed zip file containing CSVs.
2.  Unzips the CSVSs to working directories.
3.  Converts unruly CSVs to standard TAB delimited text files.
4.  Runs an SSIS package to load TAB files to SQLServer staging tables.
5.  Runs another SSIS package to transform staging tables to a reporting
    tables.

This reads worse than it is. The main jumping off word in `swiftprep` is
`dailyswift`. Here\'s `dailyswift`:

```J
dailyswift=:3 : 0

NB.*dailyswift v-- daily SwiftIQ zip loading and maintenance tasks.
NB.
NB. monad:  (ilRc ; clGuid) =. dailyswift uuIgnore
NB. dyad:  (ilRc ; clGuid) =. iaDayCode dailyswift uuIgnore
NB.
NB.   _1 dailyswift 0  NB. update stage only
NB.   dailyswift~ _1
NB.
NB.   NB. full table reload
NB.   42 dailyswift 0

(weekday 3 {. 6!:0 '') dailyswift y
:
NB. stage latest zip
'rc tg'=. procswiftzip ;0{swiftZips 0
if. 0~:0{rc do. rc;tg return. end.

if. _1=x do.
  rc=. SwiftLog 'only updating staging'
else.
  rcnts=. cntswiftrows 0  NB. report/stage item counts

  NB. update reporting
  rc=. logswiftReportBegin tg;rcnts
  if. 0=x do.
    SwiftLog 'rowcnts::pidx: ',rcnts
    SwiftLog 'reindexing - partial table update'
    rc=. runswiftssis 'swiftreindex.bat'
    rc=. runswiftssis 'swiftreport.bat'

  elseif. 42=x do.
    NB. full updates are best babysat - trigger with
    NB. code 42 - life the universe and everything
    SwiftLog 'rowcnts::full: ',rcnts
    SwiftLog 'full table refresh'
    rc=. runswiftssis 'swiftreportfull.bat'

  elseif.do.
    SwiftLog 'rowcnts:: ',rcnts
    SwiftLog 'partial table update'
    rc=. runswiftssis 'swiftreport.bat'
  end.
  rc=. logswiftReportEnd rc;tg
end.
)
```

Maybe I\'m an old jaded programmer, but `dailyswift` doesn\'t look very
scary. Obfuscated J can be phenomenally impenetrable. Look at the
definition of `readtd2`. Sadly, it\'s easy to create unreadable code in
any programming language. If program code was edited like novel
manuscripts, we\'d seldom see incomprehensible
crap but it isn\'t, so we must exercise
personal discretion. ***My goal when coding is to make things so clear
that that they\'re dismissed as trivial!*** And, let\'s face it, ETL, as
tedious and time-consuming as it typically is, is trivial!