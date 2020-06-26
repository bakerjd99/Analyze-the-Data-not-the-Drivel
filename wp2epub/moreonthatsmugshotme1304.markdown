 
[More on that SmugShot Metadata Mess](https://bakerjd99.wordpress.com/2011/04/20/more-on-that-smugshot-metadata-mess/)
---------------------------------------------------------------------------------------------------------------------

*Posted: 21 Apr 2011 00:06:49*

A few days after posting a [J
script](https://www.box.net/shared/qlp4999qre) that fixes
[EXIF](https://www.exif.org/) timestamps in
[SmugShot](https://www.smugmug.com/iphone/smugshot/) images SmugMug
changed the filename assigned to downloaded SmugShot images. Originally
the layout was:

***SmugMugID*\_smugshot\_*SmugShotID*.jpg**

This layout was inconsistent with the way SmugMug normally handles
files. Default SmugMug behavior is to **leave filenames unchanged**.
This contrasts with other photo sites, ([you know who you
are](https://www.flickr.com/)), *that rename your sacred files to suit
their indexing schemes.* A few days ago SmugMug corrected this
discrepancy and downloaded SmugShot images reverted to their original
format:

**smugshot\_*SmugShotID*.jpg**

This fix broke `smugshotexif`: see: [my previous
post](https://bakerjd99.wordpress.com/2011/04/03/smugshot-metadata-mess/).
I have modified
[`SmugShotFix.ijs`](https://www.box.net/shared/qlp4999qre) to handle the
current format and the older one. I will keep tweaking this hack until
SmugShot’s sloppy EXIF handling is corrected.
