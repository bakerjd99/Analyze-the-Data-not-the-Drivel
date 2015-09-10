[More on SmugMug
Duplicates](http://bakerjd99.wordpress.com/2010/02/11/more-on-smugmug-duplicates/)
---------------------------------------------------------------------------------------------------

*Posted: 11 Feb 2010 20:22:13*

In my previous post I described a method for eliminating duplicate
[SmugMug](http://www.smugmug.com/) images based on MD5’s. This method
does not get all the duplicates.

If you uploaded the same image to different galleries, at different
times, the SmugMug MD5’s may differ. I don’t know what SmugMug rolls
into their MD5 \`s but I suspect it’s more than image data.

*To get all the copies you must remove duplicate picture ids , file
names and MD5’s.* Furthermore, to maintain a pure duplicate free state,
you need to check these items often. Now, after uploading or rearranging
pictures, I update my [SmugMug
metadata](http://bakerjd99.wordpress.com/2010/02/03/command-line-c-smugmug-api-metadata-download/) and
execute this [J verb](http://www.jsoftware.com/) to insure I don’t
introduce duplicates.

    CheckSmugDups=:3 : 0

    NB.*CheckSmugDups v-- checks duplicate SmugMug images.
    NB.
    NB. monad:  CheckSmugDups uuIgnore

    'albums images'=. readsmugtables 0
    images=. }. images [ imhead=. 0 { images

    NB. images should be unique in three ways:
    r=. ,: 'PID unique: '; # ~.(imhead i. <'PID') {"1 images
    r=. r, 'MD5 unique: '; # ~.(imhead i. <'MD5') {"1 images
    r=. r, 'FILENAME unique: '; # ~.(imhead i. <'FILENAME') {"1 images

    if. 1 <# ~. ;{:"1 r do. smoutput 'duplicates present' end.
    r
    )
