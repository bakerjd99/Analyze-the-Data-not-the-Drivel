 
[Setting Good SmugMug Key Words](http://bakerjd99.wordpress.com/2010/02/17/setting-good-smugmug-key-words/)
-----------------------------------------------------------------------------------------------------------

*Posted: 17 Feb 2010 19:57:50*

Finding good key words is not easy. In many ways it is like creating a
good book index. Decent book indexes are carefully constructed by
*[human
readers](http://www.dailywritingtips.com/%E2%80%9Chuman-readers%E2%80%9D-a-tautology/)*
that understand what is being indexed and why certain terms *should be
included.* Superior indexes showcase the gems and bury the garbage.
There is a lot of mediocre software out there that purports to automate
this task but I remain unimpressed. Machine indexing is like machine
language translation: they both suffer from a lack of *real*
understanding. I was reminded of how difficult indexing is while writing
some code to update my [SmugMug](http://www.smugmug.com/) key words.

My first attempt at computing key words followed this recipe:

1.  Run my little [C\# SmugMug metadata
    dumper](http://bakerjd99.wordpress.com/2010/02/03/command-line-c-smugmug-api-metadata-download/)
    to update image metadata.

2.  Sift through the image metadata and extract all current key words.

3.  Remove [common English
    words](http://www.paulnoll.com/Books/Clear-English/English-3000-common-words.html)
    from current key words.

4.  Similarly, extract all image caption text and remove common English
    words.

5.  Sort the remaining caption text key words by frequency.

6.  Append the frequency sorted caption key words to corresponding
    current key words.

7.  Take at most seven words from the appended list as key words.

My thinking was high frequency *uncommon* English words would make good
keys. This is generally the case but the removal of common English words
from currently assigned keys was a big mistake.

I take care when naming image files. SmugMug picks up words in image
file names and uses them as default key words. If you have good file
names you will get useful keys automatically. Removing common English
words from file names deleted words that were present for good reasons.
For example: two common English words, “before” and “after,” are used in
the file names of image restorations like this picture I took in Cyprus
way back in 1968.

[Image link: Cyprus before and after](http://conceptcontrol.smugmug.com/Themes/Manipulations/Restorations-1/cyprus-castle-top-before-and/454566108_8VqWx-S.jpg)

I think “before” and “after” are perfectly good keys for this image.

To avoid such problems I now leave file name words intact and augment
these words with high frequency caption text words and print size keys
like: 4x5, 4x6, 5x7 and 8x10. Print size keys is another story. You can
view [my entire list of SmugMug
keys](http://conceptcontrol.smugmug.com/keyword/) here.
