 
[SmugShot Metadata Mess](https://bakerjd99.wordpress.com/2011/04/03/smugshot-metadata-mess/)
-------------------------------------------------------------------------------------------

*Posted: 03 Apr 2011 17:53:02*

While languishing in a series of hospitals and rehab centers [recovering
from a bad
fall](https://bakerjd99.wordpress.com/2011/02/25/a-walk-in-the-park/) I
have been amusing myself by taking iPhone pictures and posting them to
SmugMug with
[SmugShot.](https://itunes.apple.com/us/app/smugshot/id284129416?mt=8)

SmugShot is a nifty little iPhone app that uploads iPhone pictures and
videos directly to [your SmugMug
galleries](https://conceptcontrol.smugmug.com/Themes/Diaries/SmugShots/16038397\_4tPwa).
SmugShot is a freebie so I cannot, in good faith, whine about missing
features but **SmugShot has one serious deficiency: it strips
[EXIF](https://graphicssoft.about.com/od/glossary/g/exif.htm)
timestamps.** Native iPhone jpegs contain EXIF timestamps but after
passing through SmugShot only GPS information survives. *I am not sure
if this is by design or oversight but I don’t like it!*

The fix is straight forward:

1.  Download SmugMug metadata.

2.  Download all SmugShot pictures.

3.  Match pictures with metadata and use upload timestamps as date taken
    EXIF timestamps.

4.  Finally replace the uploaded SmugShot images with the EXIF repaired
    versions.

Simple but tedious. The following J word manipulates Phil Harvey’s
[superb command line utility
exiftool](https://www.sno.phy.queensu.ca/~phil/exiftool/) to cleanup the
SmugShot metadata mess. The words used by `smugshotexif` are in the J
script [`SmugShotFix.ijs`](https://www.box.net/shared/qlp4999qre). You
can also find this script in the J files sidebar of this blog. Look in
the J Scripts directory. Let’s hope the next version of SmugShot fixes
the date time issue and hacks like this will no longer be necessary.

```J
smugshotexif=:4 : 0

NB.*smugshotexif v--  inserts missing EXIF  metadata  in SmugShot
NB. iPhone uploads.
NB.
NB. The  iPhone  SmugShot  app  removes  EXIF  information during
NB. upload. This verb restores items I care about.
NB.
NB. dyad:  btclSmugMetaData smugshotexif clPathFile
NB.
NB.   NB. update TAB delimited SmugMug metadata tables
NB.   SmugTablesFrXml2 'c:\pd\docs\smugmug\data\smugheavy.xml'
NB.
NB.   NB. load SmugShot specific metadata
NB.   SMUGSHOTMD=: readsmugshots 0
NB.
NB.   img=: 'c:\pictures\2011\Missouri\wip\1204618219_smugshot_9811805.jpg'
NB.   SMUGSHOTMD smugshotexif img
NB.
NB.   NB. fix all jpg files in a directory
NB.   (<SMUGSHOTMD) smugshotexif&> 1 dir 'c:\pictures\2011\Missouri\wip\*.jpg'

NB. extract SmugMug id from SmugShot file name
spid=. <extractsmugid y

NB. all smugshot pids
pids=. x {"1~ (0{x) i. <'PID'

if. spid e. pids do.

  NB. metadata exists for image insert items
  pos=. pids i. spid

  exif=. setartistcopyright y

  NB. use upload date for the missing original datetime
  date=. ;pos { x {"1~ (0{x) i. <'UPLOADDATE'
  date=. '-:' charsub date
  exif=. date setdate y

  caption=. ;pos { x {"1~ (0{x) i. <'CAPTION'
  exif=. caption setdescription y

  lb=. pos { x {"1~ (0{x) i. ;:'LATITUDE LONGITUDE'
  if. *./ 0 < #&> lb do.
	lb=. _999&". &> lb
	exif=. lb setlatlng y
  end.

  NB. rename as iphone file with original smugshot number
  NB. format path chars for windows rename
  newname=. '.jpg'&beforelaststr y
  newname=. 'iphone ',('_'&afterlaststr) @:(' [s'&beforelaststr) newname
  shell '/\' charsub 'rename ' , ; ' ' ,&.> dblquote y;newname,'.jpg'

  newname ; exif
else.
  'No SmugShot metadata for';spid
end.
)
```