NB.*BlogYearWords s-- estimates number of blog words written in a year.
NB.
NB. interface word(s): 
NB. ------------------------------------------------------------------------------
NB.  blogyearwords - estimates number of blog words written in a year                               
NB.
NB. created: 2023Jan09
NB. ------------------------------------------------------------------------------ 
NB. 23Jan09 group class created

coclass 'BlogYearWords'
NB.*end-header

NB. carriage return character
CR=:13{a.

NB. root EPUB from LaTeX directory
EPUBFRWPDIR=:'c:/pd/blog/wp2epub/'

NB. interface words (IFACEWORDSBlogYearWords) group
IFACEWORDSBlogYearWords=:,<'blogyearwords'

NB. line feed character
LF=:10{a.

NB. extension of markdown text files
MARKDOWNEXT=:'.markdown'

NB. root words (ROOTWORDSBlogYearWords) group      
ROOTWORDSBlogYearWords=:<;._1 ' IFACEWORDSBlogYearWords ROOTWORDSBlogYearWords VMDBlogYearWords blogyearwords'

NB. tab character
TAB=:a.{~9

NB. root LaTeX from WordPress XML directory
TEXFRWPDIR=:'c:/pd/blog/wp2latex/'

NB. main LaTeX root file
TEXROOTFILE=:'bm.tex'

NB. version, make count and date
VMDBlogYearWords=:'0.5.0';01;'09 Jan 2023 11:07:28'

NB. retains string after first occurrence of (x)
afterstr=:] }.~ #@[ + 1&(i.~)@([ E. ])

NB. signal with optional message
assert=:0 0"_ $ 13!:8^:((0: e. ])`(12"_))

NB. retains string before first occurrence of (x)
beforestr=:] {.~ 1&(i.~)@([ E. ])


blogyearwords=:3 : 0

NB.*blogyearwords v-- estimates number of blog words written in a
NB. year.
NB.
NB. A "word" is any  nonblank run  of characters in the  markdown
NB. version of a  post. Markdown is used  as  it is less  "taggy"
NB. than LaTeX. This count will be inflated as URLs, list  marks,
NB. and other items will be counted as words.
NB.
NB. monad:  btCntMd =. blogyearwords iaYear
NB.
NB.   blogyearwords 2022
NB.
NB.   NB. estimated blog words for entire time
NB.   bcnts=. (] ,.  (([: +/ [: ; 0 { "1 ])@blogyearwords)&>) 2009 + i. 15
NB.
NB.   NB. PDF page count estimate - 310 words per page
NB.   <. 310 %~ +/ 1 {"1 bcnts

NB. blog posts for given year
bm=. read TEXFRWPDIR,TEXROOTFILE
'bp ep'=. tags 'blogposts'

NB. posts by year
bm=. ep beforestr bp afterstr bm
bm=. ('\section*{' E. bm) <;.1 bm

NB. extract years
yr=. _1&".@('{'&afterstr@('}'&beforestr))&> bm
'no post(s) for year' assert y e. yr
bm=. ;bm {~ yr i. y

NB. markdown year posts
bm=. '{'&afterstr@('.'&beforestr)&.> ('\input{' E. bm) <;.1 bm
'missing markdown post(s)' assert fexist mf=. EPUBFRWPDIR&,&.> bm ,&.> <MARKDOWNEXT

NB. estimated post word counts
bm=. rebc@(' '&,@((CR,' ',LF,' ',TAB,' ')&charsub))&.> read&.> mf
(#&.> #;._1&.> bm) ,. mf
)

NB. boxes open nouns
boxopen=:<^:(L. = 0:)


charsub=:4 : 0

NB.*charsub v-- single character pair replacements.
NB.
NB. dyad:  clPairs charsub cu
NB.
NB.   '-_$ ' charsub '$123 -456 -789'

'f t'=. ((#x)$0 1)<@,&a./.x
t {~ f i. y
)

NB. boxes UTF8 names
fboxname=:([: < 8 u: >) ::]

NB. 1 if file exists 0 otherwise
fexist=:1:@(1!:4) ::0:@(fboxname&>)@boxopen

NB. reads a file as a list of bytes
read=:1!:1&(]`<@.(32&>@(3!:0)))

NB. removes multiple blanks (char only)
rebc=:] #~ [: -. '  '&E.

NB. xml BEGIN and END tags
tags=:'<'&,@,&'>' ; '</'&,@,&'>'

NB.POST_BlogYearWords post processor. 

smoutput IFACE=: (0 : 0)
NB. (BlogYearWords) interface word(s): 20230109j110728
NB. ----------------------------------
NB. blogyearwords  NB. estimates number of blog words written in a year
)

cocurrent 'base'
coinsert  'BlogYearWords'

