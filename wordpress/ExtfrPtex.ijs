NB.*ExtfrPtex s-- process LaTeX blog post files marked for extract.
NB.
NB. verbatim:
NB.
NB. interface word(s): 
NB. ------------------------------------------------------------------------------                                 
NB.  CleanExtract     - cleanup temp latex files
NB.  CompExtractLatex - process extract files
NB.  PrepExtractLatex - prepare single post extract LaTeX
NB.
NB. created: 2023Jan04
NB. ------------------------------------------------------------------------------ 

require 'task'

coclass 'ExtfrPtex'
NB.*end-header

NB. string marking post name in bat template
BatPostMark=:'--[post-name]--'

NB. interface words (IFACEWORDSExtfrPtex) group
IFACEWORDSExtfrPtex=:<;._1 ' CleanExtract CompExtractLatex PrepExtractLatex'

NB. line feed character
LF=:10{a.

NB. string marking git url in branding preamble template
PostGitMark=:'--[post-github]--'

NB. string marking sha256 hash in branding preamble template
PostHashMark=:'--[post-sha256]--'

NB. comment LaTeX string marking start of extract post
PostHeadMark=:'%\input{bmpostextract.tex} %extract-single-post::'

NB. comment LaTeX string marking end of extract post
PostTailMark=:'%\end{document} %extract-single-post::'

NB. GitHub url prefix for blog LaTeX
PostUrlHead=:'https://github.com/bakerjd99/Analyze-the-Data-not-the-Drivel/tree/master/wp2latex/'

NB. root words (ROOTWORDSExtfrPtex) group      
ROOTWORDSExtfrPtex=:<;._1 ' CleanExtract CompExtractLatex IFACEWORDSExtfrPtex PrepExtractLatex ROOTWORDSExtfrPtex VMDExtfrPtex showpass'

NB. version, make count and date
VMDExtfrPtex=:'0.0.0';8;'05 Jan 2023 15:16:48'


CleanExtract=:3 : 0

NB.*CleanExtract v-- cleanup temp latex files.
NB.
NB. monad:  CleanExtract uuIgnore

wfmsg=. 'missing file -> '
texpath=. jpath '~BLOGTEX/' 

if. -.fexist bat=. texpath,'0bflush.bat' do. wfmsg,bat return. end.

NB. j profile !(*)=. shell
0 0$shell bat
ferase (<texpath) ,&.> 'bmpostextract.tex';'0abmextract.bat'
)


CompExtractLatex=:3 : 0

NB.*CompExtractLatex v-- process extract files.
NB.
NB. monad:  clMsg =. CompExtractLatex clPostlatex
NB.
NB.   NB. post file without extension
NB.   ComptExtractLatex 'numpyanotheriversong5565'

wfmsg=. 'missing file -> '
texpath=. jpath '~BLOGTEX/' 

NB. check bat 
if. -.fexist bat=. texpath,'0abmextract.bat' do. wfmsg,bat return. end.

NB. clear any prior pdf
ferase ppdf=. texpath,y,'.pdf'

NB. compile prepared files !(*)=. shell
cmsg=. _250 {. shell bat

NB. check pdf
if. -.fexist ppdf do. wfmsg,ppdf return. end.

NB. reset tex file
ptex=. texpath,y,'.tex'
tex=. (;MPostPairOff&.> PostHeadMark;PostTailMark) changestr read ptex
tex write ptex

'extract generated -> ',ppdf,LF,cmsg
)

NB. converts decommented extract post to commented
MPostPairOff=:'@' , }. , '@' , ]

NB. converts commented extract post to uncommented
MPostPairOn=:'@' , ] , '@' , }.


PrepExtractLatex=:3 : 0

NB.*PrepExtractLatex v-- prepare single post extract LaTeX.
NB.
NB. Convert template text files to LaTeX for a particular post.
NB.
NB. monad:  blclFiles =. PrepExtractLatex clPostlatex
NB.
NB.   NB. post file without extension
NB.   PrepExtractLatex 'numpyanotheriversong5565'

wfmsg=. 'missing file -> '
wmmsg=. 'post not marked for extract -> '
texpath=. jpath '~BLOGTEX/' 

