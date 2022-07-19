
[Branding XMP Sidecar Files with J](https://analyzethedatanotthedrivel.org/2022/07/17/branding-xmp-sidecar-files-with-j/)
-------------------------------------------------------------------------------------------------------------------------

*Posted: 17 Jul 2022 22:41:32*

During my long and not-so-storied IT career I covertly dispatched
"irritants" with the [J programming
language](https://code.jsoftware.com/wiki/Main_Page). An irritant is an
annoying software problem that does not merit a full-blown project-style
approach. The last thing you want when dealing with irritants is to drag
in IT bureaucrats. You know of whom I speak: the niggling little
project-managing creatures that always turn little problems into bigger
problems. Do you remember "Agile" when it was actually Agile? Now that I
am *tentatively retired*[^7390x1] I no longer deal with IT bureaucrats but
irritants still abound and I still use J to dispatch them. In my next
three posts, I will show J solutions to some irritants that may be
annoying you.

Today's irritant comes from my photography hobby. I have been taking
pictures since I was eight years old. To give you a sense of how
*anal-retentive* I am, I still have film negatives from childhood and
I'm nearly seventy! Since the year 2000, I have been editing and
uploading digital images. You can see many of them on [my SmugMug
site](https://conceptcontrol.smugmug.com/). My editing process uses a
veritable software zoo. As I work on an image, I flip from one program
to another. Some programs respect and maintain image metadata and others
do not. At the end of my pipeline, I rename the image file to something
meaningful[^7390x2] even though renaming makes it difficult to go back to the
original file later.

If you edit images, you know the job is never done. You can always
"improve" a picture or cast it in a new light. I resist the urge to
revamp old renderings but sometimes, maybe years later, I will go back
to the original to "fix" things. Unfortunately, by renaming files it's
not always easy to find the original image.

*This is a common DAM (Digital Asset Management) problem!*

There are scores of image database programs, and you would think that
image databases would generate stable image keys. Most of them do, but
their keys are typically useful only in the context of the database. You
need a key tied to the unique bit pattern of the original image file.
You need a proper hash.

Once you recognize the need for proper hashes the question becomes,
"Where do you store them?" You might think a file's
[EXIF](https://en.wikipedia.org/wiki/Exif) or
[ITPC](https://www.iptc.org/standards/photo-metadata/) metadata would be
the ideal location. I tried this approach. Using the superb
[exiftool](https://exiftool.org/), I inserted hashes in images only to
watch various editors strip or mangle them later on. The
[XMP](https://www.adobe.com/products/xmp.html) (e**X**tensible
**M**etadata **P**latform) sidecar[^7390x3] file was created to address this
and other irritants. The XMP sidecar file provides a safe home for image
metadata with the added bonus that you never need to touch or alter the
original image file. If you don't treat your original RAWs like sacred
bytes there's something wrong with you.

[Darktable](https://www.darktable.org/), my current favorite RAW
developer, creates and maintains XMPs when you add images to its library
or apply *non-destructive* edits. Darktable's edits are stored in
sidecar XMPs leaving the originals unmolested. When you export a
developed image Darktable creates a copy of the original, applies all
the edits stored in the sidecar file, and then inserts [Dublin
Core](https://www.dublincore.org/) metadata elements in the copy's IPTC
metadata. Most image processors leave Dublin Core elements alone so they
make a nice home for hash hacks.

This following J verb modifies the `title` element of a sidecar XMP
file. It inserts the original file name and the
[SHA256](https://www.texttool.com/sha256-online) hash of the associated
image file. The `title` element is typically left intact by image
editors. So, at the end of your edits, you retain the name of the
original file and its stable unique hash.

```J
titbrandxmp=:3 : 0

NB.*titbrandxmp v--  brand xmp  sidecar file  with file name  and
NB. hash of associated image.
NB.
NB. monad:  clXmp =. titbrandxmp blImageXmpFiles
NB.
NB.   xmp=. 'c:/pictures/2022/Idaho/07_jul/d7500/_DSC8496.NEF.xmp'
NB.   ps=. xmp ;~ (-#'.xmp') }. xmp
NB.   titbrandxmp ps
NB.
NB.   ds=. sidecars 'c:/pictures/2022/North Rim Monument Valley/06_jun/d7500'
NB.   xmps=. titbrandxmp&.> <"1 ds

xmp=. read xmp [ 'raw xmp'=. y

NB. single Dubin Core publisher and creator 
NB. elements must exist to safely brand
dcp=. '</dc:publisher>';'</dc:creator>'
if. -.1 1 -: +/"1 dcp E.&> <xmp do. xmp return. end.

NB. file name and sha256 brand
tit=. dlf ('/[~(fhash)~]/',shabrand raw) changestr XMPTITLEFRAG-.CR

NB. replace or insert title element
'idx cxmp'=. (tags 'dc:title') cutnestidx xmp
if. #idx do. ;(<tit) idx} cxmp
else.
  (pt ,~ pt beforestr xmp),LF,tit,pt afterstr xmp [ pt=. ;0{dcp
end.
)
```

For details on how to use `titbrandxmp` refer to the J script
[`brandxmp.ijs`](https://github.com/bakerjd99/jacks/blob/master/brandxmp/brandxmp.ijs)
and the associated document
[`brandxmp.pdf`](https://github.com/bakerjd99/jacks/blob/master/brandxmp/brandxmp.pdf).
Both of these files are [available on
GitHub](https://github.com/bakerjd99/jacks/tree/master/brandxmp). Enjoy!

[^7390x1]: I am hoping that rampaging inflation (2022) is checked so I don't
    have to come out of retirement again!

[^7390x2]: Directories filled with hundreds of names like `_DSC8007.NEF` and
    `IMG_6666.jpg` are useless without thumbnail software.

[^7390x3]: Sidecar files are generated and maintained by many imaging
    processing programs. The XMP format is an XML text file. It can be
    easily parsed and changed.