NB. templates and post must exist
if. -.fexist rext=. texpath,'0abmextract.txt'       do. wfmsg,rext
elseif. -.fexist lext=. texpath,'bmpostextract.txt' do. wfmsg,lext
elseif. -.fexist ptex=. texpath,y,'.tex'            do. wfmsg,ptex
elseif.do. tex=. read ptex
end.

NB. generate compile bat and brand tex 
batxt=. ('\',BatPostMark,'\',y) changestr read rext
batxt write bat=. texpath,(justfile@winpathsep rext),'.bat'

phash=. sha256 tex
pgit=.  PostUrlHead,y,'.tex'
brtxt=. ('@',PostHashMark,'@',phash,'@',PostGitMark,'@',pgit) changestr read lext
brtxt write brtex=. texpath,(justfile@winpathsep lext),'.tex'

NB. the post must be marked for extract
if. 1 ~: +./PostHeadMark E. tex      do. wmmsg,ptex
elseif. 1 ~: +./PostTailMark E. tex  do. wmmsg,ptex
elseif.do.
  NB. decomment post marks
  tex=. (;MPostPairOn&.> PostHeadMark;PostTailMark) changestr tex
  tex write ptex 
end.

NB. files with bat first
bat;brtex;ptex
)

NB. boxes open nouns
boxopen=:<^:(L. = 0:)


changestr=:4 : 0

NB.*changestr v-- replaces substrings - see long documentation.
NB.
NB. dyad:  clReps changestr cl
NB.
NB.   NB. first character delimits replacements
NB.   '/change/becomes/me/ehh' changestr 'blah blah ...'

pairs=. 2 {."(1) _2 [\ <;._1 x      NB. change table
cnt=._1 [ lim=. # pairs
while. lim > cnt=.>:cnt do.         NB. process each change pair
  't c'=. cnt { pairs               NB. /target/change
  if. +./b=. t E. y do.             NB. next if no target
    r=. I. b                        NB. target starts
    'l q'=. #&> cnt { pairs         NB. lengths
    p=. r + 0,+/\(<:# r)$ d=. q - l NB. change starts
    s=. * d                         NB. reduce < and > to =
    if. s = _1 do.
      b=. 1 #~ # b
      b=. ((l * # r)$ 1 0 #~ q,l-q) (,r +/ i. l)} b
      y=. b # y
      if. q = 0 do. continue. end.  NB. next for deletions
    elseif. s = 1 do.
      y=. y #~ >: d r} b            NB. first target char replicated
    end.
    y=.(c $~ q *# r) (,p +/i. q)} y  NB. insert replacements
  end.
end. y                              NB. altered string
)

NB. boxes UTF8 names
fboxname=:([: < 8 u: >) ::]

NB. erase files - cl | blcl of path file names
ferase=:1!:55 ::(_1:)@(fboxname&>)@boxopen

NB. 1 if file exists 0 otherwise
fexist=:1:@(1!:4) ::0:@(fboxname&>)@boxopen

NB. REFERENCE - standard z locale verb: jpath '~temp/'
jpath=:jpath_j_

NB. file name from fully qualified file names
justfile=:(] #~ [: -. [: +./\ '.'&=)@(] #~ [: -. [: +./\. e.&':\')

NB. reads a file as a list of bytes
read=:1!:1&(]`<@.(32&>@(3!:0)))

NB. sha-256 hash from bytes: sha256 'hash me again'
sha256=:3&(128!:6)

NB. show and then pass noun
showpass=:] [ 1!:2&2

NB. to windows \ character in paths
winpathsep=:'\'&(('/' I.@:= ])} )

NB. writes a list of bytes to file
write=:1!:2 ]`<@.(32&>@(3!:0))

NB.POST_ExtfrPtex post processor. 

smoutput IFACE=: (0 : 0)
NB. (ExtfrPtex) interface word(s): 20230105j151648
NB. ------------------------------
NB. CleanExtract      NB. cleanup temp latex files
NB. CompExtractLatex  NB. process extract files
NB. PrepExtractLatex  NB. prepare single post extract LaTeX
)

cocurrent 'base'
coinsert  'ExtfrPtex'

